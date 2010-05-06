From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:20:00 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes2
Message-ID: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d701a82321ad2f3e5bfa16639e93532294cad4ce:
  Paulius Zaleckas (1):
        Remove gtk-doc documentations from target

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes2

Thomas Petazzoni (7):
      Add -rpath option for host package compilation
      Add staging libraries directories to -L in external case
      xfont_font-util: enable host package
      xapp_bdftopcf: enable for the host
      Enable xapp_bdftopcf dependencies for the host
      xapp_mkfontdir: enable for the host
      xfonts: fix dependencies and build process

 package/Makefile.in                                |    6 ++++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    2 +
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    2 +
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    2 +
 .../xfont_font-adobe-100dpi.mk                     |    6 ++--
 .../xfont_font-adobe-75dpi.mk                      |    6 ++--
 .../xfont_font-adobe-utopia-100dpi.mk              |    6 ++--
 .../xfont_font-adobe-utopia-75dpi.mk               |    6 ++--
 .../xfont_font-adobe-utopia-type1.mk               |    6 ++--
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    6 ++--
 .../xfont_font-arabic-misc.mk                      |    6 ++--
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    6 ++--
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    6 ++--
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    6 ++--
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    6 ++--
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    6 ++--
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    6 ++--
 .../xfont_font-bitstream-100dpi.mk                 |    6 ++--
 .../xfont_font-bitstream-75dpi.mk                  |    6 ++--
 .../xfont_font-bitstream-speedo.mk                 |    6 ++--
 .../xfont_font-bitstream-type1.mk                  |    6 ++--
 .../xfont_font-cronyx-cyrillic.mk                  |    6 ++--
 .../xfont_font-cursor-misc.mk                      |    6 ++--
 .../xfont_font-daewoo-misc.mk                      |    6 ++--
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    6 ++--
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    6 ++--
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    6 ++--
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    6 ++--
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    6 ++--
 .../xfont_font-misc-cyrillic.mk                    |    6 ++--
 .../xfont_font-misc-ethiopic.mk                    |    6 ++--
 .../xfont_font-misc-meltho.mk                      |    6 ++--
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    6 ++--
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    6 ++--
 .../xfont_font-schumacher-misc.mk                  |    6 ++--
 .../xfont_font-screen-cyrillic.mk                  |    6 ++--
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    6 ++--
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    6 ++--
 package/x11r7/xfont_font-util/post-install.sh      |   28 --------------------
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    7 ++++-
 .../xfont_font-winitzki-cyrillic.mk                |    6 ++--
 .../xfont_font-xfree86-type1.mk                    |    6 ++--
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    3 ++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    1 +
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    1 +
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    1 +
 46 files changed, 132 insertions(+), 137 deletions(-)
 delete mode 100755 package/x11r7/xfont_font-util/post-install.sh

Thanks,
-- 
Thomas Petazzoni
