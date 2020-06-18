From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 06:27:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-17
Message-ID: <20200618062803.BDB0F87DB0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  3  |  0  | 24  |
  2020.05.x  | 17  | 11  |  0  | 28  |
    master   | 129 | 200 |  0  | 329 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 119
                 host-icu-67-1 | 17
              gnuradio-3.8.1.0 | 11
                  boost-1.73.0 | 10
                libselinux-3.0 | 5 
                    mraa-2.1.0 | 5 
                qt5base-5.15.0 | 4 
                  assimp-5.0.1 | 3 
               domoticz-2020.1 | 3 
                 dmalloc-5.5.2 | 2 
  gobject-introspection-1.64.1 | 2 
                      icu-67-1 | 2 
                   mimic-1.1.0 | 2 
               apcupsd-3.14.14 | 1 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
                 crudini-0.9.3 | 1 
                   cvs-1.12.13 | 1 
             freeswitch-1.10.3 | 1 
                 gnutls-3.6.13 | 1 
                     iotop-0.6 | 1 
             kismet-2016-07-R1 | 1 
              libfribidi-1.0.7 | 1 
                   libnss-3.52 | 1 
                 openal-1.19.1 | 1 
                wayland-1.18.0 | 1 
                 x11vnc-0.9.16 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d7d4d0eaa4f3c7b35bfabfd5d7fdc92377baa12b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e253a37e44749e20a12182bcafef636858774399 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5f0dde0deeea8a5e599ca81d51c6018a4bc8898e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/110755bf4a283f32cd65a1df3e8094e06ca514bf |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ba7cd2fc3ba351000957cc320461eabf5bb96795 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d6a1983f6641e48877af21e656354d5ceb143786 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1b46167844e5d0f7094a74cba79ce0cb86dc1833 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ae7f03644102780980f1064f7db133f7a6cf4af7 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ee9c71768f88db70a562836178c1aa0a0bd0227a |     
 aarch64_be  |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b31befc97861fb3ac3f0965b1eab37720fbbfbb9 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/16ee0acffbbef2d158e7a827bd70ddb8dcaf9a74 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/7b76acec3cdc85d188603149d23709cc742b759e |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/0b0e35cc56c50e86be352ec2e64d5c8df75d8526 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f45f597bf0b278f95ed22e0bbb489a7956e0337b |     
    i686     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/968a5d8c49d87809c5e81b3ce2fb7771a87ba735 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6d7c96de979fcc0398b5354064beeab30696ff09 | ORPH
    m68k     |         crudini-0.9.3          | NOK | http://autobuild.buildroot.net/results/99b0dc78ecce4f492b24d2d4651e72a2646df259 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/cb15a6c0895a9e7944a203c084773fd9a9db1dc0 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/bb555a85a2d3f83f2bb9da5fb47fd9b51eae5c3f | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/00ddf13890827d87918d45048756e2a57d162436 | ORPH
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/481f54d3f4fa9dd2e5b842d75d71282e5b2a617b |     
    sh4      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/9e955542fd4f7ebe2fd943834dfcd9bb217af418 |     
    i586     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/2f0eea2f8a092b2a9cf5d8b7262da2cc71482563 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/561612dcfbbd7c0cea70666e9ed58f36f1b4bf4c |     
  riscv64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/03945001520818bd5f4203ef7a6bfc62be329a62 |     
powerpc64le  |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/361f4056dd167707a955a0b163494fafcb43594a |     
  riscv64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/cb353e0d4e3a18bdd4e381aaacb1c234bf1f97c5 |     
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/38240a28b294f2c526a8fbfe7316970f71abfc5c |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/5fad24699af322ee0f2e7f3de2c9e532873f7749 |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/01464678424044368467ba5289a5519bc828f78e |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/92546ccd7633e2e3e6678af5538a72cdcd2f5769 |     
 powerpc64   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/787cae91bd4eaa76b6918fed7c971652adab052b |     
    i686     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/083e63a9e9e35ff7d154039d674b25b7c93e1244 |     
    or1k     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3752eacc4f0af9d4c044f3fb7678fb4cf8271abb |     
microblazeel |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/29d1021a318dfa18d903326b3e6f1f336b6716e9 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/aa478e91f1c003422255dd998d1a28f434557dae |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c4c0bdfe00a02ee39fbe67988d3ef7035152d332 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/01c1ddf76f64eae715f98975b0fa653a79d8b0f4 |     
  powerpc    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/2d7f63a6648af7ecec5440be44df21066cbf5925 | ORPH
   sparc     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/c812702ef559fe7dc94b2938637203476a93ebbb | ORPH
    i586     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/c11e8344f2f4d2ca8c2f98a7c9bb2731480e509c | ORPH
   sparc     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/95c89d60a0ac7f7706a7092431d1a2944f8eda84 | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/8a26b97384d4b38e846e570361e21be78dabafb1 | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/208e1d9f9eb586d54026b1a237d61383c5335bb4 | ORPH
 aarch64_be  |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/8336575d97b56ac99d808fc38648a679bcabecf5 | ORPH
  powerpc    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/628a963eb790997dd382690474cecef1037d0f77 | ORPH
  riscv64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/acbfcc4d51dfc6521d5f74c708539d0d0597be6a | ORPH
  riscv32    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/88ada8880a5ade8b315fed151b862ec93804cd52 | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/ebbc67fa71304f768682a3857396ca174814a2d7 | ORPH
microblazeel |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/627abb9dd27962dafb59dfaca416c3bf87b21409 | ORPH
microblazeel |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/4756faa438d11d1559876f03aa3ed1041fb1dacb | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/f63ac3ef8b0b3193c3f3a300260f63c242151ab2 | ORPH
    arc      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/cdfb29a64af799b38dbd5909a41f44bd93c9ddeb | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/d3c7a3c5041be3cf81d54f06fe720a222ee7f58d | ORPH
    mips     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/7d638e6b3279cfb7197a45e7b47385a7e5355bb5 | ORPH
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/7b340bcad4fec94985db6af536f49ca3ce56853f | ORPH
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/026aa11deeaebf776e353131a616c4a7ec9e4091 | ORPH
  riscv64    |           iotop-0.6            | NOK | http://autobuild.buildroot.net/results/a63a13ab0f2eb988756266267fed43aa536a11a2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c4f0d8c93685b2d4f575f993dbeccbfdcef2db04 | ORPH
microblazeel |        libfribidi-1.0.7        | NOK | http://autobuild.buildroot.net/results/d540ae8ac113ca58211af236835f01d830c248f8 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/86e2bc1cf66bbaaa5ec9ac1e6ced684d731cce45 |     
 powerpc64   |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/0a6f88c913df39e549416a07f6ca5fb22ff89738 |     
    i586     |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/e01e99ef3b6dfacc99c497c06f64fcbebae47a0c |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/fbd536f92002a63622d336cc65735d8d116b4951 |     
 powerpc64   |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/261197659fe3bbc50c1f15b057e151720e7522d0 |     
   xtensa    |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/e8d39e898f105cb99b6204200271ff2c98350d11 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9accc148157867984b6701fe6a51d50bdb357f46 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4ccb0ac04262e58c2e09c78608136b09eaeb6112 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/8a93421c16dc04803f0e7296b55b4b236a989c39 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/258915da0870d98a67a3dae0cd6419e9baaca21a |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/03af60d47a1f3567202112c409e73d827e6b133c |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/03bef390ea4d8009b06ba2eac4bb07f4a1404770 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/ede30ee6ad5eb24c7cbd88e1a86fd0a40b5916e2 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/481fdbcd728b33679840f3019701415fb02dbe60 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/60e79fb84438ec3296e2608b68c3ff850162648f |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/264b0a8911b1d3b4b312b2bf8ef411d697b6276a |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/eacdb49d3590932001049c893b10582acd4baf41 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f81774963b564f84f392996efebe7c74f1d20722 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5f4ae2be8430c3579f5af6a61c25689897ccf519 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/aeb8f4be2468e53695bcdfb75b435cfedf806f52 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed6bd0c0511826d21c8732c07de7a3a1d3a78451 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d246cc0f1e2bcd1b71bc0423ae8cc0b9f36be11 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9576b31bea5f760342bdd992ecbc4c7837bac372 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ebc076ffad1b7ced53b02412f47ce5f8f8c65ef6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/81901f154dfa70eadac1ae4055d26cd02c32585f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b60e18f47c8872dee9c4f643ce90b1a179165819 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/13b84cc28024218dd999c28225330e329b4cafd7 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cdde7fbbb4f5689006364694ff00c8c50e3e3afa |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/991f11706f77e45f5778b8b95e8b77f11cb1b151 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e6ceba186d847bcbae731b32fed43dec81e4836b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bdcdf07a816d7cfca540e670e3a0d724ca22db1c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dd896c8f18830fa7ff65353693b134c82188968f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5e3b984c1ab1ea3eeeace7fc0e05a43b62e63d74 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d908cc29aac5b538c8cba10168d095f388efc86b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fb93cde4f6b98db68fe3d46b1cfa30c134eb69d2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b00c0bf4b4931e2ae0e4bfce3f76887237c9b4d6 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/13f41e3b315b6a8448e698880276b42595e03fcc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/07ebb84144db78b7356f7c56cdb9ea96805db83c |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/186abf7cc54c1e356b12bad5eae1bd87ac51d8a6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/22b3fbf1e15f8a598968dd1ac599f7c15c66cee1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/631a4a2e952a5d536737b3b85c1e7d1f6808f323 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f85ecfd3ec20d75f7a67c243ae1a11a2d8cf240 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2703a0e6084470ef1954e75d316971a72ce9f014 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/37f0bb3bcc42f78a6cc635f780f0d13eecf9c1bb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e66daa7dc5130b0a3ccef4dbc26b96b060dcb1d8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c3e8c06a6fe9b127db08c8b05b35ae487120a877 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/085ee073eb9732d064b1d0a674b721f9d97d4fe3 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bb0502b0afb9e07a435009bdb55b7428b04d3dc2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c343e442dc7e5878113fb858a1c5cd11d286ed6e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f1b779e3ff33063398960b850d1a4c44c29de25b |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/fc0fcd7f0d52ad45d354f877f1cd58041489d3c3 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/741f20839096e0dd427840341a6acb55616738e4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/624b6a6d4396f0708904634a19d6a1494e1f9f7c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2bd7e8694e99ec0a541f49e73ed5e4847aed60ce |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/828086d827438ffa6c38d2afadca7880892cf9c7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fa22b2c673676c32b1d63f50c5bfcb2e85ae48fe |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/01481314c5d5d440e24cc248ec05357d749a5470 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4af3fc250ce983e5f547fddb1a0b73152fbc39e3 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/bcf01672bf2503bf0b2112da46f2bd26f0559da7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ccc3192914fcfa5e2a8a879a57ab77a16ee27f09 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/22d8cacfa8e21b29eff59831e75c5d74d8e62515 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/34e4cbbf33ee713ad1c0ef31125d29597ca71e23 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9b3ffdc44defb2fd602897073e8659fcfc870b5e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/009654fac30a3a87f5a97383ccad01ea282b0d96 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a9a656b726a620bf36a00562d42aec6f16345597 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/77facb667b050f8641109ee236f7793813652e22 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d02ad2a361d32b9015b66a6156674603644433c1 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/451b933f9b71edc6fbf7a393ec775f6b8449c328 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6a42f532f724db37a2e9f1d824cc514338474b4c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d69f85067f45e1b0208f20ac9c645f62709f3c53 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/5b5223d63f898cef8daea06300711858f3030fbe |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf0f85038d427da53bafac22ab8bba0b467c0481 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7a90ab72458a6ea5646e14582aeb947518101157 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/265d64d630f3694025c3f783812e0125aae47c5d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b4d87b690dc2acff4e77f0dd6a0155e8a9c24772 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9c9d0b197d478b8698be211a5fee181075fca644 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3ec81b50961b2e7a327e608f59af4510cd5ee518 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/387eeefb60165b7aa1dfb64d8ed073959a222f8c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ed431a6df9c8353936f465575853261b2b003f65 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/70aab073f3c49d713f967ea43aa4d485b87b999e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/949ccc6a3ad455aef127d502f8b6b7c3c6cc3dd5 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/600cc70efbf02db6de09407373eba32acd762716 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca62cd6511ec275bc6dd16e4bbce868589fb95ff |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d61482bdb1f5ed6c66c4f1772190155732ba0200 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/46bfd58f3d7b3b1b4969e49909a5c061892c0f88 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/90d967f79e524f620607c687400b4c49bdbeda77 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/90826392d39285fcb1e19ccc361e4a91ca7222f9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a851cf7fbe4d76b7117074b7be8c03c4855454b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/159a97b05ab2861e7d0250a599eda77c63b475ae |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0e211ad676a59433d6f84efeb38081533c82d8fa |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/92344f797345e3af18f677009de2035693ea0ade |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f884c860b8c008a1473820afcdcb2b497bf8424 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/665374ade980c0427065095c59edadb97e0a5040 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e1cc2e2c617997c9f6134ff54e667b2b0af47de |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/444fee05405f82593bb0df6f75f89dc693f47d6f |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d44fdd3e6571e32f12dfd0b41c368586950d220 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f263cdea6b4daef5e9aac242c2d808bdaa9d4a0 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb074cfaf6301d7415c0f84e02a9b8b3aeaf0443 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0aebcc76742b197763063031b4340594e2e17f09 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e353e02eaf70864ab2bb5ec3d76a594450666abf |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/97b012edd81140b3c757473ee4ea76eacb34e639 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1c79e0dca9f27381cdeb5ab232c32277b735de4 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9802d5a885fab39c42d4725183d5d7cd35938526 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/e9a1ed82ea9e649e5ef8d358aee8b9e3dbba5dd3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b241d8595bba7c32bacbc22e59bed11139d047bb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5734c2117849a3b4790f0ab36948d36e2ff20684 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a9f2141b9701ac63f3bbeb912a392897873e7396 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/66550cfa8323d6b71ee371d320392566b77cd29f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d47aa58b6a606abec07bab60a9fe9607e804ec62 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d55a4d19e908a75131320a18f776160ddae3d86 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/130d677117d6678a4edc1514d77536254a4fc8b9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9cdcd60a93ee222d755f47c328a55b99f85ac1cb |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/76df59d0728cb5493aad5589edc5ee8fd6801578 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6dec92f19437ea60b5b82184e2a0dd426747426 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/42b5be644af175a9175174f76f98a1facb753d37 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ad7e0b459b393adc72024957a4d1c53ef64148e0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f8d851837c611eae52510427faf7681a8c33312f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/33f5d0cc649ac85c091bbe2cada1110b5de15b2a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/47b8385530b897012844b51be492646e257b37d0 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/43410f427d8c31a9715095a94888f1b439b6d5ee |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a6c56cc5c9495d34d488eaecd12c2e1e196fed95 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/607dfcea324265f949218cf6bafc44fa9d317d3b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/297e2a9dc23432f98a24e94c385ae86bdc5560fd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/698381ca1f48615e28fc5782bc828db38feeb3ea |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/66267f475db3d3619016eb9e55bbc01002902b76 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f0285de56ca9933044c14ebc8f170733d1ad3a2d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/957788551de3168176b6b9b403237477d5902a7b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3824508a102716cc68801816097c0503963b52b8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ccf3dee2f4e42c7c9bdaf4d1508dc28a2ed0ea2d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e71f82981be1865adc0ff101eb77dd12ff4f0bde |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b4bbe2bbfa7d17c10f4e6a75b50b4fa186736d2f |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/70eda2e70460fe3dd50300af39d550695b8dfc4c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/994e58b763cb29ec4af114ecd644fd08f9e23fa9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0d0cf50c6c39c45305cb6ea9a4546dd1fcc5661 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6bb87ffadc67cb6572551764ab0244d6ddbb48e1 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/754500ad9bdb80cc5dedcd39f962c0aff34e4c55 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e45a54d5b3b6fc42cee04697eb1ccfeb2785dc58 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/c1c699146e04a6ad5a6f7c10e6efaaeeef2b2dd1 |     
    arm      |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/e2662ba0936425b3939c77e668be769568d84e81 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/26bfde76f34180242aea1c1e4e8f37cc0a8dd309 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-19.3.4 | 1 
                       unknown | 1 
                   vlc-3.0.9.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/03159df74f5b1c865a84ec21feea2bde29d72f50 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d55a334ba4fc0dcc7387f00fe4274aef54ed6f9d |     
    sh4      |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/05ee3b0937877c0b25d8b3453985979971a1b68d |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               apcupsd-3.14.14 | 2 
                qt5base-5.14.2 | 2 
               belle-sip-4.3.1 | 1 
                 granite-0.4.1 | 1 
              host-grpc-1.25.0 | 1 
                 mesa3d-20.0.7 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/aaa48482c73ffba754a8c9d1b9623dc264085f54 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4ab900a4183910009cb9befba396719860faf85e |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/571ee8524df0afc1094351de84803680d1ba1821 |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/c64eaf99b45a7f5fe72915a211693cf4506c15ba | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/86c19b9fef6e56d06c28e96a75fca7c5bd051ae5 |     
   x86_64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/b81c9973a9776624719539ca19c4335c4914890c |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/a4c44b4358f5e6d630784cf08f530b7817b9e321 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fe31a7bc8533c170db0c0faafd61e2918f792e96 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/57b19782295533bce0f1359ca23a35bee0636912 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b4ffff3687f8b6735da840459a8c54195bff7010 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ab9fe6fe70c1e2d00e981e1f2e31c8a41c5432c5 |     



-- 
http://autobuild.buildroot.net
