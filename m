From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 09 Oct 2019 06:17:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-08
Message-ID: <20191009061749.A74B7875FD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  0  |  0  | 10  |
  2019.05.x  | 22  |  2  |  0  | 24  |
  2019.08.x  | 16  |  2  |  0  | 18  |
    master   | 117 | 89  |  1  | 207 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    proj-6.2.0 | 22
                    brltty-6.0 | 18
                    bird-2.0.6 | 10
             subversion-1.9.12 | 9 
             libopenh264-2.0.0 | 4 
               target-finalize | 3 
                 uclibc-1.0.31 | 3 
                  ffmpeg-4.2.1 | 2 
                libgdiplus-5.6 | 2 
           libwebsockets-3.2.0 | 2 
                 mesa3d-19.2.0 | 2 
   openvmtools-10.3.5-10430147 | 2 
           host-harfbuzz-2.5.3 | 1 
               libupnpp-0.17.1 | 1 
                   libva-2.5.0 | 1 
 Makefile:743: target-finalize | 1 
              micropython-1.11 | 1 
                         mimic | 1 
                suricata-4.1.5 | 1 
                   systemd-241 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.3 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e19d59ce6117ed916e2bb8783d733833b31fbfc9 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/524224e1e395a1556c63eed475365dc5f9a0dfe9 |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/20fcfae2a396f9802e4e1ec72b58d4da5f1b9663 |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a7c530fba53f7307f2dd38f81d9c180c75627b0b |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e19c2087f20c38f289c52358650495418344956c |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/18ddb3b50cba64f1785d0c60f5ab6f166336657b |     
    mips     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/bd6fcd9e2ec70a69102c02715bda6eeb6d489451 |     
  riscv32    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/640fd5b4b2a3d29a66bf2db4ad4d184c946f0e08 |     
   sparc     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8ecf6307e1f11b4e3cbd9a8f1258f138c4e3062e |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f33b54ee0826e01ba2896dd463f8364b9ccc2481 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6f958a46c186c3075f0905d21f8503d401524040 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/10ecac020209ad35f3e440f18ad7e9d85621b94b |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/46af28c6bbd55cb08f63d0c0f7e58e114f641402 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9cf16be90504c818563fe4f169de43b96f669ef5 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/18eaa2c3fecc76d01c0161c9d7fecad1eb8b3cc5 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b9a6695988249142e5cfc04b1e5f907528f2627c |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3a214fe00583335163d3ba0f1f260e7d23989d5e |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/07584026080b99f1ef5e5998cf2f752641677a09 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/36a6bf19f1901e2c1f0813151a147486e38554f5 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d77805f46f11c5f51be30b15654851202713099c |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/656e9f9c711dbf869ed7b1ec9f0909d75da01d5f |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/679f8e0552b4099586b2ee3e2f62c75036895354 |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e99edcf7df6daede3c9c0855e07806ac3b791f42 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/030e0fa2478ccd174cfe0cec6857ba1a9e443bef |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fba3989b9d83fbd7ebf5348cad1419b46423332f |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a0d4f1b41a721bec553caef15b2765e056e6372b |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c13d5094be89eb7519286ab717dce32a165fa0e9 |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/37dacebec23109c44966bbd3dbdf54c4935628cc |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/446edbce33f27aebb3521c785bc43b038768cef4 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/893c3611b60c0145c0553b5f388fa63b5ca0cf4b |     
    m68k     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b12a4db3f18bb9a346e2e8274857ed5c76bbf4ff | ORPH
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/672d61a52c13104e5286efa86b0f3fe791c056c6 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b91073a06fd99b0237bd73e9b6b9c8e865447461 |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/8f22429a7186b74575834ee7310264b636bf54d0 |     
    arm      |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/72e445fd2e8116d64e2b3c1de7bac50484ed297f |     
    i586     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/377818cf8c1f2632cabdccb32bf4e7f06c0fdbbd |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/ef8f2d8d0a60b5a74b6165933680ff188eef6155 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/ef0c25c7ab0c7893d8b6b6e7d407d3143e154154 |     
   x86_64    |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/cf33883c58fa75cd161ea9962ace219cf6f7e80b |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/5bb501e37ee5cb26c60e2edbf92a723be37343c6 |     
    or1k     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/0356f527d96b2338cbeeeb01e689e239661d302c |     
 aarch64_be  | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/806af4b17ae00b9bb94dbffd68712c49b6105d1e |     
  mips64el   |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/eff215929e5ef31288ac9f07894045c6ed9bcaeb |     
  aarch64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/918f376c0ba0a39b87062f3f491e7931f13d73d9 |     
  powerpc    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/bdae739e411078576cc738c22ceac51d2af84c7c |     
    mips     |             mimic              | TIM | http://autobuild.buildroot.net/results/0a6ed59af0589a32a4ce056eff68d00b7215ed8a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3aa48a47afe02a23cd83b46f3862beca5acd830c |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/81a247b1e42648ceb5427fe578ae100ba95b1a68 |     
 powerpc64   |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/0d63866a8e4ef34876b9289ec7ba33ad0279447e |     
   x86_64    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/1d573c1179f84925a9e44e1ac4f390ac124ba307 |     
  riscv32    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/a8e5f2aad1cc0445a07741727b3dd36ea8f7935a |     
 powerpc64   |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/919618a10401b04226f45f474dc98ae4785e51e0 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/490328bd6aa153d5272e9333f91ea4faf894136d |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/d8638a033118a0b6b6a2e1aa4e52916aad44ca76 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/0f48a421bf5901c4d52578e7f14e1242e8cce820 |     
    m68k     |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/2dc56be88409e9487f14d9e0088c96ff666cc5bf |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/b460c36094893999353bdc74f7a6c91fd766be66 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/9a6f5f8a97bb66a3ba97684e0ca4099e5038cc86 |     
    m68k     |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/37bf2870a1a64fd42e49f61635633703f770cb4d |     
  sparc64    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/95f02e33dd8fc3878e6ad19252a2cb4acccedcfa |     
    m68k     |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/99a781201221cf5801bbdffd552726fb074042a9 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/af3451a37b5f6c81d4b19edfe84dbed09e1af0e9 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/34cd1b98f93efaf0a9ad9a3d7b1f48b84ae455c2 |     
    arm      |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/875bf9221f3da2190c11c18067036e25e6656b32 |     
  nds32le    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/9db65be7f0a973e1bbcfc6fedd09b56cc4c550db |     
   nios2     |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/2bba26bf8bbcec77e4e8b42c8cfc041720d1dd81 |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/9e526acfef468f3393d418497a3f22ec6652e28a |     
  aarch64    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/3bbb5f5e38879cbe6b870801e5f0225c08d12b16 |     
   nios2     |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/668f30b404df4e7e0886e8382c6dcf2983947c01 |     
   mipsel    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/d792f7fa504f5fbc9147d89d3ef745b73cbf2f60 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1e6fee61937948cb9bc4eba3f4c7aaf7de740167 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/63144318e139546287012dbfb70437996c07807b |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/c28584b2282ec6f556d378b88aa46d651d91f2eb |     
    i686     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b92bcb774828cf772175c1809c988e465654e80e |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/73b51ae62ab3973a9980b1a6475b17f6308b71dd |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7b1120fcc54d3907d909914919d1deebde04d8fe |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/580979fcb069d59e8a5a2baa6ecfccb032746733 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6134b272204e0d872c62b5fc83d5c62d6609d269 |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d483d50158a6afca7bac73a511a55b34e3a4d58e |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e9045c2e78530e97d4d4f0ae2824aa64cb5882cb |     
  aarch64    |          systemd-241           | NOK | http://autobuild.buildroot.net/results/9b23cdf60a7c649b247b65f6309e5f34d40bf679 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a63f5721e188a9d9e7fb0c47513b35909239775c |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/bdf92f21598db44493fd5179d3a34e612df193ab |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e1130ca604cb38306aeefdb104afbb19ed89a296 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/bd937025898c1f5290e25f07de22038663aa270d |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/67122fed82dd40fa8e13fb902edccee879c0c09d |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/7889abe86d849e3c9bf73973ea29e9a885bf113f |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/d8529fa07b8b635d47f5258fe60ecff44d7f5063 |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/a1f496001792849d929eac816131300b0286621b | ORPH
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/718aedb119f0b810d68b7cede00ecbd943d45f5c |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
               host-qemu-3.1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/6960983a23354a771e34d1dea0d6a3e1a32c01fe |     
microblazeel |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/74b0171eb7b78f085eb880fd4e292569fb6b4c30 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
              host-grpc-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0269631889621b95b6bb0a95e31b6a2b16041ac5 |     
    arc      |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/dffc43d60f83236dff55b0a35f78a50139444bc6 |     



-- 
http://autobuild.buildroot.net
