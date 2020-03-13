From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2020 07:26:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-12
Message-ID: <20200313072624.7F8A528C0E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  7  |  0  | 31  |
  2019.11.x  | 19  | 10  |  0  | 29  |
  2020.02.x  | 28  |  6  |  0  | 34  |
    master   | 170 | 142 |  0  | 312 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 27
                  connman-1.38 | 12
                   bearssl-0.6 | 11
psplash-fd33a9b3d68c89fa22f... | 8 
               libglib2-2.62.4 | 7 
           mediastreamer-4.3.1 | 7 
    host-python-markdown-3.2.1 | 6 
                libtirpc-1.2.5 | 6 
         python-markdown-3.2.1 | 5 
                       unknown | 5 
                     avahi-0.8 | 4 
                  ffmpeg-4.2.2 | 4 
gr-osmosdr-46698a67e7e06419... | 3 
                   mimic-1.1.0 | 3 
                   gupnp-1.0.4 | 2 
                 haproxy-2.1.2 | 2 
                libevdev-1.9.0 | 2 
                mini-snmpd-1.6 | 2 
                qt5base-5.12.7 | 2 
               acpica-20191018 | 1 
                    brltty-6.0 | 1 
                  cairo-1.16.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
             gupnp-dlna-0.10.5 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
               libgtk2-2.24.32 | 1 
             libopenssl-1.1.1d | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.8 | 1 
              openjdk-13.0.2+8 | 1 
           oracle-mysql-5.1.73 | 1 
                    owfs-3.2p3 | 1 
               protobuf-3.11.3 | 1 
      qt5webkit-examples-5.9.1 | 1 
         qt5xmlpatterns-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.5 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/d94b88aec45c293359905714518514f6637cc1e7 |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c5bf7cd33f1e25eac351585250b3fad10dfbfc90 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0765d4a429cf82296c53bc632a8ea5d6047338b8 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8cccf6ffb682f7cae8cf8bcdc814b96aa4b52e36 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/19a4a00f98d25ef30556630af1ed1b4974cbfa2f | ORPH
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b4449401517861de0c580428fdfebd019aef8293 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f6549c8f84a573cf6353ebb662e9be22c0143870 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/77f8bcaec336453638703569edd0c5ecdb844feb |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0c3d2b12a57f02e827534950934c3183566e4c0d |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b85d56a7209198f8c8fc897d9cfec1476c70e389 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f3686156f52dabf87b2bf73f20b147246d1184ab |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2dd80071012a4de53ea0a0d9501b3748cf5c2adb |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f617bd8f21d694a977c58b8ffaf9f37e6b6ca5fe |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ee69116a2d9b23486bfbee6b423db2401ddac889 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/65b853d18fa7d474c16fe11d42d4708fa3b60860 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/25ad61742b425a7b26121eefe992f2e033a5394e |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9f81ec4f2227af13c48810e82113cf4c55566aa8 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/5d0b238bdad1d247aa111eb7e84df3d16167af65 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/dfa071df22c5b0a5254a13abb9126d806789385e |     
    i686     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/b63c7de0c175714ff3cf25add6d8180295a8fcc1 |     
    mips     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/c63c62c85392ec79e1e3a51ab595e75d1e3301c5 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/66d48198421b81b1d4cdd22677c2dd24adf3762f |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/7d937804497e3eefd14af39a6acfcee15e95e33f |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/e66c83d0a9d0f3710907b6f7358d92b69b9e297d |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/d66aca5c5b2f73779e2daed91ac986fdddd57004 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/cf59e6669ab0007451ed4a8e454218fe492b368c |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/e4e8b567011031ecfd5f003a36676a0e2c39434f |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/75254a0cb8cc9aba4aad43478a0bf6f0d044682a |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/d5f723d39834d3dcc717dcf2df25f2b35f900144 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/8d915059544dc4eb05a554bb6c2ea3be5736bb32 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/293cfaea0871cebb5e307ae18e6211004a016db6 |     
    i686     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/36ec6019f2ebe425ac24f9a7bb79501b3b358ec9 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/91f1c324536997126122ce59e8e554b0f61bec94 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/cf73371f34e7aded72a0e9f8a47e913fa87c8d1f |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/7b0dcd29b031634c835ee45668fed4c4de5bb0bf |     
    i686     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/7850ac6076b92ccd670dadbb776b06d7f7b171b0 |     
  powerpc    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/0dbe1d3982f8a6098a6f1f6cd4063b9bac730b64 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/828b9ed21bda8e12d75bc67c647e986f3cfc518f |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/2f3327e1a5aeff58d00ec4dd8066f127f561dac9 |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/aa83d505d6ff05b8f5948674ad33f9a72c4c743e |     
  riscv32    |       gupnp-dlna-0.10.5        | NOK | http://autobuild.buildroot.net/results/756cd62d3a65918688a07f48e7d9dbf45613e7f4 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/2b385efd5d54394293d350e98eb48a76acc8065c |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/37ac0cd993541cdb044f7d249cfbab5bbc6ec190 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/04dedee9d974f2d1fed6bca0d7aac01649484861 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1a40ceb50b3a69eacb496ce34368afcfb05b7cdf |     
  sparc64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/38231229ddc914bb0e76347958ab967420640b6e | ORPH
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/67ee57852a18f84b798b3a45d061f92b4114b5b9 |     
  riscv64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/dbde4ef136040c3477696135819d548b5f9d9280 |     
   mipsel    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/82373ceac43487b1515acb1363c4217b31d8c5bc |     
    mips     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/9c65a3d47e542f0a74b3e092a18b1f1009bbcd3f |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/aa697857e971eeec9cd3c44bb01f7bd6f19be23f |     
powerpc64le  |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/4ab9b7fcda75797a324611d1fb07cdee3807b925 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/3613c67de8b6f391b0420b2f5bdc0fa05ee86692 |     
    i686     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/9abe74f69b72c49c09b62cc042f6c63ddb7abe35 |     
    or1k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/31c1fa9cdad3d8c8e2a46f2bab0d04ee13ead031 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/06a0b7691ae00882bb784b7b82d041fea850308a |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/48e1d830dc66117f9a9411290e8770e995cf6fbe |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f1170d820745b54a8b50b52630bef2fe5e92ed59 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f5839fbc0081dd04fc43b91c0ce23c72172953d6 |     
   mipsel    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/45827023c94e4c2337662ada40db89fa35714bcd |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/9200907e4daa9e5f95a499824b42009e5d093a4a |     
    arm      |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/9b1bd8459e0dc3d69427ddf4de8e3b4cd8b887fc |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/8ddf768cf866e808eac51bbb9f1b8814f353192f |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5622774fad7746d67a6f853b5794c7cb49b569f7 | ORPH
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/0e2e0384747fee48d48a9f805342a0de3d58136f |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e6a3402d2a70c43be09dcace05282264162cdd55 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e463aebfab2fc77a20f01df0ed02f265d4d4a723 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/aabf633667203774b561f7c022415a4185f7db86 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/30f36ce6e181c703b324d2c30c80e994f9a13ba0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ce6e1147f0e80584ce21a84bdd30bda4fdb002d4 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d57311e88d26faa6907026cc020822d488e40b7e |     
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/aa86e326c8a2ac8ac21180a66794d9441b513ad3 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/06b0544a68d9784148c883dfef85b0b1036f9943 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cc8e7274416ea23de79e5a302ff049257adc4f9e | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8d67a2dcb3aeeb2df140425c830808645aa21cf1 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8a23163fe311c8a0265e442154d4ad3ee18779ce | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5316fc5499bca7ad4041c4456bcb76c23bb6be8a | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cba717864bebebcd23c678f15518005d06353005 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/29c2a39f46bc20690e0032357cb575622a9f6b32 | ORPH
    sh4      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/d6d8a4fe358f93b8a280ca539e2ba70bd6c275ca | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/3e6569efeb3e436b339368076e79aae54ff29fbf | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f2d1e0b35e2eede196ca76b2c77820c6d0f6f98c | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b2edb603e3020040f0d806e3eab65a6606fd5742 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/eeff7027986c8b9a9463ea34ee9381db4d827af1 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/c5891d1ab00ca3db3e9863d0d8749b0d718306f5 | ORPH
powerpc64le  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/67d9a857a9ce7212ea48c25de4dcaa952f2ac993 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4021f4d834d94a36cb1ffdc93c47c8775f65e191 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/7a67ebd19d5dbdc1cb617bb12083d3a3b1fb2091 | ORPH
  sparc64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ead7bbdff8199e3e652a7511873e8a864c5b7b8f | ORPH
   sparc     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/079df87d04080df6c8f35343c994a53120ad3027 | ORPH
    or1k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e14791ab859fdd3e76f86cffbcdb3cf24ead40dd | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/3d5a0e14a635c4cc914308a1928ed82cacab22c9 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b079d27c6b94a262b58e013460c0819aadb7c41b | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/156fc50f7ee7974c3558d5e34fa5b6d80587627a | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8bd2c1a586ab309652632fbcbb5ad85ee24929d4 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cb32be0fc5592172478eb0e42ec7f60df2fd87aa | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cae7819157382b338c9b9ee70618f334738cd494 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/41f7eab6d23dda74e88e02b1ce94ee1552f7979f | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/9854f5388f3a672ff249e3de742b5e072b2b8833 |     
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/7f772c6ec628b0be6c7723e01bb54be8c3707099 | ORPH
 aarch64_be  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/ded8767acff1f31f456abd62b05b64f263f4b1af | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/a5de9252870ac73e578be9755b8a48db6d649e4a | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/899f21ece04bce07f48d64d46f2031bb55dd2a09 | ORPH
   nios2     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/30f492ded0dc7ab7703d389669959e4d82475b23 | ORPH
    m68k     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/ff0a711a5c793191e60c088ed3149b86f204cb4e | ORPH
   sparc     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/209751e88ca4816f989c70a20d02b15b6b98557d | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/be9a1132536ae672c6e051b22f82ee63b5aeea75 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c068fb83cb77b31a0aa5e5b6e9bfb423642a72ea |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8a76796cb61546e5f8005e53187719b6592a5c2d |     
    arm      |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/4ce78ca08cf5a57849213ae3913bb9eda8c6e60f |     
    i586     |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/6903a0f685076b4a2c2824de6158da40e9e712d8 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c30b8dc1a91cfd95d0f5f4d5a8b6d1905cd9897a | ORPH
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/4d79c79934205b44274639533d81cbd9b0f873aa | ORPH
powerpc64le  |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/046f8ce5b0a0c9acf8855c82e7cd23e9d40bcf04 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/02173670f4beea69862790e20f9a7bd0cbd28602 | ORPH
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/3797a5463f1a4f43e9d10764f24aef76dbb035b0 |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/0e29fe7c3c8f9829672383c39b352a62544bc08b |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9befc4b045782cff4262baa9425803bd01cd7e0d |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7963a49eed02278c208c3851dd2326e13f01e36d |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/56a6692b6ae3bb3336782b5677dfac69cd41fc12 |     
    i586     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d1308aa40bce328aa7b1148d1bcb6ce6d78031f1 |     
powerpc64le  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/46f2fe1afcde7dfeaeaf5ea5bda9a8387d62d16b |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1479c5b0504b3a63d853440cb5bd058581fc8f41 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9999ccae8209ee31f37a2077e498155cef69527b |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e115a6e10c505a3bbf2b3b3f616e68a9fdbf8436 |     
    i586     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/65c95c17b36de46b573f271bd7f120a6a1c776b7 |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/c24771d97988384137939d9fb10b417ae10517cc |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0c667d2538cdec6da9e3ed646332c7b0af9d97d6 |     
    sh4      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/5b636a08cda899389968efb7881a898a7b455b72 |     
   mipsel    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/f364310180a7afa757ab5e19b5cb164d6dda7b73 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/93864db27e0b8e5578cc554c7137a0a49e2d664e |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/e680f0530a81f9e598a0b05249cd61d3f28d531b |     
    arm      |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/b78b2220196c10c99b1cfe01fe6a3d419d4f4b0c |     
  aarch64    |     qt5xmlpatterns-5.12.7      | NOK | http://autobuild.buildroot.net/results/3ddfcd0b2748951bc1d221988d56e4f5480675ac |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c859b65f7cd4f92f710cbc936b05dfe7e76cb287 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/864073be3e5598b810a17f8e203c3f8664d155f7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ec7511cc3ae18c0ee6c402b52d88fd3e38341780 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca6f16a3ee397c8f90262eab02874b1280484d2f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d8397f208610c19f55147eed5edb7272f804e5a5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c18d1efcff84ecc4f5023607b0defa4f828a523c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/384eedd44729f77faaae369154555ca8df4a66c1 |     
    i586     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/de68ca407de2f9ba48773eadc6e3064cd46c72bb |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 3 
                grantlee-5.1.0 | 1 
             host-grpc-v1.16.1 | 1 
                    wine-3.0.4 | 1 
                    xen-4.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/d98de2e176abf14477c2e097846b6fbc919670c2 |     
  mips64el   |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/44c1cb349d1d052d3eb17c93616e13afedf7fe0e |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/1cd1f1f35c4bfc596086570b883170272e2ef5ec |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d82467ab17a9342b34151051dbf0ec18d1b3399f |     
  aarch64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c2c1ea04a9777f5333807d3417a22ed767bf580c |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/8aebe66e7fab445e87b6a1f7333e837bf6ec8a24 |     
  aarch64    |           xen-4.11.3           | NOK | http://autobuild.buildroot.net/results/c2192dca10baaf02475071e00c79ee0063374e30 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 5 
             host-guile-2.0.14 | 2 
              host-grpc-1.23.0 | 1 
                suricata-4.1.5 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/90673e635c405c2e032d5b66019e5907216b0e35 | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/abb9a4921514ae889a324066e3e562f36deaa5cc | ORPH
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/f027f964905202c6ef64ae8b1f1a24fbb6f0d219 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/1e7e0f40a0b9600f696514494fb24dbc4d0ef995 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/fb1f9856507d85ff3c8301a1ec52b482738b293b | ORPH
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/dd3a0c320dcd2c733d545083212a5f2ac7caae74 |     
powerpc64le  |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/268e0b87c05bf47a34ed75e34d8cc458e43b9233 | ORPH
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/fd5ecde699dc44619c4a562ddeba1407fdb1ffd1 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/b1dd8b1ef4222bc4b711e03a8e8209166ac2e100 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3d987f682c6a5c19867ac3ec9bc393ffdcca6780 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 binutils-2.32 | 1 
                  cairo-1.16.0 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.1 | 1 
             host-pango-1.44.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/7fe2bdf8bf29e5ee5613817d70b4b02f7f311a1b |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/bfb6d5090e7db863b908886f3c25e6dc8f6e6d27 |     
   x86_64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/00572e763fcd2b873e1199de3fc642c489c0f4b5 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/a79e52fae5dfc325dee43c1666c36cf274af9a96 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/9df3a47601d1743d30ae41bd4ad13c38610c55cb |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/9af1f3b4bb2a83422bdf3b141122faf740c105a5 | ORPH



-- 
http://autobuild.buildroot.net
