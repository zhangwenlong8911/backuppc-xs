use ExtUtils::MakeMaker;

WriteMakefile(
    NAME		=> 'BackupPC::XS::md5',
    VERSION_FROM	=> '../lib/BackupPC/XS.pm', # finds $VERSION (if you're lucky)
    SKIP		=> [qw(all install static_lib static dynamic dynamic_lib)],
    clean		=> {'FILES' => 'libmd5$(LIB_EXT)'},
);

sub MY::top_targets {
       '
all :: static

install :: static

pure_all :: static

static ::       libmd5$(LIB_EXT)

dynamic ::

libmd5$(LIB_EXT): $(O_FILES)
	$(AR) cr libmd5$(LIB_EXT) $(O_FILES)
	$(RANLIB) libmd5$(LIB_EXT)

';
}
