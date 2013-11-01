From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Nov 2013 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-31
Message-ID: <20131101073005.30CD352C5D6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-31
===============================

        success : 78 
       failures : 58 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 11
make: *** [uboot-tools-lega... | 6 
                 qt5base-5.1.1 | 3 
              fontconfig-2.6.0 | 3 
                 libevas-1.7.7 | 2 
                      qt-4.8.5 | 2 
               libglib2-2.36.3 | 2 
        gst1-plugins-bad-1.2.0 | 2 
               alsa-lib-1.0.26 | 2 
                 fdk-aac-0.1.2 | 2 
                 binutils-2.21 | 2 
                  nettle-2.7.1 | 2 
                 webkit-1.11.5 | 1 
              e2fsprogs-1.42.8 | 1 
               uclibc-0.9.33.2 | 1 
                 omniorb-4.1.6 | 1 
                 cairo-1.12.10 | 1 
      libnetfilter_queue-1.0.2 | 1 
                 libnspr-4.9.6 | 1 
             alsa-utils-1.0.26 | 1 
                  connman-1.12 | 1 
                    php-5.3.27 | 1 
                     apr-1.4.8 | 1 
                 cdrkit-1.1.11 | 1 
                 zmqpp-31220ca | 1 
          openpgm-5.1.118~dfsg | 1 
             tinymembench-v0.2 | 1 
             util-linux-2.23.2 | 1 
           heirloom-mailx-12.5 | 1 
                      icu-51.2 | 1 
               qt5script-5.1.1 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/80728d4267c804e8de962abd6b4105cfe2c0e23a/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/803b4423159bd0d2b19a670d4accea2359ec846b/
   powerpc |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/272e9a541072916afc6ddb102f82d099865f4dce/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/544541e24534ac9faded3bb725a90ce2237acfed/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/ed9f360dceb31a579e67f20370bce5836f610901/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c63c0d75b62033bdf31eb4c1c0158007d91fbfed/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/52d3b92405b6808404f8bbb126781c4573301a00/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/8ffccba37e6ff977ae6cf8fc24e516d0381d8eeb/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/f053f87ff182e33a0cc7521863b2c94c1cac4959/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/98b1ddfe580407c838ab66b0e5fb1b09aa14e484/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/674b357f1a97a7e9991c9b177597d43a7311701c/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/44c336209500c2f73ae0845268a3f5fd93b41911/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/372cd4e9797e4eb27ddde87a7262a330dfdcf793/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/514b239c0504c097e27255ddf81802c86bb4a7bd/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/2ffec2ac8e637da7620b6e9ed6ebe336ac274bba/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/ee5474af1fd894a888fc28de67019db82196da9c/
      sh4a |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/b57cce2780a1c2a62fd50ef4a4959499c495cc3e/
    x86_64 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/534842abcf32c0a0b95be3ab067855979db96ffe/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/81976202ae5a4335c4e053d04a06c9300a0c3511/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/bc0ba0a210888cba2e26470570bc9379ea919a95/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/484aec5af221536378856534bf377bf049c19c94/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2732c1b9e7dae7c82e92541b0d628e499e07aac6/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/436309fa4fcbfad5077e72d2311c8609dadd2230/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/1d18b4473a3df7e57b5c97556654d7693c26aac4/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d9b781da88d9e7ef178e8717ea6d1f258be1dd42/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/5fb484b0ef363749abc92e594c4e9025117d7195/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/aa98c0ed8c214388214d1bbb70d59866fa3a6f68/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/8888754b2891ee2738151d0f1d888c1e506192fd/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/219c57d680ad950542e9b30857c87b9d578b6672/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/62c6c52c65fc313687658f48012d0ebc0190fefa/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/6444951068642642862df3d5d19cb2d25d5eaa6f/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d1adde1ac4b849a0c532213c3223d51eb7406d0a/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ff2e9a0dad675fcf018e3d447ffee89b18f6b3fc/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/6a52511e5da0957e4d05fc559c5a78c5ec631a61/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/42d274e1816302240d8268cdba792f4839a59f41/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/645e9092381fe846f468cc6da10f99df7b8a3df2/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3abcbdf3801d75340adeda5bfaa61e1e86ffccd3/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/90d2e58415e5df91cab5e20b07a6b7989b0141c0/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/dae50dc1ff263e61f2ee1d350baa5e6d0c64e989/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/e8cd61987d1fe8c7a2d917d90deeb2834f921274/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b323175b019764857acb58f8e9c86c09e3e4db49/
   aarch64 |                qt5script-5.1.1 | NOK | http://autobuild.buildroot.net/results/58e16e5fb4a2d1c33ff0fe9487f4b61cdad078aa/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/a2699002d04bde52cc1252ef90d284c83e144bdc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8ec282f45364666f86cad0c6ea769ff37ca78016/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0b058297c1e28fd54ae6d3dc81efbb44aed6e166/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6b987b5327eceb2a58c2b81596bc71d76fd06e4a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e8f8ceddec1e3238bf6661b9599e99569fc26258/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/700bf2e85429b35dcaa94ada57498c8be4011e1b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5c34613561f5cb3e7713424147d93d4cfddc6d5f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/dd35f99a8f8b07e611920e69aafab41d227b818a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/544d5ad2e9bfff8650f5aa3bcf440b973be8d9d0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b1b07b69d4f5487a341bbc09280687ea18fb6ad3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2d9d910ff316c6a45a236058a8c903d52ad26ae3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a0bb3a8c378a2a59dfcf645383a8a8eeb1f15347/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/dc117daf357df011c5e178d1acf1309aeaf36766/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/228507121a22393724369c8076c365556f07328e/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0309d5f6d066e0a181cda95f6224a75e4fda32a3/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/bb0a25a09e7f8fa708c5985ce8d9cb6b7cc031a5/


-- 
http://autobuild.buildroot.net
