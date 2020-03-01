From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 01 Mar 2020 07:26:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-29
Message-ID: <20200301072628.7737E89885@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  2  |  0  | 15  |
  2019.11.x  | 13  |  4  |  0  | 17  |
    master   | 183 | 65  |  0  | 248 |
     next    | 20  | 54  |  0  | 74  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 9 
               libglib2-2.62.4 | 6 
gr-osmosdr-46698a67e7e06419... | 5 
           host-nodejs-12.16.0 | 5 
             host-guile-2.0.14 | 4 
                 opencv3-3.4.9 | 4 
                  pango-1.44.6 | 3 
               protobuf-3.11.0 | 3 
                      bash-5.0 | 2 
                   libnss-3.50 | 2 
                       unknown | 2 
                  cc-tool-0.26 | 1 
                 dmalloc-5.5.2 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                libgdiplus-5.6 | 1 
             libopenssl-1.1.1d | 1 
                libxslt-1.1.34 | 1 
                 mesa3d-19.3.4 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
                    poco-1.9.4 | 1 
                    qpdf-9.1.1 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 
                     vlc-3.0.8 | 1 
                    wampcc-1.6 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/e4e887fea23d0dbdc74e992843d75664b6d8d4bd | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/6743e6a5a84816fccfd6c991358a8c6f3e088151 | ORPH
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/555677ede921b9e77937834ae407d69546de5080 |     
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/82d6c5b46542f2b770e8ddf710d0e1113e8536a8 | ORPH
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/47dfc37e2d398f976908bb17a71ca32730141f0e | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d2a62fcc49a63efcfdef91f5534d4225de307300 | ORPH
    i686     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/05cd10fc1092ecf0bea9b110bc7bbe6d5247c1f3 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/7645ae6b80ea7c967da71e634121a6aa323ae83a | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/c3c1d07200c2b37d89cbf199f7653d17af8b4dd6 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/c7ef88d7edc1930f44968ae707533abad02bc35e | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/69ec6c9fb3844365cde525004b707bbd0b54d918 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/1c28de77e4bb89d731be2b814443f8ef09b1da25 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/cfdd8ff0f4f17989ad968c8636ba083f42583751 | ORPH
powerpc64le  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/68019b2747b6d7ee50e8f0edf4bf24d67001505e |     
   xtensa    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a2892a2162e89ba57991be1cb32bc5701d7b22cd |     
 powerpc64   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/05d6b8deaad7d218770a978a850472004805e2ef |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/5c965eee69a0ec2439cbd0f242faf99aad7c58b9 |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/32642b681b41dd81775473b21022097b25e3887a |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/8a50714520da033174eaa1130f1376b3a769e814 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ca45cc5fe82fa6278697d4685f4399c499634541 |     
  mips64el   |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/91c5957f0bafd3ecec6c6e6990c4521c937440b2 | ORPH
  aarch64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/455721ac43e44e156ec85b4c5ab2f2df7de668f1 | ORPH
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/4562b74f0e84721507c803b4aafdf2d28a7f47de | ORPH
  aarch64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/813f425d80adc9e280ff1059343d0bee6bb4019a | ORPH
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/30b83ceb87a4340149d863f5d347d3f99c784c3e |     
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/f9b6e9e554f7771388cd68219b430a9fef0f7c62 |     
    i586     |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/ce069a31fa8ecc779fe2765eb2bd20549f00def9 |     
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/840ae05d9c978b8411e8bd9dcb4d4ac830f275cd |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/381ced8ca4bf163c306009967b887b0f848f5a07 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b7a8ee3d358869a79702c7478959e94318fce100 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/7d487dfec510ed97ba3c2b5fb1a2151facfaef28 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1fdd3a9d22913755390e960b176329351093638a |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/dbb29b85ff02dbbd1550ff116a3176528b80b06c |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e27af1b0e6c9f67b18f40c1098d2edf0086ee307 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ce05bd53f786eab9511ac3d2d94f655b3ae3f50b |     
    i586     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ee5e5350ac2cc4eb75664296c5d074d0907a1f91 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/a6ba4fc8566207c5fa566c178506251770d309fe |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/807f883a2637d78600ca8f1d476bda1044c4ab61 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/6878b02f1e9b451268bd1144324bdbf45f8c3804 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/c5101587ced63f1795e285cdc25a5c184b761ac4 |     
    i586     |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/d2f11cfe5eab0f276181d2524a8faa2c691e0b50 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bed0dc98d2427461f6085e58f0c000d9d75e8c39 | ORPH
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/6b956ca792c97981b4a11e9c482b1ec5d4741404 |     
 powerpc64   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/2e8206a96280685e6ea565f20cab8246c706a3b1 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/ec34396d151be2e1926a0561754bb7e444bfa5dd |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5c5650a2ad2242b1feec9268387ad0f2c3aa9b8e |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8da58608205a0e39044cb5a160042fdf8c3e4c5b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a3b28b7bae76733eea35c168b7239513ffe2ac80 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/6dd2fc631d9e6d91528f3d86b84cd58f82bc1a49 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/77f86fc9970f546b376dfed1cfc1f336928fbf14 | ORPH
microblazeel |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/8ccc6906f1ff5691b8bc9f28489bcc47985282a4 | ORPH
  aarch64    |           poco-1.9.4           | NOK | http://autobuild.buildroot.net/results/294b604a0e37aafbe085f0e6f0d1a83ab110c3a4 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/219a46c6a0155dcd68d8232151cd14857a7fb4b7 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/9a112857e67560d1c6768f2cff2c1f26e617ac88 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/e80890bbab5ae3c98febab0ff66b593d30a4b788 |     
  powerpc    |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/99c82d4775ed44bd04d0a48188ff590dcba73d69 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3582f63074939d163334e22d78281ad16a84ef70 |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d0cffa302087013df0289281c48db9379c01a514 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/117cf74a425f7cb92fb400aa458f9fa5d152bfe6 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d546eb36fb48d670f7606b7bc5b699eb3926ddb1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2bc983d26066225b3652468554b8bcf62e0f8ccf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4dea885dd52ad4d900fd21daa0559bfb90d22e33 |     
    i586     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/7706dd681a29a55d48307db5c6585cbb80ab2578 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/b5d57c1454fe499c03c5441bbf0b773be8060a68 | ORPH
    m68k     |          xerces-3.2.2          | NOK | http://autobuild.buildroot.net/results/ebf1e363f86f4a05cec79e9a1dbee9a2b5ec09ca | ORPH


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255323  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255632  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255635  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255638  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255640  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255699  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255771  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255780  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255914  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255954  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255988  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454256067  | ORPH 




Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 11
                   erlang-22.2 | 6 
                    brltty-6.0 | 3 
    host-python-markdown-3.2.1 | 3 
host-sdbusplus-4212292bcf13... | 3 
                       unknown | 3 
                  gensio-1.5.2 | 2 
                libtirpc-1.2.5 | 2 
psplash-fd33a9b3d68c89fa22f... | 2 
          python-jinja2-2.11.1 | 2 
                      bash-5.0 | 1 
                busybox-1.31.1 | 1 
                classpath-0.99 | 1 
                   gupnp-1.0.4 | 1 
                 haproxy-2.1.2 | 1 
              host-grpc-1.25.0 | 1 
             host-guile-2.0.14 | 1 
                libgdiplus-5.6 | 1 
               libtheora-1.1.1 | 1 
       linux-firmware-20200122 | 1 
     linux-firmware-legal-info | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.0.0 | 1 
                openblas-0.3.8 | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.44.6 | 1 
         python-markdown-3.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b457671d8da944a12f9c317199c631a43990579f | ORPH
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e0880134c2dfc85aba67c9f59cba8b675c99c4f3 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/218ed06011815e53dbda65b4eb7d7d1a48ae86fd |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/aa29bf589e1f27e3b1bd55eb144904061d8b7861 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/977299ff215863c72a73212c6b7b68e8c6403acd |     
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/cefb2d4742cc2462decfe1bf8f31580f1c330710 | ORPH
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/f84d409060a812a6194d85cdf93475f5bcfa3019 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/91cd5efa21f391aa51531af24c886ee030d74690 |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/7f4b740167f05a105562189e62b135e20b85d40c |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b1e1f4997f27787de84d682f77294c5aac0299ba |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ad766cdd23cc36841bebb329cb83bed0f63b823d |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/401738951c501fdbb75265d84e2bfa31aaa06c9e |     
  riscv64    |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/54f03a3ffd88bfbe20854aa13ecfd2b132f86687 |     
   x86_64    |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/a6d1e67485463c34fcad0559a65b6c745af4908c |     
   nios2     |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/2f1cca22261df19f301d15202e9af26ec94f0a7d |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/b6a3f6e5062866ca8729da902dbffcf58aedfba2 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d7f0403cb27d0f08cd7100902a40e17eaaf3e851 |     
  mips64el   |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/f2010f8b2b373f7fb0c4b1f0ac6caaf810f97c83 | ORPH
   x86_64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/7ed1006ecc04ed70d664eed0fdfd08a04d1f0b3f |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/d47a93f6b99be3dc5d6ad0cddcb58c1155626164 |     
   x86_64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/c278d3eafbf6e89981414fdf19eb9d7161cb9f46 |     
  aarch64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ac723e922f003ffbc4828171f73f47794123a824 |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/51526bdc579116e2bb1f3fc4f6ba868f65540d85 |     
   sparc     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ad1e88c60663547d16dda5e46ca53103f276f02d |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/04fe78705c5bbd4a72d7d8bc07b54427c6970a72 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/011d8b70a5b0e11f1fccb2f3f9d5bdf87ee711e6 | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b5890e98d2deee7a7a2ad62440a8ee0030dd66f3 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/26cb3ebcf33f8e665466ff7f93877029eaa473a2 |     
 aarch64_be  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/df46da2eb91ddab7854c9192da8b9a66fe7fd612 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/80194b31a300df358d5cf00b93368fcffe8be192 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/73253441ec013e4fae607eac5c20a6a2f9502888 | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/c1a4a999f8826ecf14f3a9e5044ae6016bd6238e | ORPH
    or1k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/708cd391010f16a01148d918be8aae82cac78c12 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e84047173fd5d334b75a228778f37d3c9081fcd6 | ORPH
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b594062ccb4ead5ec6450782ef014cd12da21292 | ORPH
    i686     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/09ec5d33d0b3f54472415b8644738ad49d55e30b | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/eb1b706e65c16ce89df87f83f3f6e447020031e4 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cbcad5243c94280a1b6ff14363dc90c4b7becaa0 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e843304e80b84670279080aa1be11dcbbe0193ac | ORPH
  aarch64    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/46fdacbe4064d72aaafa9f52741121d8e4fe64ab |     
    arm      |   linux-firmware-legal-info    | NOK | http://autobuild.buildroot.net/results/372abcf91592ef4a1231de6364b0848ff131e432 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/ec49a869a3757acea4263c68f131bc63e949bc82 |     
   x86_64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/d0e21a25035a535d58ee5cac79d45aaa19d79e55 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/9eac0f25a4565dbf7c9b35eb28d791816d39842d | ORPH
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/6224320a69b61eb1418b4d036f80502f5a2f3501 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/6a6a5f351bdc743f487ac67b7a14f044f4120cea | ORPH
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a3c4915d7181db751a2af493b45d17b00dbfbd4e |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/152c7247d0666dd6072eef9cf2b1e46f82551002 |     
    sh4      |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/bbbb5277291e6ec7f2e0eff134c5a980838a12e3 |     
    arm      |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/dd5f151b2c9872476ab63c529468d0b37a0374f5 |     
  sparc64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/09109c219f8b236fc4b4ed378ef295dc748726c2 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/498cd3ae8446318a334871fb8c619ee0bc526808 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fa17bb24a93ff5277f6c515ee8b9ea721300d8f6 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/865bd4af6229dcdbce48efd933bcb7ed2e4dcb92 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/3074276149b0a49cbe387816b32037ec626d4b3f |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/8c2d00c0c0af370b6ff03f6cf811efb4ff00feaf |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

               libinput-1.14.3 | 1 
                qt5base-5.12.5 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libinput-1.14.3         | NOK | http://autobuild.buildroot.net/results/81f49f73a6a1e17fd5bf5f2cdc3a0e14b58dae11 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/f567b06d211f0ea2703422bccdfe675235adeb88 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/6dd9f5e860e5e4d03981ad028f44a26be4b764c3 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b114d3821419daf8c1125bdd21cd8b493c57f789 | ORPH



-- 
http://autobuild.buildroot.net
