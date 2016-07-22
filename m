From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jul 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-21
Message-ID: <20160722063025.84392101E9E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-21
===============================

        success : 165
       failures : 91 
       timeouts : 1  
          TOTAL : 257

Classification of failures by reason
====================================

             bluez_utils-4.101 | 5 
                  libsepol-2.5 | 4 
                  connman-1.32 | 3 
                   cmake-3.5.2 | 3 
             transmission-2.92 | 3 
                    lftp-4.7.3 | 3 
openblas-f04af36ad0e85b64f1... | 3 
                acpitool-0.5.1 | 2 
                wayland-1.11.0 | 2 
                   dante-1.4.1 | 2 
              libarchive-3.2.1 | 2 
                  nginx-1.10.1 | 2 
               libcap-ng-0.7.7 | 2 
               qt5base-5.6.1-1 | 2 
             shellinabox-v2.19 | 2 
                blktrace-1.1.0 | 2 
                oprofile-1.1.0 | 1 
                 php-zmq-1.1.3 | 1 
             spidev_test-v3.15 | 1 
                 mplayer-1.3.0 | 1 
                flannel-v0.5.5 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                  openjpeg-2.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
        xproto_xextproto-7.3.0 | 1 
                 lvm2-2.02.161 | 1 
                    ustr-1.0.4 | 1 
docker-containerd-1b3a81545... | 1 
                   assimp-v3.2 | 1 
               wireshark-2.0.4 | 1 
              lirc-tools-0.9.4 | 1 
                 omniorb-4.2.1 | 1 
                 libxml2-2.9.4 | 1 
                  samba4-4.4.5 | 1 
                    mpv-0.18.0 | 1 
                  boost-1.61.0 | 1 
                     tftpd-5.2 | 1 
               libdvdnav-5.0.3 | 1 
                 gadgetfs-test | 1 
                     eudev-3.2 | 1 
                    gdb-7.10.1 | 1 
                   lite-0.8.10 | 1 
                  babeld-1.7.1 | 1 
                    mosh-1.2.5 | 1 
                 jack2-v1.9.10 | 1 
               host-gdb-7.10.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
host-binutils-arc-2016.09-e... | 1 
                       unknown | 1 
                    owfs-3.1p1 | 1 
            python-meld3-1.0.2 | 1 
           uboot-tools-2016.07 | 1 
                 clapack-3.2.1 | 1 
                 libraw-0.17.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
          sane-backends-1.0.25 | 1 
                  snmppp-3.3.5 | 1 
           python-psutil-4.3.0 | 1 
           libfreeimage-3.17.0 | 1 
               lighttpd-1.4.40 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                   ncurses-5.9 | 1 
           libmemcached-1.0.18 | 1 
libamcodec-6f9b99182f94be14... | 1 
                  cairo-1.14.6 | 1 
               linux-pam-1.2.1 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/c232da83b7dbc3c71809b623641428b5976358d5/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/b3ebf2e1b2f4af55863af760ba185564b012c1a1/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/e0745b06b0633a8ee6c7a01ba3420b600b5ba568/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d4858aad967047edaecd8a9e673d9a4ae69527a2/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/586524a28fa3d1cef04a7adf2053799e05c1d188/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/248d70dced6719ce9806e4267dab47801597c7d1/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/566c1027617b0c125c7ee7b563e0078893dbf09a/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f2b1d183c51b342b466f714df394f54e80e2fa20/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4b01ffadc880fe27400749ad067a33fff7f97465/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1ac0d6b0ebb9e3b63eb47137249c707fc79248ac/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ff11b14041e3e32d7514f7cdb9401d7825919155/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/666ec3114e56fb64ba47c2e8a8f38a84ff70f014/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/afe82703872e838647a7ed2a4cd045a15fd0a683/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/4182f974652c4a759f0a00f1a9ec4e7367899e55/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/6b87202f558036a9897d56024fdc5f21a2adbe97/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/2959293799da83f839fee7dce14f5c9c46739c77/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/26675ac8a8488c26b7a5cccfb7d45fdf8c4192fe/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/845cb82d05443dda27c8abb799ea9974713ce50d/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e1dd7021e933269a4949cba7787a69c05d173482/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/3b87c216db9849da4f3b8c274ea6c7b3df36d3c9/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ac8cf62b665bb4c313cb5d7c58626ccaf553406d/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/d6b59324bc2f1d7a918e1f1164a0066daf45e4ba/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/69c1d45a9484171439a1100a267f07a4a1b84c0c/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/eb39cdd2ff091385404749916639b37a8dc7c997/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/dea76bc0f3c79aa7d7804b0e9c4ec5ba62829537/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5cc8a456a6006088e11fe6a35905b8f0db5625b3/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/719b538b909c391275de55f22f228fdb8e16cecb/
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e77e03d484e0c362557e865f08f8343deba81d3a/
         arc | host-binutils-arc-2016.09-e... | TIM | http://autobuild.buildroot.net/results/d03329a6e7fb483cdb9aa216d20b8a0796c2d118/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/82f075eb8f149e1309a915b22624723da889523c/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/65aa93e1c97c00514ac9945bbdb338b623b4b65a/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/9f12c4158fb183639a19289eb12f6cabe93c1477/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/8ce521b8248c377c946e0f6ccd9764fceffe0b0d/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/32b9545900628e7344544512a4c7790bbf50dd54/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/408dfc853c480073137a5833a867224fed5b564d/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/5e70b9f1ffbca43f76608068ae27d1dd325c556a/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/3cb2631dbd4edda03f4fcfe96f84293c83d7840f/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/1f64325a65686fa431be050151866533df06123c/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/0b52f1f6d7653f158c1dfd620ac014dfaf37cdec/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8e02f2eb373ad020d8f8d2bd0cff9b7a9a2bdbb6/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ce77e1a5621284688bbff8a420f595bc22f89032/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/ec73ef9467eab9bfda650bafee6e72f9449d0820/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/98594b23f121680b1ec0fed5f4696ba5762edb06/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8d26827bef643c21fb7c1b583af840f0507b94bb/
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/c8a90162596285ac63f5f17a7c92a312a0807f53/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/2b2689bb5dc1fbbd74f544e4b7f263472ebe4308/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/944c7411f2fff454dbcb5f8ff0eb0bfc1c175dbb/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/505104b47ff7621c052a996dd878efd490c56744/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/0f57ee5cc2cc3fd710814430926aef8f544bc952/
        m68k |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/bb89ece7810dd77412130a132bf16b21a237df45/
microblazeel |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/b14484300b4acfcaa18593b097167cef14330898/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/5dd382d26d4b5f939ed74217ebcfad47f16edc96/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/a0230f68e8d624954fe2338570b944ffeaec0f5e/
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/05cf72cce452f54e17f0030ee7a9ff4625be9746/
      x86_64 |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/618189bec298a4c2e1b5d1fa5a2cc8586bae9499/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/45a875081ac8b357456a35bcfea15689a9caad2d/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/254a50d0aea26899f9d47b69a15a19c28535691e/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/65443e516ba3e25c2b64572e756aad6b96df3f8b/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/b50cc43b4580a27fc95658bd3ed71dec96b08702/
microblazeel |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/e12f0a5e8d436e839268fbcf9294203b54693a35/
        i686 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/69cff42987b062dcbf0db380926dad75ccfb1f41/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/914a4d269254c63ba1bea7a948a9cb9f1cb3402a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/25347299d09dc427b407c317809b24643ef2d5d1/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/d005f19aecd6fa037269ce1d3d59bc1daef7674b/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/7360209b7b86c6709969ed03db3902777006af08/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/959b40240ff54e6096a02d2032745cdb9d931b8b/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/a30f851422031701475bd25fd4173aec78e9a2a5/
        mips |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3d5da13cbfb1ca81ddb55469ac5dd2a47a686c87/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/8404361b09ce02a2f747929e62cb0cd0f0080572/
         arm |             python-meld3-1.0.2 | NOK | http://autobuild.buildroot.net/results/b72078be9efd795c442baf8a08245e0bf3e7d5ed/
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/78e0f323ca73704311bdffc44c9bdb5c9e0c176d/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/b1cee979da9477f80b6a397ec247ad1256915128/
     sparc64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/6c3d837e7a155efbbd7ca873399322fab9e9ee1d/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/fa7fbfa65c6ae9230b9d0cd2b446d9689e89475c/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/09697c466fc94cf180fe1bfea44acdde6b7c8401/
      x86_64 |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/f5cdf1532509314e88fa2ef6953447d7d8e16eb3/
         arm |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/a1aa37909883135fec31125eb326c869f6299415/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a7bd5433cca2ab202dc0f3d98fc6fb8fcb88109e/
      x86_64 |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/0adea6121b238adf0e64d455a7573b1a31c38264/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/d68c810420e166ecc45e7752b760d687645c262e/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/2f468cd654d0288969f88be7353e6ee7ded7fe58/
         arc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/1cb180ae621bedf0b4471820d8c66244a45e87f4/
        m68k |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/42e198509d2613fac4b9cebe1ae8c00be4e88df5/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/442d0fb63e3c370633e7c4e2a834be5f364a2e9d/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/d5e37976181e318d18e200852a701be248d966b3/
       sparc |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/2a558ef2a4aca825713ddc873fb8362893e0f649/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a655b0e9fba7cc550013ee7a9237d22b820f655e/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5bafdeed366bde5a0ba15beaf1015bf4cc352023/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/1ca9331a5d5a03bc540a0c94c692dc7ed673a8ba/
        i586 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/cbe5880b472fa74963b8e489123a2a00edf74553/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/9559a859bec44f58f321d0daf5c0dc0d0948c6d8/
    mips64el |         xproto_xextproto-7.3.0 | NOK | http://autobuild.buildroot.net/results/4cd47246d6af8769f5f737c17b6cc90b20bff56d/


-- 
http://autobuild.buildroot.net
