From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 06:17:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-09
Message-ID: <20190810061740.5F669203D7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  0  |  0  | 15  |
  2019.05.x  | 21  |  2  |  0  | 23  |
    master   | 185 | 60  |  0  | 245 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/8967e86b211de94a0a4fc4485480da69bf6ab9db |     
  aarch64    |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/91232ab7339d128c071b099c85fa6e55e4f5d257 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 14
                   mpd-0.21.11 | 10
                collectd-5.9.0 | 5 
                 libdrm-2.4.99 | 3 
                harfbuzz-2.5.3 | 2 
               libsigsegv-2.12 | 2 
           python-numpy-1.16.4 | 2 
                  quazip-0.8.1 | 2 
                    strace-5.0 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
                      icu-64-2 | 1 
      intel-mediadriver-18.4.0 | 1 
           libfreeimage-3.17.0 | 1 
             libmatroska-1.5.2 | 1 
               libupnpp-0.17.1 | 1 
          lua-cqueues-20161215 | 1 
               metacity-2.25.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
              qt5enginio-1.6.3 | 1 
                  rygel-0.36.2 | 1 
              spandsp-20180108 | 1 
                    wampcc-1.6 | 1 
              webkitgtk-2.24.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/0ae5a5ad28ce6b1995dbd85748b07812b832f7e7 |     
  riscv32    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/9f8e419a9e5b161a6bb73ff44ca0bc77d6a954d2 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/04dbe4e56ac0135d26706a1722f5ddf6cf8b4fe3 | ORPH
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/15d67f230ed7a5323316671c124da1b1e4291620 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/34d6da82d3e7d2ff956f33f6e1f2f959bc76e5ff | ORPH
  sparc64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/3ab9c6a6f9d39ab10e3d8951235ee594993d111f | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/efba6abf43d8846177ee22086efb233b4deee020 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/9d23aeb2470836bef4b64214eac90bda9b4dd298 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/e98e01506734ae5c6ca91ada3ca88ef966a1aedf | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/74dc1b5448793214a8eb1ee38c64ad61b9d5b527 | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/88a85b4cc97ef6cadc5f829a2c043a1e763bb0fd |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a931f193af921e45c206eb217cf91f37363be735 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7c7f2cd6ed23d9f158743a41a23a77212abc1251 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b58c7ddc802000b7cafce0ce8ebac2d6f54ad931 |     
    arm      |      libfreeimage-3.17.0       | NOK | http://autobuild.buildroot.net/results/4d3f4f95d5af120e7d40ec329c622bd6435ece5f |     
  riscv32    |       libmatroska-1.5.2        | NOK | http://autobuild.buildroot.net/results/37e058b3544662743a6a4257b6556f8024017121 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/e994ae7b9bf041dfeb84a72555a957345a955ce2 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/72e823511ddaba6a5b39a99c9d02ca53bacac9f3 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/ff6102296b02dc9f69013a094679cb0c20edaaed |     
    arm      |      lua-cqueues-20161215      | NOK | http://autobuild.buildroot.net/results/f44ceb1fced5102cd7b15e8a054a8937a8cbca95 |     
   x86_64    |        metacity-2.25.1         | NOK | http://autobuild.buildroot.net/results/c7a12e45c774905d4253db35c35c208d3f21ad49 | ORPH
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/638651303cc246b1ce7b5e8ca0f0f19c85e41aa9 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/b115cbb7782fb67f95df60fc0dd3ebd9926c8bbb |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/efe9b49fd4fbadc6573c875f509bceaaaa57817c |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/e4b3d2adb143304ba87521d257b5adf00c603c4e |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/3e3014c2628850e655eb732ca8e23dacdd54df41 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/1276d4be7270be6feada5d5c8b9e31db563ccc97 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/fb6168d96226ec0f28c582615471d594fcfa5db4 |     
  sparc64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/3567a80057f74ec4fb25d743feab39de06b6e569 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/9ce712801a581cb2a00fe85ed3811a41737fc77a |     
powerpc64le  |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/0a1b9e3cece0625332be58b8fe253f450ecb8107 |     
    i586     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f8d43ae00ac48b16464982fdf4d24e4977046da1 |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d5c5a31bc422defdd64ff0b0ca975bcd605f22be |     
powerpc64le  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/36cc029df8c0a5119c110e5d477446a05ce4215b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c9b27fc3a0da4b67e822759a760193b628143030 |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7bca7945e0042591b263399c9163013998aa05d8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1296c9ca6b8644f5c6d3bc0ff4fd0f1cb20e525c |     
   xtensa    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e880cb39e7ef2f06969a2fbcf927d84b152f13fc |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5a5481291467e0ce386a621f1e39aa91a3c85928 |     
   x86_64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cccf4637eb393aa25a6ec133b7d8619cbb2449a9 |     
    i586     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8c2fef855381d6487d537ad74447bdfba46dfe95 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/47c058509781e8d7d54717322c41211b1d229a1d |     
    mips     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/917601a69a0e3583b8b06a75e94eb50d615abc51 |     
    i686     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/049926ae2b28638f36a5a3ca6afbba4bc1ff92ab |     
 aarch64_be  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6157a7e4f054541e9d22703ec37085e708be42ed |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/91c9454b946310cd1a9d50980027ec666d2fa511 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/ba4e0401307327ae209f43035cc17e877cd7fb03 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/f7426362e7b12c93f834ed93b4ab4211b6b6d94c |     
  aarch64    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/c0c10a8fda995d5c16fd1d0d20105c509f6f745b |     
    arc      |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/f40f89601c5721a7037874f2d02f2ab3737c2ae6 |     
   xtensa    |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/327c3f9af0a67e8a5f97bd7b4ef4ff4cea18a6f9 |     
    m68k     |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/5b9d8bc50acfbe3c65d5481f32f578e7c347a568 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/ae37bd3d163d69d9320853c3a2bc3bb7443f61b9 |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/06ed45ce87dff20fe84d515f6ab63d95a1183f6d |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/8e0640f48f28e7bc7a214bdcaa276624c7679a5b |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/13f9b8ec57f173d2e3b945830778fc1e53b0f47a |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/a1a8c654d0c9fde12ab2ce628a8ef18440b7407e |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/17d1d731354e8d181469d7753c7caf1fe5718b75 |     
   x86_64    |        webkitgtk-2.24.3        | NOK | http://autobuild.buildroot.net/results/aacde5ad4bf055c8a9cca3183ddb480c1377d7a3 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/9162814092b2d0ddbcc6af2e3ab3a3fcfbb5a57d | ORPH


-- 
http://autobuild.buildroot.net
