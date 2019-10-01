From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Oct 2019 06:17:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-30
Message-ID: <20191001061720.61BD987C8C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 27  |  1  |  0  | 28  |
  2019.05.x  | 22  |  0  |  0  | 22  |
  2019.08.x  | 16  |  3  |  0  | 19  |
    master   | 155 | 96  |  0  | 251 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 20
                    bird-2.0.6 | 12
             subversion-1.9.12 | 11
                     znc-1.7.5 | 7 
                 mesa3d-19.2.0 | 4 
                      icu-64-2 | 3 
                   libva-2.5.0 | 3 
                    strace-5.2 | 3 
                 uclibc-1.0.31 | 3 
             libgphoto2-2.5.17 | 2 
                    mpv-0.29.1 | 2 
   openvmtools-10.3.5-10430147 | 2 
               qt5webkit-5.9.1 | 2 
                snort-2.9.14.1 | 2 
                  exempi-2.5.1 | 1 
                  ffmpeg-4.2.1 | 1 
                    flac-1.3.3 | 1 
              fstrcmp-0.7.D001 | 1 
google-breakpad-7515ab13768... | 1 
                   grpc-1.23.0 | 1 
                 haproxy-2.0.5 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
            host-mfgtools-0.02 | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
                 libidn2-2.2.0 | 1 
               libsigsegv-2.12 | 1 
                   lsof-4.93.2 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.14 | 1 
            qt5location-5.12.4 | 1 
                   systemd-241 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/76aa99a416f68504f91da291d99327c0dcdb7439 |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/45a77bd4ed17b230ddfe5f7d0ad586b89307ae6d |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/4be7381eba144e7c2bc77221402d1f3f4deff8a2 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a20db86f06c355cda0b4a45e5a5fca48d2836d40 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/6a06e9ec9988de01b56fa895c0c0d9926ed0ef7c |     
    i686     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ad49ff23038893759c2c6451d9547ff94e86ec99 |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ba2dc5960635206e1a8b7bde1d1484592208fce3 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/eb88fd62de4b33ca0b7c2555a86073a112cb47f1 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/9faeb3d202f80afc4aece862b2afb78aad30e0f3 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/05c039647ffb330d8e810c821457eb68f5659ce0 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ff079806baeb654a949fc4451aed704707c4b759 |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/763e6839a5a9123e1a6acf61f8b20ac0eef8497e |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2c6c64ddd53ce36fd2c206d3fa2bebef0861ac7a |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8ad0cfd99a7f7b18942c5deab9309e44970e33de |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c46cbdf4df8228e4d9c419cc41931dca1007c981 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5d13e12b21389352a83b559efda79fa14d874278 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d22973f42a6bde3955cd2e1c2b705821f281f3a5 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0f307b5dc824ce211bcd0c1a645150e28d8e3105 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d2769bc333b9d839161086a92c521c3d293a4e60 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cd2ed4438becb6edcb258d936751f6706b0de4fe |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fe39f7df18db2dd7a7a5d019e0c8c44969547098 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ebb10dbc46dc4f8a2c1c6de8043db39991f1f6a2 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/95f1c2d36b12f1176e306dfaa8c5bc480d6618b4 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/47c02e491f5a5e1b4b12386fc55c650ad9f56b11 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7a7cf652e75d846b826558478c5cd83f36ff7e33 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ec006f718314bdf2f462664fd2872bbcf2bfbaef |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f3a93bfd646955434166e107fcf9284b0e2a104b |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/29eb6ab70fbb7ce804f276641d10e18924c20bed |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ee7de8a464f2578428cec148415e8c9c84545632 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2c362c4839ca93ad51ebe599c55d02e7fe9361ca |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c0c5b97f2f48f110e89be37c896362d50dadd07 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4c337fe69dfcc038acedc9cde1a751b33ca1ffba |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/27f4d487ee42813699e63b3633aae7410838b8df |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/aeb5c440b26c8405b89c57e8a297d2c62a3fc11b |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/70d1e28cbb743f1572fabc2f0d93ec50f9e090be |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/0a963bc167af15a1b4bf293a9e568f34bffe8294 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6abbddfede9870afe37c627296a5aba29faf4756 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/55b54576f370521cc9400fa3f53d9f314a02ec21 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/0645f323c51ee4affa568e8747cc058a8dcb2c90 |     
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/963549f1f621e11933dc52af097572cfd099336d | ORPH
  mips64el   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/d4e5084d015e5ce75f5a5c860feabac2199d46d8 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/cfda2e3f5eb8f8686006cb887aca6c1defdb864a |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d5e4df413b4bfefd82a33283a9d2d39cac673a5b | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0289247716b24c12682bcb5787601d7073a42f20 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/35d46284557890c8489b11e10dab92738db49c78 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/33835dc4c66cc46dab2dea2629f4cec9ca6ed5dd |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a9f8a1716a70a40e4a355308840d04d79b0d52a8 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/cbd43c95db01ea7a5b00beee3d55295761a8b466 | ORPH
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/125498a0b197a34045195614f72f2b2009f5e218 | ORPH
   x86_64    |         libidn2-2.2.0          | NOK | http://autobuild.buildroot.net/results/3acc06a3ba11be844402c3b8d7115efe302d135b |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/4dd391bfd679439d050fcf1362cc50c7898ff4e0 |     
  mips64el   |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/31cd3f392c46cea7954b3d166c63999d26f514b4 |     
powerpc64le  |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/0e6b0cc11ca3a396b3782a50c6a01637b9f5ebf4 |     
    or1k     |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/ccb892053684dcf647a487fd6735fcdb90bd55b4 |     
    arc      |          lsof-4.93.2           | NOK | http://autobuild.buildroot.net/results/fc3ea2975205020b429de6f643da604c894b3db6 | ORPH
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/e4f24ba810377875fda14696e38828f1de85f83f |     
    i686     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/101618687ad55b89f67b1a9853bfd728c1519107 |     
  riscv32    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/a2c120193f5bace3a8bbcfa728dae7e290e15d6c |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/e29ecc3503de27271734408228345c7c3e4c1ed9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e1d307e28c6c1ac79fc3592b01e389866ab12c34 |     
   mipsel    |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/89376e6de9ac4d51c2ed8614d43110819355102b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c39bdfbda7de0bf0eba4890fb944f9138bb33941 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f5ae8d263044bfef6091e254599acec7841d7a1a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4f575ef42bbc4387a07e396205052b2da081c64d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/40c181a87a425ca80b956182e338e23435cb5988 |     
microblazeel |       qt5location-5.12.4       | NOK | http://autobuild.buildroot.net/results/a83bdd1f3bf309c07abebe871b017c331ed36e67 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3ab958a86bb4382dcd6cb54d10d110860bf964c0 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/93eca3a23fe7be1b171b9b92796ef847519373a7 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6beec6f2d1b97a6fa5ea70908095cb6578f20cff |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/10d27db15d8fff496f7a111c91f4f25e904bab17 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/f194dab7f6664d450116ddc03c6e0171a9a6f70b |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/47a136666293d3720c628984f30676109e3438f3 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/d8f874a365fb433ee64166236cf215dbd970917e |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/62d9e715bf71af1a82ab77860aebdf7d7a1a52ec |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/dc790035d53a7927ddb570b241f4b30bec3f405a |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6c688996bcbcc8e92b16cc22831e63285137f2f0 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d562c07d53687a78e2329074da3b7927bdbf8402 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4b9d720ce19020cc9e09a60810e61bbb576b913c |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ea4301f6133d043024deb38b5f576a846a55330e |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1d4d674ebb49ba86e25019cf32331b7430f0d878 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3213255e45d13e55fec18a1586e74cfe4b426c3a |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b2f9ea3b478e47f358fee86c26bac53ccdc00edc |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/acf994d6aeed877ae819d6654dd1118577dc3001 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f7a779baa9eb44c72f61db3e4ae2a32359b3f280 |     
    arm      |          systemd-241           | NOK | http://autobuild.buildroot.net/results/bc08388f733bdf80f7fab5e78efb07982284e539 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/ce9aac422ff7dad0b60de352b2b90f9ffc8cbea5 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/5094194e38d7d7c8b73eda1e0d57ffd5f28eb056 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/d62ba8400065e36934378bb727b249ce11fef616 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/fbff6b2664f4815b726dbc36a8bbdd7fd105c47b |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/6cb87567b613a4d19e1ff1ef0ff50be1ad047b56 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/331549cb7b1aca303b7f7bbe13ad0552a432d056 |     
  aarch64    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/3864e4e6972bfdb00deaac2c5ab058018ac686a0 |     
 powerpc64   |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/85d1bacbf99c791591f5bf6c451475e3518d6cb2 |     
   mipsel    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/543793cd3ae9547fe0bd53a146b0fcab4f4ed406 |     
   mipsel    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/e3f81b7771d58e0437551d0be7a4c0a704d34444 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/a80bff6216aee271a0a38c3701e3dbef0f57d681 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/5beef6c6b7115047a38d12c2d45e4c305da913e3 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0a8c317b03a80a014474b0db99f8975e7a50abe6 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/42233205022633b908a4a977a41368fed286afba |     
microblazeel |       qt5location-5.12.4       | NOK | http://autobuild.buildroot.net/results/d13d52d3d94f2fc1ffdc37a6d59ce0e9ba678504 |     



-- 
http://autobuild.buildroot.net
