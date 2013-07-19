From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Jul 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-18
Message-ID: <20130719063007.DFE1252C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-18
===============================

        success : 96 
       failures : 50 
       timeouts : 0  
          TOTAL : 146

Classification of failures by reason
====================================

                 libffi-3.0.13 | 4 
                 libnspr-4.9.6 | 3 
                  poco-1.4.6p1 | 2 
              vim-699f8d8f096d | 2 
               alsa-lib-1.0.26 | 2 
               libglib2-2.36.3 | 2 
               binutils-2.21.1 | 2 
make: *** [/home/test/test/... | 2 
                 rt-tests-0.83 | 2 
make: *** [/home/test/test/... | 2 
                 binutils-2.21 | 1 
                     pcre-8.33 | 1 
                oprofile-0.9.8 | 1 
media-ctl-ac40b79f002a2315f... | 1 
               qt5webkit-5.0.2 | 1 
               aircrack-ng-1.1 | 1 
               libgtk2-2.24.18 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                   cups-1.3.11 | 1 
                  webkit-1.9.6 | 1 
             tvheadend-5956233 | 1 
                      qt-4.8.5 | 1 
               xenomai-2.6.2.1 | 1 
                  prboom-2.5.0 | 1 
make: *** [/home/test/test/... | 1 
                    acl-2.2.52 | 1 
                  samba-3.6.16 | 1 
                libtirpc-0.2.2 | 1 
                 ffmpeg-0.8.12 | 1 
                directfb-1.6.3 | 1 
               ruby-1.9.3-p429 | 1 
                openssl-1.0.1e | 1 
                    zlib-1.2.7 | 1 
                 lcdproc-0.5.6 | 1 
                   dbus-1.4.26 | 1 
                libiscsi-1.6.0 | 1 
                  bcusdk-0.0.5 | 1 

Detail of failures
===================

  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/98b5b20a275244e2bfc5d2ba9f0b7349badc0a2b/
  mips64el |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/72fbaa39262ca6c9abc7ebd43ecdeb2be4c7ce96/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/47105594336d36411308793985975eb6d65bba48/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0442d6030a0b292f15a188c9c165387a932f0b2f/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/740497ad9f3dfbdafab143d23f6b159c0281e283/
  mips64el |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/36e71c64abd2172874e1b5a456c6ea59d4d1a272/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/3bf4a7981819f875e634c339ee9a7ec1cde742e6/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ee2e033eedef6eeb111a46492c2db8bf04d9babf/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/a2e164fb3023811f15adb3f3d615daeff85e57ff/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/75a946a14ec0c35eb532410861cbcb4b367ebacf/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/819688b52c3781178e9f134f2d56db37f2cbe6bb/
       arm |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/440f1d1b787c44aa7b0f14e87632c91f05ec4d56/
       arm |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/d22343af0579612fde42b022edfa775da7ccfbb1/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/81d4e4a6904389332bc9ab9f711de9bfcfcd1e51/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d2b3964dd7130ee69247296709521c067a5082f2/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f51b066ad1bb72b787f0d2d47d78f9ae1c76dbea/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/078c24022ee8852ae43111fd2b9dd4b7c4285ae8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e7d4410be83f4f84aacdc63d38ed8756b5c443ae/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4e3fd91b0e95056f67236b821a19a039b31c7cf2/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/2eb4af2f10b71ec18ce07c49ea48b0d6e81fd5bb/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/105448dd04efea47401978d28906d4d553a6be65/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/3f9962a018458d7c42329f302e8d664bd9a5634f/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d7a260e1eb7053477cfde942eef25feea9aa99fd/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/32de384d059c5b51c3cd373f787a90bc4f4b8237/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/53196dea5cd446b9eb5a579c324334ae58cc7b2e/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/611bce7e8e119e51f7206dc881a91db9755b28b0/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/cb26a048ca3562fbd0b50af4532d88b5968605b3/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/18bdd3fe04a500b7f7fe3f05e93c83e0544913fc/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/df897f33a78ce4c8440564542112a50c1fedaa8f/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a93e0dffba105009f601a33b479248d4d701ae55/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4b8b1af9cc661ca0b2361d6dd21197eb2793b289/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e373f4db54caab78e0df3c9d5810174d420d266f/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/09542ee8d5a2c341278157def07edd4794a41d7e/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/f5123bc3633998b499c800d3ccb86f02217f4d58/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/f2956f456ae22723fcd67e5d029255b1489029fc/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/40b8b2d64751dfca3c33178e2318e82e95012a02/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/66dc6ae084ac3449f29a7b51c2a08af064c5e120/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/710c3160dd6324b1a19a2838a377affdfd94129f/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/2cbbd90379e172bfbfeeea591ad69af313fc9557/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/7251a002f3c087c4e0338b3df9745a80f0226213/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ccfe6e60e2ff3ece4797e006360796aacca21d1d/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/107377bfc625965634450c0d20b34206e5386966/
   powerpc |                   samba-3.6.16 | NOK | http://autobuild.buildroot.net/results/6e4ccd32a3ec15ae6b6273e80fa98525d2ad12da/
       arc |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/6f6696eefcd5cc91d0700d3a4d3c91f535e11133/
   powerpc |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/500110dc3b0d3433d2b0d62d963ca8859e5b6e13/
       arm |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/8539c07c0b4c893244faf0c1356f69f64efa448c/
    mipsel |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/bc458d06691ea74ca3ddda448056878b76d0be65/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/c9912b2c21594350945c8a64528bb6a9b34d6292/
     avr32 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/b243b87474308d91b3bec360313676e2bd77e5c1/
       arm |                     zlib-1.2.7 | NOK | http://autobuild.buildroot.net/results/f4358849adcf0c4033490e5e53b20f5f53e1c64a/


-- 
http://autobuild.buildroot.net
