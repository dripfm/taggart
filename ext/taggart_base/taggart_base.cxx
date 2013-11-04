#include "ruby.h"
#include <stdio.h>
#include <tag.h>
#include <fileref.h>

extern "C" void Init_taggart_base();

VALUE embed_metadata(VALUE self,
		     VALUE filename,
		     VALUE title,
		     VALUE artist,
		     VALUE album,
		     VALUE track_number,
		     VALUE year);

void Init_taggart_base() {
  VALUE taggart_module = rb_define_module("Taggart");
  rb_define_singleton_method(taggart_module, "embed_metadata", embed_metadata, 6);
  return;
}

VALUE embed_metadata(VALUE self,
		     VALUE filename,
		     VALUE title,
		     VALUE artist,
		     VALUE album,
		     VALUE track_number,
		     VALUE year) {
  TagLib::FileRef f(RSTRING_PTR(filename));
  
  // nil check the file (ghost ride the whip)
  if (f.isNull() || !f.tag()) {
    return Qfalse;
  }
  
  // type checking
  Check_Type(filename, T_STRING);
  Check_Type(title, T_STRING);
  Check_Type(artist, T_STRING);
  Check_Type(album, T_STRING);
  Check_Type(track_number, T_FIXNUM);
  Check_Type(year, T_FIXNUM);
  
  // do it, dogs
  TagLib::Tag* t = f.tag();
  t->setTitle(RSTRING_PTR(title));
  t->setArtist(RSTRING_PTR(artist));
  t->setAlbum(RSTRING_PTR(album));
  t->setTrack(FIX2INT(track_number));
  t->setYear(FIX2INT(year));
  f.save();
  
  return Qtrue;
}
