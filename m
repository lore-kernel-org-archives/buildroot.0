From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-06
Message-ID: <20130807063006.3686452C5F1@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-06
===============================

        success : 90 
       failures : 63 
       timeouts : 0  
          TOTAL : 153

Classification of failures by reason
====================================

                 libffi-3.0.13 | 6 
                  ltrace-0.7.2 | 3 
                 qt5base-5.0.2 | 2 
                      pv-1.4.6 | 2 
               qt5webkit-5.0.2 | 2 
                 dropwatch-1.4 | 2 
                      icu-51.2 | 2 
               libglib2-2.36.3 | 2 
               binutils-2.21.1 | 2 
                openssl-1.0.1e | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 cairo-1.12.10 | 1 
               libcap-ng-0.6.6 | 1 
                   mdadm-3.2.6 | 1 
                     pcre-8.33 | 1 
                   cups-1.3.11 | 1 
         matchbox-keyboard-0.1 | 1 
sconeserver-d58f2de88c68193... | 1 
                sdl_ttf-2.0.11 | 1 
                 cdrkit-1.1.11 | 1 
           imagemagick-6.8.6-2 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  dhcpcd-5.6.7 | 1 
                  prboom-2.5.0 | 1 
                  iozone-3_414 | 1 
               alsa-lib-1.0.26 | 1 
              vim-699f8d8f096d | 1 
                      qt-4.8.5 | 1 
       sunxi-cedarx-74923e55fc | 1 
               w_scan-20130331 | 1 
                 libnspr-4.9.6 | 1 
             libgles-undefined | 1 
                 fdk-aac-0.1.1 | 1 
                  ne10-88c18f0 | 1 
            lttng-libust-2.2.0 | 1 
                  connman-1.12 | 1 
                     m4-1.4.16 | 1 
           heirloom-mailx-12.5 | 1 
                    acl-2.2.52 | 1 
                  poco-1.4.6p1 | 1 
                  boost-1.53.0 | 1 
                   mplayer-1.1 | 1 
                    ngrep-1.45 | 1 
                directfb-1.6.3 | 1 
                    zlib-1.2.8 | 1 
                libtirpc-0.2.2 | 1 
                  libv4l-0.8.9 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/eb3a91e6e302ec547c89e64321ae09c6275c8c15/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/66e2c4077b6036e20d2d65bcc878f5ebd6e7aa0f/
       arm |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/7ed50528e07e2d4c5fcbbc93212d9b4fe0a4ef5c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/5beb95c7090f0e05ea42d61e54562b0c32b45d16/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/da56760009f6d487035e8bdb7be634a19e8878bc/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e21ca438f1f53dc4c151e5f691f7c1b05bebdb89/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/568778dd40f96f2d9de259836ee9e1f692eeb972/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/a6476472023d1dce66cdab069808703ecaa0f772/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/adfa4a3107a1a62c37ef2e590dd722494297bda6/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/68f925b3403fd97d33dd94f9e130f72001497b7e/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/dbeb836c542f2b50146364d1e7fe85c72fbac9cc/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3eaea962726f87c25371eb8ebef620d4c11d6b07/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/be0329bbb64a2992bdb4ff8d044b5cb2bb2bdcdc/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/d4800a48c721a60b976acf4efa4ab931c379238b/
     avr32 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/8321e30b5394d254d9d981d89fedd347fd59a9cd/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f613f6bd892da96207f84398a2f71b1c1137a5d7/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/13c67afeddd6799dc886fd17197eb8802694b12e/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/3c7f58fc5ec461c94c0e3cb089b75f2f8a52614e/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/b946b4bbd75cc6c9d8207ed1b63567d267214869/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/e28e733a01bb3ddc5a669f6a311262b54a0d6042/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/cc8d2049d0b3b97809f21b9872fb152d17a40caa/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0c05310a1a48cd46e59e8850328932d237cd7ea2/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f8451ef15a6e4dade9bc05c10df07d51afcf1e50/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/dea6e29c17341cc18ac9b38ef60f6e914c15f9db/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1087b6c93c71ea1b0b3370d8686410a035fd1907/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/65a167ef880c3c947361d2821a6dbe0c9ee3b2a8/
       arm |              libgles-undefined | NOK | http://autobuild.buildroot.net/results/dbd938914883a9e205f967f7b4b4a8a7dc7be117/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/817cde2a06ddd876902685aee850cb62171c8ed0/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ec825dfef229c7009b27aef2a75997bf2c48d4d0/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/41ca62b09224d7a668682f03c9fddea7f0e5d570/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e077f866fd4128b2341623b2b06e8738ac7d6565/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/fcd14f7d6a259cc8844818d0baf0c3101b54ec72/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/bfa6619c661a6eb9323535cc9a7ab5a7a9599569/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/a809fa62ebe9b617358a7cb14d4f0d9ad4ae206d/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/aa0a6f9a8b5a6059b787d90ffff65a9bd7a90994/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/897f6c8ec5c17bdf3985fa575a53bf58f903ca64/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/b2cb60d1feeae4110e7c279634069fc260c17bff/
      i686 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/9a1e67aafd7fd4d8bbeda41e395d9c9306408a86/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/15c569865df1b080ee8aad543a1953236977aa4a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/12ab2e9fc6e9edcce0d14193f004267a81cb3ebf/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/813060c995c9193aad7f58b111c141195189eef2/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/ddf2deaa30ff8c5f0d3f3277e200b602c6724767/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/78c1989be24b5c88c79beb9bd29831f39f5f9113/
       arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/8ed933da4727576a267ed2c86702835699dabcab/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/6628c219a7a39ef2a65720fc185107e74a5fed51/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/75c830704c303cf956b07fec8a868592502d3228/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/b454baf9484fc7fde0620a8f2abf7d6760203e89/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/19e6521a5d6e07f5f749784fa81d085b4fcebc48/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ca815a8948cba3af4f4db5f76ed13db8370e5328/
   powerpc |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/0980b2da89646e61036486be8a677f52c9e5addd/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/c9035a6712c8ac2df05587fb3a284c076f1dcc32/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/beb3ccc42791684b301547ee2f712df9be383cd2/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/47d277cab80c6e4e3a8ac13697af6a9b55b7229f/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d1c6f992740da79de9728a2eb628982e10a1ee25/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/cac3d032098a1854c35df761269780924d56ca4b/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/d9713fe672079a729f1025240154ffa620191dbd/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/4f7d2c3b80f033e0c21b7471bc070284aba1a8c6/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/edc7cf3be15c96c1daadc9ccdd472ae87d004faa/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/a06fe1f2fa2cb57d57524eff5f7b88fe36fdbf68/
       arm |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/5076d6b90ebc62585cf3ad4646c3f275033f05cc/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/c5229a72a7b3901f9f1ec78ae17730ca0d27b63b/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/084506a07ceaa0a0b36c24c74b4b6abd0e0608cd/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/9463d5bc705ea0155da252f859968015ebb02556/


-- 
http://autobuild.buildroot.net
