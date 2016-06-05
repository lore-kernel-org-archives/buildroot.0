From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Jun 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-04
Message-ID: <20160605063024.5D45E1029C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-04
===============================

        success : 153
       failures : 62 
       timeouts : 1  
          TOTAL : 216

Classification of failures by reason
====================================

               target-finalize | 21
                    libiio-0.6 | 7 
                flannel-v0.5.5 | 3 
                 mplayer-1.3.0 | 3 
                wayland-1.11.0 | 3 
                blktrace-1.1.0 | 2 
                     php-7.0.7 | 2 
                    lftp-4.7.2 | 2 
                pinentry-0.9.4 | 2 
                   erlang-18.3 | 2 
make[3]: *** [all-recursive... | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
               trousers-0.3.13 | 1 
            lttng-libust-2.7.1 | 1 
                e2fsprogs-1.43 | 1 
     host-binutils-arc-2016.03 | 1 
                    cups-2.1.2 | 1 
                    owfs-3.1p1 | 1 
                nodejs-0.10.45 | 1 
 xdriver_xf86-video-tdfx-1.4.6 | 1 
wiringpi-78b5c323b74de782df... | 1 
                     fbset-2.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                grantlee-0.5.1 | 1 
                     vlc-2.2.3 | 1 
          binutils-arc-2016.03 | 1 

Detail of failures
===================

         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/2f43276458b9049cc806635467f31d3d1126bf34/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c35a6548ed01abbe5e2ed677ee24d669b423d3cf/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/beaf30c64f0d49e3f08e2e5e46f8848be3e54cf3/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/77bfc4747613e0045d869a3daa6915d9768347ff/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/d024dc3046ca9505294c549437974a8eda4be4fc/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/5ba7f66126b9cd68e1a68217fcaa3dbab6c01eb5/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/c26e68e9516ea0fdd6fe430d5bc011a5ae46c0f3/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/c34930d30062e750f753f74d2d0c1acb43ac8949/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c9b50a52d6b72f47385b60653513bd12e2f99ab8/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3323c4742c0ec3622e7aa3dd30d5abd5f6583621/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/194a216ff8e16617d869da5cd8e393bfd76436d7/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b2acae149ff005a7da174ae0f65374040746b250/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/343e521454f9229de708c1169e1bb4c973a3a1b9/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8f98abeb18609f56b3fb6ef17f20d6a6190a8e4f/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/4427aaaaf0c8b2b7abe181b7e65931162995265d/
     powerpc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/66f406b10e75a7143d1173124a588ba36fa09f24/
     powerpc |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/bc3cbe469741de24d5b0b7b4a2d295b0ba842f7b/
      x86_64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/cc42f486238d7a0ab978bc0a085b30f94d5245ea/
        bfin |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/796ebd732ba9cecfe135df786545a96199fa804d/
        i686 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/ead8bd6726058e5c952f1a7fb8fc3c98b09b9b19/
    mips64el |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/498ba7183095d836d6b240a5dfa21fd577c6a4bc/
       nios2 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/9e0efee8f646e8bf69563c88a8db5f025b27792b/
         arc |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/971f7299da697644c066a3622a9df87a92c0b46d/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/128c9f2b942cc37a4d52bca0aa82e8fea1b63158/
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/9aba4c8e9089f6e367ab7d738bf3026bf2fe0b53/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b0e39f37e0e37747dee3b6bfe5ab8eeb309a45b7/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d60535908c8bb853987829106d6d2118ae62ae35/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f6a9384e9bc8851fac863e4bdf65d2b9f1be383b/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/ad818e8bde29f8cb61c42a57ddacbc68ec5ff335/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2fa294ac9da777c11bf507074e1086ca54b084c0/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/fb48fb10fa2cf143a94041a7e4e1c35cae54f2e8/
      xtensa |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/881a6539e8be32801690f15b53c8cc48ac890cc7/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e2990ece25b64f11f2e98b2bd2ce54b7be5febc9/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d455a0eaf3476a944ca487ebaa519d9a19ff312d/
      x86_64 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/c0b7683c12e358d12ea8bf7023a1e791cfd89f4b/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c8a828579f68b5e9e953a525355b2925f3d27eea/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/69ac7e73aa3d0814947411a73f4bb00da894ac4c/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/251182cd3a20dfe90630c960ad0ca1734c6c91ba/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/9a817702c9dd349a7e3ca06e32378b88d9d2a0ba/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0652fb894550b8fac5398ce8b34957d19a9d4b97/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/42b51ee32d31cc70eb848de248791dcfcf5d3a8e/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a469c173d494411b4280b222ceb2036ac821f3ac/
        sh4a |                target-finalize | NOK | http://autobuild.buildroot.net/results/bb4aa67d41a3bcd1759e6bf72bfaa9ec82030592/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/f4a166872ec82b9d4cd70849fa331eb48e48093f/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/c2d56e19aea280b60ce8304b930db0640a3bb1fb/
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a56363a8a2709b8037591ad750ad8b77e6fc4e8e/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/8dcaf9007cdcbb2a4028009eebc089854ef4546d/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/401963fea20ebca77c7e12e81f5dbe18c053f768/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/3a9744a496df1754dd29de03c1f7cbba3eab4008/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d86c71a8c38061eab0eeb59b6c0cef35e53a26ba/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cc690f3939cd2d0f4c882c0af17ad9d19762a85f/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/ecd22f6cfa5d910eb455922f745446d8527a3199/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/11ece3a964637166b6b4c13c357e1b20ea4bdac9/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/87a58548704ff73986d35bfdacf8c006fb0fed5b/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/02830d34df897d92df8f56ed7c27ba178a9369b0/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3f559710ffc9d133c85a133f496c0d080e69ae9c/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6b324e842b80205e1418701b47e7e7d4775a0127/
microblazeel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/866e285aa391e0b53b12f8cac60fa53ffc50fa92/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/58a0cd36064a17eeed14d2e0b9de2028f19e8b1a/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/8eb04d5a9efb7318a6d2c662bba6c7bf78421a46/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/b9e9af9af66b301d5e42ea6c28d6baf5c6c46606/
        bfin | wiringpi-78b5c323b74de782df... | NOK | http://autobuild.buildroot.net/results/c6013c214674f9802309d8cd770d3da2f751674d/
     sparc64 |  xdriver_xf86-video-tdfx-1.4.6 | NOK | http://autobuild.buildroot.net/results/304b68d14da026755d9d9323ed60f4f86adc7a96/


-- 
http://autobuild.buildroot.net
