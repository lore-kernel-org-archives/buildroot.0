From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 06:26:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-26
Message-ID: <20200627062653.D9F1720497@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  6  |  0  | 20  |
  2020.05.x  | 13  |  5  |  0  | 18  |
    master   | 105 | 102 |  0  | 207 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 37
          fuse-overlayfs-1.1.0 | 7 
               domoticz-2020.1 | 5 
                       unknown | 5 
              host-grpc-1.25.0 | 4 
                  assimp-5.0.1 | 3 
                 openal-1.19.1 | 3 
                qt5base-5.15.0 | 3 
               apcupsd-3.14.14 | 2 
                     avahi-0.8 | 2 
                      ell-0.32 | 2 
             freeswitch-1.10.3 | 2 
              gr-osmosdr-0.2.0 | 2 
                    mraa-2.1.0 | 2 
                  umtprd-1.3.6 | 2 
                  zeromq-4.3.2 | 2 
  binutils-arc-2020.03-release | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.73.0 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
   gdb-arc-2020.03-release-gdb | 1 
glmark2-9e01aef1a786b28aca7... | 1 
  gobject-introspection-1.64.1 | 1 
libcamera-96fab38e02792a109... | 1 
                libcurl-7.71.0 | 1 
               libupnpp-0.19.2 | 1 
               opencv-2.4.13.7 | 1 
               protobuf-3.12.2 | 1 
               pulseview-0.4.1 | 1 
       python-matplotlib-3.0.3 | 1 
            qt5location-5.15.0 | 1 
                  rygel-0.38.3 | 1 
              tinydtls-0.9-rc1 | 1 
                      tio-1.32 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ce252df1acb133a4087b5951acfe4524124817c3 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d76cb5e4fd9e6a8e09d60f4814843b6a44337157 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/282ee655dc86be7683b84c5dfe2a4c9f5fa798e7 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/0111bf6655d69990be2027fa1b91fb5b15f08526 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/15ce75554de8475b3a7b076591b9b8dda9c9168b |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9fae06edbe982e26718419317e3318757dcce278 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9514f0598cb93056f1603d4602cacdc8e72ace7c | ORPH
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/d576ba288dd229817256c648d707916c4868afbe |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/43db116b96c80f021c0e1599e6c974dad48d5e62 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/04c3f732a83684caecdb58dd2880e3e9afa707e8 |     
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6c85c13f0983160e7e3734764fdb70eeccf88edf |     
    i686     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/cec733d44755a17de1f2b253280c95b86a55a65b |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/aa64c921b3f431532ccf069109679626999d1ffc |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/af440c80d5c76610da0a556c454db38ea1dd5f6e |     
 powerpc64   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/0ca5d306ee55f73f3257cedeace627ed33a293dc |     
    sh4      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/3595f8f7941207fbbb632dd7a6189a1acf756672 |     
   xtensa    |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/4af4f957611a74e42ed71055634441ed6316e392 |     
    arm      |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/38785c54883211b97a6853a1c01486b7c7fa4dda |     
    mips     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a0d062c865a1c5d0bf9911eacc592c022ad462d3 |     
powerpc64le  |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/550af5e917cf5f740eaac7156eb6ecef57ffb640 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/1c5c9ede5f8822ae8eb4e323042d978c40813753 |     
   sparc     |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/b709a0c784abe3c377f562536cd84bdf36b083db |     
microblazeel |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/b711a86efd6fd08879b89e140774488b0a2f5bc2 |     
    sh4      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/614ea31efec63e51513d1e009681d290ddea4cab |     
   x86_64    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/1674e7dc60f9a9d923a9580beeab64ffaf5c26fe |     
  powerpc    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/966d5bf797b2e177e3c068622b99672e1db34570 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/6b2ce6fb21b30e87856dbab97082819b4ad11a7d |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/dd28dc85c9a9ad96a7c87ce538f8ba1656274afb | ORPH
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/76877a6c364de8602c8fcbc122b9f499a9b43bee |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/984f859e061d645f702ee2c5d42c23620ad87a1f |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9e665af10f1a4cddba33ed6684aa1da6dee9b700 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/709e9ce6a3870581075d15d90ef064524b570ec4 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/cfe924bbe0e135ad4d90901413ea22ca980cd271 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9d136280690eb60028394d8b810cd2778f876cd3 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/f530fd0ecbd83284233b1fb7f6473a59d3b40831 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/677163485908a12e2e577d7c782d2bbf971b10ff |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ddf1bf8fa71ae0c18ac3f9834849772d7b2dbfbf |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/19bfd30598bdc03716ed4a8c3f8ebcc4a513ea61 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/59eea3a4499dfa3a3a81539b3576dff017619954 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a25c4c9a4e58fd7607f946d760e447b77937fb68 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d05040be01cb230975eef97c5d9d8484fc88f4f4 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/379befcc46ed1459f9e1192bcce0f2c4f0d5199c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9f36cb8feec6813e2302d7392397736bc719fee2 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6147188a75126f0cc23092d509de77834669df72 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b2f9c4929a8375d49b1bef203008118c7cb2b3e3 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/150b4711a70b94a1912d4fa5982de2a36273a6bf |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2f5e5bd510178513c452fc68655b85f8a54093ee |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9834a81f2805c416ae60241b6a446e20b9de58f1 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/133655a7c77984246fe8e61cf0bc950c2b4be82e |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/af6917c2b40534351d2bb2087c8b56a95bea9681 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0daf688e328eff741b708294911d66710464f57c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b4f50ab22bdc8a1bfc0a0ec2ebc69f72ef3fc5f8 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/f39f60658d0dc8a15b847b18d467fa0627711c48 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6f4031c2b391a58025ffbd90072a55d4c7950aae |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/26bbfdfa7ca0906701748bb23937ddfaf98ea44c |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b15d43b12ecdc0d630c144b52da03f1dd07881ca |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a8383cd4ec18721c9cdb831403f0625cd016157c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/cb79d2660e9653c637e05bae971b526c23d7005c |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/841a96eead0c1da6b62f603aa2f46808e753bbb5 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/98fb1852d7d33d82e9d55f5c37179def5d887c28 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/24478911409ce61ed9730c4d664440e09ab59761 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/1db5485f57998b6c0ef37b2658a2acdeee5cd921 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/652e06871dedb36d335267d54ea75ad780694424 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/90708a46bc3baa2db919ce3ece20325a4cfe4259 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ddc204349ed4223dd20543b3425f1d90f401b36a |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2a377d8f8e35c47bb2eef15a59ff7109a2353aac |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ec5a2778a34d48ebf2b7b78501e55a2a747ec008 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/10f26b70a66241e7a5bceb985b977716f8f43bfa |     
 powerpc64   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/0670452848b5a2c8517116708c78bc0af7c16cb7 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1685430e81d68f2c5f0e4a5409afcf55e76246fc |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6ddc4e5cfd3a18c8f9db4e47717584d6bc8b6676 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ac77dea20d1ce9e5e8ef502bade1ddf86b2b707c |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/85209e210a3bfa45c99e9321f357c7fe9440b761 |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/36c1d3f53b55911c60ffde4a1f1efc48f78f127d |     
  nds32le    |         libcurl-7.71.0         | NOK | http://autobuild.buildroot.net/results/27e1c3ba60eed56c1f3f98d2974e4186f0684787 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/ddc854370461398945fe1c98490d8f2b0f9038f8 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/f2829a0aff5bd6f73a837c813f20de5df33c7606 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/b4434724ac810b35913a5e49b43e27e0418b5b9c |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/ac7dcd58f0eff4835a005e10045006d7927ee48e |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/8461dc70b58333b5d69db252c24c5cae22ba09ec |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/5969221d7305c287e44842adbef9c8679ab1af6f |     
    arm      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/779d6e43000a05c240ceadd4656a6ad182aa3b8c |     
    or1k     |        protobuf-3.12.2         | NOK | http://autobuild.buildroot.net/results/1912a187bf8154226bc01d2e20f16e8842a421fd |     
  powerpc    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/d866afd92c557d4bbebd081f4fe473e3ecedaf95 |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2164393eaa9e62d3540ad3365028847314f46603 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/2f666dd35d26237e427272f1369dbc727ba6b6c6 |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5f8b71e256f5617c636e609b53fed20b924db7ab |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/93e809ce154e44c93d696cc5fb3619e60236c5e3 |     
   x86_64    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/cf4e048108af8cf46cb1748e08cc42faf41c108a |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/b8ce30be0d09910396f701bc1357c7fd6e1bf343 |     
 aarch64_be  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4d866e92f83d299482c5b60358b936d50fc3c503 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9e0cfdb4150286f4a7f9f2025f0a8eb74e4f6467 |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/65da06025c90dd4b18f3d28da0516754ee697531 |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/60c1e104b7c550c0ac9c974e13d9df03329d4a32 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5326e1151b104eb360bf4e94a48959510e935e3a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/54ed80e332f873449c58519829bb1a0bf614434a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/19b9b5472b49902dfc69d08d0b0b1c4e234ee0d5 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/355c8b08aff8cd6cd57ae6628de29f2f1416173d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7e9b7abb0ac6209c4ace442b5bfc010cbd89b672 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/ed086813240368af27aaf667252a067048f8cc26 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ee5430457fde6053c2ccb2f85f2eaeb283421dba |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8fb95bdabbe36530ba3d0172c9d2fbea19bf6c89 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/aa23a43dadd39309c21b7234ae441cd08f809b83 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5940ffec7bac152542132a615faff030269149fe | ORPH
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/120b893ce07fe2e897e750c3b54c5c3cedc062b5 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/a08b9edfe684b2818bcb11522f6a8862e410853a |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/6eeea5c03d6cebfb9b5212300e99a4bfad8a1c5b |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/7146816a7f513086ab20d37049ebcf8b2562eff7 | ORPH


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 3 
                 granite-0.4.1 | 1 
               libupnpp-0.17.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/f83804399bb882018b9a7d351500c3d4b248df88 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/0bf8d5ca50af833787f434d2295c7dde428b730c |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/32c1457128b311ec8592a5689a9a08643e0bf1ff |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b5040cce7f8f450f8c21fae375d6ebd88919859d |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/af8390bd59ece7c83cd42bc76f5e3838f0c22e11 |     



-- 
http://autobuild.buildroot.net
