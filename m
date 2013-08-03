From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-02
Message-ID: <20130803063005.737FF52C616@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-02
===============================

        success : 76 
       failures : 71 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

make: *** [/home/peko/scrat... | 10
                 qt5base-5.0.2 | 4 
                      icu-51.2 | 3 
              strongswan-5.0.4 | 3 
                  libv4l-0.8.9 | 2 
                      udev-182 | 2 
     xlib_libpthread-stubs-0.3 | 2 
               alsa-lib-1.0.26 | 2 
               libglib2-2.36.3 | 2 
                  ltrace-0.7.2 | 2 
               binutils-2.21.1 | 2 
                directfb-1.6.3 | 2 
                 libevas-1.7.7 | 2 
                openssl-1.0.1e | 2 
                 binutils-2.21 | 1 
               czmq-cb9839cf90 | 1 
               audiofile-0.3.6 | 1 
                 libffi-3.0.13 | 1 
               w_scan-20130331 | 1 
                sdl_ttf-2.0.11 | 1 
       sunxi-cedarx-74923e55fc | 1 
                   ncurses-5.9 | 1 
            bind-9.6-ESV-R9-P1 | 1 
                  iozone-3_414 | 1 
                   cups-1.3.11 | 1 
                sqlite-3071700 | 1 
                  libqmi-1.4.0 | 1 
             gdk-pixbuf-2.28.1 | 1 
                  aespipe-2.4c | 1 
                  poco-1.4.6p1 | 1 
                  prboom-2.5.0 | 1 
                     pcre-8.33 | 1 
               ruby-1.9.3-p429 | 1 
                 fdk-aac-0.1.1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                      bash-4.2 | 1 
                 libnspr-4.9.6 | 1 
                  boost-1.53.0 | 1 
                   mplayer-1.1 | 1 
                   dbus-1.4.26 | 1 
                  zeromq-3.2.3 | 1 
                gettext-0.18.3 | 1 
                   attr-2.4.47 | 1 
                  libusb-1.0.9 | 1 
                 ffmpeg-0.8.12 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/4d66673822349c5a22c42969b18b628347ac79a1/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e88cb6dbb10d418f65dd7b43f3cf9d8ae47ab82a/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4e76986db2558dbcbf42f15fdeb3b1e7d8d1412d/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d479807a567713b661f8bac39eeeb670ddf11a96/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/88a7a46d53ca7f123c8f5ed344b5137d5d007eea/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/c9ef76e8db87be8b6f301c3fd8004db430a61438/
  mips64el |             bind-9.6-ESV-R9-P1 | NOK | http://autobuild.buildroot.net/results/4871503025256d4fd437bb4c88c98eb89b1981af/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/ea3eb68c94a7f2808127e0e81011e5e02d290273/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6ac7e7b846fe1e9fe4b501a769514076fd3d334c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/5536224025a98ceb3ade9581279321a06e760d10/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/0c6da27d3646bc03549acd4a6628299898d85783/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/a559c91a32574c847b55b0c5046125102dcbdcb8/
       arm |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/6b22d5524d320fffb7ef44c6d8d08686f409c4b7/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/5fc740d77982a004f69b8c8aeb2b6a18c19c19a3/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0f113640dd26bd2e84b1f1b09e84f08bdb744c03/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/882f62809a4242136efc7926f890cd791b5a79ef/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/65f7df6b26df5f34ded9cee278baf5db534cb15b/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/faa7f58c82b157d368c4a84908d9585cf09515b6/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/91f67505bab1169d958fcc4534a426c6c4d4399f/
       arm |                 gettext-0.18.3 | NOK | http://autobuild.buildroot.net/results/e5afcf60f7339507a658b499c3829d676f8aacee/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f71e5a5ee93c04876afbbf72ba1d005a209090fc/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c092363640e42c1fa351345c6416b4ed5d5197d6/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/081ec404b8bc38ab30b475afc392e415e7ba2e72/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/6d8c7bdced5bc15bd906567d0baa6940503f5b32/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/0042bee9b8d75d3a687cf2d9fd20ad3cb66a2e0a/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/8ee0df75f055b5d5399859e9d73a5ca4b8780de5/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6e2c45ac9a3c38bc7f648120fdbac8de3ef1aa12/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/92305e747dbd5c8cbfe968755cc92bc94e47ab76/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7d0033637adfe7501b77ffbe35087dc80ae63fe4/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/f21bd36888d80cbc9d543f861c0ad9a7093e4074/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/5fd9566e89e1500f8c23cdc7843691bbc53dd9d4/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/65cff2c9eb56b9d95e334d3b362673ba9732afa9/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/5a3cce1ea680ac8d96725d2468e05f338bf4657b/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/af4bb78ba488b7b21b5216f20d1518d677b492cd/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/f9fda287f8dd37c3f90d3e51b0887cd5018d6231/
      i686 |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/83409223707810388826172a2c6d3c4e08f04406/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/89da9f9127984837b0570a5c4863164f83b9e3ad/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/7dc6d1b91425cd50256ee5d9205a604982d09a9b/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/13c2514d3e05e04eabbae07a0e8687a49465bf5b/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/82bdccf5fb5616c27102da0af69d5a7111723021/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/cf1f18d2630babdfebb3f40e5c8e5f7cb27337c5/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/9be574c12893dfcd4d390f4f271907c470703f8d/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/30489e4c06e3ad5db32dedf33562b8771eb5649b/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/c05854de5470292a67de47ab4e50dcb65b10f94d/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/e8213e6d13cf82fe8c8a33a7ee7f935336a69150/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/9bd134930274efd68b51c04f20e08566f7bc219e/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8cb479ee5f560099e07ae71c0856d160e39e9ada/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/ce1ecd85b2e71530ee6efb7b74135558f14315c5/
       arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/cba1fc9660837757429daa1ca8f9d3346c789656/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/651ce1e8151d687093378712a3fb837e89ec4ca1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/cbbdbc86fb58cbfcdbb01c44a7a21d490b894f26/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/961781883e4b8d2908de765150cf574b0842e6c7/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/0369ba79ed983dec9b66611b83007f3e4074be1e/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2c635b6330729582fdaef7ad3889c2de7c721e66/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d76726cda5c31d7fadcbec90b69202850789dbb3/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4394322fc83f0d003f6ace6569213dbe2de7d25e/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/15019e862de4eff6b547b849de18c9c8bfba9233/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/ac4ac6726bc135f973e3eb9aca05a929dddc9cf5/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/addea9aeef2ee5e073423cef081518ef03aa1164/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/e6327e733a08c02720b2cb8d65c27e456fe9bfce/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/36dbdcbc7f0293b63f93e70815f487b7808dda9c/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/85bdec224cf6e3f7c6f2c8360b3b110bff296b19/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/7a2e212499f56f4227c325bed5f223b8a476cb23/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/fa0618c51075bb2368881c3d9f516b5a1ef56e5f/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/0bb81f5f85339188256797dcd2c0dc47fdc0b1a4/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/44da6e80c9d8e1b2f8c736427075a589d5b51c29/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/bcecf4c8a7474246f895296fcb602c4349f2d0e8/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/1447b457952b2d8ea4f21901f70ca3c0b4d74ff2/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/8e2ba2de6d10039dca10e88ce01ba13f1564853c/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/9e66988902f91d77f57d9c01e958f8a112770097/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d1748c4da1b657e39bb048fc07fa9858b8a78c8c/


-- 
http://autobuild.buildroot.net
