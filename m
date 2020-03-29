From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 06:26:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-28
Message-ID: <20200329062631.A05FE86DAF@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  3  |  0  | 11  |
  2019.11.x  | 10  |  2  |  0  | 12  |
  2020.02.x  | 13  |  7  |  0  | 20  |
    master   | 96  | 64  |  0  | 160 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

psplash-fd33a9b3d68c89fa22f... | 10
                  ffmpeg-4.2.2 | 9 
                libtirpc-1.2.5 | 5 
              host-grpc-1.25.0 | 3 
               libglib2-2.64.1 | 3 
                   libnss-3.51 | 3 
                oprofile-1.3.0 | 3 
               collectd-5.10.0 | 2 
                coreutils-8.32 | 2 
               domoticz-2020.1 | 2 
         python-markdown-3.2.1 | 2 
                 rocksdb-6.6.4 | 2 
                       unknown | 2 
               belle-sip-4.3.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-nodejs-12.16.1 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
               protobuf-3.11.4 | 1 
                qt5base-5.12.7 | 1 
        qt5imageformats-5.12.7 | 1 
              qt5script-5.12.7 | 1 
                 qt5svg-5.12.7 | 1 
              syslog-ng-3.26.1 | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/70a0080b7db5e47ae8aebd4c56ecd48951f50d91 |     
  powerpc    |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/24d0ba90ca96cb574fbb5f32ea51ebe4e2844154 |     
    sh4      |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/fb2085bf8e44080dc8dc28b9c827508318f69e03 |     
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/037e394d4a55f3982bc34b9e1ac43a82201a0a7e | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/4d05ef32b3d456f9d5346c0895c241b9b2b1de77 | ORPH
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/193b8dd97c927805679d874dce6e27c685ce1f28 |     
    mips     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/d78a4937f17a1b67360e1b19c9ed295a81a2afc2 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/99bdfd463b624156d4d9abe6a3c872bbf5d4f3f1 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/677791f03bd8d9f913fca680b0eeb3ace32cfef9 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/e1941f7adfe271f83b56780cd6e567c062df4810 |     
  sparc64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/366e94b99327676bf541072987911816a1ee275f |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/a5d714d2dbca74363c3ed0f3fa221f6a07a12f79 |     
    sh4      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/94a965968a1b9c9f4dc74e44570dc2670da1e7e2 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/90285065560963809d066d5dca7e5a608fca475d |     
  riscv32    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/5e17e4bd64e53fdca76f3c3ed84b483bc8cae84e |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/62cf6294faf2ecf2ddb30ede0868ed4dd6e4e9fd |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/0a3090800ad2bdd12cf860494120e504f212e0e0 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3b4323f2a9f4f90f7f63f27d013fa5316715b66b |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c083e7b37efb2f330652133131fccc4899153866 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/99a3f394033e22f58677ddda8c53357b092932e9 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c84d831902dca0b08bfe13aff2860bd67d062b52 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/0f902b167c1034057db90a370eacafa18d5ec23d |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/88c49dc9bbc7f80cb9111b62c7b308e142c47078 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/17a0faeba057d622b7b48d39d8fdca8c4f9c47ec |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ab30bbe6ef7a8f986fe91239e82fefa32cc73733 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/8d78ad62eab8b7fb2853f58cfe2bef6b9495b666 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/13053a7cc752bc62ddde45b973d43d946c5d9b81 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/436b0daf1eb0000f01a2ed6fa8d5ccfc8f920966 | ORPH
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/308165352185ecb5c6e87b8020e599407c00f160 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d86cbb07d81146527e8d2e66596f3e5925451c97 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/edf00be79f853b7e2fad4474ff4cdb97244eb607 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/aa87e93ebf1b44c9871ec1630c1e1ded09ce56fd |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ed3db23ad354cd25fa8573db9b3a4479d20cab79 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/38f979b9e50ecaff86d5799bfcdf314b628288e1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/55fd22de4a9e6f1c80735e642f9b682adbd4dfaa |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/3a7c1882f54f39b0d44c3763015b4ba2781d108f |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/fee814046e5aeeff93b55bc3a62a6a1af8fb21c9 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/2a36533545cb7e9595fbe9ee48500c441832785c |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7947254274730357646444ba86291e03700981ad |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/5aa0b0f716f0adda388bd145eab87c8eabb9fb37 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/66533446cc33725a90c1ff206f920c083e59da22 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/18246750e12ec467cfc65332cd89f40557d77d9d |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a27a9f0757065be7fd411df880414fd05b462a89 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b6179abbbd18833cf773806761c20af6f28b9b88 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/faefd66aacc4d3180c6ad4fe6f7636bc94e0d774 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6d5a13c6e5b07792fc7ef156c3685e8d11494e7e |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1214d96fd45ee7908b9f2dd54907fbf0828a89e4 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/27ffb1bd457f2e2b3e02d2a31381dbaa9240252b |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/eeff308c1e41f0446b1c1e73b3fc815127494f3b |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/367457c18ce2a46a7b64b2007c9351d19ad917b0 |     
  aarch64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/29fca9276f37857c9d6e8502d6a770d17be2897e |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/1e5a9f1afa383c05c8348479f4bc5c231de23277 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/a4924d337b2bc0d9f9097e132c953b4d001e6cc2 |     
  riscv32    |     qt5imageformats-5.12.7     | NOK | http://autobuild.buildroot.net/results/aac1a8b58bba1c7eaaa034a166fde42f9c373d0e |     
    arm      |        qt5script-5.12.7        | NOK | http://autobuild.buildroot.net/results/e732bb6df8e44ebf830deccd23762769d275a94b |     
microblazeel |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/a5366bae583b290f4938eb80c4acf75ab5e70cba |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/04c5afff034d8d71d11b95c998e3156292852de6 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6e559bbf2ff9510733efd71efef6f5c9018a008f |     
    arc      |        syslog-ng-3.26.1        | NOK | http://autobuild.buildroot.net/results/e672ac7fe8efc395807655a555ec18f744968e4c |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/26896938ff328e1510658ee51771339f115f27dd |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/617244551d6b7fb05cd6c9853dd185afb2b5aa2f |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/61b2214dab7422c7c7be9690a636ce0a01e91bf7 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/c8a94b8899d9698600e7c024266c1f13f43a0d33 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/18fddc79c3249249670841332ef99a1962af891a |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488815924  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488815975  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488815982  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816085  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816075  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816076  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816077  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816078  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816079  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816080  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816139  | ORPH 
      TestPerlCryptSSLeay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816151  | ORPH 
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816191  | ORPH 
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816262  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816218  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
            safeclib-v03032018 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/08e8196bdb35c1741bba04d70ed184d6c352d65f |     
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/03af1497de7117dcc6dc2176c4afae3d45096db3 |     
    arc      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bd4e898b29fd319f662247101480150083eeeefa |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                nodejs-12.16.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/fb0861bacfac725c98081e828a1562f8de36e801 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/86c34d5c3c8791cf4340af1681ba58d6633a7415 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
                 opencv3-3.4.9 | 1 
       python-matplotlib-3.0.3 | 1 
                sqlite-3300100 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/83f24763a049ec964d8e95c141e0cf3661642833 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9b0e8a7c1c580c10780cfee63c3f63e89efb913f |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5ab759ba3064df193ffffff99c42bff0bb1016fb |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/8e1bf93a43a2913ac06415c6f6f9f49b3dd8dc02 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/70c43bcffe611e7446eb4e2f7b6412bfea1088e9 |     
    arm      |         sqlite-3300100         | NOK | http://autobuild.buildroot.net/results/f4a5c4b6058025c928add3a8e32b0bc43b3a92aa |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bd83a16574ca1dbff63a7be20f8197492d287d0c |     



-- 
http://autobuild.buildroot.net
