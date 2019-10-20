From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 06:16:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-19
Message-ID: <20191020061646.143B986FF9@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 44  |  1  |  1  | 46  |
  2019.08.x  | 42  |  6  |  0  | 48  |
    master   | 65  | 492 |  1  | 558 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.62.0 | 290
                libselinux-2.9 | 80
               util-linux-2.34 | 29
                   dav1d-0.4.0 | 12
          host-util-linux-2.34 | 11
                    bird-2.0.7 | 8 
             libmpdclient-2.16 | 8 
                    brltty-6.0 | 7 
           host-libselinux-2.9 | 6 
              iputils-20190709 | 6 
                 jsoncpp-1.9.1 | 6 
                libdrm-2.4.100 | 6 
                  boost-1.71.0 | 3 
                       kmod-26 | 3 
             subversion-1.9.12 | 3 
        host-dbus-python-1.2.8 | 2 
                  libuv-1.33.0 | 2 
                   systemd-241 | 2 
                         clang | 1 
         docker-compose-1.20.1 | 1 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
                      icu-64-2 | 1 
               libinput-1.14.0 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
              micropython-1.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/dc34d1806b4fcbce7af099fc75d43e2e9c22db91 |     
 aarch64_be  |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5544c652d3070926279e00998c95df79096b7be2 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/d951f74c6e4ad3163b77bc88337dc6649f19145d |     
    mips     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/bbfbc8342bca08f6f89f102a800712ebcae6273f |     
    i586     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/140bbd487dfb9d9e1488bb49ddb8115a9554fb4e |     
   xtensa    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/051c46e8ee478f7c93e4ac8d5793a9a6b585d560 |     
  nds32le    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/a2441aeb9096bfa8d5afea08b6cfa9a4f5ec69e3 |     
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/4b0ee7a1bd3cb6c032954ae32291e32de49fbd28 |     
    or1k     |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/6279ac6c329012c3dbf68677e7619df219d14a82 |     
    arc      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/c0baed5fa5410e53ec33b23ba4215aa28824c15d |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/0ff9b27b41b35e9392739cfebc508aec812dbda6 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/da267ae804cf115218d231eb3ddb288b304de5b5 |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d163a79d2daf7ff5fcba3f0c54cb9f7ee6b55103 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dec045eaa1b8b4f4b2f6f7af8ead5af51bedec64 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5a5e87c6021a2151201eb3cf4262fe924bef89aa |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/235fd90b82b2463a3150bde0104bb9ac23daa9a6 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bf822ba0c9298d6724b31c65e631be7c82e0fb4d |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b1c86558523b06b8ba98d9c865ab076aae606d6f |     
  aarch64    |             clang              | TIM | http://autobuild.buildroot.net/results/d5a68c4e00d1d6c43d81ea59830e8cda5e185ebd |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/5d1ec4faaf10fa95fbebc0f610039498a689bda2 |     
    arc      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/858885c0cc84b2a8b2e1bcc7fb1c124760b9f5a6 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/626a1a2c729cde5d52b99215c4bc5495d6683865 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/520feec8330f555e0ef5175827f121ffc3af8782 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/ed0082d5a2bcdd4d72fba6d0ec087b57fb22b415 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/59473b5b4f4f60a8887a02bf366727d897ac2178 |     
  riscv32    |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/50a934fe532c76804bdd35e1ae85aa607d1d59f9 |     
  powerpc    |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/fc2c33edc41de7b6eabcafabf98f4a528221307f |     
 powerpc64   |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/279637eb8db376012b10cea0a63776af4c218ae5 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/66117483123f7b5a9470ca5a3cca6452b3a8d074 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/63be6b7bc6c2c50ef733929afa67181cc9a3ad85 |     
  sparc64    |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/1d32cc5fdb2de9ebf1b5bc2b75e248b3acfe5584 |     
   nios2     |     docker-compose-1.20.1      | NOK | http://autobuild.buildroot.net/results/fff69e57a38a896f5f64366b80d81db6bcb1b24b |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/74b697e54e23f14d44b92e7937a5a62031a0a018 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/fc42de788df32e8f8b60b8c51819cb0e39b8c93f |     
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/69adf2b92b2d902292fd93904d8158669dd631e9 | ORPH
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/1ea488465f16176195dc20624329c6619433d896 | ORPH
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1210caeebc93d3e0dc8be551c72719e8921523e5 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6456ec4807a257d081a469f5f5943af8844e75e9 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d9649d028bdf4ff8635d5ac4d1d6da93d1d78c14 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ee760fde436753f558df98e4860e03f1349f6668 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eff6487c3ec7916aa8f5066a151649c81f5ec797 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5c15bf1f060d5d52c4da73fa780f19ff39ce1577 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/019b0084353e49e9aa24e68da7f14b2f76c43ff0 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/41578d956bed24eeb95f113ec9852d5bb43e87fb |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0baf681b135adee587e4e583cc79c643ba74ac5c |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/33171b40bcb4feee40ab0dd6c7975f76dae261c1 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ac21c2f6753926abd55aefc817fefb5528a5eb15 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/76c80149f8a7fc1d54c48abd4bf894dbc5dd1a81 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e6f3c770f58c1fe4deea93ad3abd7d65057d5dfa |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/97bca53b4077f7100ae45d5fec80c2dee2011487 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/25afa6b25dcba4b4a8ba6e1d68dfa5ee51440a32 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ac9ebcb6d8fffe01e0ccc93948b095954ed89e71 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7f7afcfab2352fca9262627938bf542e89597e69 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/48e6855c6cd6a53c7b089b766607f5d6fc5de1fe |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6f55797b22849f2caa397cfd3dbd1c1b08cee0a6 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6907b2c42a77a648d8a1be719cbbbc2e5daad3c1 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3284d56a60711ece1fe1e3d240d8b8aeaaa9b992 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4834eb04e3e1610bde205b97353497d88115a3d0 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f14ba54aa7448371f61f4d225c5bc8ec680ea80b |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e7c1dea0bdb6e5e4a27d9355eb9f1da051c06004 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9bf27f5a7d60e34e8d8e879c30cff3a311a3d81a |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e725b7f120601b35851482bb2869fca696a07d7e |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/23dc1fc39474d3d5b45f1da295d589ea5ed981a1 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/25d841e968b4484f53fbb1c609dd14d9e7196903 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/167250a1213e8eaafa99a5c20bb41814b0c5524a |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f7cf37ba6b1ec1ada1762eb839768dde699a94cd |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1f9654a08eced750f99e6275feac5c79474303fd |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8f423f9667d0f9c18948c45027a01e1e367ec6d6 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fcc63769fbd6cbee257903a44baefca39554f4fa |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6a1ac4e5a7a2a5e4e1c06fd12e25b54f91a0d1e6 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/36d7a5e5b571962e97cfa5830e4f0b865b24b6e3 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e314a990dd77b29878c4d9e8121a9612310c0280 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d227437697d36e5c6d5d0edd3150dfd3502786d6 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5b1bbac1888873f378d7726195bc600a66ed4e6d |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/07d475a247f7b35fd8d12ac3967ef68aef04ce70 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0de816f9ec3076f27c9ab4e5df0019824f5c71bd |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6bc39474ec37d43ae600c2bd20a82fd22b274c59 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/27b45de50b83e00bb6f01e05a0ab753595140cc7 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f39ac53f588296b4edcb55a588822837bdba60ba |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0c0876af043a7f5562fd124fba91c612196ce7a2 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5171c9d747eae1d6ae54cfbd4e89a9da319e310e |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2b07416404df942f2e86e7e46c00756c5a4d0f6c |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fbd114ccad1e36728f248a6986031e95e485f189 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dc4002dcb9d98092179879d4a7b1adfcca065b9a |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/47ba1e601af4d18827792b9dea8f1625abf77399 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/73949be1169a90dc8b49aef8dd65f9cd1d91c8ba |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/24f3a17b6d37048899f165bef9abbe398c258eab |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/656ea65774df888cc686a116053f12aabe4553b3 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8a22d757bc2e9cacd576c7cfd76161f34922dc95 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7688f8c18071b4627e20d3e73adfe668d3ade744 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ca8b37bb2a2f2361fb272137143c893d8051a37d |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3502ee3252e76aee6b9a4113deecb0c03c0e432c |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/704ffb4ab3d0d79e142354c14b5fe58366bdca8a |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4c946490afe09664462acf95eb04e6506f671e21 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e133d7540b98b781a185950c8d5e205d6f62e18a |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bf7dca1276cfbb051cceb14805c2f36132830587 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7d64916d39d073f929a1a9f041fead3e710176ea |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9180d38fac8199bbdab450bdd5c94f35ba34a601 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bbc955bdbf3eb27490cb904c37f2eb1a3014c05f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/630251fcd81139af42168121410d87c0569d4f97 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2528091d775cb91c0846b47cade5a56634c81886 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0595363d1a723c796fdaa0809cf44fb9878a2c1f |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e2d11d6a839c1375debd4c4af8fab353f97ac5d2 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d038b4fa46e5696ed9efe3bef67b6e05f7aa1ecb |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/db6f52859359635bc0af50bc976c0981dc2c2c3d |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0b443c99301929d8bf7deeb2c89c0a786ba5e3fe |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8953bae820d27dbc0737f184331dd89d4907f1ff |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19dcb6e451ca8d0fa844d446e6e79467338b3371 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d5598e6d061dd7903ffad0a14d446d4e3d94ccdf |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/83dd5dc65159b58b12f488b3c30db24ce6bcb19f |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/246e0ea1763380ed9a2cbfaff547c5d3e96d8eb7 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ac740378ca454cd6bf2dc178d82c9b5f31bc613c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4a9afe18709be240ee8de1271b47e93fff1298e7 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ba3cd21d7ce5a949c4808f85f7a7d2ae7d1ffe20 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/852e896a1512d8d0180dac3ecb3da7d939e68114 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/15c53a9e7fd8fb49a383b65b5851396425445859 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a6f58510df3fce977834dd603465a729df49631e |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/33931f662be222c21148fa3282a6127d319e04cc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/138074cf1981d3f75561233b75e0f8f47c4eae61 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2c0c4c5fa04e39041d0968ea21528b0b8e96cf2d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fbd1b8e8aea9168acd0cc2537a9e54d5ae02e00c |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/676cb7dec62fd302eb215d0f97e8c407ecb3d79e |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1e51866678d4df5f7be5889506d6acad1e9afa48 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4cc41d684b5f14d2cfd118b7819931065902c11a |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ba18db972c1d937a63bf04f09c356b99be350a0d |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4e06c0c71d46e3cd2e7a0cbb0cc7cbb1dafa49c8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bf3e0c48988e32e0a61d93252a4a51ff108b2192 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/69c9bb0586de904eca1253ff8542545c55a51083 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/aab03b5cac242da57451396ea28bd7c7ac34291d |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/67f7afccb3e5855a4394e4cac1f0f4b3b9bd900a |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/531ca2c7ca45c8cdf9926bac945b9e0e0a7568f2 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6a36028a05297e8becaff1814d48ad0dff769862 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/36cbb9b89a796faaec836fcf8e06f6eab147a59f |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/28fa3a9d37a6882945fc16318486e3c1d9421c63 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b3cccbf5b5794896b9fe325bfc572fe3b2690a91 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1b269e8c61015ab05283e45885a144f60d3270dd |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/92c2729ab4585bba2ddca9b511b5142664725429 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1cd8746dd8152ec5dce67049aaae5fd60247101d |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ee1dd93d9b7a5bdb5fc49cc77599da254f001253 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1e8fd801a54aa154b3b523389a24b94f6ba91a6b |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9ffaedbb629b83afe2de5487cb21faee743b5c4d |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/734512929812f89bba01650afb3e9956251a83bc |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c164671db9121e901a0be3b13108acfca5748005 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a8487398a677581ee4d5fe2e6baa7494b2d378ea |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4b3099f7464d5e11879a0486ed05731d7c18612d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9c2121e5ea89395aec60a567635b4d12ecf6323f |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5cfadb715e4cac6af893f9348920f9a0dbb8f4c5 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e99c4033fe6d258940d1950f110e0df1a73ac11a |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8fe97135ce9dc3bf135f09bf75adf7fec746439b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/360fabb905a8c9951b1d2629890b3158c9280b7b |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/efb132a443afc8702e5dbcaf2bb55cd526e887e9 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4edf8b7f52c8dd9db2b1fec622400111aac8faf1 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d39e0b7f1a79917dca6299fe90af76cc957b03e7 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/73dc9c926441b2a0070a6282927d49875b0b704b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a94974d87025b8aa9034fa7f592dc3752af0da24 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a11783233c466fd85612fc85e9b36207e4043528 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6b3a7bab33900b117b792d11b6b308e5515b4e0f |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/590b8d2261d0d954578b240434941ec2fb557510 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/158377f17cb4914fda39f4fd82e2a07312b5bcd2 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e6f7dd6fd02c9bf779ba3c0d2854c51753e195c6 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0890c93b204571577e017ff5fe201433bf204b86 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5cc1bc3befc42da200fa434bca7c3e895f068835 |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0e8514b7cf7987656dca9f9797d58b3e46244109 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bb97b034281629b1f63bd8dcd52e0ee6b4c32c67 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7fed4af7fdc04b4c2cd4be734971665efc7bf22b |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/483b2d7fa2d7052a8255c4a3302dde08f22ef892 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/54c6af0b1c6f64be6448b024e6f1c0b05d11f90c |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/94ccbbadfca714e71ece03d76b59227a340bc53b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7a136f7f22837216d06164e69f92b7c36d31e51c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e1cfa678ac535c3d00c8b496b58196e348a57eb7 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6b7589a0f8c87add63da7023f64068c0f1c3f652 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a15c48e9cfee716e7dba39812808eeda0de36c93 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9f83ed93fcf194774e2d2bff59db6d7788053c58 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/408a88c493075d3aa8fe250799ad3eb1373b1174 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a9f067280859714a1912f5ceeec0b7c8bd9672f6 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e62ae87248679933380adf7ada7b28f1cfce52bd |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a4283a51ef031d62a541093055743c82a585220e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a91341469046313c10e5362be1dd2777ddff4d57 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f404fd98c0e5a6e2320c78fa6da421a35df017a0 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1f6aa6ef9284d4e7f560872dd76bcdbf4f44fcbd |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2fcb4a7bde6961f962b9bad9bf42b5062266e4e0 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6544338c64d578ea609981e6f66e6d8fecfa1153 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4a99204e8307df3bb2da6eeaf3b342269564d00d |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d9e5fece7a088dfee14d6b503abec1ce878b12eb |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9e496c54d05bae338ce0394643992865efa7af9c |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d73e9ca9ea5155526f0854a9a608fb349d2d6408 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eba192e9d19dd20b92ce411ac95b1befce9ff18e |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7cf55ee8a3e2bd08048a46b69711cd245b7cb20f |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ff11f6a4a14d33b537d42b3c87ee57e5c0995e47 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f31bf1a9363b8e8ae4f5199388b61dd5a6816718 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0c9cf415bf41bddda49b96400a392d6108a88180 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/deee7c83cf57d0b5dbb60e8449c387b3c74d97a7 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0be4a80559f5c26aabc967e1e7e31ec1f46149b7 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3510ed13935c401455bbc260b3daa3ed22fbdda1 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e446554afc1d4c504419993d2a37dffd6489beae |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/79e80786819d4f87b98f99d5c1a54b0e06d6fc55 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/738efd58052d7708e98c709ed4dd35bf09b6f56b |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e059e9b75365e9534ed827052074211a5b48841b |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3366deba4747cab33c64902b832ae3f98cf0b79e |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c79cc9bed8ba484c878c0a72d5257282f9720918 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8bca2db8ad7dbad9074b920159f7a9188205acbd |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4c1aefd897b9cb81f326c3dcfa729210c524a53d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e49e25094aa0bbf733d64be728618b53da42d267 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/248ece01dc2720d9cdc6ac62302678b317d0d71c |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c2a677ead7ed1cd4f45e3aa0df2f0e3edcc4a87e |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7d46ac8f040be4fbd95f523a774443e9638f9e4a |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2bb023132471651d3c34a06e26dcbfe67c8ffe48 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7010580ccd093b553375e037be453dd76062da16 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/38ac41956b8c3dc860b9011b1c8f31a78dca4849 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d3fe679cd799a449f741c22a3e4dbc4e6559f693 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/550a1548c2b2814fa4667460dfc5159f04c5bceb |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c486ab0aec5610f07388abc2add4982d1364bd56 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4d3a946023e56102643558eb1fd9a78e05b5f83d |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2aa0f0bb2bda8aa3cc30fd99542baaab7b90bb2a |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19b479052cf6894de5ad5c0bd38b128c10889b95 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/605917aa2c7efee417070b61a177a47223540645 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7f196984289ae6e68a01c01000c59afee380083f |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/015502849032cd0f1b494afff5e58193a0cb4f4d |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f25c4c55a05f7fe207cb4e1e7e70fbf3ac85ae19 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/961060391e34d95c1fec9d4b3c4db065662c50ec |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cf041c2122c8dfa69ca214a8896e68ea4539d1b3 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8c4d1ff3cf118a5742630b70c75ab3ded096198c |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a175afbc1ad51f2f9842acfc2759e1e2c64d3655 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c0344a1f251fdba5d00b10888db7ee01cfe89a3c |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6dc47d76b6d6b6db837db01c4d1fc8c257b4773a |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6847cd39b7a28046676ac885f2ee59b593573394 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/61d1a47da1423b66d0ef4359a5f2ffa03017b89e |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/714aff9e551c2b374be33f819c39d8aee35c7f7e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/234e9f1df963ba0a911babd5dc0d4d4ecbc91d33 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/17dff203a7d95c3b5e9d02e7effd3a44a676bfaa |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e6bc165f97cf49c0ac83f05d1728b042d28d06de |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6fd4c67211a41d9b488eeead58efac2ad7363fae |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c32c83015a31718a8885bdf3559d6dee83c61007 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19789d2cca462ceb860d277556f84a06f48ad114 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c30cc54696813e54a445ba28490d26b4a7dc0f7d |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/62657ce1aaf454334cd1add497599f0932033f6d |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/69c8edb5dc02a5b781fbb96b523f8ef135a0f2b3 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9ba927e54f6b4d0ee1b7f7e9e22885f21f5d8c66 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/acc752049c4f5fb2a1181eb02ef0eccdb904e3b6 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/94ddc7e6c2f2e81e01ed04673066a972300e97f3 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f44d4cf91f23d84b3c26b2559fa6af494ffbc692 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bea9af8857f1d67105707b95a26daa832ded31aa |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7b1940eca36dfca70b20fd9e475f31fddb15676f |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cad4f9d6e39cb2a18b0b12d5e0bd10d71aeeee70 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/16604f1bec86a92dd5f7953930e5e47cefbda24e |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/368ef7ae160e755982befe22be95d14b787135c4 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2aa7ad8c0dba0acb9c9b72217f04d25958aabcba |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b6e7448dadd2b61cf3b32e56d9c0bf0f60c523ad |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/259fb4ed6a4bc01907af2b1e32a371e0571883ea |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d8d71ea59c41a300267bbc44b167956535e305a0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2c7731f473676593ffd2d143bf723f2b656b9568 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b2ad60e5e83aab79a866e19a62c851b634d44bba |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f561c9f0a92fe8e9508e7352bed3a1cccefd82f1 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/148f41e3644cf52759c949e98d9bd84f372a88e6 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6dad10fc08adfc40e5a5c4274ca4246f70445afd |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c3d906d181d64e6a740b523adf583d676cc24c2e |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d8453e089ac0b9b8483c52c9a8378e8ce191cf07 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/49d89e419edc34ec77129d748ac573f89dfddbae |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1ba21e6db981f11e44f8208842efe2f1abda4a3b |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2072a5d12541146467eef84d049e66812aca9f28 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e4c426ac91e2d6a34c309778db232f60343c1b86 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2013fcb0567f9b6c35a48d55ecbac37adb3667cb |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5bfe348b6a627c5cb1d6ab72e8b46f5dd8e258fb |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/88173f1208675728a6d2d5edcba0d3eece9d0e79 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e7422797635d0be32b14c9acf68729fe5d8d411d |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e57ecb2a58cde6c35ac099bb48a1dd6ed1cecd79 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d4c6e3c2749b9dddf7d8b50c3ebf3015accd4152 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1b7fb9072661fbeeb63a18283b1fda8fd1d1cdbc |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/74cbd9a1ac5714cc2df4e08e5d37c5cd7d970504 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/457c47f04f2319fa5f3e71649b27ad4f956799b1 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/78c4759ea1dd19508162ac30ca925898270463ed |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b64924f7c0f374a0e219849ab2e41a1cb1946d36 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/036cc5e0e1397c55652bff4a70996d600793867b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e761f614470b5167f3a321ad496ad363d0c42b80 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/da3e52a91ecbb65db51c8ef85b898bf795f0240b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4ad025d66528388ea36d5484f543ffc876c8396d |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fdc464e6e4d32815e93746f0e675674e249d9f98 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bb433b8c8efb8bcc851918a87e65284d0193c077 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/180639e28720961dd3cecf38fcc32e62bad2bac1 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/59f9d836698cbfc2ab24c6f08710f4863c4b8885 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dd9bfcb1bb9f45da0c1954a5e8185dfefa4b875b |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a7aea5c58996740ad2232b04f541029f82736b37 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f41e929f03f58763926718a05424230ed1e1edc9 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1dc6564879664dc82ff83d63aa16a9bff0219ab8 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9202e7323d1705a7d01a7f6186553620c3ebcac7 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e853baf09e5f6e6f3a33dfc8557c4cf4a52a6a42 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dca267ac6fc7711ccfa4ea38f6b1c4834e483ab9 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0e270b742e8d8aa7b80d37caceb7dc56e0a0d179 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e3751892d5e970d7fe25f90874741f7d2dfe9517 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3d63d21ab23fca90ab19cc296635655367f39be7 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/17e02c7edcb9662483dd65b197d9c6c253a7b01e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/153f49c9b14c6e62788986d7942160d2c4e2d33b |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1a7120103cea6d4db67721bb6f03be21202cba3f |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/57be87ceaed506c1fe510d7794acdd947398c750 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4ac34e7d2aee6d92dca4f40c25b73e10e7ffa1d2 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/20d8ed109bdcf63babc6dd1ccaf2ab6b3da777a8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/99755c0cb91b27fa9e7a5fba2231558055106d11 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0a48518ed1227dcfcd004135e7b82a23e2dc30db |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5542f7213c97be6f4953991902fecc942319c265 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7bddbe77f85966477c096824f960084192b0f498 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f4deaaed0a1a5303c0577c0b08d7d93c480ce9be |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/95c791f1b797276444dcff702be506f7343e7282 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2fecaab803b6e978a9f0f8d4be74a4c06ab8b8a5 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2e4aa0ccf3373173f038c1e3396ba11bfe1b1526 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b113708b37859140412c06243d57d17cf08226d2 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5b239ac8cb1470238c894086c3f677146cc183e5 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2610d827c4343429e781bcfd6940d53d083dd86f |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/032c0b2839de50880076f85ea68da7625557fbc8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5b0a776a8237c08ddc9632963d8fbb7716b5c9aa |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ee0247c16201361eda48fbcd43a7e67146cad83d |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0e0b4799b4ad03bb1e9a9f7f76928623cc37c65e |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2ee9279b8b876729f8421c4c963c6c05dc11e537 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3ac67b91f174a5d0ac44247f52309f6e142602e8 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a362259f0d43b83f2a766df3cd071152f453318f |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/28c29439dea0daab48c954140939c3bffc430ec3 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0130dcc1b87b237632dbe09e143674f582696a50 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/675b3f524239254a640f6ea8e5e3e8c91f86a187 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ecb8ddf5eae3a95bc031d394a87054a99e534361 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9c8b28201eb8038ae03024b750a8ae3b037ba4ca |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cbb25d7d0088ebe655d928d2933d416004dd4bb9 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8f6503da070e400310fc8d3a6c048560fefac89d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d12538c994f2ea06484bd3ef205cd4fe9df94de3 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c737e9a3af18dcd321f9118bca5d287bf25bb534 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/50269347d4a3c8c2945178d7ca488eb2bb90f53c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b21214eacafc82658a575054d2751ba3ad53675a |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f1cf28e354310f4ce5d4578970127af853cbda78 |     
   mipsel    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/e58050f1b33c80f9c5718045fb9c72d502c2447c |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/c52d2d8e6c82915c83eed1390b805c07598b4fac |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/abd833f13d68005932716f8f65ccab58ee0a7478 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/7052ca51ae334d3fac0688fdb9334e0d9ef1f2a6 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/5b0eedbb11de1e4d3d54591f32cf2a654bf38510 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/d2f733e486853ce8afdd3274ed7fdc3725b87621 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/c7e0e35b616dbc83b1ad2be34478e68e03eed4d5 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/d46451a42d9187169d19f613ecd5cdd0808ac8cb |     
   mipsel    |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/f1572bf31fbd76fdb57de343fddc289e29337e8e |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/2e53477bffd48e783a0392ef3fb47e5c408aabd0 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/4bc1312588e685ac2fe115bb0c4cda96dab0a32f |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/ca1d5b9c27526d3fc81af3deeb4e4326adfbb845 |     
    m68k     |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/abbc1247f0e167cd48d263a92b7b2c0e1aa30e93 |     
microblazeel |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/02fb333b3d108b1f30c359ae29a330972c15054c |     
  riscv64    |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/33c0e397d9ceb43c32e56a039244e833325edaf4 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/1b416646a16af729069b1423c1f76b2b37784d91 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/c294dbae8456ae5f1b2a6b04093912840a043ded |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9ac343b80895645a63ae1681ff731784e9b4b306 | ORPH
   x86_64    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/a2b3a55977904000df8ca0e75782b27d093f5ff1 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/d1ef6ba6a159a79563f720962e2f88ccb07c5be2 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/4f1b8f73d7f456604b9799dc589044f605063388 |     
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/4575e99a4577ddb819d9bf8ab35ad245f7f587ba |     
  powerpc    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/7bcd9c9c0d1cc4dcd43210364e7e706641e134a1 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/e31f4ec96178977a8f80d896a6366014b934588a |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/390605c3b331106ef8e6925d3013db9420b92be4 |     
    m68k     |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/5d48847ae8d62cc0b24356f9267bd4693274eb9c |     
    i586     |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/f1b8abc393a3a6f7ad38c60c6ce730805543aa30 |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/72584e9aee86677624f588f64e03d9102333f7b7 |     
  riscv32    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/ae3fbfb2a0965652cce141f5570159fa2671ca91 |     
   x86_64    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/62939151c4c31f437b1d3b2528752373bcf9d9e7 |     
   mipsel    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/71bf937339705a520e047d12c146229ec42a76f2 |     
    arc      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/811bad243484157dee7a889775f4be792e918075 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/f974ecefff5d000ebe3134f62428ac62945830b2 |     
  aarch64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/20f3455b21ae333d5842c427103fcec306b7f56e |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/58a10c8d0cad334b4c47c609e2251fd690f97b4c |     
   nios2     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/35b9d4fc92f5b26575725e4e1eff8340c0531706 |     
  powerpc    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2d2ecc943e5c6628de0c9950ce190e7408270db5 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/76426f2673e7ebf83677a1c15c86c5bea22accc5 |     
microblazeel |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/cd6207b0d91fb8948963d1089eece466366f154f |     
    arm      |        libinput-1.14.0         | NOK | http://autobuild.buildroot.net/results/2a0f026cb2255dfcdaa5a3da0de3d09e9fe16848 |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/ba6aaab99415b7a0fa4812581ead02322da156b1 |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/7803e7199f80a08166142ba424c5e54f76b4a13a |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/73cbb373acce7ce334f4bb7fb009f66ffaaba74d |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/b01402806c599c932271ee2678f5aa153fc82bef |     
microblazeel |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/1ed8bdb8f64b5a1765bdb632f86d00df742a7dbe |     
microblazeel |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/f35879765bad57bb3da57adf4699b1ee4261b419 |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/1f8be3687dd99de659c3a6f6ae7e01c3081b4238 |     
    m68k     |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/5de8c258daa60950c94fc629d7e2a4fc19979fb9 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/b84655f7dbb517c91bc1ad951985f34f8ee203ab |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/48f04b170e54861478b7ccc7d463899b3e36fb54 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2cc7650c68767dc0a59694d9a7cda4dd17ddbcaf |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9d735c303cca041eaea6ad149045dca4689c449d |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bfa2b4c50d466bf1831fafa74f0655a8c058e5ab |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/45a3142d167ae22b144e8c6beb0b15649a83e11d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/98bbd0abe09cb26dd8abfe78336bfd2039f2c6ed |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/631c5806095fbaeb407a1d4cf55a36516b1753eb |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/571f449692279c61cbfb936d6ec71c8ee73087cc |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/19220fa446f0380c265ed931b5e9f15876b08e9f |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/50c1a83604ed00fe0393397d72c8d826ad8a467a |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0badcdbc2b6a36fd473f7865d08e98dc67096289 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0384bf99bbeedb3cfdbb4d5d0a16a50f349f68af |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3c7e53da8e91b44e9e0db395a8858044e80c9f0a |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2080a342ee3b30c62d27adc13a30f867c5989d76 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/98dae6b1c3da72194973d5bb4c49a77b549b2630 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8a8b3d12f34f9143942010ba982878b6d8c51d48 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/43a79cdfb9f88f531231c4763103b954a1afa6af |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9bf51f53823618d50f56d7ffea68b213e357c88b |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d30515a774be28f3d083665ac95026f3c7001235 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/83f7075ce748c0f34a7ef2b97f23524af0d2b3f9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a11d750f93b20e304072c282200af70a20a1322b |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b2a350caa6e5970c68f0602cd3018cc6c45ddb35 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4babaedb770ede463413530c670633393567267a |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b424e85316b9b2f00da2a4fc828e80c61c35662e |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/839e81c5b968c47842b4d0c25b902397af8ea5a5 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2fb1e8a2b17a936f4014e81e5f0a18a997b599a7 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d8a99b7bdae7ebb8284f814e3c14ad0da4822e26 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/586f545d83dd8a1eca88d32f09ea98c701efdaeb |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5432b82768eda4a3c7fe5575c53ac9fb64405715 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe55b55cade16627848251545cb2990d444299e8 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fbe8441fe2a528eb0234e6828c0e604a021d3c79 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/23a53bdf26bf1029a35ef9ea48cc781a8134fd6d |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0877384eb5657c20654397166357c80bb1d40510 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cbbedc1879e75ad0da0e527251c00e672a244933 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ac9290f0a50a402c082465ca29a11d2b9de08973 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9f140e82dfe36532a709389a8ee4833e5fa061e2 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f961a6fa7eb4b637a6c8988635014a16023e421b |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a6bd1c946f43c400e88d95ed8e5e02bddb01aa26 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/eb82efd2ce8fb8536425bbc53d2c86ea5b61f1d4 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5beb224b46035043374b6aba0a659469465f97d9 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0635a15a63733431463288daf2fc4c5a84b807af |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/81c880948d992a578de0441525ef878c9785bb3b |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d1ce0d968316097e517ad0cd59b91f93d99b19ee |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3198935fe950947bbaf4a5a7a6a10979088df375 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8708f28f179b9ddc5e5502bf555483c76255776d |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/837a8291b60de550e40928019d4312ad3c885af2 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/92c7e0df7247caf4bf44b47088aca98566c289dc |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6ad801fd8dfa328909243407dd672d8c2518c86f |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e7bf09238042ee15d11a5e4941ebad7a9ff0a053 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a3324c7fc4a9a80ba3e40f77d5fa8e600b891cb3 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e882c5a1ab4a7ad26e8c8c1ababed096873bfd86 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2213ed36cfcb47bc8466aa2bb12dc3533f69677b |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b057540ac239ed06dfca09562c0c0aa4ad7e0d30 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/05e858ab19509842172ed0bb2b7e8819b23add88 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bd076aa043ee0ee4623ff5723b938879a864e4b0 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/550286f4921b08eeabfff23c8a5a2621c6ed962c |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a3729f130a419021e761fee26084db592d20c044 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bfb6fc56921db930f650f1a33242134bdafa85c4 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ecfd27679a76d75b547a7badfa78e76ebb5cd33a |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8168f258e20a48c38a96053a081c1a62002034f7 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/161d34eb65ecb9e119b5bca3f9e989f30e5f14bb |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9d4fa76c0284172ed8f416733395deb5477c2da1 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e6641408337ca0c34e368557756cc3839a0f9f5 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0eb9da2299cfbf9c49a1710d2bd8195de88a81b4 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/49ab4fd74b7ffd512d897f63f81f967d6e565455 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c3570ee91a6217b06bd6d3660d1e5292812c6525 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe50ea8c06dcd553130cd0bd01b18cc359c3b252 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9501d1f08f49807949d0e11ef07f7dcdcb4931ac |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3fee7015873b4b869ec8b07b9579fb5eb11130bf |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b7b77a683924d5c092678f360d6edde9b94536d8 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d3d3e160ff1ad5e7fb2444d3388e3791f8312317 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2f188e3350fae3e1f00c547865d8484ab1e4ebac |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/23c40748147fbf7c1d63bb3431067ed2aa1e6515 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/87286941d921e846a77924eb175b6964cbf85d89 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e166e14e1be8381869717f6efc5f7c426346ef32 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/322ac2c3b78a1a8f2230934e1e815801268defbe |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c87cd8f171d0199273dcab15c1ce0e55506dba3c |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/36c1fef0aff6d85ad60c6ee3020e6fcf2d2d797f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/74d69479b9f953342c6a662c70e21c6668c4b26f |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8749c7aeb154e605ea3b3caf4f86f2d6a0c501ce |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/a7841afb6431273d8045adf49d4581870ea796ed |     
  riscv64    |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/017ce1062a61b25f949c0b8c4b73cac128037901 |     
  nds32le    |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/9ec645f513ff77e70eea925fad3244775f709d2b |     
  powerpc    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/b85b2214576030026a8e04d142a77a2648379417 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d0d8be76e7403b121785cb4299b3ef3826ea9079 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/709709593ddee3bf36f7ff618494b54bcdf8bc53 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/de61cb4d12b3efa02e6069ddcb4653de50f5e1ec |     
    arm      |          systemd-241           | NOK | http://autobuild.buildroot.net/results/dc8785356f2e2390d33bde21fcca5bf16c4ecc29 |     
   mipsel    |          systemd-241           | NOK | http://autobuild.buildroot.net/results/9eddd1e3b5db2f401fa0e94d5e2d427463a7fed5 |     
  aarch64    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/94d95ac50effcb86fd56edc2e1d92c6a0eb3ad01 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/d4603a63848f99006451c6e08a54de44fe9aa8b7 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/68c8181483dece28e236e5133b4fe736cf937551 |     
  riscv64    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/925ed19569cd8fc5721b72b44374eb22d2e564ff |     
  mips64el   |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/440af09b1ea01a0897d16b4297fdb85b13d648ca |     
    or1k     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/f75c20ee8e0bdd19467dda4d9215a8b57fc002ae |     
   mipsel    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/56c0929d868af0d8592fd4b64db27838149677c1 |     
   mipsel    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/035b10dea96e836e0c9cf704f307e38e04e62a80 |     
   x86_64    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/e4ea285af2b2376f52fb3291c0e8bef043fa8597 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/9c7dcdb5cb58e29c93a4721543abb045eddc3f8f |     
    i686     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/16bb6e0bb1ad783e6e6fa967a293262c5f5f5642 |     
  mips64el   |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/64199881e242ac6894e9fe4c2a6d4644402da846 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/ebd559af37becf5561771e8afe65d451d7e388df |     
   xtensa    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/9ea924dc093f07bf937704836dfa96464dc5a103 |     
    sh4      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/5a542fd3e9c5cf56a18059d57c8e03e458a7d57c |     
    arc      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/1f984b6b0e576d735470a43d25b2b851cd4d2d45 |     
   mipsel    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/d2e700e897d1faf837a5ca144eb9ee264bd16355 |     
    arc      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/6c7fec50900b83cac004260f612c0c47d6297c23 |     
   sparc     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/dc69d05e64076ef47a0093a4b2d046d4ae4bc0d3 |     
microblazeel |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/912e0c5a768dececd4c66279858ea1d65cc8e1eb |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/5144f00833c294c1d0555e5f12427961a96e5715 |     
    arc      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/ba03daf82329f94ac8ba6dc95bab971edb3745b9 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/8c560e19d619e32c77d039306647f747f3b7f855 |     
  mips64el   |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/86f4c71bfd2de14a84d9860b4f72c5ce704c8835 |     
    i586     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/aee6697acd577309312626444b8006d76621dfeb |     
    m68k     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/a587477686885cbd529650588c5d71cc40d09a48 |     
  powerpc    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/514ea841b455beda93678cdbd679e4c523dc402c |     
  aarch64    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/a02e86d68aad1ccd25ee3e5fc8e06c570d9509f1 |     
powerpc64le  |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/0758ca1292d908bfdf9c0ddb6bcb7aea140efdc2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                     host-mono | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/83d9d6a1980b6ecde2e7382a3670dda28bea2559 |     
    i686     |           host-mono            | TIM | http://autobuild.buildroot.net/results/1541098ddbd71afdb13934c9eb365b86b1ec5df8 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 3 
               libupnpp-0.17.1 | 1 
                 python3-3.7.4 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/77eb4c4c2a93476be7ef983727ab343b52f517b3 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/05d1b235e9e7795cdd20d2b6a1711c5151d9171e |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/26da3eec9667898fdaf267eabaccc031ebb1f1f8 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/5006d2f53d07994ba0b916a96e95ccd96f65ed89 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/47efdc8d646dd450b7a80d0a50b1e7aab62756d7 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/f6178876a8acd2fbc100499acf6aa3199c7ca6eb |     



-- 
http://autobuild.buildroot.net
