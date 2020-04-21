From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 06:27:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-20
Message-ID: <20200421062759.B8A3787894@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  0  | 19  |
  2019.11.x  | 19  |  3  |  0  | 22  |
  2020.02.x  | 17  |  0  |  0  | 17  |
    master   | 106 | 81  |  0  | 187 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             stella-legal-info | 8 
               apparmor-2.13.3 | 7 
    python-dataproperty-0.48.1 | 7 
               apcupsd-3.14.14 | 5 
                    brltty-6.1 | 5 
                libselinux-3.0 | 5 
     python-argon2-cffi-19.2.0 | 5 
              ibm-sw-tpm2-1563 | 4 
              mbuffer-20191016 | 4 
                  assimp-5.0.1 | 3 
              host-grpc-1.25.0 | 3 
                     avahi-0.8 | 2 
                  rygel-0.38.3 | 2 
              bitcoin-0.19.0.1 | 1 
                cracklib-2.9.7 | 1 
               domoticz-2020.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
      gst1-plugins-ugly-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-nodejs-12.16.1 | 1 
             kismet-2016-07-R1 | 1 
                libfuse3-3.9.1 | 1 
               libupnpp-0.17.2 | 1 
                     mc-4.8.24 | 1 
odhcp6c-d2e247d8d87ecf8c60f... | 1 
                openblas-0.3.9 | 1 
                    owfs-3.2p3 | 1 
               protobuf-3.11.4 | 1 
          python-enum34-1.1.10 | 1 
        python-greenlet-0.4.15 | 1 
                qt5base-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3a72a270f404fbb543614a6d9669304d967e1b47 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7bd17d1e386b243afb81d1f5690c10ca62930c0b |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9ce62cdf73272df3de05e05fabf0c8a354b5d951 |     
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ff5fea5860d46f6c0aa779375926aad67e7ea003 |     
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cb0789e0fdb0c83e2dcf09b08def4bc2fb2f9295 |     
  powerpc    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/9879f62e5ee5226cd6ef520fd6d70ff3cc481473 | ORPH
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/c40ffa777ae19512c92c90abf0b87ce1548ad165 | ORPH
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/db95703a907d9446400ac1fb775b7838a73fe46c | ORPH
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/4e1c3baca0cf724b0a0988c49d1ba49c13f570ec | ORPH
  riscv64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/ea4d34706d719db91e40f2686e7ee7a90eab664a | ORPH
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/e2cc1b404b064f4122c2c13dfa4cba9301e60988 | ORPH
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/c3ef98288ff84dda0ce70c797963f3ca786feda9 | ORPH
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7016f63ae17c574b4a19d944a8472ec26554eeeb |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/0f6bfa3ed5866a82095b75d89599d49c00953a12 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/f89948994b6e25477bb118be023eb9ebe87b22f5 |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/06e4bbcaf84f41465a093087fdc105edd6135f7e | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3146510f2336717c902e789285335142ae21abaa | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/61c653f8381b34f8eca297c801936400e333e922 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/f63a4ce42e5f1ed49871a54f275968e8de70acf7 |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7da9135f1dd77936a621c9d26aa7dc57310fad57 |     
  riscv64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/cc91dcdfadc45afd74988f71475a6f4e85cbbf25 |     
   sparc     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/074fc1905bb216f5a3d74167fa7289dc2c984108 |     
  riscv32    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/5f081ecf2b51ea2ff5f7d3539f85e1124a11464f |     
   mipsel    |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/c58fb63ddbbd8bfbb8d3784a68215234195f34d2 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/b79fe076fda842937677c1a1a5a6c4e745666bac |     
  sparc64    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/57bc7179609098f6cec5ed52fb5e512b28d59631 |     
    arm      |    gst1-plugins-ugly-1.16.2    | NOK | http://autobuild.buildroot.net/results/c86cde6532a6babdc89ab45089b06e80435f069a |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/aa5f778799334faeab91e0ab824b1122725da0c5 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e2fea1fd61f85c0520cf838c869b2032655b96c4 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ac4e6c238456e913d884f669a2f15eff0a9f958c |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1f5d1cd28e5ef4e078a3a299c727744a37350dcb |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/2d8fb804d4665108aaa17604235aa4e62d511a40 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f3164c177e6fea268dfaf610022dd77224ba6c90 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/adc3d2580bfbb4d8b6b9a77ecc9520e9c8fce772 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2e1db5f15db5cf204915a01e70fc7fb3bc5aa4c0 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1ff0ae2ca2893014d84028c4e64bde3b1f4080eb |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a2de7d80d2983d0cd99966ea7ac074f114486335 | ORPH
microblazeel |         libfuse3-3.9.1         | NOK | http://autobuild.buildroot.net/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/385e3298d8a2fda09879518d4c4371148ffef0e7 |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/50cc2c8bb87e15933e1470ef826f972960a8bed8 |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/32adb503885180f6690f157860bddafa17604e99 |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/200fd0accf6a1926251243b05e600fbf591bb3a2 |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/d73416d731fd1848ede874fe641903586ce875b4 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/afa27d33c5fbad83d0165561f097cad7fae2cbf7 |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/2fec203bdcd9bde91df8c101b66811695cf1eaa8 |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/ed8c7e00d7b42fcc131efcf75fd42150804565b3 |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/6596e15da9074bf2abe3a02c81b43c2c6cc418de |     
    arm      |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/1fded9bacffdc57fea9cb151ed889f48ceb5ff8d |     
    arm      | odhcp6c-d2e247d8d87ecf8c60f... | NOK | http://autobuild.buildroot.net/results/fcd89dd076887e9b590ffa672decf2c84a6d57f8 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/ec9e35120264c3a1e9e41fc15a64a0bdc8df9b7c | ORPH
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/7ed8cc456cd422a8d1bf0cb86ebb6c67111857a8 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/064a9a0ed1eba0370f5c1f2d66dc77a3544dc43a |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a399c2f41a97814e72f4023134d60146c871b7bb |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c921e01e0ec69882bc7ed777b45384640cf943ea |     
   sparc     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/18f830637a3be98d2f8ce721f5e2b4c6d2f7c320 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ccc4596c535cb0bef22aa6b4a4f6637382eb34cb |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b06e9279d7dc78ec9d7315444fc48c7ff5c18972 |     
microblazeel |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/b181850fb9a424a88a412b87559ba3e7d60ad5d5 |     
    arm      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/976f92f288aa49238e04149f52f36212ef964b12 |     
   x86_64    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/204e06fe5b5c53e50d2b31306a8e699a09014979 |     
    i686     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/5a536ab926be7d11660c17d9d3b9a2b0f75f224e |     
    sh4      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/7bb476a76de99ba73651b242495638ce23a4596d |     
  powerpc    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/a59d0858b29300d1699b48a5b35388ede638f600 |     
    arm      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/82b4acc62cc500fb222d66fae5f8a66934622505 |     
 powerpc64   |      python-enum34-1.1.10      | NOK | http://autobuild.buildroot.net/results/624ca5db0e676e7f176adc0bac856e97355779ed |     
   xtensa    |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/c2bb7615a37bb952ce8f6739e76d585f9659b4f6 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/237919823323b794f33331c94426eb748707cb66 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/facffbf2c2e33483a503b2810cb5afb1dcf169bf |     
    m68k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/dd5fa4de125ff93dde329853326add51792c428d |     
   mipsel    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/b6b3262d6c626f84b317d974a49d8462d988450d |     
  aarch64    |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/dde44cb50f930d30225320440aeefb3dba1910b1 |     
 aarch64_be  |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/e90b25a832b3de5833cf7310e11dcc92d292b4e1 |     
  powerpc    |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/67184bc6d78b3c10a224cbe71d40ecd8c9df229b |     
 powerpc64   |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/38fa47221f36f3db603ee54c86b9747b0c6ca5d7 |     
    arm      |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/7fb05e70701c2dccced6ed7bb75b7414758432af |     
  aarch64    |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/dd4c7dfcbdf19d353a6c901c76fdc5e6737ac51f |     
    arm      |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/1f397341b42cdba003c4b232dd81dd0f595d67fc |     
 aarch64_be  |       stella-legal-info        | NOK | http://autobuild.buildroot.net/results/65aab51b9204a1647728142dacac9bae097caebc |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1805bc9eee598ccc59aba8ea5949f75114129890 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/492da4356bcf78cf03b3ed478e4963fc0caf6734 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/95ecd15b4e3e6ba9c39b3134451d3a33b621cebd | ORPH
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/90098372e7fc957da19d5426f95d1ee868e028f9 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

               asterisk-16.6.2 | 1 
                 host-icu-64-2 | 1 
                nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/7dbeb9234068c08b3c0cc0be32a53aba9df6b038 |     
   x86_64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/d1cda13969094bd763f577facaa51df086cdd624 | ORPH
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/38b1c3a549bbb793f7fe324eb3f7e14a39b26efd |     



-- 
http://autobuild.buildroot.net
