From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Nov 2016 08:30:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-06
Message-ID: <20161107073024.DCC5120D92@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-06
================================

      successes : 168
       failures : 48 
       timeouts : 3  
          TOTAL : 219

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 8 
net-tools-3f170bff115303e92... | 5 
         docker-engine-v1.12.2 | 3 
                   mpd-0.19.19 | 3 
                    fltk-1.3.3 | 2 
                  guile-2.0.13 | 2 
                 libnss-3.27.1 | 2 
                 mplayer-1.3.0 | 2 
python-libconfig-b271c3d9da... | 2 
          sane-backends-1.0.25 | 2 
                   ser2net-3.0 | 2 
                  stunnel-5.36 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
          chocolate-doom-2.2.1 | 1 
                    cups-2.1.4 | 1 
                  hwloc-1.10.1 | 1 
               libcap-ng-0.7.8 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
                    mpv-0.20.0 | 1 
                    ola-0.10.2 | 1 
                  openjpeg-2.1 | 1 
                    quota-4.01 | 1 
                     vlc-2.2.4 | 1 
                 weston-1.12.0 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/beff4c247e50e3b64efdec9ef8562291ce454f85
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d29db0c1dda43d724dbd1bd004bfffedb1b6b86a
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/d78a937155db63b5b127e8d9a370cc076ee6ec1b
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/2064cc377732252924c5e5e7b29f32820ec237ad
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/663c7a2e7b61d9c1564fadf207e572fac5cb5cbe
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/7ff60f2dc451f6053e5bb64757b0859b9824b5d5
   powerpc64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/c66fe328b80465e5e2fd008f84ca987add667ff9
   powerpc64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/a87b07417ea8bd81ffe27e5661b4359ddc0149ab
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/5cfbbd059e4c77f07107fc7ad34b0a63f67299ee
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/0dd930b4667fe40a956add876df14aff565b5cc3
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/a1947c3f17c3791af606a69068f324e28481ec36
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/976b3477407e64c8c2fc2309ed952d0083903a19
   powerpc64 |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/9bec511c351b69fa25a5263316a38561e8836724
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/b9acb48ca1674ad078760e7cdd43be10e9f21d76
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/8d730cfd92014ab29e55397ba4c066c74cd41728
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/07e2f0eaa6bfa7e86a4dcf7249bbb02ef0fb864a
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/0cc417ee692dcb259584a64921bbe5467c158987
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/e6e5719a61719b36d37eea73b394c5b0a69d57e9
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/7514541efb0ed4f26175cae4744d5294f797d0d9
         arm |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/e1b05422e5717d8a2c775e3a5f9e500e54d2acbf
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/2a1d7d130011a7caded72a607733af30dd5ba3ec
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/a52e109680330d8a4780beff7f96bf1129b19a44
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bf7c063bbba7d8cc53633d8bc05a995a4aa3ef9c
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1c18832532de899bb684cbbd7660ea77fd5748ff
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9a8bfb627a787776c7a04520b741633584a308c3
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/34f9b10ef6a613057e8f6457d8a0a2fa142ad123
     aarch64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/455a3496776ab59e6b7b046bf2f8d289c1e013fe
     aarch64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a1ab86474d3b3617fcdc7bf313c0b928c2fb09fb
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7c95b79a6c83e5dfa03658f1078741888ef3f983
       nios2 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a94d1d25a002151dd4ca43831413b2b285f8a757
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/37de536dc7e1b76fa576ec500f389bb7c428cccf
microblazeel |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/ffcea69c308e06c55872a4528c6358a0b4049526
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/9e2e355cb152f87ffd305feeac7183169c308e32
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/5d2f69492c49267b6b8ae7eba5bc1ffb774325fb
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/5dce0a19cb3e1e6e5a5dee6d4b2b1908103cadd5
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/2e57391bb758a2df4bc591492af634287b6fdf7f
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/33c28408d0520d8e8a1b5b3c8eb87e02444b8142
         arm |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/6bc0f99917c2069a1614f4cfcaa98af1b21762e4
         arm |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/859d59fad02f5915a2d00fed77493ac5ef9ac7db
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/40fc7422dc7474c53c8fa15616bb520dc9aab9ca
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/2ea3c2b4a716867de43366db5e39f26f34be28c5
     powerpc | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6fe3331f1f1d54cb977bb61a09d7707f19f7eafa
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/f6b85c9dd41428ac2d2d4713e5529a7013b8454f
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6e063467b8db76df4c24a6e7a1c8009f8cef4494
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/761e0a8ccaa47699ab8d241e6a9022fd6ba32108
     sparc64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/7d39e6d405dcbf43403acca3cfcc68351ce1723e
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d1dda2c1d5af8fbaa09ecbf4a87f3892369b9e53
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d4b4ebd2723a9938ead7d4f5a91bc8ff68c13b4e
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/9bba0a802726d1caf4ab49995d15385b2bcb3025
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/13e7c0f5fc6ae8ba5e62b2597d188496c64090fd
        m68k |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/0e15fb35c0d2413c5060f3edd7fdc88c161c4ed5

-- 
http://autobuild.buildroot.net
