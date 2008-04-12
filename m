From: tanatloc76 <tanatloc76@gmail.com>
Date: Sat, 12 Apr 2008 10:45:51 +0200
Subject: [Buildroot] ftheader.h error
Message-ID: <480076BF.2080706@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to use buildroot to AT91SAM9260.

Here is what I did:

$ svn co svn://uclibc.org/trunk/buildroot
$ make menuconfig
$ make at91sam9260pf_defconfig
$ make

I've got following errors:

/misc/buildroot/build_arm_wchar/staging_dir/usr/include/ft2build.h:56:38: 
error: freetype/config/ftheader.h: No such file or directory
mkdgiff.c:43:10: error: #include expects "FILENAME" or <FILENAME>
mkdgiff.c:230: error: expected declaration specifiers or ?...? before 
?FT_GlyphSlot?
mkdgiff.c: In function ?write_glyph?:
mkdgiff.c:233: error: ?slot? undeclared (first use in this function)
mkdgiff.c:233: error: (Each undeclared identifier is reported only once
mkdgiff.c:233: error: for each function it appears in.)
mkdgiff.c:245: error: ?ft_pixel_mode_grays? undeclared (first use in 
this function)
mkdgiff.c:296: error: ?ft_pixel_mode_mono? undeclared (first use in this 
function)
mkdgiff.c: At top level:
mkdgiff.c:354: error: expected ?)? before ?face?
mkdgiff.c: In function ?main?:
mkdgiff.c:539: error: ?FT_Library? undeclared (first use in this function)
mkdgiff.c:539: error: expected ?;? before ?library?
mkdgiff.c:540: error: ?FT_Face? undeclared (first use in this function)
mkdgiff.c:540: error: expected ?;? before ?face?
mkdgiff.c:567: error: implicit declaration of function ?FT_Init_FreeType?
mkdgiff.c:567: error: ?library? undeclared (first use in this function)
mkdgiff.c:573: error: implicit declaration of function ?FT_New_Face?
mkdgiff.c:573: error: ?face? undeclared (first use in this function)
mkdgiff.c:575: error: ?FT_Err_Unknown_File_Format? undeclared (first use 
in this function)
mkdgiff.c:583: error: implicit declaration of function ?FT_Select_Charmap?
mkdgiff.c:583: error: ?ft_encoding_unicode? undeclared (first use in 
this function)
mkdgiff.c:587: error: ?ft_encoding_latin_1? undeclared (first use in 
this function)
mkdgiff.c:595: error: implicit declaration of function ?do_face?
mkdgiff.c:603: error: implicit declaration of function ?FT_Done_Face?
mkdgiff.c:606: error: implicit declaration of function ?FT_Done_FreeType?

Please show me how to solve this errors.
Thank you very much!

Regards
David
