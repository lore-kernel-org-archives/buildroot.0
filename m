From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 08:11:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-28
Message-ID: <20201029081121.768F1203F7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 35  |  8  |  0  | 43  |
  2020.08.x  | 37  |  5  |  0  | 42  |
    master   | 201 | 122 |  0  | 323 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 23
 host-libabseil-cpp-20200923.2 | 10
      libabseil-cpp-20200923.2 | 8 
                  boost-1.74.0 | 7 
              asterisk-16.13.0 | 6 
        host-sentry-cli-1.57.0 | 6 
                   libcap-2.44 | 5 
                   sshfs-3.7.0 | 5 
                       unknown | 5 
        python-m2crypto-0.36.0 | 3 
                rocksdb-6.10.1 | 3 
                  dnsmasq-2.81 | 2 
              host-guile-3.0.4 | 2 
               log4cplus-2.0.5 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
                  zeromq-4.3.3 | 2 
               apcupsd-3.14.14 | 1 
                  autofs-5.1.6 | 1 
              bitcoin-0.19.0.1 | 1 
              cryptsetup-2.3.4 | 1 
docker-proxy-55685ba49593e6... | 1 
               domoticz-2020.1 | 1 
              ejabberd-19.09.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
              gnuradio-3.8.1.0 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.7.2 | 1 
              host-bison-3.7.1 | 1 
             host-cairo-1.16.0 | 1 
                host-gdb-8.3.1 | 1 
                   httping-2.5 | 1 
             ipsec-tools-0.8.2 | 1 
              libostree-2020.6 | 1 
                 libraw-0.20.2 | 1 
               libupnpp-0.19.4 | 1 
            lttng-tools-2.12.1 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                openntpd-6.2p3 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                suricata-6.0.0 | 1 
                  uhd-3.15.0.0 | 1 
                    xen-4.14.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/166eb49415527e526771beb52c487accb2935695 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3eaebd3f7912c96249a9f34f94cf6b3bd9f0b970 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/dc99f294c46b726b767fd6be1ca160eada8c6f66 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c8f46da3cb6a5e3eb18e15f6529433318028440f |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5579b0bd9249286c46079acc3a41581e27d18036 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5e2838be1ed26148c34e1ed13d669e34bf83b62a |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9e696e7e37926431b959715ab906b3f5af6df557 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/54d44715b294f44328fceb58cad663e5e247f6a0 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/32008cd882affd74a9e0a0db65ef80ebcfd9be96 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f49d8a80a9d7bd6b4bea1b6e5739acac7d5ead80 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/12ee95f5152411d0f3f25b35de821fb70d3a6980 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/59884708c445568c30bb522cdd08ac68c9f100c9 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0831dfcc353d3833d125f6dc2143e5c31adbd74d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6ede5426820ec01d9914cdde342de983b7db5c1b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5dfc2aee28bf89195cfd6aa10126be7d47d6e347 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/73a1d0c1f3fe0bc0327da4b4f3618bd8e0ca985c |     
  aarch64    |        cryptsetup-2.3.4        | NOK | http://autobuild.buildroot.net/results/806dcaf610dd958c0f089de109b78b5875d9ef45 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/b7e20e24029f20408beae6588d1868c5d12b7cb3 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/f694f9afab7d7357fdea1b31c425ab9501f8b6ea |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/2b7205748edf04e303895cecd2c0ecf926cd2887 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/46e89519d74e321567cd078710cb314267cba03d |     
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/e9ef809612861f576c294fba5bbb32ca10c3a59e |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/932a789671d0e9a7890eea23db8576b89d860633 |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/fde670499289f3d7d47379eebccf6e0f92c6d200 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/e5e214180d34850118ceca4d5a6e3b06a98612cf | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/5d2586ee73cbc2ef711f726e4616cb725a64bca9 | ORPH
    arm      |        host-bison-3.7.1        | NOK | http://autobuild.buildroot.net/results/31f8422643c53be1ee0e157eed8470328c6f27b9 | ORPH
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/837cbba3edb88deacb1a3c1a2520a2c9bd5105fa |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/eef8e097aa6efee6fb291d461cb34851148172a5 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b2c69c3af237de1faf53b41dfc80d6b92a94a452 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d7876277be2865154d31e9d80272d2f0efe2d636 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/e83d0e38c8ad174e73417bc8c2fa5324b603c610 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/e108a55f7752d503fd7c0f46bc5f96470fc0c61e |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/3bd5bf3a38abb7f15e980959880ffb126675d900 |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c5b59bdb8154769a15cf0fa7879cbba8dff9ccdc |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7fbd20239a02d3330a55bb8ff6d882143173fcf4 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5301623e0834e9b7f17e5d8648f7922e8565e583 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/aaf666334ac4fb276514ec39039954a28d3f86ba |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c3b88630e435e3d06f2cf6477775416d6a11fbe3 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/033efe62dbe3ce1270c76f593d0d95a7ccbb33a5 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/20b7464ed0e63daf17871615b8d474637b1e4a35 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/996580eb209655586679f027ca772fe643775d3c |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/bdab809e0c2964a561b7706feb7818201eff28f3 |     
    sh4      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7745a26abfb50711195026c8fd685e08123e77ac |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8c5571c25ea5bc8e076a95eb4e90757e5f9c6e48 |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/ea80b9e587f20e0a4ae3af2eb8d70094fa2896db |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/fab5ceb9a557c27fa83bb547c24f28830eac0d56 |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/160ca12005bad3baa976a733fcd63dc41be02114 |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/99a6391f3143f2cbf91326d122d948ee65308f6f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9dd0513c08b0d8b5b0aafb348eda72bdf3472a7d |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/618b48edaf07a557f8cffc0a0640eeaae826fe2d |     
  powerpc    |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/e8ba37ff3c1bd5a78f658b4ca388207775acb40d | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/654ba17f23ae18b96b2b7be62a0d2fccf4bcf815 | ORPH
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/568cade1015bbbf79bd16255408336c2bf9d8f5f | ORPH
  mips64el   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/f226c58b0debef3080e4607483e98cc1d8bde67a |     
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/e6c46382b1be893038ae965ecb8f4efe7c1417f1 |     
  riscv64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/56616ceca143283a33f551c459bff274bd8ed5e7 |     
  riscv64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/093fbe5105c7e9d07147ce470021ba61e9db2d8b |     
  aarch64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/e071ed6f2073ca286e74d127f6b4b8ad1ae05b41 |     
 powerpc64   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/26cb1c2b1cc3b2b8d2ff16e613a364322d473367 |     
 powerpc64   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/15dcbfea68a06925aa324df40718e53d8561e55b |     
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/a5c3bc990efa8d833025e0b12c34427730598aea |     
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/a60ee85f6faa995ee3467a2d1a9aaa6fe172b4b0 |     
  riscv64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/daeda39ba82069a00999730c5ea1333db37218ea |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e6d23293c7cf408ea4f0b0a7a6783b0b4f097be |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/729f81541de7c4f1386645a5857d9e5b92ad3144 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c98a6c53057dd9588b73e6f3aa7b36955a6b5c8 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b550e9cb85a44c40fb4d6eae509890d6dab365ef |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4a05f1b9f124a8b9eeac64d945e4143228f5e0cd |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4aa2cc38b8b202a366e5ae904bbbdbdaaf0b1eb0 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2848c04856bba6b893c35a4ce91cc276223d4cee |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/873808089df3bf46377720b4bd1b81ce6d71d82a | ORPH
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/31750965d3a6c0fcd9e713bc47519695e1fc47bf |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/4a766a2399b04e1335b6c8efe5afc01ec8cc30c1 |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/38f86a3216c3cbc49e844f296e0d9fa4ec4bba58 |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/f7c936a71b18ac1ddba607de62c266fa26aff9b8 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/044daada78e8c332a8e06042c50339ffbc9270e1 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/72dc06637ef6e5a89f8d741cb38d5e63f967938a |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/1c0048445e7e33ccf9887cee4efdbdb6bc84f251 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/88e6ee21bc399f88a0ac200cd39e1272e144bd58 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/860fb17f89e6502be8beb704e1494e217064c699 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/e71c9a8b3b85f4308df916c296c1e54c15c3b003 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/d592d58901f97fb7610509bb1d040051830b38bf |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/fea3323764c0cfb1bea45d671098c638e8527970 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/7a371b7e98bb95614d414a06254c4d52f88ba668 |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/48f117231ced73b7ab7c4cf0f4ceb6ce12057d98 |     
   x86_64    |         libraw-0.20.2          | NOK | http://autobuild.buildroot.net/results/4d4d47a7bb8956b8d962fa90c1bc95bbeea02310 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/99b9a292eb95218889485a44b6532af7f97521b4 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/1e64c6d9217378b282296ab32eb51bc82ef2a817 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/1b5885c066a0c85dd7c2bb365a3df3c79ec93863 |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/278a9687b11935363f8fee93488b056a60318b97 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/19ce7bf35977b7017be03d6c995e78382c787fcf |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/8d88ce21b57bebfeab47df3d02f08eb5cb7bf907 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1cf0b43715db5199ca7b0793b044b08f5753fc25 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/6ac8c725a023ac8f625081b40b6dece278583c0e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c8e50fa7d4e3a1c4fb57a99b1226e8efce89d195 | ORPH
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/1075606307126594cd91ea698632b7f42a73599f | ORPH
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/1227003aa385c68684400b73ef060062a1d29913 | ORPH
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/13f9dd190abbed166bf755883319a49d7f44becd |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/dc90f2b32719420a81f3a6213f67a3aa6dcba87d |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/1fe3127ab8f51a6d02ac321c05697708cf35dcf8 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/e848987c4bf65138cf7566fc6d1ba947c9fb9d12 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/cb521486eddacf05ed4b03999ffe9bc2dd9bfef8 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/868d279cda5e121f05441d4cb33aa20833c7548f |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/7f337b4abef4964e76bd373abfbcca2f45a17af5 |     
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/ede8525b3559518bff696d84bb7b788730b01b34 | ORPH
  mips64el   |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/ab5dc37b530ed3efd6828a10f86e22119396be6d | ORPH
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/b1e3fcf103eaae4ddc6343353b6c7543b38ea6c5 | ORPH
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/a2778f3fda90d43acc9e760879b18c67ea51d918 | ORPH
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/3446216267e94d41f4128732544a347734173b51 | ORPH
    mips     |         suricata-6.0.0         | NOK | http://autobuild.buildroot.net/results/2210c481ae313ead11cca5cbbdebe1090b1a21af |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/bf044ffc4d5bd7b4c4d0de3cb0cf7ad7a3cde484 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/868e9c88004768722eac13204d8d948ac5ba7e3e |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/99d9979be4f37c42390c87b1afd4cd33bac07f5e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d0ea1c0e9634f4365a3b25991be3c03724150d7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f8080f5cf8cc8a4ac0b90489f33700b9c9886aed |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/12b48f282de8c1528222c91107e149cdbb6f8c3d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/350474269e4100d1bdb88f94e7a77a9c8f227345 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0ff3daa6a16d845d0e012be2ee91cf1df60234df |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/ce499198f4a5af28afee2bab2ae0677d7281a9ac |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e39f0e5fff60294ab63e724e0afee783c3873604 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4f536b95daf657d0b60f7af242ad1f09ebd1fc20 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
                   dav1d-0.5.2 | 1 
               libupnpp-0.17.2 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                 rocksdb-6.6.4 | 1 
              tinydtls-0.9-rc1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/8851dda95468ac5c3bd770fb25591671f4607874 |     
    m68k     |          dav1d-0.5.2           | NOK | http://autobuild.buildroot.net/results/017fdba3e857a01623baf74ae3a2bfbae6676931 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/064e3efaca5bba70b2762199ef10b8ff4167df27 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/d866c1734f3e99aa4243cb8cd63dcff6c5c18f4a |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/581ae82911dd0d732bfd9344e606c10755431e8e |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6b7b149f29b2c455680b3ee6910cdde9f00b65f2 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9c35a3b64c249c7dc613fed40750d043cfaf663c |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/15e9802af9d53d1344fbd84932ee645918f93dbb |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
             kismet-2016-07-R1 | 1 
                       unknown | 1 
               wireshark-3.2.7 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/af9145e64cfd011f3bdb12d5edcbd5ab6609ba4d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/e87e1fd89784353cae8dd0a15de721d081c19e35 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fc7f3617d0a489818201b79485f1358791e5039b | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/87a41efd02ddf5bb4caf02b04419b6c3a0288df9 |     
  powerpc    |        wireshark-3.2.7         | NOK | http://autobuild.buildroot.net/results/8005d32db126d1779c732a922fcfe1378b942fe6 | ORPH



-- 
http://autobuild.buildroot.net
