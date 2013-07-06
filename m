From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-05
Message-ID: <20130706063006.9ACD852C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-05
===============================

        success : 88 
       failures : 73 
       timeouts : 0  
          TOTAL : 161

Classification of failures by reason
====================================

                classpath-0.98 | 12
             iptables-1.4.19.1 | 9 
                pciutils-3.2.0 | 3 
                 libffi-3.0.13 | 3 
              host-elf2flt-cvs | 2 
                openssl-1.0.1e | 2 
                    acl-2.2.52 | 2 
                      gpsd-3.9 | 2 
               libgtk2-2.24.18 | 2 
           imagemagick-6.8.6-2 | 2 
                  libedit-2.11 | 2 
                   cups-1.3.11 | 2 
               libglib2-2.36.3 | 2 
                 nodejs-0.8.22 | 1 
make: *** [libfuse-legal-in... | 1 
               ruby-1.9.3-p429 | 1 
               w_scan-20130331 | 1 
                      gsl-1.15 | 1 
             uclibc-0.9.33-arc | 1 
                  zeromq-3.2.3 | 1 
make: *** [jquery-legal-inf... | 1 
               aircrack-ng-1.1 | 1 
                      udev-182 | 1 
               qt5webkit-5.0.2 | 1 
                 libpfm4-4.3.0 | 1 
make: *** [inadyn-legal-inf... | 1 
              matchbox-lib-1.9 | 1 
make: *** [neardal-legal-in... | 1 
     xlib_libpthread-stubs-0.3 | 1 
                      qt-4.8.5 | 1 
              fontconfig-2.6.0 | 1 
make: *** [xlib_libXcursor-... | 1 
                elfutils-0.155 | 1 
make: *** [libnetfilter_acc... | 1 
make: *** [libsoup-legal-in... | 1 
                 cairo-1.12.10 | 1 
                      pv-1.4.6 | 1 
make: *** [cegui06-legal-in... | 1 
                     pcre-8.33 | 1 
                  boost-1.53.0 | 1 
                     m4-1.4.16 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/6750814c0c82bf3212c1605c28afa1dd74ddc90c/
    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/3c3a260d5c78eed7448f2fdc54cb42dc4b9fad69/
   aarch64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/fad451e5ae3b8bf4ea558a594c817b4d2c31188f/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/662edb1cc953308a8db01bd604deef937b1a0f69/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d78edb54f5c126e5b8289caae9dacb664fe71253/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/bef8ee78fe2eba6557890e4a8ee12e772c7d832f/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a40f300b610026db907a77f4f49794b134804c71/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/15b7116dcb910f3424e268f19865a92b3bec9239/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/8b85e9471a5f58a9b8843449799f5aa9a1a81d37/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b9cecf77a66d86c3ac2f62c0a8cccdc263795adc/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/1f6f9b4efd07045c201eba77ca4f42ab8f94de63/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/458396ebe6ae0366897009e5a52de1f90a69a2d9/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/71c11cabc25ae4e356ae97d80673086e7b235546/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/9c0351d4e13e1e83f2f7e3f0ebf765b52fe51cf1/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b0c31ecf85ec91d111d92ba71a843b4524193e3a/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/780e10d4d98fe0c97d0a3bab4eca2109ed6d7c65/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/43f9ce032e255d11a54f8a79d142ef1afc02ed18/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ac468fb59bd3038620018363fd9f15e7e929ee95/
       arc |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/6cad054c9322fb4511b6bd9ed46788a0ce3ca024/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/4cbdbdbc86b43402aaff0ab93929c080a4b54e8d/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/9f0e7a71a3db0d68e8b9cd66c820cd9d88ff2a7d/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/52b6ee9d5976c47872feb33c90d11961004afcd5/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/754699ec7bb7f952363a413c98d7a4afa34ed4ed/
       arc |                       gsl-1.15 | NOK | http://autobuild.buildroot.net/results/f29175bc87d18be5cb421832eb2782f9d5428468/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/4e721515cb7f607a681644147fd59798b0b2c834/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/05ed5f760af3a938a590ed8fc23aa86d3e58cf94/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/db6e0f7543a76cc322eba9c164fdb86826f06746/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/e8c09ac3a349edef5d446800e2039d6627f74784/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/377c3ff7101848616440b7c84999143260b39be4/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/6c16bc465efbb9d22a58ac7b30e2eca5189d01bd/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/ccff5f3980ca23ce2ee18f875303c3d9d5476093/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/abc9cfebfaab8c27e5f6bae0f8e3cb228771b6a2/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/d29b82667fe2bfd6f43685f7694acc7d4e1dc84b/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/ea9733209f3f5ef0a72c894c52b1bbe53662de6f/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/53ffb053445d2a1bd5db68b54ddf21f0db3ed370/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/8ac959b83f6e833f55001cad286fee4c5105371e/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/cd98989cd1694f6a8d7f32f20448b90dfaf42ad6/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/a2ac0acc49e3527bedb2febfdd0e2a52dc6dd036/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/7b21fa21deaeb6f76497d4d37ce1c2ba4b11595d/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/86a1e95caabb3f9940410f1ae79c160df28b0f92/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1a47ed43565b44091a68ade1b4b6d2e8d6c9df4b/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/7b1024e8e36757d73ba7f8aa3fd5a0001cae0aad/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f3764d949f83f5272ff459d6b61cfff3143cd1d9/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a2f2033739fec90e72fd7d8411f9fd9283b5d9e4/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/b9751e168cff728119bafc4185b3c4d4baa0c81b/
    mipsel |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/bb565cf7dafde7c5395d79759c49f4422c6eb07e/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/c6e6d9025cecf11f0c473ff3f72c293776b766f3/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3f37d1e29cfef395e9d6e904900044ab9b0ffba4/
       arm | make: *** [cegui06-legal-in... | NOK | http://autobuild.buildroot.net/results/b3da7ae700e733a8a7ba18986192b10f2a0b4d6c/
       arm | make: *** [inadyn-legal-inf... | NOK | http://autobuild.buildroot.net/results/fa718c68593c134a2690598dd8e2af17c8e5c0aa/
   powerpc | make: *** [jquery-legal-inf... | NOK | http://autobuild.buildroot.net/results/2caf98eacc7af375f8ea44716649e749ffc932ea/
    mipsel | make: *** [libfuse-legal-in... | NOK | http://autobuild.buildroot.net/results/25f487a881289dcfcfd5dcba2237a29bf055b8e3/
    x86_64 | make: *** [libnetfilter_acc... | NOK | http://autobuild.buildroot.net/results/eaf1d201645816fd516d77382edb4767890fb31a/
       arm | make: *** [libsoup-legal-in... | NOK | http://autobuild.buildroot.net/results/2c2171b42d2dd55b271fc5ddf804d4c7c0305e0f/
       arm | make: *** [neardal-legal-in... | NOK | http://autobuild.buildroot.net/results/38e6d439e636f8e574f6b357fdf118aebe21060c/
       arm | make: *** [xlib_libXcursor-... | NOK | http://autobuild.buildroot.net/results/735d93cc17d434675809ed336c1898f955297138/
       arm |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/c70e1aa2712ef465b428390857730230924efedb/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/fa79a6036b17ef46a1238b5a503d653ea15563a9/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/ddd7ebb84c6a591bff0e93361a8a8800041283a3/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f8835122552d7947d4a83bbb8449c21569d5ab46/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/1e11f02e5c14583b690d7252941cae9a2df4d80a/
   powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/0d6f7bcb87add2dea5eb52ce32a207131c47479d/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/c39b5c1fadb8eb610dcd0b73e3327a9ff523f29f/
  mips64el |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/27d99e597abc30fd63aaec57e760aae2fd0740b5/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/18ef260f84c137ac2e72ad5b766cf5de1c0959c7/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c8bdf45b185c65006fb5afa1ef2c3f8ffd4577e1/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/c72c94d530387b94b7ca09e3adf5ca5eb9f2b071/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/e38b729203001663d9358d7da048ebaefaa29756/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/0ff6c2345a9e3db1593d5e6998eeef14f22fb71e/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/eb0ef26b1a95b78282fa9fe798aceafb26b48436/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/c2c442b940413bb4c0627510fcca8c504f028bba/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/c16e37b25c67c0d3a64e96032368528085295edb/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f9a4e5682bd73cafcf74aa9c97ae01c5ced306ee/


-- 
http://autobuild.buildroot.net
