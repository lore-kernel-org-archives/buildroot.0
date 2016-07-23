From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-22
Message-ID: <20160723063032.2AFBC102C5B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-22
===============================

        success : 173
       failures : 78 
       timeouts : 0  
          TOTAL : 251

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 5 
             transmission-2.92 | 4 
am33x-cm3-11107db2f1e9e58ee... | 3 
           uboot-tools-2016.07 | 3 
                 lvm2-2.02.161 | 2 
                blktrace-1.1.0 | 2 
                    qemu-2.6.0 | 2 
                  nginx-1.10.1 | 2 
                  babeld-1.7.1 | 2 
                  libsepol-2.5 | 2 
                  cairo-1.14.6 | 2 
                openmpi-1.10.2 | 2 
                  connman-1.32 | 1 
                cifs-utils-6.5 | 1 
                 omniorb-4.2.1 | 1 
                    owfs-3.1p1 | 1 
                   dante-1.4.1 | 1 
libamcodec-6f9b99182f94be14... | 1 
                    ruby-2.3.1 | 1 
                     php-7.0.9 | 1 
                   cmake-3.5.2 | 1 
                  squid-3.5.20 | 1 
               openswan-2.6.46 | 1 
                    libiio-0.7 | 1 
                 jack2-v1.9.10 | 1 
           libmemcached-1.0.18 | 1 
               linux-pam-1.2.1 | 1 
               sdl2_ttf-2.0.14 | 1 
                    mosh-1.2.5 | 1 
                    gdb-7.10.1 | 1 
                     dtc-1.4.1 | 1 
                 gadgetfs-test | 1 
               netplug-1.2.9.2 | 1 
                     php-7.0.8 | 1 
               wireshark-2.0.4 | 1 
                jemalloc-4.2.1 | 1 
                wayland-1.11.0 | 1 
                  mono-4.4.1.0 | 1 
      host-uboot-tools-2016.07 | 1 
             libsidplay2-2.1.1 | 1 
                fcgiwrap-1.1.0 | 1 
                flannel-v0.5.5 | 1 
               libcap-ng-0.7.7 | 1 
              lirc-tools-0.9.4 | 1 
                  multicat-2.1 | 1 
docker-containerd-1b3a81545... | 1 
               libdvdnav-5.0.3 | 1 
                   mpd-0.19.17 | 1 
                 rpcbind-0.2.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 clapack-3.2.1 | 1 
                  snmppp-3.3.5 | 1 
                   assimp-v3.2 | 1 
           linux-zigbee-v0.3.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
             bluez_utils-4.101 | 1 
                   jamvm-2.0.0 | 1 
                openssl-1.0.2h | 1 
tvheadend-8e637f9f903f6d820... | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3e97b57ca449b232401d4d9fc032531d2488cf63/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/ed11692e9f2e01e5c265739ace4ca8af6bd33f53/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/f8fe38ff5d3f47a84883b978a2bdb0e8845ef6a4/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b70e6f64789517e0db1c7ebdab823554d9c35bc1/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/f623ee8422f678423c2c61eb7ac07804113ec0fe/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/1a2f1826fdf16947a46f32352a75684c92afe6ff/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ea170828af5bbee355cc0bf550629c1f0352158f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c11d7360b69f921a75d0de30d4bd8f98fce97e2e/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9655966a10efe6b39f5b65f6514e7316bc0cdadd/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/d43267cdce518d8f66add4019fbf7f8ba2e93cba/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/a009f743b8b2c6150d70df33a07e1544c524205c/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/9a2a8ea3ab730592f775dcead5f5880d810c9d67/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/ac68504bb4c39ab1e30feb54ba00169345849889/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/9341768ce90db630b345aa07520256136e0925ba/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e9ce103aa65a549496579688863be3133bed2f9f/
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/49b4744e2e7ccf1abbaee01753a16c8fb8f23389/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/164531ed269240af3dfbeb9dcba7b5182d77eb68/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/a99f5b7a9761cd9aa366f413cc7d857a974e76cb/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/b955ead553d4bd71dfe2f1270a5950c70ba3dfc3/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8db37fc1a6cd60cec1cfa0c2cd9a66e611b4d380/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/9233533c132092b97f9d6ca6633e0a5dd701a77c/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/603af55805b56fc9f56f883177e0e271a7b896e7/
        bfin |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/06a0628209172a0977644dd21a1ad1679ed2005a/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/01c3628fc4fd602c97ebe2ed17ec0fb686a56e46/
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/f21df67ad9b3626b080b171f43770bd1dd2dd169/
         arm |                 jemalloc-4.2.1 | NOK | http://autobuild.buildroot.net/results/4090971c4a44ec74aac2e27e2bbbb2f80d839755/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3fedd673915a20f2df5ecd09230281b4e828ce4c/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/57efffa0d6625b6af9817a2c69994bc54f94e9da/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/02ceb1b28b4d7527dd2ec62bbd3d71996cf594cd/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/bb1c071e74f091c9db00d215f0e0ed4fc9ae3f7e/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/5e43b69a9d865efcab769e41abea2ecd573b4309/
microblazeel |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/e1547bbbcac947cb72d3f761c3ce92d0c32a9138/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/0372e5a6cc2eb9b88e4159d0b9ab51c23f85009c/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/eba1693d896bd8ff2ed11aa3c13cf9b9038f4903/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/75e7a37dd375f40e7e4c0fa0ce127f8cdf19ee7e/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7b64d316d2485cb003e96295b146055200ef35f6/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/10de0795b429f5e71f5e4ae37b1e605a29df6a11/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/796be352e931470226c00e5be729f05458254d88/
      x86_64 |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/ea98fd32a7da55e86f4f90c3ba1ecae4183c67d0/
      x86_64 |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/d0c4f3040799ee04480c2a9d543142916b39344e/
      x86_64 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/300e293f3bfd7e5c2752e13a888128a86532f292/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/bdcbea66baea67f84884802f24bfe80a6729ab0f/
         sh4 |                    mpd-0.19.17 | NOK | http://autobuild.buildroot.net/results/b82408fccbf816575125dcc1a1de7260f66f62e8/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9c7f2aa3aedb7a4faeac43be3197436761519ba5/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/364685eae4f2aaab5e32af6ae6954081b17d7e1d/
     powerpc |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/7537641f72de4f5097f1f2fddea5fb9a603482d1/
     aarch64 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/2642cef91cf2c48943c9e465b36f5bcff9c91b86/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/672649710940cbebcceb2d40298ac4caf89f5b1d/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/aaae927aea23412e7ede04a3983261516cfb8614/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/94b87ec8a5aa0bf95af980132da5250c999617da/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/29df7045383711ad0de1b54836dc1bd50f76afba/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8a848638abcb78d491fcde5e20c4ac06c6950c5e/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/315b0832c4e58856abc7a8160386828642359a96/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/2ab817ab939e5e280a1196139177841d6493f661/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/8d48c73148b6e7e22445e44815529ef37906b0b4/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/efe5cf0ace5cb3eda5cf9f9d4363410d02fa6df0/
        i586 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b17e40308b914312c51e96ad498d0ea2d7096cde/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/dc89560dda20529b7e8350f99a8247d4580ebe49/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/534d1987a4c8a6437e3c3eebf0ab12ec4180a416/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/29c205d90db0f4437cbebb4524c1ea259a45f6b8/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/2e43653ec57dffaf3ba36a572224040adb11ca94/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/ee12b2702c085d7a52869fc0f31366c667303497/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d1aa84c0dbb0d8b19f6e50e8afa01d6577f9938c/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/506c6212abe20bf41f19069a1c9b7caf69e0a08d/
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/fee6b0930cbc968e6a3bc0cfc4961ef08a3f53f2/
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f968fb31e9882cc856296a7c729d93e345e9e861/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/0991eee73866c7e55eece1f8296a30d06ea35b94/
      mipsel |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/2e12860761a951d44da2d6115af75eeb4c071176/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/2647253017d1f6969d79d4a2e0f7bb3f14861689/
      xtensa |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/520a6c902f731fa43e919a6167abfcfe83c85717/
     sparc64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/c1c347f4cc23314c1acc2d18627050b4159d52ea/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0456243b88d0366dd323688d5d7aeae5feab1a5e/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/6cfd52fc771921264964632fd9322cc75b14c6c9/
    mips64el |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/5fc24ed3025f287c2d776e5af2f4ac35815b1aa3/
    mips64el |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/ae7e113d7c66460b12e31b39663c8bab1394a2a3/
      mipsel |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/6cc0e6c2cb95d980190a9e2a7e3168fb67a24217/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/4932477f49a8949c6fa4595cf40e6615eb937b85/
         arc |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/dd03a25a4eaa6287fad984a21fd7a3505d98e23c/


-- 
http://autobuild.buildroot.net
