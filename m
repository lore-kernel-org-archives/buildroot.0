From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 07:58:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-22
Message-ID: <20200823075855.D3C3687F48@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  2  |  0  | 18  |
  2020.05.x  | 18  |  7  |  0  | 25  |
    master   | 168 | 68  |  0  | 236 |
     next    | 39  | 29  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 8 
                qt5base-5.15.0 | 7 
                       unknown | 5 
             kismet-2016-07-R1 | 4 
              netopeer2-1.1.34 | 4 
   gdb-arc-2020.03-release-gdb | 3 
              host-grpc-1.30.2 | 3 
               libupnpp-0.19.2 | 3 
            live555-2020.06.25 | 3 
                  zeromq-4.3.2 | 3 
               apcupsd-3.14.14 | 2 
                  assimp-5.0.1 | 2 
               collectd-5.11.0 | 2 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
                  boost-1.73.0 | 1 
  gobject-introspection-1.64.1 | 1 
              gr-osmosdr-0.2.0 | 1 
       gst1-plugins-bad-1.16.2 | 1 
libcamera-96fab38e02792a109... | 1 
libubox-723730214732862de7e... | 1 
               log4cplus-2.0.5 | 1 
                  luajit-2.1.2 | 1 
mjpg-streamer-5a6e0a2db163e... | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
        qt5imageformats-5.15.0 | 1 
            qt5location-5.15.0 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c5a9bd7cb53966c58db452038adce49c5093810d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/57f0e853da2728f38a1848c63e0867e6073eae44 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/db84fc838ff461a93783a20ec8c0d40f09eb3e93 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c5e0da101193f87da22f6193377984e238a79e1b |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7a49e48e66669b8f9a0eb2cb9b311632997476ca | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/29ea5a7df50073efed547bf7319db64b55fe1a8d |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/10edaed22c15b9d0f7de187085aeebc96e5ebe6c |     
  aarch64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/31302b47fb70eb442cd000f4b9f27a9e12432cc3 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/e31d4c4cf25d3f2fb33fd80f52ced3aa17cbeed9 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/664664dc7f172389c816eb266537e6f4ed99bf17 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/d11b80116372b8331f9f3f7c12b49b8893035635 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/7010a14a74dbd4cb88145dc66899120b82719071 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d9291ab50d8179d3597208cfaa56138f19bef5d5 |     
  powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/0c7064dbd760029facf618e13c017df5ab0fee27 |     
   nios2     |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/43111c311eed407931e80669c1e97ffe3117aff5 |     
 powerpc64   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/c7ea6a541858b262e0b49b80a9b72fc1fc5f9e6c |     
    i686     |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/e82603fe1a40208c1f85f408242a0ba3e6aa0eb0 |     
   mipsel    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/cbc7aeedd3864a62b47d98be944202941b1dae47 |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c231e8188a23214efd7b2df4015ef278409205f3 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9c5ec39ef838ae6d8b3e5b3c6ad8560e99402974 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8e8896dcef77167ff5c45169aab01039cac4101c |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/37aaf3e3694f8f1cc5699e075968ad86c11862c4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c7afe822d8f2cbccab7d043399cfd86c25883b5a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2583437dd12c476ac40cae560f53ee6563559164 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b5d944389fc96ef2c5e0608fe4ac34149e5f9739 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9fc0e69d283fa2c8cff60f13c5f3f18da36eef99 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cdcefbb25c2b5bc0b8e0608c12dfd95e97b251f5 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/21a1d66aa744976c7fb6b312d368fe67d16760f7 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ac3c38d9f046b9fb410414c861f38e5bec20710b | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/307f234edd6dffdb2419a2be5209ef5cd3b6d8d1 | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/04c569237c92c46699ea253d524aeeb813bbae42 |     
    arm      | libubox-723730214732862de7e... | NOK | http://autobuild.buildroot.net/results/aef10cc43f6c34f106624588ae2a1131520ee066 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/effe98c2191e92b1ed760a1c365f2703a97b251b |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/938ca5f096f43b3a62aa3730f2e726a40e4cf9f7 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/97788e8f87d2e4b348a87ddeca0aaa45de56e1cc |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/6ddf4b5b4052bf6de0215014ea7416e392b98701 | ORPH
    arc      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d32df59d942e307153374f7012831eac2b6b40c5 | ORPH
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/dd2249bf8a231a7512b06d97d6788f3d70bcd06e | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/8648a721846bf1d30d31af2fdf772c84ebd90afd |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/1287c200ad19de4664a18162c3471271bf31e009 |     
 aarch64_be  | mjpg-streamer-5a6e0a2db163e... | NOK | http://autobuild.buildroot.net/results/e6795fa8ed5d8514b3e10ea1135afb31eab22b7e |     
  powerpc    |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/b2b5c26b03a71fcbf956789aaa8bf6638e6c0994 |     
  sparc64    |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/f19c635dead5babaf63e4560afd7415eaa95af35 |     
  mips64el   |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/96709d4487024a5fd7ff4b412aebcea15101a0ff |     
   nios2     |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/9e453d091dc8ccd0b63996da9be158708ef05e3c |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/4c5ae55300713548021618cf03ba7c7a588d751e | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/11d617cb4ea0f53aa7012d78025e11acd5def1cb |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/2c58e724d220b0eb0a32dc779d078e7e2f8c47e4 | ORPH
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/30c5316ba418e134f37008c5e3f213375c12b444 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5792a1dd03ae18f39ad47777a785fabfac0952a0 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5e906ab4540cb6612c33d4bff294634125938a29 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/464c1d4ba397a1b80009018e171bb14f82e0f8b8 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/6774d7178dff6a9394f21ae74d347ebd2cdd4ba8 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/3f7bd3e881de68351a2b4d456f6c1cd652011907 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/00a7646aa5331d97402c849f51e18148c5242418 |     
  riscv32    |     qt5imageformats-5.15.0     | NOK | http://autobuild.buildroot.net/results/ea3bc0d3110cb54421ecf433317ca79ca0ff834a |     
    i686     |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/adf32dddb38145279e7d1afec7c1f503e4c1586b |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/58e74bb056ec65680ecebaa559aa14bdebbf5c85 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/a22d45af9bec54666ee11cf124e91ced27a27d61 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/366c857799dd856f3da4dc952282016e260e7461 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9ca9d6786522c4c06f15d6dedb22033e3796ba8a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c5c1258f81ff178ff056e06c20104bc2249f735f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b720e1431ac99cb44502c87630b35c58a3f1b4d0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9617b2f3396085b5194207198e553406a8c08864 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a05cbf3f6fb0354d7e8830d4f291b4f46e2c547 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f03891626a0311682c9c9e04b851b1325baa6c8a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/bf644f380c1f35032bfc878a9a329209db9dc01f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a59afa1a633817d56704b82ebe3afa631fc4b179 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.25.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/430faa58db512d5175990ce6ef98391467ef688c |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ccde9bfd02f5a999daa8c5913706bbe154ba581c |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f132ac78dfbb8eecdb2e96d63aadc84891446cb2 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e282f05ec78c6bff6971314474cdf34839fe2ed6 | ORPH
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ef08e78751fb4ebfd014b77f8417315fca6d205c |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8878de1dca23d8106835a622ebd5226a03257880 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/8f49dcec0fdc064e714e2b346f9986e6fc6ee685 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/252ef565af4bd3f515f91ca86155647125ec76f6 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/31ac321340ae4fa26bddbe10b958679590142abd |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 4 
                  zeromq-4.3.2 | 3 
               capnproto-0.8.0 | 2 
     dovecot-pigeonhole-0.5.11 | 2 
  host-python3-requests-2.23.0 | 2 
               libglib2-2.64.4 | 2 
            live555-2020.06.25 | 2 
                     avahi-0.8 | 1 
              bitcoin-0.19.0.1 | 1 
              dieharder-3.31.1 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
              keepalived-2.1.4 | 1 
               libupnpp-0.19.2 | 1 
                 opencv3-3.4.9 | 1 
                proftpd-1.3.6c | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.15.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c730c3677b8fc7fdf18884605a2462d046f38541 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e148fa3910b589fd30ade8b046d769f62e21524a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b9f26f6fd93709db2bbd23633ca9ebf1b907652b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1c7c7aa77283369ed1578300743823b949d61634 |     
    arm      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b8b2a31c6c9c365e95192f47a1a844164fb7e1b6 |     
    i586     |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/e9127143a248fb2ef009aefec72f4a3ed0c314e2 |     
 aarch64_be  |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/19b57300affb2545a56de11009d45ec901b9d435 |     
   sparc     |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c6d3b8860f3e293a9a78c478f2ebcad6a883e8a0 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/acb8514ffbb5603bcab46436b49efed105d5a655 | ORPH
 aarch64_be  |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/6d8425fe399e3123bd592fa263fd0a2e5727c2e0 |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7b548e015c4f20301b0f55841eec02446c8c1294 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/f8a23bb99068ada7c303c80dbcf641f71a8a8e5e |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/131e70359aa4cd9cf672fab17471618743bab7ec |     
  aarch64    |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/735994209ef740c7cfb60a660096f85b6393543b |     
  aarch64    |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/aef549622e7cd519945d8ca41499c4b02bf8c1c8 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1453707d34cfa7a8b9af39afc7297da8b6708568 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0b2d3f6956b3e9f81e71d003f9197f4168b461b6 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/35764696aa8196843b83bcb3fc8a4226a3ff8db8 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/36a10fadfb0482166d3a86bd60a4956e937e6bfc |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/a3f8e73e9f50debfd78562adf2f18cfbdc9c031d | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/cb0b23dc15333c6e7a1e3453e65379c2a41dc9e2 | ORPH
    i686     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/10ec1fd17d08e60d87557f4d08727869f8ad6817 |     
   sparc     |         proftpd-1.3.6c         | NOK | http://autobuild.buildroot.net/results/fd43b4ddf3aa31ba46979a62c00f53c0a687831d |     
    i586     |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/5c3ae63337a4f14e318ce9e1b28a88406641debf |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0f2ec7ca1db4bffae4c7b5d273ce1e8ac3b9066c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/10ef6d885c7edfee7f39b1988013012300dd0e9c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/03f9eda4b43ae7e5a507f3e8eaa3856198baaf89 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/5c7e060f0e1b6241c9754b7e526909e087e522ee |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8db8281d410085767df937046ea802e711e552ff |     



-- 
http://autobuild.buildroot.net
