From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Feb 2021 08:18:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-04
Message-ID: <20210205081823.F05298708A@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 31  |  5  |  2  | 38  |
  2020.11.x  | 19  |  5  |  0  | 24  |
    master   | 161 | 88  |  2  | 251 |

Classification of failures by reason for master
-----------------------------------------------

                    mpd-0.22.3 | 14
              netopeer2-1.1.53 | 9 
                  perl-gd-2.73 | 9 
                  dhcpcd-9.4.0 | 5 
                clamav-0.103.0 | 4 
             libopenssl-1.1.1i | 4 
                 mesa3d-20.3.4 | 4 
        host-sentry-cli-1.57.0 | 3 
                mono-6.12.0.90 | 3 
                 pixman-0.40.0 | 3 
               belle-sip-4.4.8 | 2 
                elfutils-0.181 | 2 
            erlang-jiffy-1.0.6 | 2 
                  monkey-1.6.9 | 2 
                    qemu-5.2.0 | 2 
                       vmtouch | 2 
android-tools-4.2.2+git2013... | 1 
                  boost-1.75.0 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
                   eigen-3.3.7 | 1 
          fuse-overlayfs-1.4.0 | 1 
                       gdb-9.2 | 1 
                ipmiutil-3.1.7 | 1 
                 libgeos-3.9.0 | 1 
              libostree-2020.8 | 1 
                libselinux-3.1 | 1 
            lttng-tools-2.12.1 | 1 
            makedumpfile-1.6.8 | 1 
                 openal-1.20.1 | 1 
                openblas-0.3.9 | 1 
                    orc-0.4.32 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d9521b4bfeafb1140c21745dbfe28d476a9b71ec |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/0d644834efafd991f4aafdc367a000c3ebc29eb6 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/42b5069afacd6efdbd01120de083d7cc87812b63 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/0afebbae51ffba4b3aa58cacab2685afb7a9522e |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/165e81d60987d7ad06536d60277caea331c6c286 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8d1e051861bd4e87b43b90413463436ffd2bfb5d |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/19101e1cc73193cb65d928aa4c2b36392907c245 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/55fef9c932f583385b2bf0e70c44f42141feb233 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/41293da0945ae3f88c860dc501de24523a488e93 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/0b7696bc2262b3524cc3131fea153ab64355f0d8 |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/9fb279dc2dc51461dfefb1abd008ede295837ddb |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8ebd984bb72ab0a52639a64e409309be2aa836a3 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/5b8af0be5238aa6541b57f48638f5766289c74c9 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/f8ecde0cfeebbafd7ae195d4db12907b0d318cea |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/58159bf3af678156b5b37925a14393c84810fdd4 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/e831d482de2e371fa9dc995d4f2d2f3916e4118f |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/0ea02022ad5deed1ca1c792e3ac0ac92bc2dc343 | ORPH
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/724c40ba0ee57c987c2b254dfd6a4db51133b585 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d5d180e0ee6145565d1ba1b284a8cb791f6345d4 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3359b642136053f6abd4bd5dc670bc789d1cc90c |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/f20f90932b2585828e8ce1bace60953128f635b9 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/9c8553bd8c2bf41ccbb74b0b58c9d625ad525195 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3f690870745a2441fe89d557aaa79cc73c630156 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/53b4c293cf4f23283ec134c9078180a2c5b888be |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ecc2c502492edcf26fee3892160d99e5e9924a1c |     
   x86_64    |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/c6e5d1576fe3058e17a8d4ab027fab592f957654 |     
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/32ee5e525c9b939abfc5bf190f26e8b73f2e01ea | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b267d656daa167e8a4bf83c3e1ab94642100c25b |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/7239d319a1936678877fc8394ce82a35f2986c8c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/47aab7a24c75deb190ca4cfcea9e02c2faf83d8b |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/d54181e2a97cef0b4099edec6b05811ccf2d6367 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/5afd81edc6d388773f2b2522629ebb3550fa0fd4 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/c9004997952596513e2504057522145a8ba8bddb |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/0f3d20b749885aedc84efec2876f8800fbeaf1c9 |     
  sparc64    |       makedumpfile-1.6.8       | NOK | http://autobuild.buildroot.net/results/1421f54f7599bba62c0a4bd5c65ce21c8cc7ee1a |     
  riscv32    |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/957160ab4171a7fa337f2b056baa8f5511ef0631 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/fecd2472414455408a35f374a0911def1aae0bf5 |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/7dbaf9390c17b6011103d3ccb8374956edf6b0bc |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/999c8b7042d339f8d58c8d43ce58733decd0f837 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d4182ce295b613a7eb3116ec529157879729b2b7 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/aa22683206c1405a6a64d7a47526e69841deb821 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/eec0d2d59c99ce892f78d29ba52c85540e40d5b5 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2ca433c9e3f0e68c4a7d63fff90075c9296d2abc |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9e2454432c5569564d798f31a154537f35552966 |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/faeda890a4f915171dd0cac5409075068d12de40 |     
  sparc64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7bc3a51a66c325f2ca38d82c06f4977feba09243 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/cc145f404286a82b449c80eb4d93d58a5ac328f7 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/fcebb642fbff4161c345a29630d95e17d261cfac |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8ef2bebb6d1eb31c29dd3b9a65d8d8c176395f56 |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1f8c129cf9428985dc4df01669e5a4a9bbb82997 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a337cd67c69c51e10086ceea2ebf0ce7d6340d6d |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3088a6b87717240c510cd19701788bba9255fa72 |     
    m68k     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1e0aab2a745f7e778787b8633ca2f243e9bdd1cd |     
    m68k     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/64945084096bc0ac323eb60c88a12d2ca52dae05 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/396d9cf4ff62a6274db888846a008ba5745a8b4e |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/b06b1ae4af4094ab7892f2f4521f0154169f9b67 |     
   sparc     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/144b1d665e0e2adfae56cbf3e743052c2bb57599 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/10723d07b0bd5161d1302d04f0dd17655829c4e2 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e21834d4d2ee580f00f0fdcbd3728787148c0da9 |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e9bfe730da3faec5884e8950855a34541c3408a9 |     
microblazeel |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/99ca5aa18074b19f2e6a311c2d38addb697f552b |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2b9ad4626a1b6918a8e8d586521626306f5f8133 |     
microblazeel |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/65108399fb6d7b02d812bc15d5074bfd404764c5 |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6730e1e6ceebec94a9ad27deac0a4d1bf4661536 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/16bf1c3b4059a159480d23e6e132dcff05bd9b96 |     
powerpc64le  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/985aac8fd746c64e4ad0e093028164d8ae637409 |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/da0e36543cf68e4e9bbe819945a884193f33819a |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ed92b831a3f54e5b56b88a94440a327dd3aa4e6a |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/43f35c22ea1855b9fca86725d8a6222f449bff42 | ORPH
  powerpc    |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/4b45f41c521b63ad1e9c354f319e8e2994da7a3c | ORPH
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/678935e6fc3c96c9d4e2ed1e2dd21220a9c709f8 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a4c97ec1b4cb61bdd312fc48b5f0c60684cae973 |     
  sparc64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/ee61f872e2cc7d0fb0395873e6a789971bceb0af |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8db05d7b299dc8f49c1028c651763157cf63820f |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e05b17c9f64553a4fe023db40bad1f2355559f87 |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/1695eb29e1bc2fe228249ebf479f571218e820cf |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/52b6fc6825195a823c9c4d2bef371f4921844e62 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/438f26d609a2ee0a0c068332b3502fe41bece5f2 |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/9e12f556a840754250d6ac40d44b2d216ddfb46b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7757d9c2e88493f724f60b6a5962f22cd33ab7ca |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dfcd5c2944e5a8295b39f261f11c671dd35aee0b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b2f2dd9c532c4b906407d91910898ee73d785213 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/658a0492b57393ae2811c2db268c981f31ed1a98 |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/57641a7ab25e7254f0c0cb674078bda7bc15b45c |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/084b608bfd206f1c091f4ba3fbcc22ddb1409c07 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ceb3677b980f4b1f4be4d51d1968d1f91064bbba |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bda51fb4d51561e5f38de2286451a07c3d81bf01 |     
  riscv64    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/ab988fe29adc75a47f1c98b0b426caae3b0d020d |     
    arm      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/a1cf052b0ea7a96d3fc3e3d07b7a6edecb20b3db |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1c0fe5d453a2a30a7e8e46b569521e7bb40527f2 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 2 
          gstreamer1-mm-1.10.0 | 1 
             libopenssl-1.1.1i | 1 
                  monkey-1.6.9 | 1 
                    vlc-3.0.12 | 1 
                       vmtouch | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8897f46e48a57b34ba96b6a02eb9b9577638c792 | ORPH
    m68k     |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/71354002ac435fec0c725f62348634e185b7bec8 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/bc799c2ad8431d41b76902924cd1bfed976564a3 | ORPH
    i586     |            unknown             | TIM | http://autobuild.buildroot.net/results/0fd40e2ece434efed07bacf51300a7a665305497 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/569d07ee4bb68171d288eb8705c81d4bdd5206ec |     
    sh4      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/98bd2618771263a928e13d07883d247439fa569b |     
  powerpc    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/39ba87d1a21e95403143bc3f51b59882cf060e4c |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              asterisk-16.14.1 | 1 
                 dc3dd-7.2.641 | 1 
        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/ec4b6e6ab1ca43178386bfb33b1602e51219b533 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/00f5df41f32040b9e9f47527b1b93b6621dc0bbd | ORPH
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/452715bfb09dd1226721a841daade009d793f0ed |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/d5ef5a5498ad0b67d2c793959bcbf5776812b6f9 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/b547b4ccc00f81f0a6cbfad85b772c4d7bce5df7 |     



-- 
http://autobuild.buildroot.net
