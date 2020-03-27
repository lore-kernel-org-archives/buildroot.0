From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 07:25:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-26
Message-ID: <20200327072537.4A73D20407@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  4  |  0  | 17  |
  2019.11.x  | 15  |  2  |  0  | 17  |
  2020.02.x  | 12  |  6  |  1  | 19  |
    master   | 113 | 59  |  0  | 172 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  connman-1.38 | 8 
psplash-fd33a9b3d68c89fa22f... | 8 
               libglib2-2.64.1 | 6 
        perl-crypt-ssleay-0.72 | 6 
               libupnpp-0.17.2 | 4 
                  ffmpeg-4.2.2 | 3 
               erofs-utils-1.0 | 2 
                   mimic-1.1.0 | 2 
                       unknown | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
                   evtest-1.34 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 mesa3d-20.0.2 | 1 
                    mpv-0.29.1 | 1 
                     mtd-2.1.1 | 1 
                openblas-0.3.8 | 1 
                 openjdk-14+36 | 1 
                  pango-1.44.6 | 1 
                qt5base-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                    rtty-7.1.2 | 1 
sdbusplus-4212292bcf136d04b... | 1 
                     vlc-3.0.8 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/31b127600a9354c91630b79656e7e78f2e3f61dc |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/24f01cf0fe6e2c07a120d93d0516f62d33e68115 |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f1f4010f244f6cf3123213778f1d7d43d8d7e145 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1dcdffef1debd6293edecb56706479670d03ab89 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/484ac3070a9420af21e709e23d297079b21ec5fb |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/61250b1454709f0a06fbf1f1bbf7e3ee79d303dc |     
   x86_64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/dd8a68827ca70838c59d82780cb3eadf6b9764c2 |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/89e6f92dee4a93185891c48b5d7f7b5b0345b67e |     
    m68k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/4afdacc0357eb3b86594757dd89623b6e5a5e362 |     
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/69ec61716b404052630df844360d36e9b8e57456 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ff602904c9662b97077d9a00bdcf424d3de0c578 | ORPH
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/42cd24535ab38cb9b416b730a034a1dbe3293bf5 |     
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/260cdb3203e9141e674f38a2acd127d10320f8fa |     
    arm      |          evtest-1.34           | NOK | http://autobuild.buildroot.net/results/0847ef68b7f7bffa3083229ad9523dbad28db4f2 | ORPH
    sh4      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f50f0a7a47cec1c5a65d3bd036664a123c55438b |     
    i686     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/cdeb19d50399d3295ff4747ea76dbad0bc6f0dcc |     
  powerpc    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/e8d578adaea65581e3f660cbaf00563e38bdb3dc |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/b7bb88c0d029b6cf22c7d2c554706a2f8c09bdba |     
    i686     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/188da93eb07a76d2391341976e9e56142798058c |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/bbbc2eae4b33816a111d6d94f9c47ecd6f95305e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e3d7c42b53357648e421963aa34cadf14c44cddb |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/d184de70ba38da1cce40408b6143a2fbbc1c947e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/74453c9bf03b7a4842895d9e8c04e02f042cc374 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1f360c2abbd456b6fe5fc3dd07d4341fb9716a4e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/bf6b68b605f48dc67a6cc6f74ca6c2677e64cb96 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b3abbe6c93c6d459d3f7c096d3760a0f977ffd1f |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/51d170b2790537cfd48a09c6fb94e8c3074057ef |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7bf8ce5e79690de15b84891bb75313a315a256c9 |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/aba3fc843aadc9d1d5c9b75fd12cb55791edadd5 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/183daf9503497ecd2273013c4092b286fd6f600c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a925ccece20b4ca5e6bb192d5b006ec3c131a0e5 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/569307ac9e858efeab9db4f4673197f3006a04d3 |     
    or1k     |           mtd-2.1.1            | NOK | http://autobuild.buildroot.net/results/cc9a87901d909d565f0061813ec28e64d2058926 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/dd736a84c1906bd4ac0040b8716dc109097bed21 | ORPH
  aarch64    |         openjdk-14+36          | NOK | http://autobuild.buildroot.net/results/bf93ade368c155bd10a3c7e7a8d3ef1d07d70693 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/d8e94929324a1ca2c847c55f2b49451a02bfd29d | ORPH
    arm      |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/50a639aa66f1667475c2b7ae61f8614844f5b12b |     
    i686     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/54822a0eade60895416710eda5692e91a1a98b94 |     
   mipsel    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/4badd88329c2bb1b3cb545b85fbe8739c62fdd59 |     
    i686     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/437d79ce7bc64064d518c92fae8e70c2bcafd769 |     
  powerpc    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/5c401a4d6dd2388bf97705c0f4cb7d5d0f0bdbc6 |     
  powerpc    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/e819e73698618bfd185a5f978abe669bad966d19 |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4a6c6ee883b686603b5fdfa14f7f3292fcd386b1 |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4f295d695901d7943eaf9a7ed43cdba3366a085c |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6a88c234362be885ceb285b26d44db16096aad2e |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0d8178d37decc1c0ff096d6513697d135de8b260 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7bea1981565192fa8f28ec4f8b9cbc47e24e4c5c |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3ea8aff6a5ce1589044816d8f43a64c7ee94904b |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d93dca7f818481fc21ffe2b4eda9df7a9c5381ee |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/15f31eaec951627d6efa29bab4a04b124eb45e22 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/e3f456ea1d1ff4491b3c4d9c17327c61b4e02625 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6fa41d153d938d1583fb1577f34e1e5f7e55eb0c |     
    arm      |           rtty-7.1.2           | NOK | http://autobuild.buildroot.net/results/6105b69d8598f0033044a26f53a768e2d4b2915e |     
    mips     | sdbusplus-4212292bcf136d04b... | NOK | http://autobuild.buildroot.net/results/65a4652e5b419f03ace109c4b3738e9b997cdabe |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/37f695effa235e2d2f353a0149a853f60ffc3d10 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d8b121191afb7019b9491991f52dbd6282d39a63 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6bec911f24fb8e7ffb5b524e46684bdc55853efc |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/2c18f3693494337c85e69ec368285688dc94e46b | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f43d8de147b5e45a47b7e5cbcb5947abffb93721 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 
             qt5wayland-5.11.3 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/639a65a4d2e2bea323332f5f37e0955cae803275 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/46e47a967a51852efa6bf8249033682092f275bd |     
  aarch64    |       qt5wayland-5.11.3        | NOK | http://autobuild.buildroot.net/results/2fba8a2d7a7cf375fad4d512333aeef41af161b8 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/1d8552f73efbe313ee1c646a6d9bd7f4a049aed1 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                 host-icu-64-2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/072e31ef6fe38560428160b25f0338f2c7970d33 |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/9536500e99a1a413767059d38cfcd3ec558c8ae5 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               acpica-20191018 | 1 
                 haproxy-2.1.2 | 1 
                    host-clang | 1 
jq-a97638713ad30653d424f136... | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-19.3.4 | 1 
           oracle-mysql-5.1.73 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b32d665b807413edf81c445c770e3b10e52ce743 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/a1a6431a3ae67ac18750e30f09524efd8376c263 |     
    arm      |           host-clang           | TIM | http://autobuild.buildroot.net/results/0fdf65d01729dfc9057a35e3bca10e4b1794d0d1 |     
    m68k     | jq-a97638713ad30653d424f136... | NOK | http://autobuild.buildroot.net/results/34a7ce7f9cf9f60f0ecf33ae4b2653d303e6adf2 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/9c372475ad7c51dc61aa899ce699124791e240c2 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/437482937706c067524b37d48a48f575942028ec |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/ab3e7498c24fd04d738ec17eacdf00262692198c | ORPH



-- 
http://autobuild.buildroot.net
