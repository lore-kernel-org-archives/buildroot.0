From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jan 2020 07:18:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-15
Message-ID: <20200116071812.0E41F203B5@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  4  |  0  |  1  |  5  |
  2019.11.x  | 10  |  5  |  0  | 15  |
    master   | 91  | 88  |  0  | 179 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.10.2 | 13
                    brltty-6.0 | 9 
                   mutt-1.13.3 | 8 
                    parted-3.3 | 6 
                apr-util-1.6.1 | 5 
              host-grpc-1.25.0 | 5 
                bitcoin-0.16.3 | 4 
                 libnss-3.49.1 | 4 
            host-mfgtools-0.02 | 2 
               libsigsegv-2.12 | 2 
                  olsr-0.9.6.1 | 2 
                 opencv3-3.4.9 | 2 
             openjdk-12.0.2+10 | 2 
       python-matplotlib-3.0.3 | 2 
               acpica-20191018 | 1 
                      bash-5.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                 exim-4.93.0.4 | 1 
                haproxy-2.0.10 | 1 
           host-doxygen-1.8.17 | 1 
             host-pango-1.44.6 | 1 
           libsamplerate-0.1.9 | 1 
               libtheora-1.1.1 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.3.2 | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
        python-alsaaudio-0.8.4 | 1 
                qt5base-5.12.5 | 1 
         qt5xmlpatterns-5.12.5 | 1 
                  spdlog-1.4.2 | 1 
                     squid-4.8 | 1 
                      tio-1.32 | 1 
           uboot-tools-2019.10 | 1 
                       unknown | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/804ad9e4a33a0622535253dc228d5bb850ff82a9 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/74614e4deafe64ca8879abdf081a6748097acb37 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5493f5842e3379d2e3eab60cd5c9db70f420575b |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/73e8b94fb66ec2317f307916393ff3a7f2fb9b06 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/dae9d20894431f71888af3418776dfd4c1682b91 |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/6cde15051aea757deb4e29d4d96a0ee41a9c352c |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/553cf73e0bb69223d5d767c87a522829c64bce41 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/1f1269c92538ade7f87b014220eb5d1e7b4e882e |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/95d9f21a650e30e6d6c1636042bb24555079f643 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/0917154a60cbe238ed4ed6f038f0c65a8379206d |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/0cfa6ca08435fc8498243989e2210e53ccebf842 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dcb139dcf9648aea26a3899cbe8a7fad31ad3798 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7264a4ecfc34fc7c0856b16a4f70735c9d7c96a1 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/360a30d8c8825442a8128c1e0056d8ba04d488f0 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2d0b8d1324deb041c7d55cb09590f120138719ef |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/09cf4985d99969b24ec8139f2e4fab794053776b |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/46be21d7d4479e3c3f6b841ec99778901973889e |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1cbdbb05692806680f9badd98c599004c5fa7fce |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/932ac891ccaa4463ef42470bf313ad52ce78be79 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/54cf7f44b03e8fccf72d5ac75287e36cb067041d |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/d398d9fd68ca46a05e4b61c6c53df412a323e75a |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/1441ae8ddfccf9dbf2b7fb3f11612d2aa643ae9e |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/7a5b9c9e4304fe586f59886afae65a7a48c8f679 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/b56010f7bfe1766ecd1088001562da3df8d361bc |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/d2391a7bf7dfc436f4c262639e724fa3a2c84ac9 |     
 powerpc64   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/615bc92f28e99748b598f4f916150a969ab52394 |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/4be6df27f33e4fd6955e47892e1650a9d5ebbded |     
  powerpc    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/ece8c42bf4092f34b3fa0b7a20c136b24c452523 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/7006bc6ed0e27b1ec3156c7c697fec56e738682f |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/08bf88999e054e96388c84e9ec0161ecb58b8d72 |     
    mips     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/55bf85018ba49ef9bba238aed1dc019d40c05dda |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/17b549181b6ba7bfe58f0d7e0a62f4733f90ba95 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/12a6ac06eaa2d7b43f675ea8b01c1814f9f4d266 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e8c1457d612986f0acb18c7a818de6d47b4f3e1d |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/6d095764fabd91f7c53265a5c89df9ff03a93918 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/e565cc1821d12745448cf2538ccd754222234461 |     
powerpc64le  |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/607b27c930fcf7d86274eb0dcfa8cbf72e67c4f3 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0e70ff1393ca07cbd139358e100836fc39537c94 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/46d08e5b09b0b088795198a9296d45eab133a499 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4be6f75d6957e0ece2c1617e57d515357848cf62 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/53f96dcc6f07ac3bce23b865105548bdf3e40a26 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1d146fd7baf0f16d91ad71694e454143e806a1d1 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/77e341588ce339d9018cbfabbf1ba87c31e93696 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/b85ecb81f8f1312e7de14518b4d072f4f35d63bc |     
microblazeel |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/6a97ffc57b6259320306fd52d4797dece5e8fdf6 | ORPH
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/d6122929c8176d54a429e169a57e8fe39bd8b08e |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/ae28bf20ca24a18c609051f57eff23fae1f97695 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/b426088056bce620420bfc1e3b1bcb8180c99b4b |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/754102d628548ed0bc692f42fa726050f615bc28 |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/283728b2daac4c6103d691e87705f82512c10546 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/320c30f476c93353aab632bd5ac633fce0a5f881 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/7e2a802e850516e75cad24e7c0fb48b75077e6dc |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/9f6a4704eaa9c8d7a5cc36102ae775b417569d46 | ORPH
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/b334a642799837fa971cc0fad1ff10537f88b974 |     
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/df0fdb3e6ad9515190b728a849ab19d962b72a1a |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/04155236f07dc2d46fdc13c50edf316d87706885 |     
    i686     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/fa796368b171512d3afdfe7d81e8a960e987e221 |     
    or1k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8b146432c05589e65e1f4a4831a85b64affbe2cd |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/dedef6e8dcb7b4acd8f368682f825fea8172ae62 |     
microblazeel |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d7acda7dad408903a00e4274644db2a08f2a2784 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0f445d2472a1fd8e07f2625f653f4f1f81d2fe3a |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b21619bbefeab1a675667f7c5658e588fcf2353a |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ebbf2553989963cfeb2e5fc20a2f3f1a66394e61 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7d9b15238419da132a59ddece80c25b0125acc13 |     
  riscv64    |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/2bffa4b3d28478bb9e6bddfc901d39b4cd724978 | ORPH
microblazeel |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/0b32680939a35c67f50e3818a81deb4d9672c10d | ORPH
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7c7b235cc922252c5e297f135c31fe7cb362f6ec |     
  powerpc    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c1dad542edc217cd0881d470f47c8ecff91ec9e6 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/e61709c77181f38150246ea8994a53354eb67f2a |     
    arm      |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/b31b2fbe01394045afb5bf7b350d6c4a4afb55a7 |     
    m68k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/7b6eb06521622847ed9a2d2950762851cae69d23 |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/7f3098b7b0a0f18ee22f6a10351b1559b78e8183 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/49901c72b90fbf7b722e7a4e8f9c83dce099eb2c |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/2e6d655d0ee171e2dd278635932ff857b822996d |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/97b569d40fd56ccc60b49d1390350680f8778848 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/4d17b0579d8e6cc5f79d3cd52dcf3f4450fccbfe |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/2ae0c2e52d49bdee3ac022d4d7efba0c0809a4e9 |     
    arm      |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/1abfe1d727776d9283c7385056c1ab7e39418dc3 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/38f0bf44648a0b997ef0fb44d70bf62021f949f9 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/0e78d1bffa41b282856109681d8616e417b64a5f |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/863926916657d1439a36438c3bcec0c067f2069d |     
    arm      |     qt5xmlpatterns-5.12.5      | NOK | http://autobuild.buildroot.net/results/cb8727d6ec312febb158ac0f39ac3938b46cfbaa |     
  aarch64    |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/4750b261d4476e626b406a99f8600d2c8ba4db9d |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/d4c0f574ced247ef477db0a10d1921eb334a780d | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/6fd9116b3fc3d4e530056d6342d4222850454655 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/a41df0fb65e39c86869e719f4ee52730080afed4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/78d657d828c42b71c222980264d9506ae98c9f88 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/5e7cb831cd90d13edb118a9731c56e5d9c62a415 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     host-llvm | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/3a7ee953b494505cfa021b9905eb1264e8422af3 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
                  ndisc6-1.0.4 | 1 
                 systemd-243.4 | 1 
toolchain-external-codesour... | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f79e5223e4c56d48cb7af926f58196dfdb506fb6 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/392328d85ead942b5e1991deae00ce3f33c9b10f | ORPH
  sparc64    |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/7f2fcf373140637549b34fb2a7436d751364caa8 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9a69ef34b5c664a5cc14ff23935324ca312e9db7 | ORPH
  riscv32    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/3eaf5db7a5eba8e99d8c8409b49411a1fd469b7f |     



-- 
http://autobuild.buildroot.net
