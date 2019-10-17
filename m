From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 06:17:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-16
Message-ID: <20191017061727.3A953884B5@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.05.x  | 13  |  1  |  0  | 14  |
  2019.08.x  | 17  |  2  |  0  | 19  |
    master   | 144 | 83  |  0  | 227 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 18
                    bird-2.0.6 | 11
                    brltty-6.0 | 9 
          host-libglib2-2.62.0 | 8 
                 libdrm-2.4.99 | 7 
                  cmocka-1.1.5 | 3 
               host-qemu-3.1.1 | 2 
                      icu-64-2 | 2 
             libopenh264-2.0.0 | 2 
             libopenssl-1.1.1d | 2 
           libwebsockets-3.2.0 | 2 
                 mesa3d-19.2.1 | 2 
                    bird-2.0.7 | 1 
                   dvblast-3.4 | 1 
                  ffmpeg-4.2.1 | 1 
                  flashrom-1.1 | 1 
       gst1-plugins-bad-1.16.1 | 1 
      gst1-plugins-good-1.16.1 | 1 
           host-harfbuzz-2.5.3 | 1 
               libsigsegv-2.12 | 1 
        ltp-testsuite-20190930 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
                  pango-1.44.6 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/be826e04f06a06871d2a4cc185615f1b3d7ede3c |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f5fcc2ed08056625bb239875982013fb43f20fbe |     
    m68k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/fe6b98bdc68b868307470fece714290ffb76a49c |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/304028ba6b02331f4928481405d6b824998e0a0c |     
   xtensa    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3ab072668d0f6b25b3351316ed4410cad5224a82 |     
powerpc64le  |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c70b467536cd50b95c196270b1773e33af603ff8 |     
 aarch64_be  |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/bc5a4257a52a148753836f46c9e3a053877e9176 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/70e072430cd9851851c0872ea1ab3f2fdb74b9a2 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/80afa9be46cb2f87f48338acb898e73e62330a8a |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/18f5d8d7f97e598818df4e508e5abef3048660f0 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3b2ec7c8ab6a551be5d949b16b7361d5d8ab6ec1 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/3e95ce8914a7ee4514b271e29c910f1ca69e16a0 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/073a214a6df9445941d3ab58530d798ecec92683 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/08c0d078face47bd0eb15b407cb7e56419ee545a |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fc80c56dfcea9c9e66fd32412c4779207496993b |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0a31536eac66bf5437f5844c5046a07ad37b540e |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bcd756289587a569eebc29b0ffe6069d89f7ba0e |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0e2f3eddc612590cc0a674fd07ec1d59785b9e87 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6d3ba83e96c257b8c334dc0b55072ab667a22d9f |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9e87de04e82d34d096cd54d581fc7dddd7d89176 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2caca254a4111a5e87c53250170c53eb6c45483a |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4e0f7e27b9c3226957fc66a5e65ff989ddb855bd |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/9ce9b65928214912717c17ee338d94eff94ca274 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/11949d67e74171646d81f6c1273c32cc3a651254 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/c58a49f6eb0eaf5615bf6ab542f19a360174cf35 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/02e458e66fd1ace53e7ff0d1cdedb85b30211d52 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/ce8521c66ceb6643e859975aa7ae4949f53e7b3a |     
    arm      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/e85d6d24a086f9743b1470f0c0110454f2690e32 |     
  riscv32    |    gst1-plugins-good-1.16.1    | NOK | http://autobuild.buildroot.net/results/efc1052807f94b1013cc8c13bdd790a01ed7255d |     
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/e85ee48dd401aa00c4484a40eae07271a2ce6f5d | ORPH
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e89c50d78adbebfd83fdcef32b861ffa610bb431 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9f7ffaa7f8e48415b1baa809f2ba0278421eea6c |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6c658d9bd3ec85406aca28f04075c140630946d8 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0e8e3e74604e639617033a1a8c91994fb7cd552a |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d18a507134d7baefa69ba21bcfff06ba2926d0d5 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9ecac25df94386f03d98bf6e2584084533dcbe7c |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f3de72a7330d932b2d9a0683685b2f5e73589b05 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6f0ce609b6c31d027e385179b36ce494c8cf417f |     
   x86_64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/85df2ac2b37ce7d2112ca5d768df6ff983ee23a1 | ORPH
  powerpc    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/eebb967bafddd6d18ecfb0f3a1814514e1c7ed13 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7748acd20d7c9af3ef47e3452cc10ff30cc3243a | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5ece7c97a1db4dcaf4332affd52f151bf97af295 | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c58d9b85adeeb29a825754efe023b059364ea9bd |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1c82dc81b84f8e2bfa26213c984c91f5daf590da |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3c07a3379b08761e439e27ec5faa180d8f7585bb |     
    arc      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/0956b71e1133f05f444881fef7f9eb6111e45fc8 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/40869add377095de94c52b01c53f93af15555bf8 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/908826749e5681249919b539fe07039ff2e3e0cd |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9db7a3b4e32abc3aacc4fd68033a53d62fbb7830 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/dccdcd503358fd28f41d6a90d94bab23d4439baf |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/1be5ad1d72990a1415ad7978c90439f7c91373cd |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/bea9b5574adbd19f2ffe504c71dd18e02687c3d1 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/c17f78d4eb019aa32bbd3f6751cbbe20625ddafe |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/73d201f1d0074f8ae4526285ef8a96677da562af |     
   sparc     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/65d0528b208c0a470264f7e2433be89425971dd7 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/44a6965d924c8c55dbea0fde78935202ecba1648 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/72819e44ad9e492e82e032885abe60dac099bc53 |     
 powerpc64   |         mesa3d-19.2.1          | NOK | http://autobuild.buildroot.net/results/9659c73843a7d008d364cd39b02a39f23c3ddd10 |     
    arm      |         mesa3d-19.2.1          | NOK | http://autobuild.buildroot.net/results/d7f92ba6d3621d3392bd2f7c22e6f5f702c6fb72 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/efc9d9da36af2bc43a2b897fc1f032d7853cf908 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/5179e8ce18aaddc6e1a92484e2f71f56c791c87d |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1fe6bdaca0a7ab3e0c5696ef53842e9dd3691981 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e93895ade31432aeafb371a3ef5af93bf0e15c4b |     
  mips64el   |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/5503fb1670bdd07d71c65b2eb2f333b9f0533ce5 | ORPH
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/83805a74b3d2a641f56ebedc32d39c09ea7a74c9 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/c124b407f1dc7d33c303846a734fcd45b2fcc2a2 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6962f99ea84d04863df250248f1da5966e009fde |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ab9d9cc744f93a28f89ad121200a8e8c0870937d |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/702ef1f9c7d1d1085f051bd43ea85ee1c7af19e6 |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0fc71a54a6cd4af27b0412ddac1b164534360f0f |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/540dc35c8ea4db86f979392dd603b75130d730bf |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/21b47b17e1b3392232bb074e094d52cf6cfcecca |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3438e45edaa6f00e4d0ce9d4e7be4fa740415d13 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ed4ae4b059972256fa98ad4713bfe842a3b46237 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/75ae24443dda365795a72cb980b75bbefcfaea18 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/006931281d136605d21a9fd8c4c6fa4715e2affd |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/23802baf8ce5ddf679c820e2a58800964dc891f9 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4330053e7d16434c4610934d0777d66a8a6a83b6 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2587d5085a53702599e54b6401eadb429d255785 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3b226cc921b0308f1f13552b1163fc7f6c08676f |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ab7075de63f8cf1cd7785c1421cb58f1206cd43c |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/424da027c62cdd7e23a36128a34dcdcb8707b782 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/ecdac6d2c6c2fa4d271a1ee7d93e6a0106dd0847 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/0fb85b7d709653941b68792fd45c5fd29bec3679 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/393134ca503b02bffdf7d48881c074815a00bd7c |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/27d566cd4dc8f4f91a50b1e640d328ea977c691a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.18.0 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/8f29f3a7195dc3a132dfad9aefc397aa83a5c4e1 |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/2da42e843c15789b10692177879778f42d97b91e |     



-- 
http://autobuild.buildroot.net
