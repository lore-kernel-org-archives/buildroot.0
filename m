From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Jan 2020 07:18:21 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-21
Message-ID: <20200122071827.23D0C2078C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  3  |  0  | 16  |
  2019.11.x  | 14  |  5  |  0  | 19  |
    master   | 66  | 67  |  1  | 134 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 14
                    parted-3.3 | 9 
                    brltty-6.0 | 7 
                    olsr-0.9.8 | 4 
                 exim-4.93.0.4 | 3 
              host-grpc-1.25.0 | 3 
                 libnss-3.49.1 | 3 
          libpam-tacplus-1.5.1 | 3 
                      bash-5.0 | 2 
                     lxc-3.2.1 | 2 
               acpica-20191018 | 1 
                bitcoin-0.16.3 | 1 
                    git-2.24.1 | 1 
     host-erlang-p1-xmpp-1.4.2 | 1 
                     host-llvm | 1 
               host-llvm-9.0.1 | 1 
            host-mfgtools-0.02 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
                 mesa3d-19.3.2 | 1 
                   mimic-1.1.0 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
        python-alsaaudio-0.8.4 | 1 
                  qt5svg-5.6.3 | 1 
                 ripgrep-0.8.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/963e22b402d4c9071fb0fa5f377d7ea3609467cd |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/75c80a0e0de10867a70a205b655bcf482d7cc0c6 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/381ed6dec99bf930afd684dd77d85a37ce9c43cd | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/493bb86792a07c9f6de8f3fbc8be378ddd931955 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0bba709d7d1630fd377267b83a12f9bae74df1e1 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/41763fb03a5f73cd00d6d71ec5a234e4378c5efe |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/174fa1fe83b75736907a61d8459807a919fadabe |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/efe31b87a67d0be69238e62a9db178c4d5398e02 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/881d7333ec7000d976f248a78bdf642a3ec045c4 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2728c7938766ae80c5be624e81f0eb8f9ccc9b04 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/52092f0b526803ebbbea5da50bc5fb10e804e2f5 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/3666d282eb2297f5348d8d6179ab666f34d6ab11 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/3742413be40968264cfb6e13f222b1178e69247e |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/d7813b6486dbb2ef2a495c23a2315c68c622f2d6 |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/e225e62ea2d48660df4110790664f0c3306c1ea9 |     
  sparc64    |   host-erlang-p1-xmpp-1.4.2    | NOK | http://autobuild.buildroot.net/results/3e594350131994df53b20d5113fefbba2e747836 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6a008654e06299d270773d15235686d903c6b962 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2d801136a7bf0cd2d4e912293b88fd90a0676845 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/24f321a10ffbed3d80f1f1333226428eff11740c |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/1829c4682d73c0a96ee1901f4410510035006cc3 |     
  mips64el   |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/31d00b6c32ad522f4216731f972f90ef3eaf1ab2 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/8889334c07a36020139287de8f94dfce3668b735 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/80d1d001ae9b387dea9f75aa657533f846d06320 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/fac7d89d397ac9e060f95b7f40f9eb17f75fc1f3 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/1e8701673eb159b6f61624f3d56252c52ba7a75d |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/c2359a034864db2bce016bdf211b233fc0c11f7a |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/e9c8f55c47937731824bd339bad2ccfd76131b4c |     
    sh4      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/6d6eac9f0322054410dc19a6c0096c81894c47a6 |     
  powerpc    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/a9c2ad3b08762401921ee9d441ee1e27262d8b80 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/f09254c11ebe92759f8e3767d6013278fbebee99 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/c8127582e4e823e7f98eed57a78725b95425f809 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/7adbaacba782137c6408a03ca925248382152788 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/bbbaed39879ab9fb5eb133cc9123f0f137a728ba |     
    or1k     |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/f0b4d1cc3ec14b5cd4d3725b0abf02959e9c6367 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f74662fcf594834facaa5618219e3cbc7d38c08f |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8e0c352baa44843212c440820d8a3cdc250b78e8 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9e094f6512134b78ed708ef0170f79cdae002b65 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/89e8aecdac16d072f05db74087f2142f6671522c |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/03b1ad1d17c90ca01fdf20873610a2e0c968917e |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ab51c865004c3ce4970df5fa034008d04e7a67a9 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6166b87a138cada665d2d2b613a5334f08cf425f |     
  nds32le    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/95c747af88783bb3cad2a560e0e6d5298e47db44 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1a28b60c850ed86f37eebcc0e1299e8e522ac540 |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c03f091059e1535a64a6cc55d4194b5ae8d3ce96 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a442aeb1100e582f2864f151d9742fd3af81362c |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b49d9536310e4fd7bbe97592feb4447b7179ec99 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f15fe359b1cadae39734be674820080eda3542f9 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/518b40f91129e1bc79eeb45d13b88817d26f0df7 |     
  riscv32    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/bdc4d150b0dfa724428e13616e5f698ff647bbeb |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d1c509be43b085d819f9dbd18812a3d1bc0cd863 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8ca44417120bbbc058e747fb916a9a910f1af041 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/41c8651a13ddc5251485b1ecab29127910dad02d | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/99688b11ba495635061fa30497104dfb12343040 | ORPH
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/a1e53b2939e4a7f32583969b186adf60d4c8582e |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/76396a45bf27c224ca31341a18c907d867433abf |     
    m68k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/1e310c50310f0057b05bc6f59340d055240dc0c3 |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5020a2e0a30914622d533fa58b14f133c1eb9c11 |     
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/7fcf364ea168ee53bea255f6dbf8118e50d95070 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/638534bacb2eae67585a2478f948c6df5ddb682e |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/393a9387531e8279b93d738cde6520f75a3ca194 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/547a5a56541d8f5b9278089d34eeb6fc71d834e2 |     
    or1k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/0b5795017526c3354f64a98fbcba5cba583e0cd4 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/40aedcaf457b27ee1b395d0e0b5a6ea01cd5bc2c |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/62a93ba379b8d869d9f51cd414b734cf6c5569a0 |     
  mips64el   |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/d4bf826021c079a68562e121423d516b3f10ed96 |     
   xtensa    |          qt5svg-5.6.3          | NOK | http://autobuild.buildroot.net/results/52dcb01fe0f91d3a3a3f97eebd0a852c9a2cf750 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ec0e138cf5fd7be378640a08759e6f2c3f1b7f09 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1b5a3ac77c2dde4fb6888fbe538372f7569d49ea |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
         mono-gtksharp3-2.99.3 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ecb2a0e12c8e5fc0d96851e8dbb508754c13f795 |     
  powerpc    |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/ccd3f2bd49f5b6c8400d12833a4e010ac66d8b9c |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a2c9f4feab8a192eb5a3682d207216e411e9c6a7 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.2 | 1 
                   mimic-1.1.0 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/ddbf0ac22e1012785dd70ae7360832ec1cfcf7da |     
  powerpc    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/75960768a22d0d0335a43bc805decf6514054a73 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/240bb64df9a8b51c062b87718a35ab99b0c92f38 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9b4a0642d4c4b6b294c030d6841ffe8cab467ac0 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/5719766ab3c555984bf907aee50d956efe4a4781 |     



-- 
http://autobuild.buildroot.net
