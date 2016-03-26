From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-25
Message-ID: <20160326073023.432861016AA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-25
===============================

        success : 203
       failures : 190
       timeouts : 1  
          TOTAL : 394

Classification of failures by reason
====================================

                     tcl-8.6.5 | 22
              gnuradio-3.7.9.1 | 19
                libldns-1.6.17 | 11
                  samba4-4.4.0 | 9 
               linknx-0.0.1.32 | 7 
                moarvm-2016.01 | 7 
                  boost-1.60.0 | 7 
                  connman-1.31 | 7 
                blktrace-1.1.0 | 6 
                cgilua-5.1.4-2 | 5 
           libimxvpuapi-0.10.1 | 5 
                  trinity-v1.6 | 4 
  getent-buildroot-2016.05-git | 4 
             coxpcall-1.15.0-1 | 4 
             gdk-pixbuf-2.32.3 | 4 
                 rtptools-1.20 | 3 
      ca-certificates-20160104 | 3 
                wayland-1.10.0 | 2 
             ipsec-tools-0.8.2 | 2 
                collectd-5.5.1 | 2 
                  stunnel-5.31 | 2 
          libwebsockets-v1.7.3 | 2 
                    norm-1.5r6 | 2 
                  ffmpeg-2.8.6 | 2 
            webkitgtk24-2.4.10 | 2 
                busybox-1.24.2 | 2 
                 jack2-v1.9.10 | 2 
                    ustr-1.0.4 | 2 
                qt5tools-5.6.0 | 2 
               ipmitool-1.8.15 | 1 
                   systemd-229 | 1 
           ljlinenoise-0.1.2-1 | 1 
        host-gutenprint-5.2.11 | 1 
              host-cmake-3.5.1 | 1 
                libcurl-7.48.0 | 1 
                    yajl-2.1.0 | 1 
                 weston-1.10.0 | 1 
               valgrind-3.11.0 | 1 
                     fbset-2.1 | 1 
                sg3_utils-1.42 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 mono-4.2.2.30 | 1 
             lirc-tools-0.9.3a | 1 
               libsodium-1.0.8 | 1 
                      qt-4.8.7 | 1 
              ptpd2-ptpd-2.3.1 | 1 
              rabbitmq-c-0.7.1 | 1 
                socat-2.0.0-b9 | 1 
             netbsd-queue-1.70 | 1 
zbar-854a5d97059e395807091a... | 1 
                   nginx-1.8.1 | 1 
                   mplayer-1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
            lbase64-20120820-1 | 1 
        lttng-babeltrace-1.2.4 | 1 
           quagga-1.0.20160315 | 1 
                libpjsip-2.4.5 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    cups-2.1.2 | 1 
                 opencv-2.4.10 | 1 
                    owfs-3.1p1 | 1 
          sane-backends-1.0.25 | 1 
              strongswan-5.3.5 | 1 
 toolchain-external-legal-info | 1 
               pulseview-0.3.0 | 1 
                oprofile-1.1.0 | 1 
                 libgee-0.18.0 | 1 
                 copas-2.0.1-1 | 1 
                   tinc-1.0.24 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/51166e16051ef00c8f3f0f4e26008560aad0a776/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f996af8e67f596daf8d587e37b52a0cc19fc6d8b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7d6f32e3413591bb27049c89913a07dc081e2994/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/befc4993fc35c5e21277e8e4304cffb4d2b5addd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/38d01ac27d635463fb21b1e65364d901aae5186c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f1c02819d742944e637ea6a1a90aa05c743da601/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/afeeeaaaf33bb829bd8186e08a46e05f27b1ddc3/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e3e6002ac5b40f7f03d32ba9da99f6497f01b42f/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0ebf0e19b760bb57df96c4684c13decd582273d6/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c372d639ba33bcebd4314e4090345367e1c1ac10/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8bc674fb6ba1b640cc212a6e3c75a5cfb384f460/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/37bc60f6e2e3f7d6fa9ff897e9c12d246144c573/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4f20cb8f650b24314b947a16511d50398645c929/
       nios2 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/9cad55db1bd1ae4174ceaaaddf6c2f0244399cbd/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/fc34125ed9e48c1137b2552299fce081bb71cda2/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/4ddbeb855c65dbe3e6ee54baf174f13113265c38/
        i686 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/6a84006167b045d51acb0dbdf2ae364abe4af0ac/
        mips |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/a160d34e5846694c69aea924ffa820303a55185b/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/0f4426ae29312be201bb733fcca0857dfd9b930e/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/e4463e740fd04a9e02eb22c0770e5eb39f141804/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/9d4cebf85e11a19345342a191f5ec15a5b0909d5/
     powerpc |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/9b58d05b06905c22b5239ae894d615633122a09d/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/7e5b577a1de9eb914ee17d027238650806e17c30/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/57931786d66fbcda8ce6e21b72609fb1c13f10eb/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/b89ba79dc236a64061b456304d98230a46ff5e1a/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0419bdab525a80e4f7bb277507cd2dc0fe50f668/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/dfdbc502e7c22fea8b590cddce5f70b75a8df235/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/825bfe3ab60b2f0ba6edc1581082ae7eddea9dd4/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/57a8a5af78679ba51fb6158afba0d6f920f22b66/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0dbd3151476a8323696da5170d5cbed81f74c5d6/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/71b189f1a654fb73d105da838264122d97d13b53/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4e43bd95450c4fe6af9a3754afa3f3b6c4b48774/
        i686 |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/5684625ccb26185211cf8658ccebb915ad8cec66/
      x86_64 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/a6ccab3f63bf4a3bd61509a417150eacf342cdf9/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/641411bb325a8a1028a362f8e2f7b2e3318eac09/
      x86_64 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/78b9feaa71a6388fdc5ac563bf6cb379ae52effa/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/d72fb76b136b09b125585eac84eec4a21b59f7d8/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/2ad5ca37c2e4f847c32f63926db6ba1626399e40/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/f1510bf1894dc858fb773c038e4dab2e410c3d9f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7af5fd754134f0d82dd2a84d804a832afe11a31c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7fc04f67ccfd0bf5f3380635f887149450e874d2/
      x86_64 |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/4162e3becb0126c5fc3ea6c46ae376a9b250d9f9/
         arm |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/5a7c158c8c2e49d5ca3b11ef3190cf0edd812ec5/
         arm |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/e6d4d1d6e9787209598cbb8a514c149508b1ae12/
         arm |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/da9f29a06ea548c1b67ec8c162f40e244dd4ee5a/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/f7de149a2d3a4032a7bc564b5bc8dded58db187d/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/eb9ac79628a1fa3db717d01927a4fca5c07bc688/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/c5776ba1b79977490f9c0448ad1b4223462f3ec0/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/e4bb3e7226d4806f282075e850b8212fce9ee99e/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0ed53060e43503d16f15e235c667f7d6ebbe88ae/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f3da41fa6013f30ba1cc141b9bcb39244bca7662/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/879c7c32bf3355fadb65d70dc30e3e5218f7404f/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/52fc6788cb655a4c2e9fabc659a0b1d2a2bc554b/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/941e8ae555d083f2d8ea57a3831424968e701761/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b4136914d386f4f021b12fb1644bad81a65b456b/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/23526ff697bf78c20a1000931be04964d746b918/
     sparc64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/48ff465af8bab8a1527b2cf2798467389e01a51a/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8a139853b0d036ca240be154317041c54ad4746d/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/06955b7d0f53e284ba1deabeced8ec4c08712642/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a9de354c1a2c27db7264c79cd3c8358bace18f2c/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f5190cffaaa95586ec4a0846bbc181cc917fbfe8/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/79188d5e05105e7b000022a18898d34a10922c67/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ad6989c306f579d180cb24ced3a038dcc4660e8d/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/192a1c238927f37ecd95ef97e884c44e30199aa5/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5185bf739e1766b9245372056ee8aabf9fd5f13c/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c074cc3e88deb838f2e0fb63a7cd58d51e0f712f/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8f7fac92ac1f6d5c5f9778c18882ad32d8d563f4/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b6f0d80448958c01999d85f5761dc1bd7f608f68/
     sparc64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/2cd24b202f798ce3ff6f293a127edfb2974bbd60/
      x86_64 |               host-cmake-3.5.1 | NOK | http://autobuild.buildroot.net/results/cda57e01fa5db6c41fe6155202a0dc989090053b/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2df9f4f505b8366f3095dd75014eda05998e3802/
    mips64el |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/f6923d682d416f0723847eb758d5c2555e911a9f/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/6a770f8a3dddb15ba4d95555e74b198799278dcf/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/40019fb2b8a374f6c33a4702182e6d49d2887df3/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ecc26f718ab362743ab347aabfe6b3480e63b6f0/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0f8d5940112bd282b5dd371a573ce194b697ed45/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5ec8afc83c443646c979fcf2107e1f76871973d5/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9592483af4a335b2267209e611852513670276cc/
     powerpc |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/a09c7920a5f1f0504fbecbe018783cee156892d9/
         arc |                 libcurl-7.48.0 | NOK | http://autobuild.buildroot.net/results/00e5c8826d7552b1e0c1590acb2a4b9bb506f4be/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/3aa1ec4e6d44c361358bf9fe1f9143809bfbdcae/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e4453d728eb1f71f2958374e710bcbbf1db8d4d1/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e73f47c3f697ab8368cbbed10b6356305ee80efd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/7b68ae3dcb8cb1b8656711f9ca6f862d9fcb8ee9/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8ff415050b77fa9314e1d6f6da42385af3d52256/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/05ca1b185aa37c45c8c574d3c7f5c9fdec255bcb/
     sparc64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/8eea6074c51c319ca631b91cb2e5771de2d1e659/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/0621f7bda9aed647cc71d4d93ff20f9fb88304b7/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/3fa4acf2d73bd138964f013623e104f0d70f0f16/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/6c682ecfa8e442d0f320c3130ac3e68a914d13ba/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/2985b1a6d399c2192b259854d8c9512a5c07f8a6/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/4aa5ece9aae7d780813990222cdb4c32141ddb2b/
        sh4a |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/130ad38d700cec51c09f2f584f9681c7e45a4d58/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/74e2a89b5b6be2c7c98b7163f14f0e4a61b8242a/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/a90d368625362169ab4d40242f336e78e77779f7/
      xtensa |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/dcf85b5a03cfcfc15942149d0a22ee0deb49ded9/
        sh4a |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/5dce070fd9187ed4a6be362fa48f36d54d1f7b7e/
     powerpc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/a21d57c5cc6d97a919ed725dcb9ff5b059192c76/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/8693c5aba20d5e6007e48de119a7c456105b4883/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/26c2ac28f44f8f1b227caa715af60bcd92a5f740/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/d65dcbfb96b249e01b034c01a52884b522c778b3/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e781cfc2663fea954cdf34c211f45254b96bdf61/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4d672a228b5b459dda458f417c4ffe9759da56ec/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4134a6ae24c0674a4caf020a45a2959ee5ca3c90/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/bb1a183034ed0c4b06c1c5a770e49db2051c1f54/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/fe4861b11ff79e673d2d17b70ed2e22dfd3d94ea/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/06c201c5e6af604386e9b7b786e7cbb2c5c3ead2/
         sh4 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e08f0304c41ed52640ee58c42fc797d8fdb7ea65/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/1ac2c24e68838ef515d9ddd8ec3486df7637fdee/
        i686 |            ljlinenoise-0.1.2-1 | NOK | http://autobuild.buildroot.net/results/e6eb9df13251a06dbc877736b84a31f983e232b7/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/6820ac396514c26c233949181964309a9439a5d9/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/452b92d0251188d910608b744185f3b86bd56899/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/0eb8c64e645aa1034b6a4ee008fb0cd426e1917a/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/949e6f27493775d45b0ff94bfd67acea88436344/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b6ce8120ea41110da399dd66939877245b8a1f58/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/f99b68e3b2e3b2764f8c4cf598b9408fc18d0d0b/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/59621da881bd86ca121720e27d26e595ef6af656/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/487fbc4494e3f4849ae0d3387ebcd7898d4ab2b6/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/fc631389d84bfb0076ea539eb54ab2cf3d54b88c/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b5ad4aca68999b330fcc60cf82d5c73a9edb8d29/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/141214341a58a642e4ab2ca683d88cc733a2c2c3/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/3bfb566b28fcf5eca5cb0002cdc94bf1cc84a5fc/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/d2e700f3bb35b1f7c8fa779f0542b056c4a91a69/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/dd1e34b4ea0bfa91634ac189c80b0ed96635bb74/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d6f776ec45860a8839a99c0113323bf30bd1f0a9/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/ec6079f9ab7d87262a53bb2ff9931ce2de56a28e/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/62a3744b7be0f7b593963ae64d87bb4800854c05/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0ea68a47e26660305011dc61856b3c7a1456dd36/
         sh4 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/15ebb8bc2b50080c37c635462a5faf63f038f014/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa4cd153053c762b79993f3c930b2d6bdb13b82b/
    mips64el |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/24f42d3d8c08538fface180298bf77bba59c91fd/
         arm |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/3a02ba2a4798a0a62c4189c725e809a5b92e0aab/
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/001da8ec1cb9405ac425bcb8da04bd902d0bc271/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/853a3f83e714443ff41e1154c98eb17ac11ff0ef/
         arm |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/d1913417956185eac132aa7143199f1a8ddc744a/
      x86_64 |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/0c33a4a01804a4080e3b921650eb760760052ae6/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c763949912cc88913d31c67a62fceee7d8350b82/
        sh4a |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/3c0800fd6cc7a217a866cd9cf63d5f91dcbfd306/
         sh4 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/f402073cfe59a965e7536d760115b8881d81a447/
      x86_64 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/2c7c23796652ec4783912b6bed2c569c4c61c02a/
         arm |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/d97a861837f5e2813c76ffa493992e33c304bcf2/
         arm |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/9a9e104f8d672ee650a8854feab2ec789acd0d69/
     sparc64 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/790066f6d98f235bf18c6442295f509543ec11ba/
      xtensa |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/b49a15a0d606be86990752960301cfc9ce50ea75/
        i686 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/959659e7d6612f5275ba98ee71d20a49fe80c6bb/
        i686 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/301c86f81b1ae69d08cefda79b95d2d596dab511/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/401903516a05ea987c4bafc8653c44d673cda893/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/6f30f58334fb4c01ca4e40790f994341fd5f56f3/
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/15d3dc5b1b51f4f4125a2fc9b23a75161799c935/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/a545c330460a8b70ff83e60582f6826008120976/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/1c3b28c7482965c67739ae3b1c9bdc16ec8dcb18/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/eca0e290ae51a0705595ee2f28141332420f94e9/
      mipsel |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/8ada38fc51230a38d6c794b3c364c683fdd80428/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7b32e08b39827e03c97e7408d33805e3ec066f44/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f0cb50045b517d1c62a89cd1085c1bf23a43b1da/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5d64cede121386e788bb679d01a4be691361557c/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ffe7c64aa91a9dd4a22f4ed906e85ba5a4f5213a/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5e1a913306b11ddc960c7493fb79b2d91cfd9193/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2cc5ea05dbeab258b364ac75b95e914406a150a6/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/077c9ce5a0f0ef559508cb11984b6ee290d8b738/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ae4d60eee003f60ec9f5f6b4500d1950fa91b99e/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3779c6baa174e68801a75b40bb9002d7e8052e64/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9888859e3a079dd984dcbbbc9bf61357264396de/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a1d86f81616c6ce25e49f0ac4c17ca800256b7e5/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fd560086a80bce53823865c3b3d713bb9a6d14ed/
        sh4a |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ee52c1f716af73f5ac924c85d0167fd463876b48/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b968fe8b3f12c60b90dd2ecf93622ac8e5350169/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8142c78a92f0de820714a622d51e3a630b191439/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/512bb3d2d8457b5d67dad81b9f954bb290ec1dde/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/604cc33c0dacd4d1f26dc4798d0ec93322bf87ea/
     aarch64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/302e2abbd373629ff332aab7323112ad3e967fde/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/db79221b32794da5452229d017047a107c73d596/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f536cd5430452db11e66321edf7981ad8edc653a/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/af154c82881675c2109706e0a3132d570838ef72/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1a56ff6f9f5420451bf0ac01766ee05117d1918b/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/d3e0828975600ca1294674b22c32ac68fe6ad193/
         arm |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/a2c3fd7baaa8a72d95fe2f322eaddd89a13ce55e/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/86705740425e04d9499fe3f98f83f021a5a61cef/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/8b396530ad69707999034dbd67b38d6d39b34dda/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6012b9c2fa8356f4812a40db91b9b53082cc72ca/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/4af07ad99977e623a01cea7bb0717239f10888c5/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a5876a6a2cdde37b81c96d2c84118b8a6979f433/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/4ef8b6b59c3bbd699c17c8298889bad21f47a443/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/506a14d23b31255ca30ccb66cd4e1bd7d9def494/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/5f268af2660be8b1942945ad0e07a1b05d312ff9/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/67ace012e8f8c5498d96f2b0e672e229b4d8b0fb/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/eec6d05726fbe88cd2ed3abcda7ee656d06dd8ab/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/5616f8ebe7ad917fcd1f86bccfaef33f41117f5f/
        sh4a |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/2c8f0446f1d56499dd5947da945130e36eee204c/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/395d1ef91f23e243144adf3ada0e2ca86def1025/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/e10bfb92cbf22abeab7786dd6e0691bb41d174e6/


-- 
http://autobuild.buildroot.net
