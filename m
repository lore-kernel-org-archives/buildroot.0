From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-22
Message-ID: <20160223073022.BAAEE101D6B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-22
===============================

        success : 197
       failures : 61 
       timeouts : 5  
          TOTAL : 263

Classification of failures by reason
====================================

                    ruby-2.3.0 | 4 
                  cairo-1.14.4 | 4 
                      qt-4.8.7 | 4 
        lttng-babeltrace-1.2.4 | 4 
                 libdrm-2.4.66 | 3 
                 lvm2-2.02.138 | 2 
flann-04b4a56533faf8c8228d0... | 2 
                    cups-2.1.2 | 2 
               trousers-0.3.13 | 2 
        ltp-testsuite-20150903 | 2 
                 setools-3.3.8 | 2 
                   host-jq-1.5 | 1 
                  kexec-2.0.11 | 1 
 xproto_xf86vidmodeproto-2.3.1 | 1 
                  weston-1.8.0 | 1 
              macchanger-1.6.0 | 1 
                 libraw-0.17.1 | 1 
                 libfuse-2.9.5 | 1 
                 mesa3d-11.1.1 | 1 
                     gdb-7.9.1 | 1 
               netplug-1.2.9.2 | 1 
                      x265-1.8 | 1 
                  boost-1.60.0 | 1 
                numactl-2.0.11 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                   erlang-17.5 | 1 
                  prboom-2.5.0 | 1 
tvheadend-1aa0073be39119f5d... | 1 
                       zsh-5.2 | 1 
              pure-ftpd-1.0.42 | 1 
                   qhull-7.2.0 | 1 
make[6]: *** [libavfilter/a... | 1 
qtuio-abe4973ff60654aad9df7... | 1 
               libcap-ng-0.7.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
                    sox-14.4.2 | 1 
                    php-5.6.18 | 1 
                   tor-0.2.7.6 | 1 
                     rpm-5.2.0 | 1 
                   fio-fio-2.6 | 1 
                  trinity-v1.6 | 1 
                 opencv-2.4.10 | 1 
                     vlc-2.2.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
               libgtk2-2.24.29 | 1 
                       unknown | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | TIM | http://autobuild.buildroot.net/results/217b5278193b2b0d9975a0f271b1796c511dba29/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/664944583bf6d72fd83733463a609e42fb9c0e97/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/9cf17719313016f03f405c5a4fbb57124a9adf04/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/3d9e5b239af57e9ddab80182086a745821503319/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e84bcf9820d40509f1d8ccb94f79e09ce0de2b7c/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8f2ebb3c83188d035a0eca2dfd52708f2cb3d25c/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/34ef566c83d52087470cfefc35e5100124535bf3/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b86d685caf8cf812f9505fca2de36fb8c18baee1/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/622f7f3f9bff9ea92b494a9d1def0cb43330e35d/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6186e4ac9deec979951f5a4d7ca0750a93fc5de2/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/0c7f618c3afb690694daa8ffbc1d9b9b790ce6fb/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/25d35b1996e15a1aae567c297f1f5a2154c59204/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/19ca73d8d10712dd8215d2dcbf89dd5525fe163f/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f063398c0d79ce6b5c61e867a1b9c84dc0e3cd7e/
     powerpc |                    host-jq-1.5 | TIM | http://autobuild.buildroot.net/results/b918ee17f0d30313c47aa1f21e9e24ec7d3bc640/
         arm |                   kexec-2.0.11 | NOK | http://autobuild.buildroot.net/results/fb45044831bfa498492ce12b194703c82d0eaf45/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/f3cd305c4b97241bddd8f4c6243199c96255a526/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/4e98345602b8fb40a71c480a3dd09a61a8284bb8/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/e4a75dfe8beb7f5f47d258b700f136cb8c77aa98/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/1e059060fb0cb9085d5a03f7917f3551bf96c45f/
      xtensa |                  libfuse-2.9.5 | TIM | http://autobuild.buildroot.net/results/c876277c8b421009f36611a98a5d1daad8d1e68f/
       nios2 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/07b569c64a7402df67a5de8daaaeba196b87734a/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/c076ded773c9644f4f74e6446855e1f39276745b/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/446584a4792665c6f5f7156df34e48a5290c9ef1/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/cbeb4d1250412082be7bd7664de6b7bbc0cc80b8/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/f9dc81389ce513ac0700e246e16bdb8184fc906c/
         arc |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/7f652ee8bfa6d46d9b0745ddfb9844df1755e05c/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/7b7d05735d60156c82801f98dbbd32678f721a2f/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/a447551f6eaf9d8542dca84160c42b0391eeb1af/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/dcca70e7225e9eefed12b3ecef2c70d2bff8b4b7/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/8936aa1c3aa5055e8f5769f5b7250c1e177be3f5/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/5c993881402701814e65c5431b72cf70f6f2ade4/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/b16097b382f7bbafc1292c0b9de6cec3b98c1258/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/7e5b02f75ff62be26fb508ed7d36693454bda775/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/3abece92fbebcc7bba3d5235d4107eb95e8e285b/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/c361f11594ea17b113b85325fae467e374862b72/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1ccfd5075835a2804eb807ccab5826b8132d620c/
     powerpc |                     php-5.6.18 | NOK | http://autobuild.buildroot.net/results/9b9ac1488336bd1616a99c5c3c77e7c98e72bec8/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/78ed3c41fac4806d3e454e5b9f9636bd9e911dd8/
        i686 |               pure-ftpd-1.0.42 | NOK | http://autobuild.buildroot.net/results/f0b3b6f246e5c6039ad55980e912d6952237f461/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/fce6bf585b8d391def9fcc131b49ca1e6664fdd7/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/75fc12dcf5403fd38953c2b642a88ecd73cb8a25/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/95d6c16ba9507da9c1aa80ef3eef5286a00725de/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee2438665518d4297750addd8fceb3a807507caa/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7acdbc54e26ad2ba4756512614192be0a086f563/
         arm | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/97fbd1640d1ef7b2dbf614db89a3b6d8b7cf8ce0/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/194fa8d1076d2a3542c0bbd4c816d61c230e65a6/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/28894f73db494dd3926ec92ce8ec3f42860a4a58/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/92967d801d0e50e1ac7036f90c9484d7c35801f8/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7c6d6abf6800892b471f69004fd7e13a26db2f5e/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/9e4dd5e95aeb36c22104ce6bf949add8265b72d1/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/a37f4879d8a54a0c6566f5a0d67d1e581e98af45/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/ac1d94373e856980e44e4a275e38b07d5a4c2815/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c05d4466b828dad50f63fdf459a1813257a668cf/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/d5515d7a5be19dfe68817cb823aca699923354e0/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/62640969a4b69d308ddfa7adce8875d25fda8213/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/52fb967619c5fe75aaee7937627fd7f469f48692/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/068694d8dce9d472040eee826c799b8b6090f1bf/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/477dee8a5285a1588f545f8e67a2b4c8d2785aa4/
       sparc | tvheadend-1aa0073be39119f5d... | NOK | http://autobuild.buildroot.net/results/610ef13ee1d62597f51b061cd1216e7a4e96abff/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/47b671e981a4b0af5db62926002fb241ba6e0121/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/5b105aceab1cfa47448617e5f64e9b3fdf8805f1/
      x86_64 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/a6fac7e6cb08403a787a5ea87d4662704e0615bb/
       sparc |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/6cf4cdfdcd00f92176fd8a901884a3fd0c784f24/
      xtensa |  xproto_xf86vidmodeproto-2.3.1 | NOK | http://autobuild.buildroot.net/results/efc9dce097763722e00df4a357209ac417de1644/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/3e903401978d49c7023cd36b049a8c8e8e8222ae/


-- 
http://autobuild.buildroot.net
