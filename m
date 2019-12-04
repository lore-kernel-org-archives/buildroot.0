From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Dec 2019 07:12:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-03
Message-ID: <20191204071302.0B9212288E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.08.x  | 11  |  4  |  0  | 15  |
    master   | 117 | 69  |  0  | 186 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              alsa-lib-1.2.1.1 | 17
                    libffi-3.3 | 8 
              alsa-utils-1.2.1 | 7 
              host-grpc-1.23.0 | 4 
       alsamixergui-0.9.0rc2-1 | 3 
                libgdiplus-5.6 | 2 
                 mesa3d-19.2.6 | 2 
                    mpv-0.29.1 | 2 
                oprofile-1.3.0 | 2 
               protobuf-3.10.1 | 2 
                snort-2.9.14.1 | 2 
                 xvisor-0.2.11 | 2 
      gst1-plugins-base-1.16.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                     gzip-1.10 | 1 
                haproxy-2.0.10 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.2 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
           spidermonkey-60.5.2 | 1 
                     squid-4.8 | 1 
                    strace-5.3 | 1 
                 systemd-243.4 | 1 
                       unknown | 1 
                    vnstat-2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/d7832e225b231c537924c5fb72ab91478a630f7b |     
  riscv32    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/5be06a42e4fec1217c699d85596e2c08c7ed4c84 |     
  powerpc    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/68ee89a63e61f0a4b166ed5f2a2b07b00689981f |     
   mipsel    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/b235a75091883e7965d0d90b1c234edaebd0cc6a |     
    mips     |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/4ea0dfcbf418eb099a536e8501a02e21c907159f |     
    arm      |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/0173a76c0b9f25ab0e14bdd976591f1c2fbe9472 |     
    arm      |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/b3aea7b225df74a616eb01730c3b245eab428b0a |     
    arm      |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/d884a3f943f191debcb98b0138e22a574ad2e279 |     
    m68k     |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/6190cf38aac1d965e5fa811403677eb0825151b5 |     
   xtensa    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/4d91c9f82a2a61c50c457a851073b85cc09ea345 |     
    arc      |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/555e66a59db19b97b58217e01f60acfa63cfa4b3 |     
   nios2     |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/52dc03a4bb31abd7aa75e75ba22bbd926bcc1147 |     
    arm      |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/9cfbf836eeb8d482b9e575d8d1a7b16373e342fe |     
  powerpc    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/67417173808c442c48a2e2f1c32af0fb3d9e203c |     
  powerpc    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/0f82cfac828eded5cbc187e3582b1c95c06f2e6a |     
    m68k     |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/df7c65bc3c45a6c31f894efd6a8c333a1d0ffe33 |     
microblazeel |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/16facee63b137fe58efacfd3016fc237bcba1f33 |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/30eb03e4d70a28e264a38df066955458d6021427 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d7358af2630043ccbca4e7427f8ac8e25bdf5547 |     
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3a50bcf5fd4ce2c7fcaf742226fd0b0b4877d2df |     
  riscv64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f3217452209ca2049bd0e0c724ba094347ff634b |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/252ec5fa18b5135166954242f8f8602f5cc3ef3f |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d0fb760669b02b813115af04adcf24530d35f4e1 |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/812bc3f89ddf75eeff5f74dd46921c0be78f53a8 |     
  riscv64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/883e88ca399a0f5b3f13df08a65e6191662f70e4 | ORPH
    sh4      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/edd500b054192231ef30922775bb732e2b556a75 | ORPH
  riscv64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/013e1b114603fd88e08a079738a1266f31d0d6a0 | ORPH
    arm      |    gst1-plugins-base-1.16.1    | NOK | http://autobuild.buildroot.net/results/724522bd9c42262808d5024692c057566ba71ccc |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dbd701f9c0e3bb49fa9b2744edba7e323edcaab4 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/2309a0eb04066f3ff06d606b1ed4609c389d951b | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/7876c333409adaebf84981eb04711c1b33d40362 |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/7c633d804d26f68fefb726f5dd9b20e5f5e27966 |     
    or1k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d5da4818757975c18f209970a973455791dee979 |     
  riscv64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/810be73249e063ea83dc114cc29748ab1a4be273 |     
  sparc64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e86aa6e940b0c4b378f9b15837044916159181cc |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/db0bdb1aa777b30c84c12e424917545f2c48fd59 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a6abbd3c86ae855a695f94e029b0959f3bee0ecd |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7796f3e9e9d273b3da9d195e145a51d6f7759e51 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9ebfbf670e627d9ce6d0681055be7df46847a3ef |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ef9559c04c4d2638b8cf60fb855a723516a52f71 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e3252ad0d90ae2d0d3fe974fc066aceb01a75270 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/02ca8747dce16a00e86f3b0eef0703e8a8d9f778 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7028202c9936302b5ebae8c95bd5924a9a9c5045 |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9e19ecd06f8796b24eee0a39d447bc05863e38d4 |     
 aarch64_be  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/47ded9924eefbf163949d8331c477591aa8b6dbd |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/81a68cdbe3c3c132bc8c09893a6b1bd6af0f1bf7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/c391cc4f95e44898b1176a0b61a4e8af4692a6df |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/39220387ab0bec13d7300062decab0afece5d553 |     
   x86_64    |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/4ab83716cb7064ec6672e1da76bce7d74f2d57c4 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/dd2f0edf9cb136d2f7c3a75727959c169ed2cd80 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4f267fc238da41515241b0fceda9e11f0c3c31a2 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/37f380ac4adfd6696dfbe22b937d1333b79841c2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/477ba18bd8ba340aeceb2a9778bb66aed13cd5ce | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/746067352f2f26bdb7eff484a338c435256f12f8 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/76e5730355f14339fcaa12606d9c2dcc2f18d6e6 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/587c9f1f48709a160764ff8aea81a3de58fddd03 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/9473b7c9566859e72fa8596ef5b9a8b9dcf62583 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/f56c93cb80b9ee04d0d4153c5a0c8d04a5f74b68 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ab0cc214746e0afe637d290af582bfa2edf2c588 |     
   nios2     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/cdf522cdb34a678caf3ea1a37beb4b531440f232 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/fd8642f59832f53108b7859a1bba30a1dd6b580f |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/192661452fd522bf46b23d5a7a522eb853a984bf |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/b1204869235b2f21d132af34b1ea8e295caed577 | ORPH
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/ce70f5508bdb393146d8ac07c4bee8da18870c8b |     
    arm      |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/6f5b1065859d866af6fa719f611c3ea7f4b88760 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5889e8566ae1b092f7d9f91efe7fbdc5640f245b |     
    arc      |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/37f52f34011e3a0c04a4cd159a4138faea58ac41 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/80068e5945c9eeb290afcf0e9c7384347ee5e84a |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/cd2c220b9528c5eae737bfc223a79af3464e8dcd |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e3f5be0d188f86ae69d1c1e3152460ad3cde61d0 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 2 
                       unknown | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0352dc7410d66e483862109c5568b3913fed69ad | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/325b08afd0faa73351c5f60061308900795bbb00 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/433987dade92fbfb1ef309d78f2aafea846e3084 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/6623496b2f80fa4b91ed6e8cdee37e1a2adde2d1 |     



-- 
http://autobuild.buildroot.net
