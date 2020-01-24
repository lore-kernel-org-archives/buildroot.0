From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Jan 2020 07:13:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-23
Message-ID: <20200124071326.5F93487708@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  3  |  0  | 21  |
  2019.11.x  | 18  |  2  |  0  | 20  |
    master   | 111 | 81  |  1  | 193 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 14
                apr-util-1.6.1 | 9 
                    brltty-6.0 | 7 
                 libnss-3.49.1 | 7 
              host-grpc-1.25.0 | 6 
          libpam-tacplus-1.5.1 | 4 
                    olsr-0.9.8 | 3 
                      bash-5.0 | 2 
           host-doxygen-1.8.17 | 2 
            host-mfgtools-0.02 | 2 
               libtheora-1.1.1 | 2 
                 mesa3d-19.3.2 | 2 
                 opencv3-3.4.9 | 2 
                    parted-3.3 | 2 
               acpica-20191018 | 1 
                 binutils-2.32 | 1 
                  cairo-1.16.0 | 1 
                     host-llvm | 1 
           host-nodejs-12.14.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
           libwebsockets-3.2.0 | 1 
                     lxc-3.2.1 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.19 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
               protobuf-3.11.0 | 1 
            python-cffi-1.13.1 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/e33d14a8cef0ec4837bf781f2748b9464fa2e935 |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b4ac327cd9e787fd5d26d49368473d18ead1d0d3 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/cc690069fa09b4320e31bc3edbd01916e9187ab1 |     
    i686     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/447da69b03cc18355424d9c47d6ce36e9e2661f8 |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/04bb997ee1d75c0c51536420652b77299cf718ac |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e377fd33a98911d9a273942a63c6d531152ca9eb |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/bbdac657aebbf87365c0d86cb34c8be58930a17d |     
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/37fe508197973eac690e8e5aebf39cd7ab71bdc0 |     
 aarch64_be  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a44b769d72993ddc5a30d8e41763cc7ca8c2f7a6 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/72e7333fd69e67952d1b61972663afc93ae105be |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/3aef899a2f90518ff9d308db0a10a84263423200 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/17dfe19d58bc2adb0e4ec028a7964a7679c51089 | ORPH
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/0870fc01d46a3adc730a324230232e99329c21d5 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4891736d5d7644287feefc94c685a73fbe227c3a |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ab5e849f74741f047536974326331bef18b47d46 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2620053e6eff47d8c1d6983acbe5ff8b127270a9 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/34b0450ce7483d1ade3cad858fe4801e7ebde9c6 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/25a5273ecd7881fd6d6f1b2169082b4d8caf6112 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4b53bdd164fd22c4917b5dd156d8b0deba10d415 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4f2d3a4c9360cec3af670a52ce54ffbf52917a07 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b8f113c138d3b2cb1832968863b0a61766f4459c |     
  riscv64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/ad059e41ee4681c3c3c8b77af743c9e6401cee83 |     
  powerpc    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/d2be9ae742702bb7c456343443cbc28197cef4f5 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/78538c166d4b43689647d1146244ba96ef426c3d |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/af87de32215e2c7670ce89cc6cd39996b02e8db8 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/10a253b0e07bdf1e4713ca079821e4288dbac022 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/48077c3d5d52064597dfec7071ed67da44ab7d77 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aa66b05139e97c49c119d720573b306f97168c0c |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/cccc93991f22ff43fa05ec38742b128d868fb5ab |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/6d5681252d4e1d3befde50e1d30492a86058af48 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/7b151be9badfe39264a5c9083aa08b2ff70047a7 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/6f0d13cdf684eac48d57e1a00478002a61b6ecb8 |     
    i586     |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/2f9aefa30f6b572eb6e280e72480ddaf3554b9bc |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1b35f6bd3be7d4f8f5b3640309e9a9b208742928 |     
   nios2     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/ce5910374801f78f6ebdb2b6b19d0e1955357060 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/52dfbe27aa5853dc9146e240545c4adacfb04f1a |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/1d77e4e91f84bf52635ae763eac20a325de48d3f |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f039464cb85d4c43a4fee8c29b3c2ad24d482783 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/fff992211f19b4f606516886ec7f1273278300c8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/e3961ca9487b6dce2cd2d40271423013bbbf442b |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/c6277a72ee96b4d7481d08bc73c9ecb96a734406 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/6b2771d17b6a29385ce3c114667a4a2db4898e08 |     
microblazeel |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/4677534eb07805169d10b03307cb8298eb403cf0 |     
   xtensa    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/485fb4b570095df3899c82c443456e0ff7c7acd5 |     
   sparc     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/b58200778cf79a34d9655b178c892b3bede268f0 |     
    m68k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/9e9328283ffcb35bdf80d9b7849d2e7f8009cfea |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4b917bd8556e7b2bc9c82226ae044e2f56cb2732 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6a4a40205f66a38e564850f716ed76706405c352 | ORPH
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ac8cb25056eb020c909deade9a9d95e70f788219 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/923932850752e9d77dbddf000fb2c31e532a809f |     
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/a9dabc9b9a620bda0faa5e467ecef6ccc7840f34 |     
    or1k     |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/0239c3ccdf1015aa20061cfcd0851b5d3309260e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c8b9f594b3023dbc62c65ab4c87d0aef032654d1 |     
    arm      |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/355e5ef449447d559b93c65a3bb3123b3554af2a |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/22d144af546d8146eccb1586dab25b2238dfe3be |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/98c332822609fada9304cadccc0f2762ffc915f6 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ca5dba3b3df0a84aeb6f4b51267a140f3b8b1818 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9731e342b734b0e25b44d761c709aed2578e7761 |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6581b5e4dd2bd7d541cb065c2a53773f40377515 |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7c887c0ca818ec1026c8ec2988552808b062b6c4 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7502e04d8864bcb59d6d1edf4326fc762891ed43 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/49086d9ea4ffee52ae3bf525f563d5307ea9d4fb |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6c3c6b8d858fed8976ecf68d4d9bbdd1197df441 |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/93dd55ac25d4f4a0dd9337709c124c436178d6c7 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6dd95773f5da138b6819a385f31cb6501487d5eb |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0bf2d39b89997cedd4bf97035eeb8c760f0e3b54 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1e042cc402e6be09ff32c7fed9a6605552ddfc1e |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/bfdb1d791fd18e7b8e09bee46e61fc6d91fb6a5f |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e03b8719b9d73586ffeea98404609ca444ade910 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1538d4b722d0ca353fa42d991ba2dfbf8aecceba | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9e3fa4682739327aed4351f16c482825e414ad0d | ORPH
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/380e220f6988d2e6b6e19ed52f96a65d1861ba0e |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e15421617d6acf5abd591757dcebe745c184d536 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ca232cccbd8d36749d5a18e8d856e094c9616991 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/9f11472c7b051571d6498b922a3a002d98f376e6 | ORPH
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/113186f0d73b5b1f526dd5a42dc576e05aea17ec |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/f27f7c4d72b6904bffe7a40eaaf5ef5863c9a8a6 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/7be9d4036c7d92a46fe6a7b7a3c784b4548a4514 |     
  aarch64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/c3f81dd0d8a2f532a7df0bbb3de1259d3f7a4563 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/3d8da68c3af74ff42e6925ad3371fae32fb35896 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0c7e06e85dc3af152f219c4a23ede3299d8b1bd2 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a1b5dd24e6f888449e099aba432a2a6d1ad70ebe | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                qt5base-5.11.3 | 1 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a3049a84d572121970e594532c599474838ed35b |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/2f9785c96f717bb95998f597633de9892479eac2 |     
    i686     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/5f9fc089ff37eda0d6cb3fdd2750efa06074b89b |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.5 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/07bd9cdd7434e6517cf3380281ce7f0040ad282c |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/e7a0df4af451178e13bab5941e90c3c4809e98a7 |     



-- 
http://autobuild.buildroot.net
