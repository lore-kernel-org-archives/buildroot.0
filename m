From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-10
Message-ID: <20130911063005.37D5452C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-10
===============================

        success : 62 
       failures : 58 
       timeouts : 0  
          TOTAL : 120

Classification of failures by reason
====================================

              opus-tools-0.1.7 | 10
    trace-cmd-trace-cmd-v2.2.1 | 7 
               nfs-utils-1.2.6 | 5 
               libglib2-2.36.3 | 5 
                 ffmpeg-0.8.12 | 3 
                   dbus-1.4.26 | 2 
                 dropwatch-1.4 | 2 
                      qt-4.8.5 | 2 
                     m4-1.4.16 | 2 
             alsa-utils-1.0.26 | 2 
         matchbox-keyboard-0.1 | 1 
          enlightenment-0.17.3 | 1 
                 libunwind-1.1 | 1 
                 qt5base-5.0.2 | 1 
           imagemagick-6.8.6-2 | 1 
                   mplayer-1.1 | 1 
               qt5webkit-5.0.2 | 1 
           binutils-2.23.2-arc | 1 
                      pv-1.4.6 | 1 
               alsa-lib-1.0.26 | 1 
                 binutils-2.21 | 1 
               w_scan-20130331 | 1 
                libroxml-2.2.2 | 1 
                 libnspr-4.9.6 | 1 
                 distcc-2.18.3 | 1 
                  aespipe-2.4c | 1 
               binutils-2.21.1 | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/5f3b68aac6201aa05d145b6f610f3b5613fc1785/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/62980dcf2236c88c4451036f44d5b359d07e8491/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/34e83adb83c650ba272242a8c2ab7474fc4f2399/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/aefcdfb48230bc14d5747fa4985dfc495c5a2c8f/
      mips |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5aa98ad6d3c1d29747e424904bca189c3477b44e/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/33059ec26bfcf777fe796493b692ccaeb94933bd/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/7e9e795c45c1484b7463d55d4239311d67fa1177/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/d896fe265f0aa0a73747ee1d083dda3d62fb0227/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/b10e1bedd542009cdffc0b9aa71c8fc1eb9ae3a8/
   powerpc |                  distcc-2.18.3 | NOK | http://autobuild.buildroot.net/results/e7eefab1db4a2adc503f796eb642d54446d18f0b/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/14bf0c9aecb1996450912de876dc6781c185ebdd/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4ed7324ae4ae9d719e99643e6a88670353ed1171/
    xtensa |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/fd3ebcb78b096e6542406ac33a61d2c733f9efb9/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/df1159fb508ef7a2944fbee8eedd00bba65ceadf/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/65b477881953380dc7fe3e34cb64753a6e856730/
      bfin |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/92a943af22e7130781a8b62bea4ea808089c5bfa/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/2bc7cf863aa49481b3402212d198ace276fabde5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/fc3d11d004f3c6df858aa5284a541c017ad43102/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f3cb0cf03d7aced25bcaccd19afec73c81f8d13b/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/65cd530f81d91accefd76ea2fbdd795852619473/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f15abec7fbd88f33b0aee95462b015d47f7d6370/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0724b5227a1f0897da8ea989b684f9b2d5198681/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b7ee68b39b2c1db1bdbe3b5ead4d399ecd7dfd61/
       arm |                 libroxml-2.2.2 | NOK | http://autobuild.buildroot.net/results/169b607993cd7ae4a8a79c2a00c00f820ec1c747/
       arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/39a32d323252e3d986fd9290108db7a496d429d9/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/104ab5ad041870c58df29f4bd84e275d80a70998/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/d6821ce44c6640c89a9244af407c3079f29db3e5/
       arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/f2d95c6e37f5a165855c5a9aae15c4eb2add61d6/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/e0e42875aacf5bc30adaaeb07b640c9f5bc1c0f7/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/73a30afb05f7c2a15c56121a3275d80c358c5d7f/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/7cd20180e58487d46b5ad9947f2b7355cd16ff3d/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/dd97b8f532e9b2648d2424352f6a024caef752d4/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/c476a566644cbe6ffa774e5c2c5737b10452171c/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/3d37212239cf41ed0c58177f7db356f26e413085/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/1218d379007ea1e09c1e18b773e20f65d90394b2/
      i686 |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/7005a310a04a37aa0e79595df46739ecafc1daab/
      mips |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/c5a8d2dfebdbc8238aaba1ea2f212ab1226d29a4/
    x86_64 |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/b479027b8b782d08866ee23b3aedda3a96aa5547/
      sh4a |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/7c05fd551d1fadcb7c3a6a2993671a84791d9dd5/
       arm |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/7cecdd324fbe008b9d878c9dedd0cddf3205eb51/
       arm |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/c8c1a682336c150ee401f76b173944611b96bd4e/
    x86_64 |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/1b99181a01de0431b706318290bf9f65305431c5/
   powerpc |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/d3dbc0140b20d1b603a7ffad40ca7b8934b2e21e/
       arm |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/190416acf4e14f5d78fce8e5e6eeacac7887dfeb/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/11dbb2dd60f2fe476446ee049400a3b2072e0af8/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8fe7086bcc4c01ca6f936e9a6a086d7e6e7ef4c5/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/55ada3ca9a5cd6296d2998c2b9122c9d40198a98/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6c7be65e61b2c8a854f63ac938fcd4930091b009/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/728bc8e8a4a4d0849c1b66fa61dd05b31c701cbe/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8e2b94165c1a9c325b6274db45fa0bf3a664cba3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7d7585c793a7ed931c913ebb7ba1b36335797fc6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/30f1f1b181f6f80b9a0b40dd07faea8063b6a9f6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/861dd12d2fa807560849b587d67abae80face6a1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9c1d8e50eda6ef55d67855bd6340c652352cc581/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/19eccf51f3803b88bebec5b00849eba53c1fec78/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5619f3027d6d2741668ae069aadc16306387e1cb/
      i686 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/b203926d407b3b838ec6f55316c9e86ca677deab/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/57e0b2527aab7bf10f5d6e1bda287336cf2780d1/


-- 
http://autobuild.buildroot.net
