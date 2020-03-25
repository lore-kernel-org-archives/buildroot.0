From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Mar 2020 07:25:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-24
Message-ID: <20200325072537.2D102881F9@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  4  |  0  | 24  |
  2019.11.x  |  9  |  9  |  0  | 18  |
  2020.02.x  | 11  |  5  |  0  | 16  |
    master   | 89  | 57  |  0  | 146 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  connman-1.38 | 9 
               libglib2-2.64.1 | 5 
psplash-fd33a9b3d68c89fa22f... | 4 
                   sdl2-2.0.12 | 4 
              host-grpc-1.25.0 | 3 
           mediastreamer-4.3.1 | 3 
         python-markdown-3.2.1 | 3 
                libtirpc-1.2.5 | 2 
                oprofile-1.3.0 | 2 
        perl-crypt-ssleay-0.72 | 2 
                    tslib-1.21 | 2 
                       unknown | 2 
                     vlc-3.0.8 | 2 
                coreutils-8.32 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
               erofs-utils-1.0 | 1 
              libeXosip2-5.1.1 | 1 
                   mimic-1.1.0 | 1 
              moarvm-2020.02.1 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.8 | 1 
                qt5base-5.12.7 | 1 
                  ramsmp-3.5.0 | 1 
                 ripgrep-0.8.1 | 1 
                    rtty-7.1.2 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/303eb2b30b09408e016253d79801f25621009f8a |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/8c9d56f09a0c4a16e4e1f55ba0dcfc7c14f16c93 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1758a0ae959eab0bc9e872f052e78714fe7ef587 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/3eef81d3e91058eca03ee74bc3f6ec544de285ae |     
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/01a7e5fa9787852953666a1652211332feff312f |     
microblazeel |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f2e67a17c48a219ef06ba3f46e559739c48bf372 |     
  aarch64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/8072edf49be8233ff8d0c46258f30872837da1d1 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/d768111edaaff772bcf5caafd61b66b3fac9bcef |     
  sparc64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f76648d3f1b69213d6dab870a125a4c24de9bd59 |     
    or1k     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/7b899f2939da02d559ba40e65931be1cd9de74b2 | ORPH
   sparc     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/ba9d96a2cdf687176de1c8b4685947712babeef5 |     
    i586     |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/340b98caa45bafd43f109002be9da59ba7f6d971 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6a5b00b05f186b3ee57c92665ace808a6c3c5c66 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9cc08cbffa027fad6f0bb874a88e10559f66f78d |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/cb83c683a332cb981201b1420d41d6c5623c69c9 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/87c5e64f4198513bc7ad878982fa66c27a78f3a2 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/38e132da342d4ba52ccd3644cae48cc6a71f8805 |     
  powerpc    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6c835bfe05db9f80b4340b230cbc5bd7d59c6f7e |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7c79f0172501ab956bf1903558991299e91872a0 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1aeaed2738e789470e26fc1b34c70637f1887241 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/41d1bf7ea30fd72ba8e654d7274bab7056eb8833 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/62c2cfac501cc00bf0a8898e11c863a7acbaab99 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5c43465df5dcafbda39667e11c453d869c30056a |     
  sparc64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/4e8714065de6ef3ffe81ae54396ec345367ea74b | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/bbea21d7529219827f2919cd4f9760678f6a95a3 | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/0657c11bb122e54a267ac669f2db6973742c6eb8 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f41a7584aff13f43094f22a839cdfb2eba7564bf |     
    arm      |        moarvm-2020.02.1        | NOK | http://autobuild.buildroot.net/results/6ad8295064920f600f9b55459415d01023707cb2 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/31cfae2f69e950dddde0278bf73368b3d5baab05 |     
 aarch64_be  |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/8115f14d49de18e393f1a9aa252b759c68cbc53a | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bf6785f7d299d4848f29d861f69eb28d387306c0 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/df1959c5922952622af7b2941ba2429d4adc57d4 |     
   x86_64    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/9a366a263e4d33ac2f3120501c619dbb93d7aeb0 |     
microblazeel |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/660bde1efcfc8e7c8416ba7ad105fc0037217e5e |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/746ac6eda7057a75621f844c4b1cc35b52c2a792 |     
    i586     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ab7b8eeb2d70f81b72b66c0d87cc50708a0fd853 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a798bb6015cce5b70195f3dce2dedac4552e4a9b |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b34bcef75ad107f88855519b2a7a2daecdb16bc4 |     
powerpc64le  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8890d81c4dfe8a702faf3a1436c3fa643c1da764 |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/3506737cc84fe8fb809cc277aa4a547db289d0cc |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/80da724dbe96219905255b9b1bf9e020e849900d |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/02dac640d4fc79080f672ace05969cc4dde6cd21 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/3c6fc1a10cc851e7d9dba82e15c9830a98fd41a1 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c60bccaea83c3736f67705dd5c26c91a10701001 |     
    m68k     |           rtty-7.1.2           | NOK | http://autobuild.buildroot.net/results/ebd483ee87046396db39f966e34f93c3d1123202 |     
   x86_64    |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/189254c00c050fece3cba3c3c270dc1349493f8e |     
  mips64el   |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/fafd20a01591032662f9ca025fcea3478239cf3c |     
    arc      |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77 |     
   x86_64    |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/fa6a00cd6a6e8e9d7294e1e171b87feaf50603dc |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/b9f582d8f9c205898a3a9815a78ca7329ccab297 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/75139d24f049df08fe15049d7ecf3effa295e8b9 |     
  mips64el   |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/f2d28c7883a44f532ac036f57a7bc49b10a075ad |     
 aarch64_be  |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/240d75a55dc4449d824e45455a5751e55fa1c177 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ae7b85f46864b7944021684f01f4f9af24e08a1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2bdb828efa1e79282dbb2469649e388a72a60ffc |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/455445a8c2507ba0c0829e1cc9c06dffbaad03d9 |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/127e8fa44164538464c157e919d2a4c23b4e2f40 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
host-google-breakpad-7515ab... | 1 
             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/9020e975ca16f1dd39dadbcf581eae8d229bb8ae |     
  riscv32    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/ad99c5c799a005a49b957c42fd2f020d4603d074 |     
   xtensa    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/122596b3e00c24bc6de88cb0852c1283b09704bf |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/2a45778deccfc4d0d61ba24b35cbe638dbc86736 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                 host-icu-64-2 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                nodejs-12.16.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
              python-pyqt5-5.7 | 1 
toolchain-external-codesour... | 1 
                     vlc-3.0.8 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/1987fe81b923d7de3a3102db13916d29dc529159 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/34ebc9176953dab1d1ab9112deae1aa89403a0f5 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5a47d6b40df4fbb4f33f0061bce6591df1834a2d |     
  aarch64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/ddb9eb2fb1191596c0c6e5c83080a9b7c9f2df72 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ccb09dd9589fe2dc08d3478c2f4c3a58462785d8 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/c8061cff26ac8dd35640b2ca1ebb4fb747df19c7 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a8d3432bc0f83716850d87a647e275f3ac7190cc | ORPH
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/744a982b2453c3bff1d67544710fbbd20ac8f7ec |     
    or1k     | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/bac5cf70147252e8cadf2d97075ace3c891ddd65 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 1 
                   mpd-0.21.19 | 1 
                   ogre-1.12.0 | 1 
                oprofile-1.3.0 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/b1bcca1807d7c210be014b200348bd3d4a0922d4 |     
   mipsel    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/704ccd6e2ba89a8eadfc00f411fc25471b3c99f2 |     
powerpc64le  |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/0b1ff5c63cc9427ce41133f9ef7432c50f5b0dd3 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/583d281c6cd2aecb65556080b379db24101ae3a8 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/1ed585512e7f41f9e07933a6a1a11eb4c581374c |     



-- 
http://autobuild.buildroot.net
