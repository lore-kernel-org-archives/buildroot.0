From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 May 2020 06:25:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-13
Message-ID: <20200514062552.A98A820438@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  7  |  1  | 28  |
    master   | 179 | 83  |  2  | 264 |
     next    | 25  |  7  |  0  | 32  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    atk-2.33.3 | 9 
                  zeromq-4.3.2 | 6 
         uvw-2.5.0_libuv-v1.37 | 4 
                  assimp-5.0.1 | 3 
              host-grpc-1.25.0 | 3 
                 host-tar-1.29 | 3 
              ibm-sw-tpm2-1563 | 3 
                 mesa3d-20.0.6 | 3 
                    mpv-0.29.1 | 3 
                qt5base-5.14.2 | 3 
                 rocksdb-6.6.4 | 3 
                       unknown | 3 
                host-m4-1.4.18 | 2 
           host-nodejs-12.16.1 | 2 
                       libuecc | 2 
               protobuf-3.11.4 | 2 
               apcupsd-3.14.14 | 1 
                  avro-c-1.9.2 | 1 
              bitcoin-0.19.0.1 | 1 
               collectd-5.11.0 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
              exfatprogs-1.0.2 | 1 
             fftw-single-3.3.8 | 1 
                      fio-3.19 | 1 
                    gcr-3.34.0 | 1 
              gr-osmosdr-0.2.0 | 1 
                   gssdp-1.2.2 | 1 
            host-binutils-2.32 | 1 
              host-erlang-22.2 | 1 
          host-fakeroot-1.20.2 | 1 
             host-gnupg-1.4.23 | 1 
      host-libtextstyle-0.20.1 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
                 lvm2-2.02.185 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.22 | 1 
   openvmtools-10.3.5-10430147 | 1 
pistache-73f248acd6db4c53e6... | 1 
               qt5webkit-5.9.1 | 1 
                  rygel-0.38.3 | 1 
                  stella-6.1.2 | 1 
                suricata-4.1.8 | 1 
                    vlc-3.0.10 | 1 
                wayland-1.17.0 | 1 
               wireshark-3.2.3 | 1 
              xapp_xload-1.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a86992f0c0b63c9d2d3685e01e607409746259f8 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/cf507ce821ace97cbc4c0a333e66b19a49e47881 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/3159cebc701e0fb5a5e3b0a77fd0d1e418e99632 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b7e568fb0e2c3fe261c7d3b25b42caf03cfaf5f8 |     
  riscv32    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/087455371c7f3555aa1b873ef06d92ee627827cf | ORPH
  sparc64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e7160449245ea0d3b39bd07a421b578032b834cd | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/7dd356158ea5b2051ba6ed49f96b914d3ae13a5c | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f1c3c59086b9e9669defae1f562cf0ef106f5c71 | ORPH
powerpc64le  |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/c93f21e32062c9611dc6987c4dfd1ea763a687db | ORPH
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/d02ddc87d79df99e90f203ef6028e49b5d913973 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e35d71e154be4c913d60ac1849e8c5fff79bdf4c | ORPH
  riscv32    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/8d1e18bb7604dc3af4664f8058d89749133d6895 | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f4b28c70d4dc13fa8f543c75a1a35c0caf6c45f7 | ORPH
  nds32le    |          avro-c-1.9.2          | NOK | http://autobuild.buildroot.net/results/f957716030e8234ab7923fff9abb44cc64df6178 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d88575221aec0e972591ddb1fa79c79995edc99b |     
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/5936f1d59e2a53660c0b736d4b11f95985746346 |     
   xtensa    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/6fc62ae518e6ae24e68f5243ae92afb832199d46 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8393dc0dbbc45efe8a6da98a11c58f86d30d5f2c |     
    arm      |       fftw-single-3.3.8        | NOK | http://autobuild.buildroot.net/results/23df8a4b8691f7fdd017e0d51c7898df52adcb0d | ORPH
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/f85853213aa73a09cbdba2ca773f9fff033c73f3 |     
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/58f3ed1152113721f0cc5aed164efaec0abc73de | ORPH
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/5e40728a8a20a3466282dcb68fc3ef45113d950e |     
    arm      |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/09eef1ce7586bf8ab86b3de2d98d42e5e691c709 |     
    arm      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/eb0179c0d1a541cb23700dffdd514f493fbc22fa |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/266fbdc8ada681aa98b9e766ead38b5b876df34d |     
 powerpc64   |      host-fakeroot-1.20.2      | NOK | http://autobuild.buildroot.net/results/d4a19d7a6dc8a5b2b95353d5a9fa4439990ea26d | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/852cf0be60bfacc72fe6a5d2e0b021777e92105b | ORPH
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/99104c920d283a3deecec275bb7149e98bc5a16d |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/cd2cca75023bab006ca2c2060680d754edf6c0fb |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2481f6463b123b1b438654c991303f25ff1b04a7 |     
    arc      |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/a4052f10b6e0db9ac8e1530465b92b1f071f850d |     
  mips64el   |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/eb1ee89641ea8ad81b000d5227ec60e3b1bb33e6 | ORPH
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/33cdcd8040fb1ebfbd2dc13b05108969e59b1098 | ORPH
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/6bb5d6a31db5e4e67d696b456dee26a1f8be777b |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/26bfbe9ad64dbb1cb309bb33f2b9abbe5eaee95e |     
   nios2     |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/3586193723d7ce4c73b3a547eecc5ebcf5b7faf4 | ORPH
  aarch64    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/95630c15606c709cb98169c3a0661718b6b46e11 | ORPH
    m68k     |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/3d7d44acf69065d3ad5da22cff0bb03f81ffc6bc | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2d2dfc2127842c4bfe674299a7ed67718cea34b2 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5dea58273e16d421b6053797222b8a625536c788 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/91cb3f6044b245a4e09f9908d6c9a5db61b44496 |     
    arm      |            libuecc             | TIM | http://autobuild.buildroot.net/results/c6e186f569aa5ffda5a54cb934b1514c058cea22 |     
    arc      |            libuecc             | TIM | http://autobuild.buildroot.net/results/448d4e09510ee2aca392a765e8bbaf3da4e247d0 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d1cb27ec79c4862a8a69b49e3fbab1c88e2d89b1 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/cb07fe7fc113a4bacd25355de50ed64586c6afb8 |     
  powerpc    |         lvm2-2.02.185          | NOK | http://autobuild.buildroot.net/results/0e75873c2b0ada119557dce3bafb759996b4d5c1 | ORPH
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/0acc9f6fee081ee7928fa4fc256bc855c5aeeca5 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/372333a20124ad80d635a95bd37dbfdf4ecb6a08 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/3d770883e4a29a910a0ae52ecfdbb87a5203a245 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7be806b425093379e9b869c87927dcfbd0b4374f |     
    or1k     |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/53c2fd2f661e0b75569198088b0b7df0b2bbe46c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/13ab18beb0e2c0ded847453fade97af11c018ac0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/19f1c13a905f8f6fbe2bf7c9825da2df22e51111 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/27e3699c16af524ddcc16492f827b2424c5238e1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/38ab37096b5c6bb44e7c7861ad50a1d98734edd7 |     
   nios2     | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/d228f2f5f5712f9a7f767bacbb1e4bf67bad8adb | ORPH
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/c0e81fc8a6222f28a35ddca0b383e26100ea2f7c |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/3de512c9cf17292dfb77decec9f8056db259cda3 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/220652e70e512e866b2e8b8da5e1a006de6b22f7 |     
   sparc     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6f2e1c027158c7615ae3ca38215caec02de0cbed |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5d0e2932ff6a07ac35636e084dda643fa1fa4d78 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/5aac303c0aee421ef304e9a71667ef2907948d23 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/adf58465398fb27d49d7d7d4a2e67954e297a108 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ea614e37e9f8a22b5707961f43094faa93cc2246 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/4abf9da2c2ba17d5abe8184bc940cb7010fcb9c7 |     
  powerpc    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/02978473035ff6b1e05491c44b01c3584bf4a5cc |     
    mips     |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/2b097abdf1f01fc240fc561252d4aa96bf69a7cf |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/74a0023828f812558912ed83bf00f7f7201a51bc |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/3a5cffecb739133b36d540bc1975c2c1c9de99ac |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/37b592ebb5bf0722a98278eee22aee6b3d8ac1b4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4066fa5cf7bd53a8e31506eb358ad2edfd784560 |     
   x86_64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/65712c2ed1232cd898498524ec496ec1eb2dbb13 |     
  riscv64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/bd85f013262e9673e5a280691a38cf646ad185d5 |     
    sh4      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/89b7e7a7726978197bdb33e6985ebf5aa3673f1b |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/83b601ced563557a5dfa49e2ddb76b10fbcce326 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/0e11154ad91c86619048acffed0a425fdf42800a |     
  riscv64    |         wayland-1.17.0         | NOK | http://autobuild.buildroot.net/results/879ae04fe4378f119d3c5cb2daf8dc047f5294b3 |     
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/168e3ba30aa26c3e2b9bc617ca05764e5f2e662f | ORPH
  riscv64    |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/025258c37e1a2f9fd627b88aa513e93d9260e9df |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/4716967c1491ececac0a757149017c93160294bb |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/15e1195c1514c1aa69c5880972e25c3363df1232 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/63cb22268f8aa721d412445f6ace2f4d641ba5a2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e5a74c0401c151657cfdf7ebe787bc7c298cce38 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/eacedfe17d4e5d8b75ad96e81eb4018d77d97197 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/86360bad2142b34349ceb6cac7e32f1f6b57894e |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

            host-binutils-2.32 | 1 
              host-perl-5.30.1 | 1 
                 host-tar-1.29 | 1 
                       libuecc | 1 
                   mpd-0.21.19 | 1 
                    mpv-0.29.1 | 1 
                 samba4-4.11.8 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/15a743194f9f0f2ca73d52055c7094941b725ed9 |     
  riscv64    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/87e57d62312859f02128d6b242355e37515084fe |     
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/c6af9fad64b2485965013b616017be9b93d5ef12 | ORPH
  sparc64    |            libuecc             | TIM | http://autobuild.buildroot.net/results/8393bf82bf7962e937310f13cbd5c53aa6d6cf33 |     
microblazeel |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/6cc10d1b2a3e1f7914ff21842975b295c64bda47 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e4979eb2eb52d016cfd5f6ecbc3d7c459c734a48 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/7d66e9abb944a1e552b0580ea2f5790af706eb6e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/57f320a7f566556eebbced1c2d6618aa5f7f964e |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

         host-exfatprogs-1.0.2 | 2 
     python-argon2-cffi-19.2.0 | 2 
                  assimp-5.0.1 | 1 
                 mesa3d-20.0.6 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/23e7b22346cadd67ef7b68801411af60f8365e76 |     
   x86_64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/d4e72e83942151af155a50230f24183011764967 |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/cf7c458ac6bca3fbca7ec06a4391e2644f236ca5 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/048520f6a98f83db937581d243d9576d6802b1de |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/afc22ce089e37e906f4f050f7be6aa6cbe9393e4 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8c803899e148222402b10b3fb070992797cdf782 |     
  riscv64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/1263120163cacf673cb182abac38d5f087ac061f |     



-- 
http://autobuild.buildroot.net
