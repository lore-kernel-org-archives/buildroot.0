From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 06 Nov 2019 07:17:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-05
Message-ID: <20191106071737.602EC876E4@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.08.x  | 15  |  1  |  0  | 16  |
    master   | 125 | 72  |  0  | 197 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 15
                libgdiplus-5.6 | 5 
                  cmocka-1.1.5 | 4 
am33x-cm3-11107db2f1e9e58ee... | 3 
                  gmpc-11.8.16 | 3 
                 host-rauc-1.2 | 3 
                libdrm-2.4.100 | 3 
                oprofile-1.3.0 | 3 
          python-web2py-2.17.2 | 3 
              host-grpc-1.23.0 | 2 
               libsigsegv-2.12 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
                  ndisc6-1.0.4 | 2 
                snort-2.9.14.1 | 2 
                 uclibc-1.0.32 | 2 
                 acsccid-1.1.7 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
             gnuradio-3.7.13.5 | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
                     gzip-1.10 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                       kmod-26 | 1 
           libwebsockets-3.2.0 | 1 
        ltp-testsuite-20190930 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
              sigrok-cli-0.7.0 | 1 
                   sudo-1.8.28 | 1 
         uvw-2.2.0_libuv-v1.33 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/b40ac4211013e6e17f42d5a86150f6f96156499b |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7df1cb42f06c9652ad6154333054a5a2cf5faa5d | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/6b8959f2b9f9486b5b0ecc0691ce72f0cce6c467 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/afd33aab1cde0a8469f1e32f506d73ddc0f3154c | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4ae99e7faf359d00360de3d0866b2a995157f613 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/05824a46a80e09a7d959f92615d8b26f51dc1d52 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/74eb87ccb51e2b09e1242cc7f7b39f9c864d2219 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/83262c5a5e3e2ee9f8416a18c555e6ccffa22be6 |     
  riscv64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/265259f59728e5a9e71a3cb5dca9ec790f0f1052 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9e42de4fe19d9827bec60886a4756696fe70ee6c |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/c6f57ca5a77ade6433594f70963346a2bb69002c |     
   xtensa    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/acb7b0befd36303941d0390dacdd2aae4ec1adcb |     
   nios2     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/cf6d0943be668fb91bd6686f344f8a1f8a258a02 |     
 powerpc64   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/562bd18d4edcbce1a07f1dd14823dc5eae54516a |     
   xtensa    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/1104e82307eaf11b4f45e0e3dec71656cf1fb87a |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/aff8eac5370dffb6d6371f5145b15570588cdb14 |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/e32e99729d6d10a757ca59c86b3d5b65ee09f762 |     
 powerpc64   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/5f1f0424f3e05fe893c5d58f68c312086a8eddfd |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/13d423eeda940bb0dc38430e960786b524742a5f |     
    arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/710bb0720bceec1b01ce320b670e38c8b8620304 |     
  mips64el   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/4ec303854dd41e769a1f82174caa7a286184ba3b |     
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/49cf9f8f6db68b41c286ec9f99a5b55a3d5e5358 |     
    i586     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/a81bc156803c32eac264e3a95c0591c0c9458dab |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/309ff4d692bbd1a836fdb3539d857f727733e7d7 |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/1fbac98c86c36d1414d7914f1729b5230f910aa1 |     
  riscv64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/9e36b0ba1202ab582786a89543e8652a93904966 | ORPH
  riscv64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/0a66c85acef7ebd7cdd6dedf736f1aaaf3bb4beb | ORPH
    mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/6ceb4b5d50b0cc7d5ab03b892cbd81098eea7fd4 | ORPH
    arm      |       gnuradio-3.7.13.5        | NOK | http://autobuild.buildroot.net/results/a809e7d6e57dbd8ec68523a9ceba0df713f596c0 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6dd060e25276d83aeb4819f9cad403e39dd7e380 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/af7270c1b49078ad4fb5f45751b91096c0a93b68 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/a6ebb37e4d3e0e8c59ea3d8bf68922805f4430b6 | ORPH
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/14fb575e9c992a7cf3392d21af72c74a1b804c05 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fa1137f18b06636ad72acd213a46fe8203f37a48 |     
    arm      |         host-rauc-1.2          | NOK | http://autobuild.buildroot.net/results/fc7206d02fd04314c72e80642ad1a339fc1b8c73 |     
  riscv64    |         host-rauc-1.2          | NOK | http://autobuild.buildroot.net/results/d9862d1f10e6301736be091bdd3dd6a46b4fdeb3 |     
microblazeel |         host-rauc-1.2          | NOK | http://autobuild.buildroot.net/results/1700950e682e48bdb99a0051af062f5db5997c6c |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/915f864100c57a0fff478af8040aa29f5c04ae47 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/e3ad050eeb3ad428a54a1ff3661cfcf8d86b54e6 |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/931e931edf049f8191320d05d0d4354eb330f15f |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/1e20eafd2a296440ae856a9d62d6087a79cb1841 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/01373b154f6602335a704c56145ffbe96c9cf4ef |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b9cfcbd84781ce9aed27af03c3a747a83b90ac47 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/e6d28ff7edbaca4864d294b9e55be32ef7fc5802 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/14f451641758c9835357e5d0ab1bf9226711937d |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/7ae91bb3693fd83258a4e95c8321c7958a3c7092 |     
  riscv32    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b58983e13caa969c22e8522a0bf5d6d54aff3d22 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/68e37bb955930b47783df9298359cbbe2ddbdabd |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/06868ac970838846599ad28fd7a675b32e077ade |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/db1e6f440f791be78058adea87d20597b21301b9 |     
   xtensa    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/d3430cd57aa7a0d0c0eefecf2170635371893e2c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c89872e649076ef21f215eef834e89f1f7976533 |     
  mips64el   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/55125bcb4b5e660e91243e163026174ab84c658f |     
    arc      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/40f3498e4ce9ddb64d26aac653e48daa0580f3e1 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f3772dd65ffe628f271fa9b1a28fe42349f9dec0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/356a6e2d00b1c5be411f48666c949c791810a5ad | ORPH
    i586     |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9e29ef1a0d3192bb641f67b9115e0106ee1aa626 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/3ad756ecc443941fbe5a9a092bd1c8f70f61d8a2 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/afe7aa2cf36846df3269148a0233ec2a34a42c77 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ac2ce14cdb4b82b235b458d0b2c2351cf1362d0c |     
   xtensa    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/d8a651e25ebb55871392f98e54beaa9ae361725d |     
   x86_64    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/b6a76d66edf2cafcb03d70f3e86f8e84efbf6cee |     
  riscv64    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/c941b2d03cd00ed54f6a3ef2850e7fc94745b8d7 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/92cfdbddde8dfd8e1102f1ccd18c9f014317027c |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d9f53d7c4d0e0326fc537a5e937fb198fecf6f9e |     
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/66520f21e5d8c25e9c8c281a8f0e4999f62153a8 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/330a1c1818ef74ea29ff5fa41f47cfe016d6701e |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/8d049c25d6391bd4605405e66595e83ed599a81b |     
  sparc64    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/fb52bedb91184551e07ec61f00dc0eea542b1315 | ORPH
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/016c259373dcebe2fc1308daf70902cffde2a350 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/c2eac4a5c66b6b20cfd84df9a0e55d167d6218db |     
    arm      |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/01f97d793f28772cfce44f6979e39d8adff233af |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0499a513f9150022d2f7867c5966372b8494b5a4 |     



-- 
http://autobuild.buildroot.net
