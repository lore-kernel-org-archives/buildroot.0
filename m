From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Jun 2020 06:26:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-10
Message-ID: <20200611062705.AEEB720368@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  1  |  0  |  9  |
  2020.05.x  |  6  |  8  |  0  | 14  |
    master   | 108 | 65  |  0  | 173 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 6 
           host-wayland-1.18.0 | 6 
                qt5base-5.15.0 | 6 
              ibm-sw-tpm2-1563 | 4 
                   mimic-1.1.0 | 3 
                 rocksdb-6.6.4 | 3 
                     avahi-0.8 | 2 
             freeswitch-1.10.3 | 2 
  gobject-introspection-1.64.1 | 2 
               linux-pam-1.4.0 | 2 
                 mesa3d-20.1.0 | 2 
                nftables-0.9.4 | 2 
               pulseview-0.4.1 | 2 
                 ripgrep-0.8.1 | 2 
                      tio-1.32 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
              asterisk-16.10.0 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
      gmrender-resurrect-0.0.8 | 1 
               host-go-1.13.12 | 1 
                      icu-65-1 | 1 
             kismet-2016-07-R1 | 1 
openfpgaloader-849e5751e06d... | 1 
pistache-73f248acd6db4c53e6... | 1 
       qt5quicktimeline-5.15.0 | 1 
                  rygel-0.38.3 | 1 
                  umtprd-1.3.6 | 1 
                       unknown | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.4 | 1 
                 xvisor-0.2.11 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/29c5625f889d22b15461c2159841978d3eee5799 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/060d51387a54fa8d5479a5ee4ca6a7179c7f5246 |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/297c2db7e538957c511b7da38745ff8c524f0ee4 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3bd1e5e0885e0b9233ca876d2da9564b5036cfb4 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5201d4a0d0c76f806a7c430039e9e950f4c56d93 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/20ec6b95544c3320c21aed114306402f009cb06d |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/9a46a239b17ce3c65947e47c37e593c6d25a3422 |     
powerpc64le  |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/12ac7895cec4ab0c93ce0b76e6cb790cabdf9b50 |     
 aarch64_be  |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/c6d12e79e42ea29e2f88a26f2c60bfa5b3d86f20 |     
  riscv64    |    gmrender-resurrect-0.0.8    | NOK | http://autobuild.buildroot.net/results/bc4940c2981e95dcc1aa8e1cc749edabee2e6aae |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/01e753a905d6bd1dbcaa8c13b60c00087475e963 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/71a97fe8de7da001dd2cd16e4b9fa7eaeb10ce8a |     
  mips64el   |        host-go-1.13.12         | NOK | http://autobuild.buildroot.net/results/363e86987ed596afbc629452af5774ba78805572 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/259557c22d325c063caa9b84d04a58eadb836587 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ed0c8eca6b3a0943125e67f2297030744d3b97cb |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27f0dd6dcb3d94986d626bd7b79c15781280810e |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8a431292a4b41716b72095fc62f9fd79472234da |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/638374992321597e6982740df006735c9c3cb235 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e5401f5e7f074c1157e5095d64cdcd7417b947be |     
  powerpc    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/b303ce7fcfa7cb558b6bc7544f2535a28e76c8b9 |     
 aarch64_be  |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/1f6b18d2880e9ec28575943e898a3aaf16abbf66 |     
  mips64el   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/b6d7d1e3f8b92a852778ae95fb70ae661c35614d |     
 powerpc64   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/2d53f83b2549d2799fbb1293dd8fad20aa4d0b44 |     
powerpc64le  |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/90c161202cbd7639d85495b3152d8ea4a1fbdc39 |     
    arm      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/3cb2a67dc781255d9166a295e9ca985a55663348 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/face35cbe2a46dd3655918095f811a778fa05106 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d2552bbd88ed45bb353d4820266abb4a568dada1 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/833c67e76f40ce36e2177c66bae136f75a915e9d |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a5e47d63b4c8b78ddf89b07b39a368ecb22ddac5 |     
  sparc64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/f761e532c118eb42cb9b4b63dde06f6c7d5c334c | ORPH
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/47c7da5d3e2f0b1f5c27e274a8eac0053cd42c38 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/92b3dd7c984d2b843ac9aacacd69eec99f28743e | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2262a4d8b76899b60bbd6bf34d739d818aba3a02 | ORPH
  powerpc    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/969575868cfe2f40beb25bc9517e07889ce8868d |     
   x86_64    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/7c8045426cbdd530475b8446f77f4d63c5d410de |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e14ab4917649fafcc79cb6006d1a649c57eeaf15 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ffdc5ab5e6f65bb2015bc40a1d012b0ddb22262a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/65a8e299d42ea241d45cafc62ae7a2893eba84d8 |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/0e4625ec34ddc2ea7ec3a1cfe23ffe1acda89e2f |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/12bbc828b8b26e6ecd45ed3ceb26b1b4527c501a |     
    arm      | openfpgaloader-849e5751e06d... | NOK | http://autobuild.buildroot.net/results/5aba1d6e44feda944cb648c8e641a3bbd65ed281 |     
   x86_64    | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/360c693baae80d8babc3d33fbe52645b9acf4c5c | ORPH
   mipsel    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/83f82025ff236ed94d6173b821f6a278a45fecbf |     
    sh4      |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/d1c9bfafd99db543cb00b86fa38587c4277fe308 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/339b1d049c89fa5af6bd660eb20802faf45ca223 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f046b886717f368e41af6ce57a5aee97456c4211 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b8ac7bf12870c076739f716a9e01832a3cb3e15a |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/49c527e6b674a20fa9f3844b6a5bdee6d939e7b6 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/4feb3b9a558a1fd36bfbceda425a32dcf585ab86 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/262b0d3fac44b3af42e84790b474a40d98c3289b |     
  aarch64    |    qt5quicktimeline-5.15.0     | NOK | http://autobuild.buildroot.net/results/f1dfcd807cacd2653a8c566e64a0836d1a4e55ab |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/501ec71262fff0e731f894086b6cc6bd7252258f |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/fa799c838952d7ce18460901da85d0962c833710 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/4e4b008d835f5df7db361296c170e44372a8a7ca |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2862ec0be3362323c71bdc8d0f6a5ddfdea95613 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/205c3327d8a6f53d2dcf01546e90caa8a68e4e78 |     
  riscv64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/925adfec5f7581945e56dee1c7b42250d4ec3a74 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/08d85d6c5b52ba4c3b87c284b7734a984895acfe |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f968b13a550a415b183ebdb26caff43159d9a49e |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/2b10293f9cd5af540d084226c911eb6e02fa0a1b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/00fd5ef03fbe21447d7e0cf0ffd50b067a19bb15 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/47188dee641fd17209e08ed38364ec470fc477ea | ORPH
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/fb7be1117602707718ff6eea95100cf68c5fe05f | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/098ff2c165f31c5dcbffbe489e554708c425488e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/579293cbd19b83d284635fb99f67b357aa484dae |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/766940aace5193b15bb88866bc53aee61f0f7ee4 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
          host-acpica-20191018 | 1 
                host-gdb-8.2.1 | 1 
                    mpv-0.29.1 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.14.2 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/77ae6790acdf35d8d5a43a14d795afeba9a940a8 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/62c3ecd6127676b2e988013fd031faeb404e46d1 |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/0731706e8dd4f6eaa66112bbc129c78f6af7cad1 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/2f06e37cffb249270d2fced1dd3f0045a2e972c0 | ORPH
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/751715a442e9474f28053f6947c923297b6cd260 |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/619206dce3f8d0ee098dd69c36eb7f5544fd0117 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ea03d93122c294433585eefb15b0628bb71194b9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fb6087fe7cccea6cef002c77f45a21b336fe8924 |     



-- 
http://autobuild.buildroot.net
