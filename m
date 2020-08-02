From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Aug 2020 08:10:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-01
Message-ID: <20200802081102.3262D87784@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  3  |  0  | 18  |
  2020.05.x  | 12  |  4  |  0  | 16  |
    master   | 99  | 100 |  2  | 201 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        libabseil-cpp-20200225 | 18
            host-setools-4.3.0 | 9 
          fuse-overlayfs-1.1.2 | 8 
              keepalived-2.1.4 | 7 
                  boost-1.73.0 | 6 
                       unknown | 5 
               domoticz-2020.1 | 4 
                  ndisc6-1.0.4 | 4 
    host-mender-artifact-3.4.0 | 3 
                      skeleton | 3 
                  assimp-5.0.1 | 2 
                host-gdb-8.2.1 | 2 
              ibm-sw-tpm2-1563 | 2 
             kismet-2016-07-R1 | 2 
               libglib2-2.64.4 | 2 
                       mongodb | 2 
                    mpv-0.29.1 | 2 
                rocksdb-6.10.1 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
               collectd-5.11.0 | 1 
                   eigen-3.3.7 | 1 
             host-pango-1.44.6 | 1 
                   i2pd-2.32.1 | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.19.2 | 1 
              luabitop-1.0.2-1 | 1 
                minizip-2.10.0 | 1 
                 mongodb-4.2.8 | 1 
                    ocrad-0.27 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                qt5base-5.15.0 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                     vdr-2.4.1 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4b1782b766a4a71783c8dc69e7ac3d1cb6142ae4 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/745e3bca33be6cda1c49893c60159f781607edad |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e2e4773c6b72edddcc17c924f4b655e6b7846afd |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/927cd4067883c0e6072ee1419883e9aa2a33b074 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/eb250e940c72d71252751d6d88d918abbaa58d69 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/6976c3682ca13243bd577bd82267e366745936b2 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f45c3d62718631aa0d4ea1512871261a280ec0d8 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/3f7ad2c7a4b45cef622e545a42490ed9b950ae4e |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/42e9445dc3ec0b41ed4c250e477577f09f86d809 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ee283f0eb3797756d09a5805945ae0e8a45460f3 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/542e493bbacb1e1495114b13d22cad9d9497dce2 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/f77ffb4bd00c3353ccf0a017907f054c4476d9b3 |     
powerpc64le  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/469dea412ac929fa794dc547321616926aebce98 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e1ef5b1dd2defb5233693e2f046e04836df40be6 |     
 aarch64_be  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/8d4a07a013c9e4c311d26cb4b8246ca5039f60ef |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/5da4924d51775c7595740cd88467dbbfd2da5001 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/7af47f7b52a65c6512bbb9ccc291413a585b4c46 |     
    m68k     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4477d7a756f87d43dd6613aeb5eee4fd99fb514c |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c28ea6d3f34a085478a1a3240f84d53a201334ff |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4acf03d1c10f884d3dbdeff913c54ba6a7e01f3a |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/6679fc5d627071e32f0cd68c31f88b51d64af88d |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/75e040419cc71c5d56d910ca1811e147772f13b5 |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/8721bbb24a9a117ab0dd7d77e4212714e1125f36 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/ee161d3df178ae6baf1102ab4a7c02846df7aa05 |     
    i686     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/1a5d7aab051e802d99504feb953ae24168344274 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/d185fe87661d5929d3f3b50ffa73066b128b8d26 | ORPH
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/f7bd34230ef9cb3178effe9bd1e552ca70163ad3 | ORPH
  mips64el   |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/c87e2825ecf4fbf79839195db0d8140a8824661e |     
    i686     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/1d57dcd57515944e82dce2f2f64b8ab118db2b5c |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/f302ca80312b51044a13b76faca7abaabc6de7a2 |     
    m68k     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/b791d538005b393a50053ff73892978c25003940 | ORPH
microblazeel |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/b55bb00ee70de5937c397dc03ac0a77b6f27c231 |     
   mipsel    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/9e8c15b03044f33cb4e2b10da00e68a4f7570fdb |     
    arc      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/ea705cf78c207c10d76189f04fb5adea45a77b28 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/abb0ea0b0fd04053dc98ef4bf177419a639f8564 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/344dcae16aaa6dda7e8deb83970a64f42e22ca3d |     
  powerpc    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/ac22765e79345ca788d85351888bf8a9e89f9e0f |     
  nds32le    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/a910b4789337206e0126731af02fc976ad11a6fe |     
  aarch64    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/3bfd0c9d9ede794eddd3477ea3b31b3a53591c87 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/28d718d8a0b986cfcfb55b3946a76be3afdc6f1f |     
   x86_64    |          i2pd-2.32.1           | NOK | http://autobuild.buildroot.net/results/f5ea892c5d614eb8082a2735f34c409c30eac84a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d48316b7c64cc8d08c36f46228c56c46af501bbd |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0e903a5199109cc7be1f236725edba40a13fa452 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/aa7660365514c5ffb03c2ec23aa52ec4f5e14577 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/2a7ef3d88d5400fbb5fc5f17a08cb1a89933c916 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6482340b03445afb2e5d5eec3a1ae5b7b66f79d4 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1f4f2a9ebd7bab13b4bebde0bbabed46b8a38678 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/3a82bfaf24a6e62574db3448bb10328580d706e8 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/717cc45bce732134ccdcac84f2134656ecde8b71 |     
 powerpc64   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/edf724ed122820a76e3ed685fdee1980084ca16f |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ad8321b02b42e4436f5e3bc9acfca44f928049e3 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/350876342b2ca27ef7af11d4af0d57a637021612 | ORPH
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/331cb967e563852ac8b0a4a430d48f16ad047d2c |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/0843bc3ec2c28f500efe70fa89c904fc50d15b94 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/f5139a82b667533c923d31b83138bff2276bb9ac |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/276fa1a6b98cc20c0107b24f3a60a80f7f900e70 |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/da26614ad534535d503ae648126f7cc9b92ac7f8 |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/9b3b3b9029c6fc7a14b3291727ece97f0032be16 |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/589ff4b4cfa7b0a266d3dfcdc3ee7414fccd42db |     
  sparc64    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/5ae6789d34a2bee19f94440c496c4f7dde67e3f6 |     
    sh4      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/fdad2214af739d64456837852497584a285ce258 |     
   sparc     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/5672a147d3ca9e4747b555506f1d306e7c58b597 |     
microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/1e2f784e4b329d1507870e31d3af1c22c3e0eec0 |     
    arm      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/50b20fb93ee39e7059c939f2e8302e2c0eea34ff |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/1984b3dd2e72a70a00565f24e35b6e5f8e7283ca |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/148cd162badab0ccab87b48b93b4ebd5cf8055e7 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/8e5b07dcc92b012a2a0b0934300b082dd7f465c2 |     
    or1k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/187850606e07f4b0e60c566df75f1871d5a3edb4 |     
    arm      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/48c6aedacec7581b98047d8acf6e7a22403fa1dd |     
    arm      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/bc4bbfb13a77e775f894c723ba0c2d460b5d2625 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/1aa14f66bb1a2daa44023975c8b253f20b930565 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/9138649817c5cfbe355a0b6881b6ed88591bbb20 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0308b110579479352fba35c291f1e6271479e9cd | ORPH
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/31330ee8e15f40b9fd506675d7ce2c5acc036137 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/7afc81b43db60ccaafe1de596668f1eed4af2971 |     
    arm      |         minizip-2.10.0         | NOK | http://autobuild.buildroot.net/results/d81192a1a4d629e46cd43fd387c66c78b3d3981b |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/8b9e8674a2f721290ad6cd514a976fdc45263137 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/192e81c759e74f9f8b450c585477efb40b417c22 |     
    arm      |         mongodb-4.2.8          | NOK | http://autobuild.buildroot.net/results/9f15f0db377bee72c3d79d67e22ade5be4ec22a7 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f34911aa1d963e48cd303de893fa7de1dab03345 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5fcb6176dde8a60f9f4d7992ff6b18cebe216504 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d957c743336a2f2066f3ee8d3c2f80aa64803a8a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f6edfacbd56bd58408a04bd6767d446506bff186 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3e37fcdc87819d6429c54389263ab95fb031de3a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/59febb20e32fb9e96782e270c19e409f67ab2e3b | ORPH
    arm      |           ocrad-0.27           | NOK | http://autobuild.buildroot.net/results/adfc818da18006be22df87be80624741d2f9b43d |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/2c34e630310ccbad593d6f45352ae8a7701e97de | ORPH
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0746bfc95c7714787d136556eadd5529abb0aa84 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/edc3ce2bf7e2cd4e3d9bd919228f9ffe1b313684 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8adfbe01f5164e7fd8d35ad6f583051bde55d25d |     
    arm      |            skeleton            | NOK | http://autobuild.buildroot.net/results/0c700d856d521470b63fb9b3f83d5f3ae3904e6d |     
    arc      |            skeleton            | NOK | http://autobuild.buildroot.net/results/4c895c7ac0a635d38f5015b5df0393581ad7b508 |     
    arm      |            skeleton            | NOK | http://autobuild.buildroot.net/results/105d27b21248b2b84a4cd88ba5948b5a0dcc962b |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/90a38ab47109e4bb76f36d58a361c0b314c03fe4 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c7bb88e7768df1b5b50aff95e974b1af9968f600 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/a750edbfdcfb1ef8161520b73dac0368bdf300c6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/849dce8b27a3c7f488a1bd1f8f1f1b83a3fd3b0d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0104e0b9eca35caf92d68dc9ea4bd322b778e78d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e44be218ac2e53b9707cbcdc21f619009be36b8c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef6974b39fa3898985c49fa0141307b2c1e6358f |     
    arm      |           vdr-2.4.1            | NOK | http://autobuild.buildroot.net/results/b8475cfddee94d2938be98356e53328b5cd064b5 |     
    i586     |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/984fdb9b567c3b4c1a0b30d81fd079dad74f5f5f |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                    owfs-3.2p3 | 1 
               protobuf-3.11.0 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/58b267dca4419a97297fab743c6b0126ae17480c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/311c751745bf16ff1daa03a447bd30caa4097ff6 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2878965eb3f50271c0cecce3816e74f73928bac9 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 2 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f7a1499f97b934377fb8c1aa05845697971f805e |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4eeb463280f5c2bcafea77028278afc2f32433d4 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/01236cde119881155f2ced0700e4fb8b06b0f6ca |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/398dbd663cc92d778e677d3836dbf517c8832e0c |     



-- 
http://autobuild.buildroot.net
