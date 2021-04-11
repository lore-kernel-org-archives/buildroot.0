From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Apr 2021 05:10:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-10
Message-ID: <20210411051102.9D28E607B0@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  | 10  |  0  | 41  |
    master   | 182 | 67  |  0  | 249 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 20
                       unknown | 6 
        host-sentry-cli-1.57.0 | 4 
                 pixman-0.40.0 | 4 
canfestival-7740ac6fdedc23e... | 3 
            bridge-utils-1.7.1 | 2 
               capnproto-0.8.0 | 2 
  gobject-introspection-1.64.1 | 2 
                  monkey-1.6.9 | 2 
                  ndisc6-1.0.4 | 2 
                rocksdb-6.13.3 | 2 
                 samba4-4.14.2 | 2 
sdl_mixer-d1725fcb7c4e987ae... | 2 
              skalibs-2.10.0.2 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.75.0 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
             host-cairo-1.16.0 | 1 
             libopenh264-2.1.1 | 1 
                 mesa3d-21.0.2 | 1 
                mono-6.12.0.90 | 1 
          python-hiredis-2.0.0 | 1 
            quickjs-2021-03-27 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/73437b85360a70cc3cc6fb1244f63bf258ef17ef |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/86cb33e0eaa3badab9f17390de3045e52a3f2809 |     
    arm      |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/3ec818e676827c03f08c264c6c7a53b025b7ba1d |     
    arm      |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/019445bdb325b02eaf683d5e011740e90e8de9ec |     
   x86_64    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f0499e9816b443e3ab0239118fb4f2bc3eeaf7f0 |     
  powerpc    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/89e77b9efcb4325b219f023d998cb95c7bf8b96a |     
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/713ac12affe4c4394dcee7eff3aeb54ff02389fe |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2982bee1372e3cd134c7deb2b59aaedf401f2c61 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f2f1ca8cbcda13447240bac1ecd3cfa7f8c91c5e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e35c73d6b096ba6c59ee5eac7cb87f051a2bbb10 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d8ead60f60f371cbd1591cba8495a226a531be90 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/af500e82db2933a82da0927bb4fc4879ce5eb1fe |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/dd855f8efa883b6ef967f459b86ec4e76d02ad3a | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5527ecd9a87154e643127f13799c4ecdd56da254 | ORPH
 powerpc64   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/9cb04640ed99d1ae79d4ca3dccc58e9f9dcf811f |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c760d88eb4fe7fc163cdefe453a42683984d5433 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d241654efb4be5d9e7c1cedd9e8af42c7ff0bddc |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/80ff8a0413607c7ab2de626f7bbd260c91dc23db |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/417f6eb1ab589f127b4caee48d64775530863d07 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/687fc3bd41f1afccf675909586992698043d2a48 |     
    i586     |         mesa3d-21.0.2          | NOK | http://autobuild.buildroot.net/results/39e01c2bda29b3ce73756172abc130b76288e64f |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/50361a96bac8c5a591807a39dfc83e6a7545e08e | ORPH
  riscv32    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/dd09349dd2676f0db2e075e9d1223a948505c1e3 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/c4d9821315a4b4b5336772268287f244d719f793 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b59f2706a0b17f0c15c2b1c19bf2d422215faacd | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0d0405d05059c8f6d7c15a1d567a93f1cb4a07f1 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f54631c8fe76cdc9f1bd4df047270dd981a65be8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/916c26aa45aa0cff2d7406333f272e95c74dd400 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/95cea0f810987d8df3c1a59da2469cdaf8023530 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf3c71132ec8dc8b88a4d43c3293600803e8bb01 |     
    arm      |      python-hiredis-2.0.0      | NOK | http://autobuild.buildroot.net/results/45c5b0c84a1f47023bf5819346b871493c0d248c |     
   nios2     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/306ec7ad36b1a46451dc0be2dc8d7f6c397d794f |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bdd5410f8591fdc6bcbd97760fddfbeb137d65c5 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/59da0452603297e2db58a98ae22652e8c7076b3d |     
 aarch64_be  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/871804386bc54e78d2482ce0475aa35153bd20bf |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fae38d485c84fa1ae2e61728e7e8fbbda2b2e487 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b05abbeae8ea891a016df342eee901b310248e7d |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/a561afd930fb2cf8d4e6ca5e7989e82282f14365 |     
 aarch64_be  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/730672f84de45600e5049a26eaa3c843dd59d27d |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/feacfdb6116d45b330e0b9b410affef9c5012339 |     
   s390x     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5545ad8fb4eacad5c978fbaf67dccfd8a2f47df3 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d34e9f4f70b3b25ac60acce4f44706dc13588eb3 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/013d43182fc765fb1ca593217957869f2e8adf10 |     
    i586     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/3eae6964ccf1fb781b7e9aedc248512b969808a5 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d61b064b230bfba22b776b865efa6ff632cf4979 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/9b126ee30ad7d86f873b73690fea96828ced2cb8 |     
  nds32le    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/cdb0cae547256e11353321d936fffb42913f0ffa |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/2f36bee7ef61ffc8f1e21d3ece3fdc1057442e97 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/46475d697f432265742e535d0d27cdc09656543d |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/21b17d35c8f47e88271e1846666ba6f3e4255f22 |     
   mipsel    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/17c83fb4305570a12a4a6fa5ae1516ecf3bb5c6d |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/4119babf6b8378168202abd3bcf3c92951b78e00 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/163b33d096740fe8fe2d02a697d9ddea975971d7 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fdca752f8b0a31372f4684d1a1d539c709735665 |     
 powerpc64   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/a01d0a3764ca862460a228bfac140c18b31b4ca2 |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/cb3be883cf3f1fa67357383a05240ede4782b50c |     
    m68k     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/793ba4dcdad1e7d038a60a331d1d33d63906f64c | ORPH
    arm      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/9634adc433da0e25732eb98675c59d0f96ac93b2 | ORPH
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/c5313bee894e885ca815bef2fde68ab028a3a68e |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/9b57b1c91f76adb4712eecf9abc8cd729d109231 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/22129f3b7da5bafb7f43d892aad5df3d96f264ca |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/49d2a6188f3e4530131fe94658963d14695494af |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ea0ad1d660df20bdd154f1de82abc2841cab4114 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/84fc417a5e7b6568b087d5259f0abc4f401c81ff |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eedb11f3acf6be6ea388c6f879a7ebcbdbf1e25c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a47dd4cf9b8e3a707007e45cbf2154219bcde3e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/955291554b08178b006d24c4a0968cc43151574e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
  binutils-arc-2020.09-release | 1 
                 gerbera-1.6.4 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.4 | 1 
              netopeer2-1.1.53 | 1 
            quickjs-2020-11-08 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2687a71713758f1aa883a121902cefca76ef26a4 |     
    m68k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/47773a5bc6fb8e6a180252f621bc054b17e5edd2 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2cdd2bbbc9d8a530510752c71fbf73a7d719c7f4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/158776cf0eb075cb5452faad928ffcdb56100009 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/cf84c4482990e460f35d79081f49640ea140b6f5 | ORPH
    i686     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ed7f69c34f3e4a9e04b6e1814b010a7919368303 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/bc0e10e116d40dd2be5a40fbcfbcad74e296d7ff |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/b91ec0c033594b291473016179b40d7015db42da |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/c50e8848df08834b8fe567fce4821d054346ec98 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d6ad3dff51135ea24a795a8a72a874adff012921 |     



-- 
http://autobuild.buildroot.net
