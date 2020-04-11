From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 06:27:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-10
Message-ID: <20200411062706.9D7B8868F6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  0  |  0  | 13  |
  2019.11.x  | 17  |  2  |  0  | 19  |
  2020.02.x  | 14  |  3  |  0  | 17  |
    master   | 125 | 81  |  0  | 206 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      ell-0.30 | 16
                  assimp-5.0.1 | 6 
               libglib2-2.64.1 | 6 
psplash-fd33a9b3d68c89fa22f... | 6 
                     avahi-0.8 | 4 
                  boinc-7.16.6 | 4 
                libtirpc-1.2.5 | 4 
                       unknown | 4 
                  zeromq-4.3.2 | 4 
              host-grpc-1.25.0 | 3 
                coreutils-8.32 | 2 
                 jbig2dec-0.16 | 2 
                 openal-1.19.1 | 2 
         python-markdown-3.2.1 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                 clapack-3.2.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
              gnuradio-3.8.0.0 | 1 
               libgtk2-2.24.32 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.0.4 | 1 
                    mpv-0.29.1 | 1 
                   mtdev-1.1.5 | 1 
                openblas-0.3.8 | 1 
                     php-7.4.4 | 1 
               protobuf-3.11.4 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b34e66bfbb1d8211179345c68747b7b7fcdb7ecb |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/64cb15edf43d99663a49a4818b205a37432c96a6 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b82420ab608a1129bbece9aae66f0d229294848d |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/bb896d1b8a7c380884ab06dc121d993c2204f49b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/86a1e2f9b4de49f62eb180470bf9ea5ed5d3190e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9035d6fe012e94926945815117d161545a5f8f0d |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1ca5b4f18f83f28ee8c875614c1f07b27b98dcba | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9a8f34f4b39cbeb01bdcbb766591303f5da7667c | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0ad40ecf8af9d922f9064691b18bad62bd37c2ee | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/973cfe4a4d0547af4b3fd76c5d50ca5edd952b66 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/df84d249dbdc5cbb4a783ecd4e3b5e00e287e594 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3b0a185f31e2441f5efd822b837f235fd05b9ace |     
    arm      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/28cca3958054f9039926b624d4befbb28cb402d3 |     
    arm      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/26ab8024e3ef70b898981763f4ea89b647cc9f4b |     
    arc      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/d0b031f8ff502b96a9ebce271584625c5cd015eb |     
    arm      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/d5439269934aa02de732c2b475d8c0e916938564 |     
    arm      |         clapack-3.2.1          | NOK | http://autobuild.buildroot.net/results/a7cd49af036515cd8fe8dcfec9d28ed24bc24949 |     
    arc      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/fa0b73b02a632594eca42908a1208cd039c7e382 | ORPH
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/aee93ea7a21c4c4a2360c8dc231f3dca32083bc5 | ORPH
  mips64el   |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/12aa9f35f5631d523a722c5ae92b8b6600dfa63d |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/2723d2b6205b9dc06ed9b8aea24b02d5090a22cd |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/dd0fcaec5f51d56a3ca5261bd62a071a8f897ad8 |     
    i686     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/56f5d62905eb3024efb0c0e47e6d13862639323f |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/16f336598b90c790f8ff91466bc23f38d3319503 |     
    i686     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/b4be697a2fd842b8ebfd2b9b955215858342d6fb |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/9ac3d90bee94f67e726ea13b75ac6f6c96ff269c |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/88d8d13def6426bd6a8636f1981dba8cc41b9963 |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/04af8137d59b02c1e12fa650c43b46f8a2a0a872 |     
    arc      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/1efe3441fb856df8b67c1dbcd3249c2b142b1626 |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/359e72fbd9173f74805da98663ffa1edd24f8edf |     
    i686     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/37054051b65223742404a18af03fd2c4fae67418 |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/3a9e47324d580135c5322ac01f08dcdf387ca34e |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/bcb0f5966c1c82856ce6ca716bb3e057f04b745e |     
    arc      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/83af777f9974705148061145ce1f2e2f19c8165f |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/cd50c4e32f7eee86f82dab6f885548801a728197 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/71849d28c191668ad24b4abe620620ff7f984bb1 |     
  sparc64    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/ff29b01f41c7d2e139a319aac1406dc00185fcae |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bf21c636c6790e7c4ab95ac6820c600438632625 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bee3bc1efce1b7cdbd7ef6aeb3ff42b1c5eea5b3 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b2ea8547f4004b818a56ab10ac32f6f68d8e2c0b |     
powerpc64le  |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/3d3925ac226eac91d30d9c3d4738e25a6a251f35 |     
    m68k     |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/f8e5b8a345b2ffdd7b1be07c5cd4e91c03aaea6a |     
  mips64el   |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/c543ccabea646196b5bc0a86fc4d9b7f5dc44d5c |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/5ace95f3e3bfeb35d471c7a99879504e86b8cf33 |     
    i686     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/386c150a08f51417c9680b1730ab12f6b516884d |     
  powerpc    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1b81457178edb72ec0d1deed287e15248c29cd46 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/4a810ec7d3424b1ca974138165cbb4146edff31d |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fa2dce9cb31d5e5db09879b6c0717ae139182a9c |     
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/3df9cd1741263e694c093e0a62f2c79a6e6274c0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d203d6ac7809735195d8d277106eeb268644a3db |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8526f3296315f8c1bebab690728c0918a66d7f47 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c8283c0312bb13d9c48ec380907baf56e755d091 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e1fbd6e4ec283019b0ed513b7f04d0bb17e29345 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/94d700167e09ec2467873ec3ef14de1b7e32ed96 |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/dbb023e0d39c38f096caa4ad5c3bc48ae94545d6 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f3ed9ebc6a4316331a64cbb81141f3bd848b708b |     
    arm      |          mtdev-1.1.5           | NOK | http://autobuild.buildroot.net/results/5861dc032ba2d0e092f742674759b39f393a710d |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a64559a70e03b603a7fcc7bcc77f510fc5d07edb |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/4c05dc5431bcc7069e22d789ff61acadc02e9233 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/62f5b5acef0cfd87cbb1a9cc94a8d0d041ad330a | ORPH
  mips64el   |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/d9c583f83280138b1cf56a5619c64774531b85c0 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/203833cbf0b1cb5b99f4bb03ad8f90bdd43edd23 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3ad0ea738a7b671dbb92b8da7652d6ee68e2f7dc |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6de11e45061b2a49a7add55b16314dbfd27f0b91 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c0bddf458b628015124ed815ea9b7b4a7df4e8b9 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0e1d5ef87b7fef76ccbcd053e4534ed60ba3cfa0 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d3e2453a217b5107e6219c00db22b4d56504eef5 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/bcd71b2746bb11e8930c685866c069fbc54c3320 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/da38210e08bfdfca81111553440fe9c69573c7fe |     
  sparc64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/1bc8e31b36117b56dd97d59f79df0a4ce3e05f26 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/049c9f51a2d33e64a7c1816b992771ce0277d39f |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c2902ef0a0f3c4d92a0656bcac85ae36fa35adac |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e8674f49f26afb66cfdedf481d06e1a7475d20d3 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d575db2184c187c8a7ced773116f8e102bc6ab7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/072b65cfe27ae8a0d432842c0ac7ea185e8ce383 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/afb48c5ef84e4957301739132e86d5594f0df067 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/2087a232488a6f28032575cbbea61e49d0af71de | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/653097a2a0021cb264e6dd89bb3c28893d1d318f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/edc5c15e858adb947670a541042871a248c98412 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/cbec7f1d6d4a7a0abf5239276fe7ca1c577d7c17 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/24a99efb9774aafff88e5d8ed4b085460e835928 |     




Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e8d842dfd96e999f3effe96a0541f390efdb0c23 |     
  aarch64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/7809d88ff4de29617fc0bafeac18f3a770f0a5cc |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
             kismet-2016-07-R1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d2669b49fa795bddee541b3442118104e636d8c6 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/964c3d7c18702f7d43c97b5798f4aec21ee6acda |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/f64e21690cf91ade7dce6481d48e08d05836f6cd | ORPH





-- 
http://autobuild.buildroot.net
