From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-02
Message-ID: <20141203073017.2AC17100ADA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-02
===============================

        success : 122
       failures : 30 
       timeouts : 6  
          TOTAL : 158

Classification of failures by reason
====================================

            live555-2014.11.01 | 7 
                    flac-1.3.1 | 3 
                   dejavu-2.34 | 3 
            liburiparser-0.8.1 | 3 
               alsa-lib-1.0.28 | 2 
                      qt-4.8.6 | 1 
               pcmanfm-0.3.5.9 | 1 
               iptables-1.4.21 | 1 
             alsa-utils-1.0.28 | 1 
                   atftp-0.7.1 | 1 
                 libnss-3.17.2 | 1 
              librtlsdr-v0.5.3 | 1 
  toolchain-external-undefined | 1 
               host-ruby-2.1.5 | 1 
                       unknown | 1 
                 samba4-4.1.13 | 1 
                libupnpp-0.8.6 | 1 
                    parted-3.1 | 1 
                  perl-gd-2.53 | 1 
             xlib_libXau-1.0.8 | 1 
       directfb-examples-1.6.0 | 1 
                    exiv2-0.24 | 1 
             python-webpy-0.37 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/f904f5bbe37c3d481839808f581929dfcb5b85bf/
        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/1a550a51d140af4c4e49da5faa7b4462a39594e3/
     powerpc |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/1aa8a19a114aacddbd43baf5f99154bb898e886e/
microblazeel |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/4b29aa93ea2d570a60499f6e8cf66cfca65e7858/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/0d922af618af2637778f07c56aa85909fef9bebe/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/bb71133d87f1ea31a98d2c5e8d60c42ac7b13d96/
    mips64el |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/44c7e0bb697b05359d2278cefdb2d9d40fd934e3/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/6fba256be73074bcf6bcbaae5dc5de63387735e6/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/09d9b525eeee458247e10a7948070c00bbabb964/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/c22f29fd787a3d12d86cc3cd3e2d9c8688d2f65d/
        mips |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/1f824e3aa17fb17e7efe3e4c1636974fea79c1f9/
    mips64el |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/8ad965fbc19e22d3f43899cb5efb42626fa2f55e/
      xtensa |                host-ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/14a3914e528ced3d8f53d349b018772d4435db77/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/a84666721d0b899174e873ab58753cc136994cc4/
         sh4 |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/23b736dd74ed8039af58e442b89011335f6ae8c9/
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/42a90b803219948c9262e333d5e850feb2ae4f16/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/3f6985139b345e6416535b2480045e0961fd362f/
        mips |             liburiparser-0.8.1 | NOK | http://autobuild.buildroot.net/results/7bc98be6b4bd5f9f3052391fca449fa1017f2953/
         arm |             liburiparser-0.8.1 | NOK | http://autobuild.buildroot.net/results/43981347f7d9eda915d58b18ced4db83643e30b4/
    mips64el |             liburiparser-0.8.1 | NOK | http://autobuild.buildroot.net/results/60b006624a8d246278e60dffd34cce0c8a96272f/
         arc |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/431c4b5dd0ca177c84bc3f43fe7c97ecf1511839/
     powerpc |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/618598005126a4556ea7284d21de1eac4def455e/
     powerpc |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/00f26fa3b6fc8c707009f44ede7b680849f18d5f/
      x86_64 |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/6e78d3e29856c25d233f1629c31bc15f7ecb2f89/
        sh4a |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/3d323737183e4e5a5ddf60eb70beb30ac576f76f/
         arm |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/ae21c44340e184ef4d3095dde8304af6fbe12c92/
        i686 |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/fa211cd5e96062ecb140f4c35beb1b69ba39e45d/
     powerpc |                     parted-3.1 | TIM | http://autobuild.buildroot.net/results/15148c0b0fb150f0fc3570aa34507e13947fbd2c/
         arm |                pcmanfm-0.3.5.9 | TIM | http://autobuild.buildroot.net/results/127738cb875e5da0293384367cda00b927a2d93d/
      xtensa |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7e9008ee9b806f38f0fa58300704d00e90cf8901/
         arm |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/9e657f4d7a0db8987e85994a6a8b76502d5f6a95/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/cddd281b7f0df7212d9a0e429e56828061272000/
    mips64el |                  samba4-4.1.13 | TIM | http://autobuild.buildroot.net/results/0cb44286c00691ff25798fe218d0145bfa4c4d36/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/78b00d1892488175dc7d06407b72cb75d8febaad/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/df5b72647aa33f6958d3b8bc7becb675bbb5a570/
        mips |              xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/b8474b85315a0424870fc655dc89324bb1193d44/


-- 
http://autobuild.buildroot.net
