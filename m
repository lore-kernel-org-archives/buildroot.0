From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Mar 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-07
Message-ID: <20150308073016.D1BFE100C42@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-07
===============================

        success : 227
       failures : 66 
       timeouts : 5  
          TOTAL : 298

Classification of failures by reason
====================================

              host-cmake-3.1.3 | 19
freerdp-b21ff842ef3de583751... | 5 
                  uclibc-1.0.0 | 5 
                host-gdb-7.7.1 | 4 
can-utils-002f8eba8703e88cd... | 3 
       erlang-p1-iconv-dff5ee5 | 2 
        gst1-plugins-bad-1.4.5 | 2 
                 qt5base-5.4.1 | 2 
                     vlc-2.1.6 | 2 
                collectd-5.4.2 | 2 
                    strace-4.9 | 2 
              wireshark-1.12.4 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               batctl-2014.4.0 | 1 
                  cppcms-1.0.4 | 1 
Resolving www.directfb.org.... | 1 
           heirloom-mailx-12.5 | 1 
    libcec-libcec-2.2.0-repack | 1 
                 mplayer-1.1.1 | 1 
             host-thrift-0.9.2 | 1 
               sdl_sound-1.0.3 | 1 
               qt5webkit-5.4.1 | 1 
  host-xproto_inputproto-2.3.1 | 1 
                    php-5.5.22 | 1 
           libmemcached-1.0.18 | 1 
             lttng-tools-2.6.0 | 1 
                  snmppp-3.3.4 | 1 
                    sox-14.4.2 | 1 
checking if /ssd1/thomas/au... | 1 
                host-ola-0.9.4 | 1 
  toolchain-external-undefined | 1 
                     gdb-7.7.1 | 1 
                  thrift-0.9.2 | 1 
                      qt-4.8.6 | 1 

Detail of failures
===================

        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/889c8f32453eb2616844a441b53ad941ba584f0e/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/799561c928d711ada4070ae5e09f4097dd4091e3/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/f18c11457059e404c1e2a28f9948aaeea5a830c5/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/6d4adb753063e1c8da032ceae9ea420d0a399163/
        mips | checking if /ssd1/thomas/au... | TIM | http://autobuild.buildroot.net/results/669c1e7877b593b27fcf4b8a722e3dbc6685922c/
     aarch64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/f06dcf8ba1da796d21d1a9285341c3d24df5cbcd/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/cba6b9a0d38bd0b918bf8a3a19cf3f41e3dd2c73/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/43098bb3665f02e0dcde479673800c88e7a934fb/
      x86_64 |        erlang-p1-iconv-dff5ee5 | NOK | http://autobuild.buildroot.net/results/f7470f359cddffca8c99927c0b275400669bc815/
         arm |        erlang-p1-iconv-dff5ee5 | NOK | http://autobuild.buildroot.net/results/da871220f87b584400c2169411eef741cad825bc/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/b7721e274913a5fadf97b89536d07513108604a4/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/3e4ef3174e5c2beed9b0eccdfeb0a13238ab54c2/
      x86_64 | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/3db9a2b766db66f2cdb2e4ad89b67589954e8f15/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/aa2e05655ca1c38861611c2bb29a6215fbfa498a/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/326b0a950fff540eb1b6a18127d1afd1d7624816/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/be91c3e2e1207b33717a3e8cb7cbca5ffa16b050/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/69812f27988912f6e9675d51e2154fd566491ea3/
     powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/dc9b5a75e181e3015c261883d7856e4cf487be8b/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/ec0a3f1418ef58eb5cb0f53a889b016479586e1b/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6dc5cb6e2ab2da23214eee57d74226606aa67f57/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0ec1102c8029e5e7ce1731b1f4bbfec159ae099d/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/7fa210963bdb8bce998ef291a7481cea28fdab86/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/037177aa1895703f94e29c1d8648515cebfe7ffb/
     aarch64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ef5372f2ce591131b5f2877490908a4796f33e56/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/8fd55e66c613924f50da69bb29de43e2914b38b0/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/f51edb321584c94cb096f425424e519e2b8526a0/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/06cf142a5406904021001b1ecdd3dc698e2bca04/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/fb020c0b7718810a1c8926692300def62cdee5fa/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/db72742e241bc3941a76db1d3f95d7d5f583d2c0/
        sh4a |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/03b2f136a4cde866c67d341660cb677eff93fba1/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/d02bef6d2ce5395c3b13908f75e387ef23451c52/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0ffa13b7a8e8c704a35205b5c641dec54e59e3f7/
microblazeel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e02f1b424d17e5c3102e262211942159d79907b9/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/a7887d6963857dcbe7a095425b28c0062967fd92/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/4b759e1499402f585fad0af9c5795292e9581a82/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/fbae3c787ff3aed4975c776a46ad32036e63d824/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/3a6e4b2e44a4f1d88be5359557ec4f01bb955675/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ec0a91b1c5dfefbb4f0174f3a406a4b1d846aec4/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/0eb04eae946944fc90e874ac737f3e9bfa8cbf0f/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/bb699f20a7d6f4f5c3be1dcf9744dca94e21e1ab/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c8d08a465b8bcfe38e9e7bb37f14d27cce2b82fb/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/513d54c8b61faa58e5e14d362786cbe645316ea1/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/47b70d2e71e75e508f1f18f8c94566e779fc9649/
     powerpc |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/73233ecfcd4946c72b6a85f5852b193c32f1a850/
     powerpc |   host-xproto_inputproto-2.3.1 | TIM | http://autobuild.buildroot.net/results/19443cc3b8ea052f0d9a72aac75611992a9bb9ae/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/30b5e4dd183a0e94bce1fe626dcd11949371aaa5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0c76499d5bb19193c31271a4e3f32085135e4e88/
      x86_64 |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/fabdf51a26b091d6e26cc7ba156f008f94deae9a/
        i686 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/2c30ec2673edd5d0940278df003c2e92063e3384/
         arm |                     php-5.5.22 | TIM | http://autobuild.buildroot.net/results/f2bf1e0944e9adb376e1b76d90dea1aaa5fedc9d/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/5725484cfcc0a999654f147ce6d00b1c2c15f270/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/4b48f44493e4f3e78a67ccef4ecea7128300f7e6/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/c67bc33cd2848978a2bc7f52aaebe413b66d5fb6/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/6aa9feff6f51ca76a7e4424d76d38ee299dfaf98/
    mips64el | Resolving www.directfb.org.... | TIM | http://autobuild.buildroot.net/results/8de38168c865bd0421f8e7423a0f1b42744a2fcc/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/539c84a3b9caee5da1072ba5231e35f3fd1443d1/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/924d67a0bda1a9a8136bc2d0db98d836ff61b426/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/74f139a61741868256dfc906b5dce5820f0610d8/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/d05e208cfd655102d30def9339eefd3e4fc38121/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/24f4be630490ed0bff487ea782b62e83e2ed7a92/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/088a614b2f9310339d1709b6d2bf92eec59847b8/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/28856309fc18db02e3bf5a6eefbce0730319b4f8/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/74022e50e5f86aa4f06248b9bf224a23b15de64a/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/df8c9ac8f749f2bea8d7fe099be80ee0d479040e/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/85e0f1dcfd8748ac17f165ee8d0ba096046b2033/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/527ab9da44622072688e2dc55ecad22fb4383482/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/89e423bee040cbce3e82cd89f1191efaac490c0d/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/173f24f469a9b52e8bae8b48e837befb5a0113ec/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/9f77ba6aeb88b5aa963229f6c96fd7895bfff049/
         arm |               wireshark-1.12.4 | TIM | http://autobuild.buildroot.net/results/5704571caf6484506d4f5211cc0c2263da0f2115/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/3359da417542cf49a4b2c4a457a72370ca0e2260/


-- 
http://autobuild.buildroot.net
