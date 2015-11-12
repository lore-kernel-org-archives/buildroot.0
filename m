From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-11
Message-ID: <20151112073021.78617102C26@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-11
===============================

        success : 169
       failures : 108
       timeouts : 0  
          TOTAL : 277

Classification of failures by reason
====================================

                   mplayer-1.2 | 10
                  ffmpeg-2.8.1 | 8 
                  gauche-0.9.4 | 7 
  toolchain-external-undefined | 6 
                    libuecc-v6 | 6 
           libfreeimage-3.17.0 | 5 
                      qt-4.8.7 | 4 
canfestival-7740ac6fdedc23e... | 3 
                 mesa3d-11.0.4 | 3 
                busybox-1.24.1 | 3 
                pulseaudio-7.1 | 3 
             host-mono-4.0.2.5 | 3 
                directfb-1.7.7 | 3 
                 host-xz-5.2.2 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
             host-gauche-0.9.4 | 2 
        python-protobuf-v2.6.1 | 2 
                iproute2-4.3.0 | 2 
             util-linux-2.27.1 | 2 
                espeak-1.48.04 | 2 
             lttng-tools-2.6.0 | 1 
             ebtables-2.0.10-4 | 1 
            libserial-0.6.0rc2 | 1 
         lua-periphery-1.0.6-1 | 1 
             bluez5_utils-5.27 | 1 
          sane-backends-1.0.25 | 1 
           dialog-1.2-20150125 | 1 
rpi-userland-b864a841e5a459... | 1 
             fxload-2008_10_13 | 1 
             webkitgtk24-2.4.9 | 1 
             host-nodejs-4.1.2 | 1 
                     fastd-v17 | 1 
                 python3-3.4.3 | 1 
                  qemu-2.4.0.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
              lirc-tools-0.9.2 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                    sdl-1.2.15 | 1 
               libsigsegv-2.10 | 1 
       openpgm-release-5-2-122 | 1 
                  autossh-1.4e | 1 
                     vlc-2.2.1 | 1 
                  connman-1.30 | 1 
                 libssh2-1.5.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                rt-tests-v0.89 | 1 
                     mtr-v0.86 | 1 
                   jimtcl-0.75 | 1 
                oprofile-1.0.0 | 1 

Detail of failures
===================

       nios2 |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/ecf7d7e99937a01be35f3eaf5910f10c55fd5cea/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/08e98ab70fccc70a81dcdb3a97d921d2bef796cd/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/bb4aa55bbfee1e10b6fbed17cdd30b82d935a1da/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/f690477f10a8a5e139e1d15bdb44c20713c74a8b/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/ec90ee87d92901e6e051049c5c1f39f804e717af/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0e06e0aa4df0bb1390c9c2c69d5254605659fd48/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c8e464a2366bcf757fbf7b4bc5673fa613a6ae39/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/925d646fbb5cad538d8ef9967147ee2ba95f0c8d/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/7817046781000e00f5b3a60c5e88685fe6b5774a/
    mips64el |            dialog-1.2-20150125 | NOK | http://autobuild.buildroot.net/results/b4f9291cc7dc17b54ce89b6388d2d7ed8f59c8e3/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/6a38f77fccce795e06abddf10634c1ec6d0f09be/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/d855d8df5bfac2a4539dabc7fd6f4a1da1d39142/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/2ecdbbb0618910ae1ad43544b0d26ca382a0f20c/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/75cc79ae2a2d05ad27198f1b745c8bef37c3a87d/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/3b66bbd7a966b44706e552ade1a2bfcae8b702bc/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/c3cfb3d92d91a5d3e3ea6ed4e6113b6044ba0ff1/
        bfin |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/0f42fcdb1cdce05945758a4b203e4f53aa53b71a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a05169f9e564e7e90785d4f983dcc723bc86cbfb/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/c67b3e03b203fe2aca2b74cd3b5061cabd96af7a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/24f7aaf09f7c6596996e827caffe7057adc3f2f3/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9212f5a6432c5e695ac0630695405cea05e28610/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4e933aa7b6c0696e44bba7a062f3e64fd7b4b511/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/c20cb0a003c2a1ad2b4e5ba323b2840bc392b327/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/30f85b89d014fe1bcc19166c8538363366549fbb/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/64b3f28d87feba14bbed816342782301504a0e44/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/a9146b49ff0fd31b59443c5ff5094fd278d1ec92/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4ed0768d5bfc2bd3a30d74abb60e16067657bb8f/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4862a0e4a4d65493da875c2071b543c067e2ea4c/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/f258fa9c8d7298fc984c270e4f5e8b09efce04e0/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/0dc2552bc8ae333f2c14faaaf3308afb9d785a02/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/6682c4170272e0331b22b2eceafb3d9ac97c29a3/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/36c2e7366a03b841e14c389dc87b99a4190f0e68/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/27fe03e5ae2310163d46f4888ab688426f6f9c70/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/07a3fe9e25e3c18b05d95fa335393d6be8a05988/
microblazeel |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/327597adca42bbee5a80285e0f34de245cf0e829/
     aarch64 |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/9c4fa6ef22db017351b0ce15028db47af2fd1f66/
        i686 |              host-mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a7f84d1eb6cc0a3d4f8ae6ea73a4eb170677741e/
        i686 |              host-mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c0451283060f6553875b648945ea4082ceb092b4/
        i686 |              host-mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/f391295cb8c772460fea0d6bee8927302590db7c/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/a2838f7f7cbdd5d0d7625c83f5b2c442ea85a61d/
     powerpc |                  host-xz-5.2.2 | NOK | http://autobuild.buildroot.net/results/5400790dcd902a71e0d07fd88852948d3fa0a75f/
     aarch64 |                  host-xz-5.2.2 | NOK | http://autobuild.buildroot.net/results/4407d5ec68f32f9fcae73a7e55816e5316ed09b3/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/a038b6cc2f091c5b4a654f4bada1a713393bb50f/
      x86_64 |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/875b7f350108c39f9f8ef2c90dc417f1f916d556/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/44050664710445f9eb2df9d7068ada8c17733a01/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/5171ab8404658f280afdd24802072276d8b0deb4/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b29702c1addcdfbe8ab585404f2b993533ee921d/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b20d5884761acdcd7dbc4d25e8e30812f709a734/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cdc12dcc079587666b3c7481bace21b29ec668a8/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/00effd6ae03493fd6bfca89886bdd7962a4f629b/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/00077e9415eba445af5a558de3fe350aa661fdd5/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/6d5ce62d3ce99f267a7573375fc9f91966e842b7/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/54b742e7cd4b54e20f53dd757e847ed4288fa7f3/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/bcfd8287a8d3dec2d66aa8191910f4dab0d7be36/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/8c052b847a4723cbd042b1b9b41f927386ca9d57/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/106375cac1aa43ea11792189c9ab96327e607627/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/ed99f5e83d64757e0f877ca5e5c2d9b2c2d38e53/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/1a24986cdc79a930f61a201cddf7c5290af664a8/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/65148d8f277d192412c581049493708a24c348f6/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/d38d2b3301b0345aee2b294d1314b885e337918d/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/bc12f24b1f91f4c2e766dc9165d37b9e2da32027/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/a171eb0ff11b41c9f3bb9e4c6743810a157b8895/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/603c4426c47220808305a416f3d60fec2d8c02a3/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/96dfe004f9e3c7c55eb351d0c29c659624739348/
     sparc64 |          lua-periphery-1.0.6-1 | NOK | http://autobuild.buildroot.net/results/005149b5ac0175b1d34166ea9cc46d5bf69d9db6/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/f52d8dc01fe5a8d94263fb992dccb55ba177b398/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/b0c3658e0b1b414bfda1e5b912f2dfa09a5a06ee/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/10fba60b8e54d7854446a2a8de62acdfbc28bbd3/
     sparc64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/390774d87db9638a6f63fe5a64f7b79bf1aa2344/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ec9606c4994b71cf3449cd46e0215038b41a24b1/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7e8bc58aca7e72fa449419965cc70b0a63dd4f9d/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d6fea133d93c98620992a7f2d26a80161949cd4f/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/83c83eee272330251a7abcd6eb2943dc2aa48c62/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/19b12e84326e3c8918efd947430961d8060a6633/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4d79daf131c5f1193153276b0c3ae144823b465d/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dfac59d4fcac4c75f060e6228fb4cab7e262df84/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/706ada0dec0d0051479d7a7f913cdc60e94071cb/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/829ab2c1a730069651319e0507addee66915645a/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/a53883e192de4bce92c49ab26c4920834ed8ad91/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/8dad283cf3fb19df0b180e44b1b1f0abe86b0c4f/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/9caa3654755180f5dcaa7d66044d0db6b52f0c8f/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/0fae9a89fda1622a94ee74b56471ece71622b869/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/606f3b32a621f3ea8260367df9010511fa326b6c/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/fb1b0cedf6924eec097c33dd921dc2f4ed2ca5bb/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/ee0c19ea4275c94b8ae2339567a682588d4782f6/
         arm |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/6d82b123d704fdfd57bdacf07ecf85ecc01a7e40/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/0c6babb3e6a834c4f9f94d949f904b6d5e4131cf/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/8bbfd91d1d972b5d382e7355a8a36ab532510745/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/6615b4abc2a312253a0ae66a61642aba0c58f1af/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/957ce562c2df5c9b995893fe413d3ac3a0fecae8/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/775b83b8359ab919792517ee8015d9f23257d5b1/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5ed462fcfb1177421f9a552cb780d26a2a067f34/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/95b3614cae5f2f8c6cdf5e0d36e8e86c2c219aa0/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/ce8d7730e48d03bad981a741f82325abcdbe7f38/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/b4d739b73a88375e868af008ca3b2783001b5bf3/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/8f14faa757a70d2e9bc372c3f35f5748a4f31b45/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/d193ee41386dc7e98cd2b9daa6e13e65ee62ce92/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e2649937a15fa4f891e925fdac7711b2485b4c1e/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0253f369fe6b5b4322a7144863e4620a0faec6a6/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/11c38904a0c2d14636bb4042b0c55a9dd5ac99fa/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7a8e2b72cf982dfa7bb83661d02cea7e58b189d7/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9ba0e45094c3b28fdbfcbcb0ca3102e8bc57a946/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d0198acec679376fe486e431da7ac2f292198e27/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/8e7ad9190112f32244892c46dabd3cc1919ccf23/
      xtensa |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/6f596aef58315afae2608b51ad70de4cd240899d/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/39ab86367f8ee4474bbe81fdcdb4994c150b43f9/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/199b2bf2f0e86a8bca8440000ce588d814f2b2ec/
    mips64el |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/d189dcd5fbbc53affa9139c0445687d14e88883f/


-- 
http://autobuild.buildroot.net
