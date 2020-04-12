From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 06:26:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-11
Message-ID: <20200412062650.0D661857D6@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  1  |  0  | 21  |
  2019.11.x  | 20  |  6  |  0  | 26  |
  2020.02.x  | 16  | 10  |  0  | 26  |
    master   | 169 | 82  |  0  | 251 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      ell-0.30 | 10
                  assimp-5.0.1 | 9 
               libglib2-2.64.1 | 6 
                libtirpc-1.2.5 | 6 
psplash-fd33a9b3d68c89fa22f... | 5 
           host-nodejs-12.16.1 | 3 
                       unknown | 3 
                  boinc-7.16.6 | 2 
                   gupnp-1.2.2 | 2 
                 haproxy-2.1.4 | 2 
                       iwd-1.6 | 2 
              libdvdread-6.1.1 | 2 
               libgtk2-2.24.32 | 2 
               libupnpp-0.17.2 | 2 
                 mesa3d-20.0.4 | 2 
                     php-7.4.4 | 2 
         python-markdown-3.2.1 | 2 
                qt5base-5.14.2 | 2 
                suricata-4.1.5 | 2 
                  zeromq-4.3.2 | 2 
                     avahi-0.8 | 1 
              bitcoin-0.19.0.1 | 1 
      gst1-plugins-base-1.16.2 | 1 
                host-go-1.13.8 | 1 
                   libiio-0.19 | 1 
              libostree-2020.3 | 1 
             lirc-tools-0.10.1 | 1 
               log4cplus-2.0.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.11.4 | 1 
              qt5charts-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7c2db184ee200d1719308f38f42382bb39d8d5c6 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c1011a9fa4a3ed81ca5710bda169bd0c194d82a3 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/86138121f35728a969110ddd6109789703f02d9a |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/01672d57e07f36b2e4d4f92b599d239b62809fe6 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/fb3d9097b629740b6b17da9fb84503ce101e4203 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e08695526a337117fb867ba415b54b3de7376a49 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/89e5de39c3849f3e87067fd728482eaf02b72f9d |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4aa15cb40cc4b0b14b565d64804fa56afb3c77f2 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/86666e3d56e16f4f1fa56a1c1cc9e3af65616adc |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1f0b7796cabf3f9c82b608e421d5eb4ce352ba6b | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a3ef6baaeb4dca909ce4ea24ee1a8d2e613a30e5 |     
    arm      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/2290eb93d58e99cf604f82be189e9df154a61652 |     
   sparc     |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/460349267ea73ca5faabadc1be9cd166addcbba7 |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/c31e287d8dc95a1d6bf553c73929322df95ceda6 |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/e758ba03b0d215c8cb78a7236cd502482468ccdf |     
 aarch64_be  |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/1d82bda92937489347196174e3f0c3862405d4e2 |     
    i686     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/6c5d99c0fcc8b9deb93fbc3133ce1e7fde02b3e1 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/84ed18c73729b9b3fca64f3ca355567232e95715 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/e5c6194054ee05c729ac05600bdb01644b0a6443 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/192d5fd51be159b342476892f5ad94583fc2677a |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/23232451967e8ffcbe950b87d3f32b14f1b852fb |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/a26a941619eef2b00d52e85d927a2d724ff16847 |     
 aarch64_be  |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/ecde6b64a249e5bd66bbee8dba6d084f6eed5f2d |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/68465d9dfcde2711d41128ac9bb57ed22ff7bece |     
    arm      |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/5d66c18e7b8f0facc9fe91b1129faf966c13a9ad |     
    arm      |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/8393f8e183be785fbfea54be6cf9c55d2b993633 |     
    sh4      |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/6eeaf4ab5e8773f4c00e9b40062a6f80c475e3cf |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/9f7a6d7acde7ce75eb287e3b1a7d9e3c1f73251c |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/d0890eae9728279502b0f0151ea2862417c451bc |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/1b5ff2a09bf70818044a97571b3255c3f71db2db |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/68f02d3dfc25e73925f3d6fb6a643104d77bbaa3 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/34026abad7db1ba9038782b83649a8dc4083f6f1 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/63f983aa22ca5303a55bc55e004f05a94e5f7259 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/3485088b84111c271bbcfaf025aa4103c6452072 |     
    arm      |        libdvdread-6.1.1        | NOK | http://autobuild.buildroot.net/results/28a2e837eae1dae9214fab1aec119a9aa6b2e5c0 |     
    arm      |        libdvdread-6.1.1        | NOK | http://autobuild.buildroot.net/results/edd29ee97ac17b01a80e267602f71a276cfb353b |     
    m68k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3cc5b993b5534b0d3cac7e9e54615e8650724435 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/53b1fd249a77369f226e2f11ed4b17fcdbed260a |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/98c6b17328b2a25f7a5be866f684d70b987ef502 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1d1a4756ddcca91b066575ac3b2d305f546abf17 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/c9bcb6f12f26e3d1f300e59c7a7c91da39ca67c8 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/42ddf2d2db86570a66cd02e355bd90c72ce27a87 |     
   nios2     |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/1e7808d1fb291aab6d17597a00448c0086bca8e4 |     
  riscv64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/38decf3a44171a0ecd46017b53c2bbd853b6265c |     
  powerpc    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/def60fa0c41b3691f8be7e78d4a173dbbb842fdb |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/63450efc7db91221191a6487cb7a6a97e5dc5b39 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8c8e986fb44a7a27d0fcb8a74ce1b0a2e44d57ec |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/98dbe2deb8848eba39cce2bdaf9ee22f6ead4a6e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2aef7076c04383a2f1b999d11c0fa5dfc3186f98 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/41485e36cf73fb0b6a3f3be61ebd3c270107849a |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/058dd90e6507951ae453337b8da0dc6b030d2c44 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/23636d940a9924ada4938af9260728c2add167f7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d4255214cc5c6732279e3326376805fb0aef2218 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/6a792a539c95c2846f1f7e8fb4a04f381dda71c6 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/a53b646f8e45e580837e10700b8b5e4014df4913 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/9220373e6a57374fbcd483ac4c03f0c4d46061cd |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/6eaba14502b36138a88c230cd8f8bb7ce8e02946 |     
   x86_64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/f9eed731900438b8c67fc3dfe78a2c4766687d43 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c9e4518327b6b8bc70e32cbb4e0bd2247f7c3473 |     
    sh4      |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/232c43bfd2767172690982e789cbe39ee4eae81c |     
   nios2     |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/dd10dbf0d3da245fcee56efa6a508a96f3a1d1c8 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/ad7efda41aea4e5bd902f40bcef2affbed2fd58f |     
    i686     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c2bcd836dac89a6b3a8be3e518d46798f222806f |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6ff800a58cdc33218cab6c3ef96ba57e73cd21d5 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c473e674d09d2e79977f2f7601ab3c0baaeefb43 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7eb0ae8103e442a1a07d1e2af78eca058763f09e |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c1fb558e18240d65cbf0117f703b78814fbefbdd |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/1239eb8df99fed19d590aebe0cb344fbead830d5 |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/cf31dbe4e45d274ff41cfe114bf746e2eeb6bd15 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b5c92b00ad7ba4fc24f9a4940d605774a50d1a7a |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/213cdf83b9d68889d01ea4d35037703142a7ab32 |     
   nios2     |        qt5charts-5.12.7        | NOK | http://autobuild.buildroot.net/results/37cb8581efd623d7e317aa1eef8909c526b31b21 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f709e4bdfa052147398d2991c902544d01add94e |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/efeaed7648963efa2531a0c41eccfee3ed1b0aec |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/521229134dbcb168d95388d49172ad89c59b6612 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6484899b2ed46261217d54cd53cd3e42059b6e0a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1a8f7f0a3d2ac3ccdcc65e3bd317686a90f636e3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/f6c91f9c658a589da4353089a4bf571f29e4ab94 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/f80e6c1d7e11144fba8cbcde491c28554e710d06 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/2c99a76e24659c7f0df4494e1482f500f3ea7bcc | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/60b30e0e0c0e268e4030f83bda3cb8ce174c654d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/349a7748b46dc3fabfc3da4c2d9a7945546af1ba |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c859ec15d8a0d7f29a658c1fda98b49a513e2d82 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 2 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.14 | 1 
host-google-breakpad-7515ab... | 1 
                nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/02eeea75765dc3469340a9271ce19368af3bd05b |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/3cc343475141afb3ace6c93fb0ec213bf1ac8ca9 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/21ad57f5452f6a4fbe12cd01fe87027d77a56d66 |     
    m68k     |         haproxy-2.0.14         | NOK | http://autobuild.buildroot.net/results/898a8bd2f581e858e2b5bbda2f9b42aaa7680a6b |     
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/3741af95af71643db3060d3e2bbe8a339c43aaf6 |     
   mipsel    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/bf80bf7f18853dfe7a9201c9db642a80ca2d9ad9 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 binutils-2.32 | 2 
                 rocksdb-6.6.4 | 2 
              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1f | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.7 | 1 
                 ripgrep-0.8.1 | 1 
              xapp_xload-1.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/8bf064c76eeb94e74010c50622e4c237a962568b |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/d45ff60f3ea6715cd789578868d1976dafbb99cc |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/01750d4318307159adecd3b30a1f6fe9ecb59594 |     
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/449c866abf7ff49adce74fbbb7d5d88dee442232 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6d223b1dc90ecc82852ef01967037a0a01a91d80 |     
    arm      |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/5ccf1aa9e420f1e34c70491926251efe391b0983 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/36a83dd55374e8da456f1eb8cb34a5af4833b182 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/0ef481f40765ef3da2a0781c8374d7fe0de32752 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/97c01e9b5691c670c647f7c82d3bb3ec0c58434c |     
   mipsel    |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/d2efaa1896a7e3f5ab597371685d43253e86e8ea |     



-- 
http://autobuild.buildroot.net
