From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-21
Message-ID: <20160222073022.D29851025E8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-21
===============================

        success : 191
       failures : 70 
       timeouts : 3  
          TOTAL : 264

Classification of failures by reason
====================================

                numactl-2.0.11 | 6 
                      qt-4.8.7 | 5 
               pax-utils-1.1.4 | 4 
                 opencv-2.4.10 | 3 
                 libdrm-2.4.66 | 3 
                   qhull-7.2.0 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
             ipsec-tools-0.8.2 | 2 
                 mesa3d-11.1.1 | 2 
              gst1-libav-1.6.3 | 2 
               libcap-ng-0.7.4 | 2 
               nfs-utils-1.3.3 | 2 
canfestival-7740ac6fdedc23e... | 2 
                    cups-2.1.2 | 2 
pifmrds-0bf57f9ce0d954365a3... | 2 
                sqlite-3100200 | 2 
                  trinity-v1.6 | 1 
                   fio-fio-2.6 | 1 
        ltp-testsuite-20150903 | 1 
               trousers-0.3.13 | 1 
                   perl-5.22.1 | 1 
                   tor-0.2.7.6 | 1 
                    sox-14.4.2 | 1 
                    ruby-2.3.0 | 1 
       openpgm-release-5-2-122 | 1 
             bluez5_utils-5.37 | 1 
               qt5webkit-5.5.1 | 1 
make[3]: *** [code/CMakeFil... | 1 
               host-efl-1.15.3 | 1 
                 igmpproxy-0.1 | 1 
                  stunnel-5.29 | 1 
          chocolate-doom-2.2.1 | 1 
                     gdb-7.9.1 | 1 
                   erlang-17.5 | 1 
kodi-pvr-argustv-32f03271cc... | 1 
                 setools-3.3.8 | 1 
                   mplayer-1.2 | 1 
                  prboom-2.5.0 | 1 
     openvmtools-stable-9.10.2 | 1 
               ipmitool-1.8.15 | 1 
            kodi-15.2-Isengard | 1 
                   hostapd-2.5 | 1 
                 libraw-0.17.1 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
               libsodium-1.0.6 | 1 
       host-erlang-rebar-2.5.1 | 1 

Detail of failures
===================

        mips |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/2bf4e5ea9b67b80ba38bfeaf71b747a92be09011/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/92802995144a76202040421255b003aded527958/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/db5733d2a62f84f90056d5e48e3f08fe94b87a6d/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/e09ea3a64d396bbc855acf7c07fcbea28fb2395d/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/07ccca8f80c56ab0ff48bfee876885b1c8c3916e/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b169b939e38cb761319a92d2871f4f59ddb5c4ac/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8b47dea53fc8608ab62cadfaeecdf828fd3d940f/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/68f98acca8b02aeaa98c78d2e95a6a29df629fef/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/edfb6854306ccaed9592139ad803850c2e0011d2/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b848969d518008dadb40fbebc40bab4124231c2b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ace98b9c51379e19f70bbe0bda94ff80ab9dd7fc/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6f0c9a682bc98f962874a38c9e2a334fea21b0cb/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/a9216cd5f9568ef134b64341b629efea40d54fe1/
      x86_64 |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/c427d13cf1c50305047a3f0b0051520e672f91d8/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/685e2ec91d889c6a789025864e6b4890ef6b532d/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/39ff650ca14bdfa35b35bbf13e01cfceeb43035e/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/f44629feae5eb8b8b61e88eac5b24cbfce8a1c4d/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/ad8fbadedc152ec93c175aeb24f062e8290a352e/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d618837a536dfd3d076ae1cecd1f598b4bf7efcd/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fa6b8a8175420e9d76f23eb7b61075ac5ce315de/
         arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/43939f65e4516adddc4385c6e0a2193abcab0446/
         arm | kodi-pvr-argustv-32f03271cc... | NOK | http://autobuild.buildroot.net/results/dacc3bd00ab2346d7655c0a1fb99f6c50b9da08b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/67f19f1fdf642c3c72deb931cb674b114bacc4da/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ed2503778126253fad08d9828f442a0b9d042fc2/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/a17047ada385e5be5f60c07254597fcb7c4183d0/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6d79591bce2d3fa5b93e268fe50d5b89ecd24521/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/52cdd46091740aab423987bdd6e2423b157a8799/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b1d80c4b62bd71e722f53b0e2caadd7951f23dd7/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/80988d3cc1cebd32b5c9718b936f9dfe9c10e34a/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/ce2c1fb10dfef1039545443ff9ef969889d2bf40/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/a692bc6df992cd05470fcc5b6e59ffb449da2069/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/0eb25c0756eeb6b7ad4d3b1a86a47dfff3d766ef/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/521aad4fd2e24fd78fa26a1d0c6284d56100a467/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e82b37607e3ef9efb0933e9300c48074d249a414/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/630771e41d71443e7c6a1ab3367199ebcc451153/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ddb1f5ccb1fb41fdfb7c035c0a8282a4afaa9c61/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/11e90fc79cb96631fd3e44af7e15650047858b7d/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/1997e8c52e093395bc0b15d6de1ccf328e077fce/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/39892be2a1857b727f4213079faaade52d4da0d2/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/131b044097725c00c58c05bf0d4e2afa05cf145a/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4db511e9d09b67ea333814d3698866c82c7afb54/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/6a1470c60b08c95765f3549177dfa6059b76493b/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/63086c31c57fd68aa2759c51d7dfd49ae9e7239b/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d05d7a24283cb0b5f305a7cd4cf8a60a4be7959d/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/92ebbd138dea50183880db49f920439b60e6f89b/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/bc6209c2531c791a095935ffc6ff461de04f5b04/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/a6b5ef77df470c99c83ccc02a731f944e9747c65/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/8a3156e287282fb63c009e04248faf09f9b29476/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d2686e71dcc1cf017503f7c68efdfe5c521abbc3/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/ee3701c11ba8094e74c7356105ee2a18c2c73100/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/a854da559be1d617d31acbb08c39e6ac5464cee7/
         arm |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/985dc18ec04901bea7d4fdd6e0145f7625e80869/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/f61ae46ba4d4fc3af3784d1f612a8c1cc7de3314/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/a124d4c8a2ef36165b29fbcc99c4c8ff89d296fb/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/918d72bd9684a39dc688b143b682f8b5f49f1b26/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/884bd0fef2f88154da949fa3f4cc04368575183a/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/34f8754e2ddb243aaa73af196622449f655c5213/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f3d2938ba6a590ff2c4b20a7a15a46cbb079bc8/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f67b512b761cb53a9d66ecfda9894e1f8d86c26f/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/872cb03d5869bd616fe8b22099a9ec4d556645ea/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d462bf881ab01102ae26e20794b90c0ac3bbe27e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/90a74e1c6c759e7029802caed2b3117fd63b1f17/
      mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/9379603f465a5ce3a579bf27338a5a4be0f11728/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/87c882bc1a0dec9d76917c1e2db51fea61150294/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/d22c1da4439806ded7cf8abf54ef92d0bf97dc9f/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/fde279194387e131a4027d5a1e2183da8e477bbb/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/95721f7b88c46a20202fb02e408817097df965c3/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/52202f98b9ebd273bdb3dd87f27cb1789f8362f9/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/d97674be3ebc90ab99e93b1b294cfae8c7c1dad8/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/64cd09dc957cbeaab9c5c6d331d38e6e22da29ae/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/fd0be644bf5c1c448eb1d2f94adbb433095f22f8/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6703eb14e69120f82878e4d3fb0dc5a4362cd8ef/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/28638752ebe923b6597ebc6838c1f97477dc23dc/


-- 
http://autobuild.buildroot.net
