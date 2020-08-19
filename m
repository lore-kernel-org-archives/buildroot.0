From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Aug 2020 07:53:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-18
Message-ID: <20200819075337.E73B6203DB@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  4  |  0  | 30  |
  2020.05.x  | 28  |  3  |  0  | 31  |
    master   | 152 | 77  |  1  | 230 |
     next    | 34  | 31  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 14
                qt5base-5.15.0 | 8 
             kismet-2016-07-R1 | 7 
                       unknown | 5 
                  zeromq-4.3.2 | 5 
                  boost-1.73.0 | 3 
                  assimp-5.0.1 | 2 
                     avahi-0.8 | 2 
               collectd-5.11.0 | 2 
                    efl-1.24.3 | 2 
              host-grpc-1.30.2 | 2 
            live555-2020.06.25 | 2 
            lttng-tools-2.12.1 | 2 
                 openal-1.20.1 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
               belle-sip-4.3.1 | 1 
                        bullet | 1 
                 gerbera-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
              gr-osmosdr-0.2.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.44.1 | 1 
               log4cplus-2.0.5 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
            qt5location-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.3 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/17fa550ce0c47fae3fbef780afc6b07fda82fff6 | ORPH
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4745dcca7693b630bc11561f102644bc60fd0aab |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4e764d00de302affbc955a41d633bb288023193d |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f5ac073250ce2cdbb2dcfb537f851749eec66bdd | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5d7f263169a7fc0543e2d41ac37b9b7eca1b33c7 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/8876b8c2ad9bab7f826c4501ec4c18da733c4f0d |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/93988405ba369c770666a925219ca7857c9ad2c3 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/34ca0baacc298cd28a46b982dd2b8ccf730b83ee |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/df6f90310fe3704929d5ec4f0a407ab3c3ea2021 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/b20dbf6383b351ca8c859b1571835103b66fd156 |     
  sparc64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/cea4b045bc931cc1a71c99ce86afd52a2a1ce159 |     
  mips64el   |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/770293a007d683cb6f82f1fd3bcc20967e2b4bed |     
    i686     |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/e84b910b7fc7e88ca52f5f1aefff66e05aaa2125 |     
    arm      |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/51e25659d9dfeffc803659ccaf92be4266d20ec9 |     
    arm      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/24ca1be058ca6048bc97b6364d80b45ed8489e4f |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/39db09be78352e207cbed7643f4b9f5218b4cce3 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/baf2d9c6cacfc25bfd9da10a9461e1eb15285bfb |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/fa335896d1401f5b821d41ed5e21f75effde555f |     
 powerpc64   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/496ae93beb85b5d0abeddcd29474f314b6fba66e | ORPH
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/d6adc4c08df3bd70f91b70b256fb688292acc063 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b721dcfb3cab9c372ea56e4c6f89472eb0ce9438 |     
    or1k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9f2b8a467a94dbfac75c86cd0df3b669db1066df |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/677868fab5b900cd443693467cf54909eb191102 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/31e20218aff6cc46960e11c3ded1dee682ab4b2a |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d1f88f21322f46d6ea31a9e3ccdea43f85f2334d |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d21652c2b3b606e21d375025ab5cae68043ab404 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/92b0e82cf83ff6f2ed0b3b85caa37c2ba526b132 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5a6527a6d56b6a8233205cced23d1abb72041703 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f5bb8af2f2cd7d1837a8abd8d0f45c7ee132c7d9 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f2720a3522e59231b3f02d62ea80916fe43df74b |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/43f7873935da74fd604813b28b3bce0681d25fb9 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ee7ca5e5513881148c59d311cdb85037df6b7d72 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ce54b23d536b43cffc9835ccd014980715badfe4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c442b6a4b00a12f07b94e92b620dea79eafce792 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e28f1e632d56c03f3fd77044806ce843a5bec3e7 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2b8e629bc196599858aef1c57d74f515570e67b1 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/79a7aa2c2d41f7d862b1505750d10353f4f1cb86 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5e66f08ce6d72a2c430d183b08aa31a79c55b495 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/36ad7f8734d48d6d802e2762502fe79cd9111b27 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6bd42446eac948470f9a957a46abce8d136a5660 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7b5a5c3f801fbdb0dd09d3b8f6179f9065e84a39 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/af1989a5baa6eb2e74ee167dd9c115833e4c3744 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/9eeda41606878354a41405e18d087d40e4de4bbb | ORPH
    arc      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/35bd3e6d541b7aee8b1dfe14958913a1b2dc50b5 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a2bc832ba26b750f189145773cca2b3c7f6b0a3c |     
    i586     |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/06a73f87c6198b7121786152b353ce5eb7dbf16a |     
    arm      |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/3d69057c5104e87f67d5e97473886935cda7f93d |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/00b00c2cd6e75b35740b2a05efb9d7d68f943139 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a8f7a85dade441269a67eb33e7dc106e346b0a4c |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/ede194fc1fcfa8ff30c94bf5909bbaa773c49c07 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5230d7c0ca86d100cefcddaa8702de414028434e | ORPH
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/f3aefb83af3eae432365d214d9a945693baac30e |     
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/589c7853ce334c7502f7cd4cdbcaaf3c6840f43b |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e87b566f9c7d4ebebe57313fca4751939c197c88 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0e5cfa381cf2f6a665e387a0915d8ec318f1172a |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/9cb5f6f5783a79d0c9bbe5984506679a753211b3 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c1826a22200544869b8ffafaec2df5327e26c2e2 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/97a0465d5a2adbd9202da68556e1ed7f7eae80a7 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/3c32c1ec4d5bfdd61e2d8bec98cab232d6f377b6 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ddadf5aeaf7d4b825eb0c8449956c2abda620e9f |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/300713fc98910b8d8db5c400913c519886e54bd6 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5318ee90056470237d43a91f09399d7fa2f67e8f |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/d185822ec33fa1c9c5855baa3418cd75b53334ab |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/769893922a433bca96e70c80ca66c5d79b6f0e9a |     
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/ce6abcf36cca739b72587123dd6e0b3d3c999d76 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/715347a12c2b6cdde8a43dbdaef7adba9f3eadb8 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0b4aa4b743f69bc8b639113aa354c8f24bc8205c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/14e8d906435bc6b25b621b4eec3ba422e4a01947 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5cc25f853dd6f58e3430ca09a12d4dc7660a516 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9ec1bd1243d8f276b8966f3cdbb1e129cf7d3d7d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2a49c3dc5663c8d0f17605db03c82b93b2db6aaa |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f7ae71d1752b31b0ab1c38320b3774e6253618a |     
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/d0738aff7d23952dfb3224a314276fa97d5ca2ab | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ee0790f893dbb89b7201392107d16f8fd6ac8ccc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/43a09a7527a89b8d06544b0da9ab0be415e824c8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/06130866f4bd88f35d1e0709f0967e892653b9bc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e30650b01de45b27d0465a62ef4c813491aff7f8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f29232155bbcb797a754ef411c2c748748e47e7d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              spandsp-20180108 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/254b127feda5baa9cf7c969a67d5652961b30aab |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9c7b606afb87be8ccb1940fed6ee13dd61155e72 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8e3fb9af7585ec6e0e100a42ef6bfc0fa2085e6d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/40582ca7fd6ce4d011a804422940a54c27a6ef44 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               libupnpp-0.17.2 | 1 
              luabitop-1.0.2-1 | 1 
                qt5base-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/1bc316cbb4996e62b9ea2a7982337ec644ae2a49 |     
   nios2     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/2f51bf536aaba8223441d0283652589f10e062d5 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1cc7597591805bbda0ef81d5e82b00a25889ae2b |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 5 
              keepalived-2.1.4 | 3 
               apcupsd-3.14.14 | 2 
                     avahi-0.8 | 2 
                   cvs-1.12.13 | 2 
                       unknown | 2 
               belle-sip-4.3.1 | 1 
               domoticz-2020.1 | 1 
                 gnuplot-5.4.0 | 1 
              host-guile-3.0.4 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
             iprutils-2.4.18.1 | 1 
libcamera-565f95d64ff92e871... | 1 
                   mimic-1.1.0 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               protobuf-3.12.4 | 1 
                rocksdb-6.10.1 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.5 | 1 
                    xen-4.14.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/364a5ceacb0c07827d8d6f7d495cdf6174b37854 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d65c19fb81df3dc8849c7b4a8892a99da7b9a1b7 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/872e7075a66ba29fa148e745743c1d8acdd104d2 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2cf32f797d4aeb8e634dd909b5e70b168cefad1c | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/67f2817d69fb233a03271b2e58e72280a362d3c1 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/b51333068cfce778a408f62457b23248f57241ff | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c779ab950dcaf2dbf34dfea4db20fb0b85c9292c | ORPH
  powerpc    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/70665bf8ce182b1d425fe57c75af9e811e13d703 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/589fae36106571342dc8dfd9789df37ca72f01a5 |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/73efc35c6abd4c6fd5cc8368ce1e502bf6a022b9 |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a82d0e7026d1eeab7ca2cb1fd7cf6554812aae9d |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ee309af858831613f79f22afabbce7f671f13019 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/1e477e5e944e86adc2fd6c3c6afbe89d126582e4 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b03d200a8160fc8c4398861b91c46833a008bed1 |     
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/d8709d6e991acbe0cae2963fd49ab45c2a5e326b | ORPH
 aarch64_be  |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/c1c1c177a15df72e026e9589893c2172b81d64e8 | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/acd182b9ff928484ca656a8d4ca59ab5a0af92b5 |     
    arm      |       iprutils-2.4.18.1        | NOK | http://autobuild.buildroot.net/results/41fde4aa06f7c025bb05aa594716643b9010358f | ORPH
powerpc64le  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/632849b4fec722b1b00bf8190086cac801637625 |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/a73b68e7b120c878d62a86883c711e8eb633f103 |     
  riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/be066679002b552d5965ce5c98de4de35bc8052a |     
    m68k     | libcamera-565f95d64ff92e871... | NOK | http://autobuild.buildroot.net/results/40e8facc805b3eaac5fe6c95db0cd7b756eb1f18 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/19ff07cc26f927ceb850223c3a6c2818f6b0a1af |     
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/eef573a36c7f7c96856a7833046b6f8ec10d6c49 | ORPH
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/b9f1993a7b6b71b833e673149f0f7feb4ccf7692 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/87d7ca58ac87d9e554e20f5df623c76e682b2b89 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a1f2b9253259851c7476113cb4d65e5031e921bf |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/65fddce787127a9784b7b2802173fd7ed4333d3a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f5cf5a4abab088793ba0e674e3baa9f73350168 |     
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/743b4da5fccdb72935ebce8b9abadac975a36f4b | ORPH
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/db67451256717065ffceb48248d749682cac286d |     


Gitlab CI results for 2020-08-18
================================


-- 
http://autobuild.buildroot.net
