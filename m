From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 07:27:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-13
Message-ID: <20200314072725.46AD887BEE@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  6  |  0  | 32  |
  2019.11.x  | 26  | 12  |  0  | 38  |
  2020.02.x  | 22  |  9  |  0  | 31  |
    master   | 157 | 151 |  0  | 308 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 27
                   bearssl-0.6 | 11
               libglib2-2.64.1 | 10
                libtirpc-1.2.5 | 10
                  ffmpeg-4.2.2 | 9 
    host-python-markdown-3.2.1 | 6 
           mediastreamer-4.3.1 | 6 
                     avahi-0.8 | 5 
              bitcoin-0.19.0.1 | 5 
                  connman-1.38 | 5 
psplash-fd33a9b3d68c89fa22f... | 5 
                       unknown | 5 
                libevdev-1.9.0 | 3 
                  ndisc6-1.0.4 | 3 
         python-markdown-3.2.1 | 3 
                   gupnp-1.0.4 | 2 
              host-grpc-1.25.0 | 2 
                mini-snmpd-1.6 | 2 
                   ogre-1.12.0 | 2 
                oprofile-1.3.0 | 2 
                  pango-1.44.6 | 2 
               protobuf-3.11.3 | 2 
               acpica-20191018 | 1 
                 binutils-2.32 | 1 
                busybox-1.31.1 | 1 
                coreutils-8.31 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                     flite-1.4 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                 granite-0.4.1 | 1 
      gst1-plugins-base-1.16.2 | 1 
                host-go-1.13.8 | 1 
              host-systemd-245 | 1 
               libgtk2-2.24.32 | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.8 | 1 
                 opencv3-4.2.0 | 1 
                openocd-0.10.0 | 1 
           oracle-mysql-5.1.73 | 1 
                qt5base-5.12.7 | 1 
         qt5declarative-5.12.7 | 1 
                ramspeed-2.6.0 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/5b5a121fd62ee00f4e3b86df0ca70beb79d05474 |     
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/078a93c184ae090db80471d4433c47edb44f7884 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ba9e846734bebc6f6e683c5cf7e52f66542e9cfe | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/67d258b9e701fdfe3cb1cd16ca31cf6c5ad2b137 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/734051ab3d9e70b1e52b1ca17d7452766d4d2165 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e84b398bfe73b5abf544d5a18728770ba322853a | ORPH
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/30d20079a17a6f8393aafffa14024f15dd90f362 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/bb22bb98ea0411e9b59b55ea005fa1e7e1117a07 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d2e6c9318ab864905238c37e509c408ec5c20342 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/875c11ed16fa52597286e23a05064bd7936f2921 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f683768f3fe6c99f4ed58ec57f9bca2a6ae90d72 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6e42ca0539514066d0052c135bf5c99b136a1e61 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9a82fdba13ea019ab69f6d2f340bb8e297e347c4 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/fa5e2dfe22af7de4304023482c3aa04b03981b4d |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5e6abc98deffc6f341832f9a6acb32c16070515c |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/267c128e9e9dedac1f646b66faee8775aa5a20db |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8bcb852c3279e9e177d8120026c1e752afdcbb12 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/e2647c8d782af650d6c635aa4a0e61a9ec39f1ba |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/5c39d867b1471741bbdb748548fa6064535214eb |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/63ad7bc5139ffe944f3cb67c2b3a5c7abd3752e2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/793181dd72b7365fd12da4f9da6e05d37f12c970 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6ce1d891ccbff4226db6971af340c41ee5c647a8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/226e9ced521ef50338b050bfc4f6a1443a9ab7b3 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/26d140d566e5c1eff33456cb1c75ad19ef006121 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/db1480f1209259c85939c0cd4fd92a610df15270 |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/acb13986fbf87703f0e9de76f08498629a75aae1 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/eeeb2d19b4ef48c34f473776c18143337656c76e |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/6ca1f55ef015d231170d77e487c7c7debca49f4a |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/2bddc5b7267c3e0386a774fe3408d686705c6f68 |     
    or1k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/781b093fe7598d4111a842100f670c70eb088bbc | ORPH
    or1k     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/52ad712cd167f85139a74533c6513be8724e5bfd |     
  mips64el   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/fc7d0bf02e0f62c2c63a8227199bc1191f565db6 |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/a81066310fab0f11e048777bcfc4becbd6578da1 |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/1760443f1601224fed1065536f7ea2e141040a72 |     
  riscv32    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/867bee6aea5023f71b047e7064531d63b77840fe |     
    sh4      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/43f3ed144091547fc5fa1d945e98772c37891b96 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ecaa5589a9d94d9c8f8f87a5a0fb8e84fbe6f927 |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/5b57c2beed5714bd0903b62ab61471051d4d9d2b |     
powerpc64le  |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b0b9917b9cb51d02fdea6b1188f0de589d35e316 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f272d66e6006662a99bd6afcd42912938e92ecea |     
    m68k     |           flite-1.4            | NOK | http://autobuild.buildroot.net/results/be8741c7e09b8b40fcf2abeb4f45b17f4caf5845 |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/b3271ae51a4b9461c708de13c859953529923490 |     
  mips64el   |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/aff5a6863d94db2b96bebd6d27e34e3e690b6d4e | ORPH
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/a4dac3ce290b0c4b18de593e652a2d660198b97f |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/75eaee45b59af2f7fcabc3a2cd669e6f3a2b1e3c |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/e8f642c6b8ae4ef2cadb4e49608ac933f56fdeaf |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/4c23348698da2a0527dc52a0758432bf273fb556 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e59cefb0b16e871aeb871420e12591b1a1895fc5 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d2ba64622e1e9bf0bab7bf61252128ca404e8c86 |     
microblazeel |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/7377b5c30b492e7a5f89b85488f393564c645ab7 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/e0cac5c12ae6d1698d09c01c1e520ce7ed11f933 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/d05a4eaf08cc555ff2331cc9185eed6d9d4cdb27 |     
    i686     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/b195124205cfee40b9f9ed55ecf3477f23af9505 |     
    arc      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/69a10100d616c02d275f2eb94811a989f73fe790 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/38fbf459bf4616d0d69f2c13f1658e403e4c58db |     
   nios2     |        host-systemd-245        | NOK | http://autobuild.buildroot.net/results/afd2b092b0ae0c317d17c8372d52326f4c2b37c4 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/b4955221d89ddfeda096a18c4795efb55379be97 |     
    m68k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/c7d0d24db5d8776c09bf6fc2b8e038a0f2249f0a |     
    or1k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/c474d644a1d8eff939cfe425ad63cd32c9a71839 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/c1c5a9ad5e98b67bc4133398d5eb69da4b102910 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/995dfec41c2eaf13dc6a0663e5059797fd05606e |     
  powerpc    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b9bfdb38c711478e4bf1051077a8282df646e956 |     
    m68k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/0f83d865ea9b571d5eacab6e33d571092308ed48 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/5dce4e8a2203460c720a983f144253d627d2c974 |     
    m68k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/dddd8db534dd05f9ad8772bdc0760df97c00906f |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/bfc7a36fc221047c9c8c99afd385053a60272912 |     
    i586     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3e4a6669f7b3ebab789a638a5e80cc0aab724efc |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7456be7883d6de745ef9bd0efde61a2ea5e04fee |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/2b19b6e3b1990fbbbeaa3d02afe172936edcf7b1 |     
    arm      |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/7d4e9a121b7603472d95df0bbe5967010ccd5c14 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/90df875c675c1a836f5e2c06fc7ff4db8a44e164 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/aafb8cf0189133465b85855af313d10198f8eaeb |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6a63abf2c81fc8cae41bc5b48f5949550d39e0ee |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/727afea5e48f80b0344b3dc138e3346a2772aeb6 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/194f76955a1fc7b0ebe757027c144e0efab78b06 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/9383fc015aa51e640e29182bf6e9be7154755c1b |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/db842c5c0457ac0c5548af3f608a79ddeb417d20 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4a110fa62180f596ac01127a87fe1099b57c4531 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cc3eb69b6528d53ab6a8e76edcf0150a52a92060 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/fc59c10a54e65b873f08ed3d9c67ed98e0d5beec |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7a5d36e7220b624c41d50c0aaf5d90a56c62ba84 |     
  riscv64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/97c2d406be8483435dc6142552e6da735ff02894 | ORPH
powerpc64le  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ac03fa9461f49f9d219edffe29df934b73286bf0 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4bf7d61b2cf5f2889f3f051ac0803004f714d6a7 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8e3adfb9c2e8ef9a15d1a012f38cde5887607448 | ORPH
    i586     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/392f7cf1dcc8c171bf9aad4cc1b346a092c98dcb | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/0d985b58cb6fab8502d883482e0a4134d02e5175 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/bad0e267458af62886996be3d4c5626f8afae5eb | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/43a597bee5a8b1b61fd07c50193fa6d2ac29bb7b | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/1f4ecc10c008d4cb790921509cfd68016e1b6b8e | ORPH
   sparc     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/9f3ff8268a083aa53822f869e95dc8955611878e | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/01146536a80bb925e4c82d841c914918b12d1799 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/534f414a16348e9410af7877e513b5dc7b554d49 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/2b6cc3d23c1088e7031acc768347257d772969b2 | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/85c0a87b9c0ace469443dda7b38660fcf6b94004 | ORPH
    m68k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e68e8168ab25252b2d1ff9885a34d294220da403 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5eaa6e93fdd141c17fae7bec76818733f30c41f7 | ORPH
    mips     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/34f9196d310db7369df03f25d56acab2653f8b6d | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5ff9ed68557918767312f125f5da68c4bd4fef96 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/d65a5bd84e2d0b95b911842be461d18c189ed51c | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/5a9eea00d7ac0607f5e387a97e3cc95ed733be12 | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ccbf3e47a68f3bb4a0186b49fe99af5024281eb4 | ORPH
microblazeel |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a4fc6284dcdaeb384d884c47ab88c3c7aeae4394 | ORPH
   sparc     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/2071ec0c695aeef8f4ec389147de0e65557cbce3 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/d3765e8f97a5684501f530cb00936738b0daca09 | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/86f80631a9a0a6612ca1bd55c1dbcb85f3e9d7fe | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b062d90b00f7776a52f9215987da19878cc2ee5c | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/3500b563e1314f447378132c5e43869cb3c397db | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/75a3b01dc774225c474cc52559d1d56e7eb39450 | ORPH
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/39b2c06a2353e1898128825d67d24a13c5134380 | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/bed44d17e75f90893491bced7e93813bf9edb07b | ORPH
powerpc64le  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/dc10594c05280b2a5dc52ad667c313fd4f7919ab | ORPH
    m68k     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d38e8f06f2990df8e0a1d6c4ee356e45f1471dc1 | ORPH
    sh4      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/4742033bce3d1e3658a9748341041cb91ec1f90b | ORPH
    arm      |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/353709db076e2c1daa72863ab091f7aceb854862 |     
    arm      |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/4010fc5c01226bf642f86aabfd4f23c8f88593b0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/86343c20eaff07cf1952724efa317f7a52e6a4c6 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2d9e0f7262b4d6f6bc024c2d930eb4000fe1748a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6013e1072a8cfcdfd2347a0cee1b8ff6a26f83d1 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c02c050ea1a8f6b271473633b746304765ccd0af | ORPH
    sh4      |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/6e23455f47fb60df0ebbc077cfeeb823ffa757c3 |     
   x86_64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/b1a0c1306e4766917d0cf294fe6995feb3075d80 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/d533aba3f6600f311c90e0fc7012c6a2a8a328e4 | ORPH
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/47bac71efcf5eb9ce460942e79d15f84275ddd51 |     
    m68k     |         openocd-0.10.0         | NOK | http://autobuild.buildroot.net/results/3637ca7d9afc470f7fa28e3d7395457d39cfe13c | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/9b52582903cc9a06bc49f6eb3cdcd823c1b6238b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e3dc502c936cdd0adee110d5532e6e9c3bc692f0 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/4ef42977c48d4e342af6d39158190b21fcafe6d7 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/93984688dcf394afdf5baab4ee94a0ae94a92d92 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/e786d059c142e8c4c127fb18896d9c299920ebed | ORPH
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/87a9d90658ebae9df881b3925dc1582d5117ac8b |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/715d26fb1cfd82859238cf4e9dc0e63820d9175a |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/023448b9712bd9805873b0cffcfd19844a83b67b |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7d60f0812efb14fc3d63c06eddc56e5061d5b8c1 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7b2c1fc6376d0f81f9ae5165a2ee46360d659ef3 |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e53c666ed75e6454b0a71806b3146f905145b1e1 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f0b55ac95b1604afd12c0a4fcb0597b843a94f7f |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/17dee69d2f5c46f9d9df27a4842e58814b3fa4f2 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0915dedea3cd0783b4a2c5c82c24752df7aada64 |     
    m68k     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/2f524f3db9db56f61501e58aeb67602c2da4ee88 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/5d4ca5f4bc3d6ea9abefa4bd021c3f4ed0d469de |     
  aarch64    |     qt5declarative-5.12.7      | NOK | http://autobuild.buildroot.net/results/5bb7da02d9dc1dbf8a45c14b8d6470fc4ae3eba9 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/63b8d84d75e2721908365d10524cb27c1470a360 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e2c794a232bab68e10eecf60a8ff65e03f863254 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5a36383ea7e84454abf7b0c62471f13e90f4f2cf |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/10fb26a8e5060384f9b79d35291327ce7671b601 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/655a8a87eefe06bfdc24a1491eb1c69d9e75cf5d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa3a4750ab1a5d915dc0c600d085be3b79e418b1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e1e73dc4d2bcbc3451a939774301cafffbcb1aa6 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/533f464a76d0f2a360aad780cd737ef5800b188a |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/7fbe48fc0e2584f5369932d52fbe3d0784779f98 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
                   glm-0.9.8.4 | 1 
      gst1-plugins-base-1.14.4 | 1 
           host-libselinux-2.8 | 1 
            host-thrift-0.12.0 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/f8675f0ea77a55fa777920f730b657ede8c3d6f8 | ORPH
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/8d7914f8d5800ebc8333101e4c820d66776fdfaf | ORPH
   sparc     |    gst1-plugins-base-1.14.4    | NOK | http://autobuild.buildroot.net/results/afab3e13b2d06a4f2e44e3c0c47165e38f8f1d74 |     
    i686     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/9d355aa3048984996b1c74178489a3cb3e387ff1 |     
    arm      |       host-thrift-0.12.0       | NOK | http://autobuild.buildroot.net/results/1cad2d093a81c0a2a2397676f1653a82c7351f0a | ORPH
  aarch64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/3e9399842ab1aab50d0e57c33494ac8e8fa366fa |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  gmpc-11.8.16 | 2 
              host-grpc-1.23.0 | 2 
             util-linux-2.35.1 | 2 
google-breakpad-7515ab13768... | 1 
           host-protobuf-3.9.1 | 1 
                    proj-6.2.0 | 1 
                 systemd-243.4 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/02e3e7ab13dae70351244e01ce5a854a9485f16c | ORPH
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/de72a8fb0bff4666200d188add079c8e1f318e7e | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f4c6c9bb33b13b7128baecd6bb900b3cbd9998c3 |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/7de65a9e3a94eae60c2597c325f16e1f6d1bf94c |     
  riscv64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/dae5c34ddb9d9aafd71d9a45feb1c561cf4b7637 |     
   sparc     |      host-protobuf-3.9.1       | NOK | http://autobuild.buildroot.net/results/e7e6420d646c21f55c7f227b0c1ccf17bec8e476 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/2d815fb08b6aa399a06dd5ec86c2ef1bd6258932 |     
 powerpc64   |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/2c7f4ff20e27065b32a3f8fa5eb5b24a4c7c95dd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/83d58217f256946141924d103d3de992d56aee81 |     
 powerpc64   |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/c4dc2a42155d83e0123f444b818857f881c2e269 |     
powerpc64le  |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/1b496db1ff5cc5a1478f9601025eff46c8e2fd4e |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f15c5ab9c378d5b879471a981781bc40a5a1cb50 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

gr-osmosdr-46698a67e7e06419... | 2 
                  cairo-1.16.0 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                host-go-1.13.8 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
             libopenssl-1.1.1d | 1 
                 opencv3-3.4.9 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/aa8952684d596ca3af72be00cc0c49299e2ba55e |     
microblazeel |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/33398d596a7aac02d20c1b4da63c1e9585b08e46 |     
  riscv64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/5060770a14b2d49b8ad339af47b7a46ab1a65eb2 |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/2cf1c658330e7a7cab02dd5d68711c2658959cdf |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/6c980ebd36cd277ae3e5252d32370e1b7497ed7b |     
  aarch64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/7414e494bf9d5f422e5f6ddc74b1c9e55a2828d6 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/13ad974089a7fc1111f88406c4aea200ab924a40 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4e067371d15694bddb7c8e13156161fb98cef9a1 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c29c25ded02245c02997beb9000f1bab92954a63 |     



-- 
http://autobuild.buildroot.net
