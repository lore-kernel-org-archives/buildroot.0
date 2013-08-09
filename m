From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-08
Message-ID: <20130809063005.46A7352C1CC@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-08
===============================

        success : 81 
       failures : 70 
       timeouts : 0  
          TOTAL : 151

Classification of failures by reason
====================================

                  ltrace-0.7.2 | 9 
                 libffi-3.0.13 | 4 
               libglib2-2.36.3 | 3 
              strongswan-5.0.4 | 3 
           libcec-libcec-2.1.1 | 2 
               alsa-lib-1.0.26 | 2 
               qt5webkit-5.0.2 | 2 
                  cppcms-1.0.3 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                 libnspr-4.9.6 | 2 
               binutils-2.21.1 | 2 
                   attr-2.4.47 | 2 
                openssl-1.0.1e | 2 
                 binutils-2.21 | 2 
            host-mtools-4.0.18 | 1 
                  prboom-2.5.0 | 1 
                 cairo-1.12.10 | 1 
                     m4-1.4.16 | 1 
                cegui06-0.6.2b | 1 
           host-gettext-0.18.3 | 1 
          host-protobuf-c-0.15 | 1 
               uclibc-0.9.33.2 | 1 
                     mpc-1.0.1 | 1 
              libatasmart-0.19 | 1 
                 qt5base-5.0.2 | 1 
                 fdk-aac-0.1.1 | 1 
                 libpfm4-4.3.0 | 1 
               libcap-ng-0.6.6 | 1 
               libgtk2-2.24.18 | 1 
media-ctl-ac40b79f002a2315f... | 1 
          sane-backends-1.0.22 | 1 
                    libev-4.11 | 1 
                   dbus-1.4.26 | 1 
                      gpsd-3.9 | 1 
               aircrack-ng-1.1 | 1 
                  bcusdk-0.0.5 | 1 
                    systemd-44 | 1 
        ltp-testsuite-20130109 | 1 
                      icu-51.2 | 1 
               minidlna-1.0.25 | 1 
                 nss-mdns-0.10 | 1 
              fontconfig-2.6.0 | 1 
                  poco-1.4.6p1 | 1 
                      bash-4.2 | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

      i686 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/df0f39323a1c699f66e5de7f0440945da42178ee/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8bca5e2ccc35eda7f0efa233de20eaa162db4aa5/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f2b4d716d49d7284a18a0c1da6f88e8041544928/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/bca8ca0edc08fed030d6a967ef4651651eb9d891/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3330fdd8faf44ac906c7fc97f238990c0553d708/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/1ab5527b69ce0eb02497d254b20e392b4515363f/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/d99c8c9ea76f8aaf05f46f60c41da8e59ae29dca/
  mips64el |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3a7619a8364164413d23a76e3e4e5c42cd234a96/
microblaze |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d90f8bbbafe06359564cfae35c394d046c3714c3/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/64fdf5bef77335c44cbd2eb586d711dbb9902f66/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/3abb4fc1d5debde32ef70bceb3de8a121893609d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ffe3d8936f116ace8faffc1b44ca4d2477bc30f6/
  mips64el |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/048b941f004652ff85151200fae5f94d3f71c571/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/93538f22cb2a592c0a9868d8da5151b5ea3e3b5a/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/a46b8ba6cb11510672799a5a05c7f0d3281748e9/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/97d3e4a92b780dc442d496c8443c386ed7a92bad/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/00e33f1e51ca5b16d662ee3b6f385f3beb4d0d90/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/b64ce69dcaee2c6a1301e7faee31ae4557a332d5/
      i686 |            host-gettext-0.18.3 | NOK | http://autobuild.buildroot.net/results/95a9b6ceea3185a6814d179f168480ee6594ff56/
       arm |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/a1800fc4fb48f6b290d9c802a63f363e6aab29a0/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/e63033b8ef0b451ad3bc9088b7efafb9de762c40/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1fd808e0151324226480051c35d25359960361ff/
       arm |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/f64e7fc724ad17e35238b8f9750d2b2c793e813f/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/6a7027efe0f2650cb4f34e90274133cc94e8412d/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/94e7cc54fac70a4af85f34f5ce5c75c96511cc1e/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/9cb3e084529d9d64d11e3969848a7f88682184d7/
     avr32 |                     libev-4.11 | NOK | http://autobuild.buildroot.net/results/3c7ae651c8e3494e2a7e07b0d4876fbd7f004b8f/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/32a5a23b6e4783caeac34172cd13b14581896567/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/67dd97ab53f534e9416693ae05a62479454ad8d9/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/930752a7a8247a9a30d41aa218fccf25d7202edc/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d9cbaaf1a36326af7d1e394b11ea837f99f0e3ad/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a669463ec3332d003e20234636cca89eb318c46c/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ba63531487fd3076a1f0cc1c057a4466dae8c795/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3c728f96367acbf7886e752be0886496203d1604/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/34c62eb6c27255d0c0be66651b6ccd14cfb5609b/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0dadd50d6b4a4b1ae3eaf2be272a17da5230d956/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b53eb565128fddbf2265e4dd4382e3c645de58aa/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/beb8f6670063c2a0b9d8591a588f6392114a5055/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/bec962ae9acfc0033c56b83b949513364821fcce/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/12dd9ad4befd29e4f2393b87fa7bece1f3beb111/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/0a3bd78aa0054a0ceda972f6cd89c1b929860822/
      i686 |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/ba8b8f5dd1ca6da579b79b075d14de0a5024732c/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/d4c465ea57a1954c3323234100ae08156cbd8324/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/cf63812772ce07545f5744a07a61119cc48f518f/
      i686 |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/02a6a064ca5254b6335bfe8598d7778623c7216c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/12fbebe0e70d208a8fe75935b7f90875684bdd54/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/31a3c2fd4f8f32d4bd00d4d9551dec7e3b9ff64d/
       arm |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/50dff1bcbbc0c29399124de66e7ebc3eb36cf5a5/
      i686 |                      mpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/fc3f04ad9d08fa09d4a1637a053bc388a7307c04/
  mips64el |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/8c0fc29e29df62d3b6ca0d24dd78df6ba04c2aee/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/22f51ec83d0f604d5d624edae16844030343039c/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/20ebb0fef5c5fe8b11ddfb44ecc8068e1265e424/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/955453c9121fa696268d0b362bf8f8a9cd08fef9/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/99130660cbb3362d32d478bf9f57347cac7c4753/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/405ce300e1367d34f5189f861c17aeea50964b1e/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/ef00b1aa8cb420f2a160bc1a9692c468be06126d/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/228dc08714ff15de08c636f520ee9632505af039/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/8f00a6cc4f3bee5f0ffdaba1dd26eca2c156cdff/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/f468babf96e4e0c714e3bfd2a9e6316c2e8bda27/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/b140dbdd813d04c6c68980a5fb6f43492eb07139/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/cc668a1af3ec0c091dbd548eb32fb127fcf567d7/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/75b137213c14bc5869bdc2a889de27fcaeffa51d/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/ff4e4b15fcd965f20514898ff11d7100cf082953/
      i686 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/7f019205f6b7e0918c28c0adc7d2e2277ac6e319/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/1d3097a4cfc18b1e39a6b0fabe0880fef005067c/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/762362da4b4d7bf204a713dc90ea6bdfaa5594a8/


-- 
http://autobuild.buildroot.net
