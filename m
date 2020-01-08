From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 08 Jan 2020 07:18:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-07
Message-ID: <20200108071810.4762820499@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 32  |  4  |  1  | 37  |
  2019.11.x  | 23  |  9  |  0  | 32  |
    master   | 143 | 222 |  1  | 366 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 121
           host-libselinux-2.9 | 29
               libsigrok-0.5.2 | 10
                 exim-4.93.0.3 | 9 
             libva-utils-2.6.0 | 6 
                  snort-2.9.15 | 4 
                apr-util-1.6.1 | 3 
             freeswitch-1.10.2 | 3 
              host-grpc-1.25.0 | 3 
                       unknown | 3 
                  avro-c-1.9.1 | 2 
           host-doxygen-1.8.17 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
           libwebsockets-3.2.0 | 2 
                     lxc-3.2.1 | 2 
           uboot-tools-2019.10 | 2 
               bctoolbox-0.4.0 | 1 
                  botan-2.11.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
      dovecot-pigeonhole-0.5.9 | 1 
              fluidsynth-2.1.0 | 1 
             fontconfig-2.13.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
                     host-llvm | 1 
            host-mfgtools-0.02 | 1 
             libopenssl-1.1.1d | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               linknx-0.0.1.37 | 1 
                    mpv-0.29.1 | 1 
                      pdbg-2.4 | 1 
               qt5webkit-5.9.1 | 1 
               target-finalize | 1 
            wpa_supplicant-2.9 | 1 
                  zeromq-4.3.2 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/dccc1b19b3bebb30257938715aa44a6418588c45 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8452e94963f8f86226d6022ca56c71b96a64a3eb |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e68cbc78d3dc31a3b38ac5089828521e5c3403ef |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/7fa276d0f21db4379d5dee1a9c0ab13a0c13cf69 |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/4cd8939e0ee71368c27321fc521853cf45b066ff |     
    arm      |        bctoolbox-0.4.0         | NOK | http://autobuild.buildroot.net/results/d9cdf36aa2453ff46a6459975115c80111e3ee5e | ORPH
    arm      |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/1e2bde88b8f3bedc1e60d58d56818d6d1f5fe6bf | ORPH
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/ad3ccc3d58709cc910d8827d43c67c5463f2fa88 |     
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/2894d594ef41ac779741b83d2500c7e9db5824e9 |     
   sparc     |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/23499088576a1bdf4d9920be79a270983bd4cae9 |     
   nios2     |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/ba426cb51f6d1aa793c0e2378b8aabcc512bb07d |     
    or1k     |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/4aa9297c1d0a8c23fca0c912118265e81bcdef67 |     
  powerpc    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/36e371e4187251edea96cd0d853d0fbf9c285f1c |     
microblazeel |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/d86b887ef703ddfb7c69898b86e56e22a9448317 |     
    sh4      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/446e888339fd8d6ae7fc2873c49c3a680dcee094 |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/8dc743778010ed620c11f916a66ccbce4065563e |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/3614871f55fe45702dfb0fd5275af8eeabff6a51 |     
  sparc64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/771383ca24ed601f81b266ec02c150a19af11e32 |     
    i686     |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/31648e929528ac8ff77d02962b222e092af3574a |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/31489fd100550ef2e46bbd6113c7ce93f3e3cf3a | ORPH
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/06ec34d03d4636a14d28e3041c8d478ca1ff9638 |     
   mipsel    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/249b77f4b0a114a5b12902667e359eae6f252727 |     
    i586     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/394b8ffe1f1a376e495a44aaba817311717560d0 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2c85497f9f4417468637839cc752abd7de52638f |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/ad426957e51b0729206eff81c33ea177afae93ac |     
powerpc64le  |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/c1ecc2e244325f7a6b20d635619e82107758a823 |     
  aarch64    | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/54901fb4e41ee389b96a8f99dab4a923286aa925 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/684f7558c9c7861e74d2dad0f67abdf85f0e02db |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0e44d5b233faec7a4aeafd78d3212727d3bc827b |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bd36947581da0d4e51e9442502c504a79891c67a |     
   nios2     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/c8fe5b47e422bac13b4d5fa10bd1ee5218021585 |     
  riscv32    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/33ca2f8507fec2fe8df483589d32ae5c758dab72 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/1574108e9dfa43e700f6ff7c6993314417354b4c |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/469f491a5a98a0c19a041d3488fe97053204af8e |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/f0e26680bb733f0547b2674012fa66586b775ba5 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/53ef3574f28d11bd6cb01c84fdda9a77c9579aeb |     
   sparc     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/1bfc796bff2820067ae60e75187b256cdae95554 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/27a434030d6945f459eb5c7033afa1bc95ed2b3d |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/5f5899275f97d787e5609bbcf9a9765589c0cb55 |     
    sh4      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/8274ff1d53b7821520e594dd04b2251a2b3b3e16 |     
    m68k     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/61c2d81d78c87a33a8c8510e6401b75dc1d45d6f |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/809c19ba175e35d78b0201b5a0588648b3e5fd35 |     
  riscv32    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/6bd47799ce6ba9dbe5104d1217cf65f0bfa84154 |     
   x86_64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/10f6a21fca52ccb45b9cd093389a0ea1689822a9 |     
   nios2     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/115ae04f488e5c14c6256117a63c27cb8efcfa64 |     
    mips     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/bc59e3ea67562766434e978f149c798f86b504e6 |     
  aarch64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/b4fdfa034038a3eed8a8921f8b09f1ced5f81417 |     
  aarch64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/21a417e286bf5098a9effe74dfc640198d446727 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/83eeef5e3ad7e0464e3cf9f647b9d1b7006b7356 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/7a686cadaa0aea978bd9ece555ae166c46255e1e |     
 aarch64_be  |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/8eac8375abbd66a54ed64d41604fbc2345c5471f |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/7a3769a0038299f52a4fbe8cbc07d039901c5236 |     
microblazeel |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/0c903e41e5678791e19060a2ada072aed4acf591 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/638022a0c8f7894c05e59a8085f031e60fbfa879 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/3845f10c1a34e4a91d813bf1e7cd500f7c190f42 |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/813bca74209cfba5e91917f22ba13e879b723d0a |     
   x86_64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/d08ad9bcb4c8380ab3563f7a80f8868794c94992 |     
  powerpc    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/93dc7dfbc1a4b01bb0dfc0e5548f9f43ccc2e958 |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/4733b937854e91a2fc658ef9e2d339ca5249d826 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/23f4dd8715014958cc09947151b6743932cc4917 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d078124ef7aab9e43163404f3626f07409cb959b |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/4a63addb658b0e0b477105d3b64cd093edbd46ee |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/bd069c25e362406cddb09d0f35dd5c7136699112 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/3de5c61d353bb6737665c7e9f3b92257296f8512 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a64e5aa4462f13b8eb75c8f8f408b1f7325e4568 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4026a34c6c096354ba99e8c202210428fa2795d2 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d7f355953926a52f9d8c58077587fab1fa558892 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8ca4a9715fc8070daaa5282013f25279f3c0bc1f |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/31e69b946271c43f1615aab3704c1864c7558f0f |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/23d5cca8f0f0974f45a7e5264abbd2a6d5526c21 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bc6dd5ce89a9b2c07d443b0ace6000996843255d |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6f10a33905702f8de1ec97cfb7db95d82875f96c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/72a7d80788fde4a7f636771ace88908634d1befc |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c27cf3e76afc27e7685f8c2466e2822f1c6b47d3 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c154c13471572921b149cb86c36bf16f68481312 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3cc6f9bad72ace2402c2a3e6e85183c92997eed6 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/711bfe874a3792685d374ed66dc49e47321d87ae |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f1ebe647732ede45bae4d2ab5ea75365af3a6483 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/66793483acceeffac37d035931111d92988ca994 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e4e1562a1e4153ef30eeb269d6bb70f03521db66 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cfd9e242537cf55fc9f2fdcfc98edc0c1a4260df |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a4fd20aa4a257932406165cecda584cd8905fedd |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db237ea986fe18771d2eaf49c644ab45d680a5af |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6ef81d6de1ed614f442b9f3f607bebc92930e21f |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9f29e85de8141a000b454b433d33ceb2bae41823 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c137ac3a2f83406539784418908af2df26f0ac39 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1dfb45a6d9829dc056f7f8716aea97b826b6347f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/62b85f936032c8b47af4790050aef80f178cf47a |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b5f8fa07e90cdac48a4c6547a2426bf219a20576 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/735695c041a2e13c4dc5fd46fe40d39d13c81e95 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a1370b008f8a29112000f8bcda1a4fb79efb3139 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/11f14530a805a9beec6ecbe666356b78541f499a |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a40812de2b8c1ee6f70b0215d3abc40111c34cbf |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2f13db63bc893cd4f3ced030ed4fe32f8df590b2 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8193c2a1242fe327d12243de188d31f9671e8707 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e6349ae42c4d1129446ae2ab18f16f534785b0b7 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d0bab622e26328cac24040b1561a60eaf23d189d |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d32cc21953211c12a71f807f367175e4c20ba257 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c7407eea148c32fb33ea00d14079615572f890b0 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0e6afc09198e04282681fd788fabf1d5229bb516 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/906ec22dd1d14b07e6348c551f5c23122d31f01d |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ef75915650409a8ec31c46390c75137954c7e564 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/346fb64192fabaf524ff1343ccb0901c6c3d271c |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0be20a6eb2a52025d1d9688f022b9330874af75f |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6864c3e4a234edfc9315fb7f0606a3a23fa25ab1 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a6555cfbb6adcc433399611ad036449435b7a0e2 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/47de0a95163c373fb154b73e18908a7c4c5f1992 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c41ca8584dcf32912241240b6a04e544c7cafb64 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9342249460d09be4215a24c2915fe9dcf93d54b3 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7e6de2a1df9b7d5e230badc40339c247021c2c61 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3e940a5d92f96b3693df9a1d395665ff911a771f |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6af06461e2703b606657a796ceb8716ba1027211 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c575bdc064209c639e67e0481862848dbf711dbd |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bb569ca8e02155d18806e2e0286cec3d60256f5e |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fc80368a251173d9cc69184fe271e3d5a933cab5 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/46e48d9c4939155a56fd38af77b01ac1af7aa495 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5df53bdc1e41139d3df8fc1f00a7a421d3b87955 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/82808bd4ff623c4f51ad5ad368482329eeccc72a |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8b7c2f7a8d9f5ae0da9975d58c8fc92fcd5b21e7 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/13ddc1ec57f9d7d70db4913f26c72beafea791ae |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/119b1831c5c2b8687fb2b293ec4af5d1c28fcca3 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0d57708756121c0eae62adb2596fce4225ec3142 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/972bde3773987f3a49a85fe3936cac6d5bf12633 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2ee3e343925ba421a938c64caa643037f84be090 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6a2b041b114f1e5290dcbede9d4c695d7b0defda |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e2ff1b0de8634a881035c3c4d7279f9f4f9dc929 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0dc9956c752d4765ba0ff47a1316d69a750a2742 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5dfe85a10350fb74abbceb82038cfea3dfae329f |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9f2312df6e8924910119b851ba51ceb9e4d5e5a2 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/34e2717107307b40318aacecb91601bc4296265a |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f7f1bbb17c4e3e5e2404bc6daacebae49054b1f1 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7292f2b7e3863ca36a511e9f390fd023ad86d64c |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9d36e15c011c796ec5ff4db4f0882e368133a4cf |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dfcea11412fa6d54107bc10c30caccb7ce7d2492 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4008046d3999c7b75ebbacbb9c59fa5d974a9a53 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/85efe231727b497247bb9ff3b33c39d8888e23af |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8f04b9b16bbf5d22776547886f759cdb9777dd99 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a4cf29f5a21d429f4609feb90e9921dcfdcc5a7e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/163ce6ba56d18a9ba1feadaf2adebdaad5e251c1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cf50079b2cf6cd911c04394a5c270399f4d95491 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/76e29b0197516ee99a53cc33b020938ab980549c |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5bac3832b2dd7fc87347ec2d7c76a73f2c6b24fd |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b4fdace31fd5f273a779a75fdd5af91d0042c383 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c88f45b2db61ea1a1612d141e7298e0e296a0c05 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d8713d87ec7c1d687a917c1dbc1bad7aafe9c57b |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0712f140af46fe2b16208052546b1cc03fcfbba8 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ab863b18827ea81414d8f8d483ae9f71aea2dd78 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7c931c0a8b0255f254ccb9c809a26684e373d897 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2ee81e9f63c1a2c003af6351296ec79d6e1c3ac7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1dd68cae083c49d0dbf8ebd08467b20d49e6dfb0 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/35f7fde9d76d0d4ac9ed63f9aea77484263d8d89 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/024d5cf7bc9751a334b33e66c9e44f6ade1fda41 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fd3f71aec56efdf8bd67ab9e35c7b7199f9fe913 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/538fce3becabad463a0202072b052346aff74118 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/811cacf839dd0c40664f33e6944471dcccbb29ba |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cb86c64198337c76c777cff195e75a58b66094c4 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ceaf55d0acdd4b8f5e5226ae4b765be414e21bd4 |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bbdfbddfa84b8bd969326827b994b5c60e677cb0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f1f9d07b1be3861f485bd6c3bbcb77479726bd92 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db3b57ed967dde1618218d339fa37591d8750c98 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/440162d97dcf040e87bffca4e5d443c17b0822d9 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d4b1027b27a20803fb57b57e88a54f473da65ca7 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3b66c887c50f789521fbd376b840a1e8164122ac |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/317962ff13f6271c4a871442f2f54128d2ad1989 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7a9325ccf1e62af688308ca9533bc5489ee144ad |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/88a2c1d6ab0eda9b9e313ec2c9d4a9b7e70f28a4 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6353b9fb4f6b8a50e7c8a847e51dc0cf263ddc58 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bb906c3abfd4001274ba630121aee972dc890c4c |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a5ea8ab9255d3b47df7f5666488104a91da9aaf2 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f03d8ad8bcff3b9c8d6b89beb3ff07d610f96918 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/35de09f28b3a5f715478dd590cccc07530db92dd |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4ed3fabc10e3d24b7215e5abf8826e51d75272ca |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/19e32190960aae5d89ed4866cf5e126ae7951849 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe14bc36a130dd0dcf62c0637a824f66c50dcac3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a85a9523da810b547fcfdf42702af8550aba06b1 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/15247b3be297dad7dbaac42091038d003283b4cc |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/31fa7c3b553cce201300f3c84313898605fe43d5 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/33cf4df41b3469a72b5f7a141dc2cbd65fa3e8b7 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/49d91cbd53b78169d53c910a7bef8f3cc0ff3a06 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/601be40b3449ccfb410b260e24895d37b4150fb2 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d71029f32d7dd30496beabf7c7bbf1ddbb5cc26c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ef8f32da2e06b4e91e8483f724d3e5bb6eb78c3a |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/615f35e79ea14b389b4f89679f4ea54f9c4dfc0e |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c228f2056a0a5db86e2cc23dc9c51a3672616f5f |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6575edd00a62500dfa1e59eb6c5563b72260bb85 |     
   xtensa    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/bead4ed1c68323b0a78cd187ba778371c930bafa |     
  aarch64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/49108cceae6f1ad8f472a9096088734e80a77f6e |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/6dacefaf376cbca8b52c19e2a59da292c5183c17 |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/3d7fe4657e8353116a3bc50ad55ff0358515c832 |     
   xtensa    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/86e8b9ab37f82edea3a19cb1ae86a2f79d4150a2 |     
    arm      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/006830524ba828ce65f294abd8719fe51da9e597 |     
   xtensa    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/7bbe559058eb74c68756689e9c4d02410302947b |     
    i686     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/218c19e121dec7c16db303a516cb8cc3f81fb466 |     
    mips     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/63623793445c845467c0c2d631c61017d4c36ebd |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/c51c602959b6bddcf1e8646274b5070d0c2d0d58 |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/625ee3a5154aec36b43d41a065bca8d5febf50f8 | ORPH
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/3771de94b1d719a4f26208288150e79e3edfe1fe |     
   mipsel    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/bebe3e233cbfa663054de0cdd28638a58f263cca |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/2683951c55a8e3f5bbd1b02e2669296a13c28409 |     
  sparc64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/3827d614064664991e939616e118a0a93326cb46 |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/7215039677cf0ce7e5b50fefb03bb64317d22d88 |     
    m68k     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/730cb31737a20eac9f0500475a8dc2c1a9c565a7 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/70e57a78b0a185a38774c6ac463df13c7a2b7888 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/273baded05e921ff88c7c38f52ba6001a12004b4 |     
    arm      |        linknx-0.0.1.37         | NOK | http://autobuild.buildroot.net/results/1e67059ac1dcaded9f357fce3aa58f21ee1ce1c5 | ORPH
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/c2befa9a0d640b9c25f3bc969ab688da6cf7e24a |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/08ba49b7ca7c5ddf03c79d56a1c0b083f5f44698 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/570b63f1b40fadcfde34b22be205e216d339d0db |     
    m68k     |            pdbg-2.4            | NOK | http://autobuild.buildroot.net/results/664d361ff4fbbc4e910696512f1afbf4369660a4 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/8c31f99dd0c0a657a9207a6bd7aaebbde392d0a6 |     
    arm      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/4ae0a253921738af67dcd50db23b1eed2529490b |     
powerpc64le  |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/c399ffcbc7dcbdd71605a9877e0de9f1af3e124f |     
   mipsel    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/e81e56e51bf4c3e1168298bfdbd07fd05a1c7bf8 |     
  aarch64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/cc4b3e0a25d4e669eb8cc7ff10cef42e28ce8ad0 |     
 aarch64_be  |        target-finalize         | NOK | http://autobuild.buildroot.net/results/14f0966f3393b8d656219328bb93f79e97d5c338 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/1fa62880da93ce2a29cd0ec8d21f331879aff6ef |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/ec7ceeba6f571a71375e9a7e8474eb9b52199789 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/dd97cff088a71f7e08dd9bcd427bc8efe2501df2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/83fe3d3674d41dd93ba1fd6cb6cc04659d0eb0f9 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/ad61c59d2c5ea5de039a149ade044ef84cd0bdac |     
 aarch64_be  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e83613c06041a60f89da787f4ebf876245713cd2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ea9933530a84b0e4de82a06f252b3092ba674f55 |     
  mips64el   | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/eae80c5ed9b45ac96f14e86a1f38c96c7e8883cf |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 3 
                     host-llvm | 1 
                  libssh-0.9.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e06a2bfabf2389e4d21a5141ddbe2eb31830a670 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c38bdb4d4aef539e0bd85356152e2e9b5b7cfbf0 |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d0b179932d04f708f1bbeb9d737e2d9a138b5da4 |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/7bbddf862a898b4eb1483876917d2b3601a9cb45 |     
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/efa843cefa58d2bc5f0c0fba106191399b1e7cc6 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                  flashrom-1.1 | 1 
                  gmpc-11.8.16 | 1 
                   i2pd-2.24.0 | 1 
              jpeg-turbo-2.0.3 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    quota-4.05 | 1 
                       unknown | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/306d64b772c42380464cf6f2546ce27fa1291390 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/91faa570b196f97e61a8b783f3af5b3a2f10c688 |     
  riscv64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/c908806f8e3604dc9d041b61ff003c1e18c5c9ab | ORPH
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/a0e5b89c778a779bf50f9fbfb7c116325c95d5ed |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/e441af9d96963f20faa721ccf78df6fcfd78cdee |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/f59b3a96b6ee49e12cf482ff189290845d61eb69 |     
  aarch64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/5ec517edf31666aaff8f4f96ec71690e6d416a06 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5659e1c91831921bd9ad6af670258783771b4dc8 |     
   xtensa    |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/2d2168f47444372b5fe3e7e31115ca0299c0db3d |     



-- 
http://autobuild.buildroot.net
