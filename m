From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Apr 2020 06:25:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-21
Message-ID: <20200422062542.73811203DF@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 29  |  8  |  0  | 37  |
    master   | 163 | 113 |  0  | 276 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 13
              ibm-sw-tpm2-1563 | 12
                    brltty-6.1 | 10
               apparmor-2.13.3 | 6 
    python-dataproperty-0.48.1 | 6 
                       unknown | 6 
               apcupsd-3.14.14 | 5 
              bitcoin-0.19.0.1 | 4 
              mbuffer-20191016 | 4 
                 mesa3d-20.0.4 | 4 
                grantlee-5.1.0 | 3 
              host-grpc-1.25.0 | 3 
           host-nodejs-12.16.1 | 3 
                qt5base-5.14.2 | 3 
                  zeromq-4.3.2 | 3 
              gnuradio-3.8.1.0 | 2 
              gr-osmosdr-0.2.0 | 2 
                       iwd-1.6 | 2 
                  stella-6.1.1 | 2 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
                cracklib-2.9.7 | 1 
              ghostscript-9.50 | 1 
       gst1-plugins-bad-1.16.2 | 1 
             kismet-2016-07-R1 | 1 
               libtheora-1.1.1 | 1 
             lirc-tools-0.10.1 | 1 
                     mc-4.8.24 | 1 
                   mpd-0.21.22 | 1 
                  ndisc6-1.0.4 | 1 
                 openjdk-14+36 | 1 
                    owfs-3.2p3 | 1 
          python-enum34-1.1.10 | 1 
         python-markdown-3.2.1 | 1 
                ramspeed-2.6.0 | 1 
                  rygel-0.38.3 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/aa2ad7bdb37da611a4ec863ed2e986f34ea5228b |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5b04fccc3621ec8f8bd670b5249c04de2c61fc30 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e2f06512513243fe19e212af51955497083bbfb1 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/19af985de6e26813b841e7019051da3043c2b7d1 |     
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/187ec53e96846fd439752679730338184f1ac12d |     
  aarch64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334 |     
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/e84caa51cb12c4b2594c6d182def731c1ad1cf47 |     
    sh4      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/a172e0727c04564622fa603605f01d11ab95a9ea |     
  aarch64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/0c8ce7f9d5b6e30d146c7c67e6a2ba45959b00ab |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/1d6ddaea892361b7dc4f1fa4e9eb248fa14718ad |     
   nios2     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/49b35dc55502dac1d7b4aa4a245c7a37729fc39c |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/808a4adc6d565c369a9fb0d4e3f6012198e0e0b6 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cad381f3ec8a99fcc57067c374899755fd4ec411 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/63c0ae85dee5057d6d7de213fc63676b2423b807 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/eeab4697d202b514b560a1239851ddfad2deff62 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/75b78c3324c4069840fcdbbe0874b5c36b4955e2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3e64881b379455e2f54317d10d3f50ca8a066622 |     
   sparc     |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ff84dc527a6e3af996f50cf359aee9c72333b98b |     
    mips     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0617d84ef84a3dfeb3c37f001a1f135d64ed4be0 |     
    or1k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/4dc669201bc84b84daf348c2fe4069fb1d2b95e3 |     
  riscv64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/1102509dd58ab6e4de3a7f31802fb587b8604939 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/3107f8c6ef106f6979778b3486ae048bb67260c9 |     
 powerpc64   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/94323c43bac2c31442b8405905e2bf7ce0f39ac5 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/a64a153c8dfcabeb596541201e5430e511b29d72 |     
 powerpc64   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/062e2881a10136f58b0beb84dfd1718ffea2e8b5 |     
   nios2     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/6b8ec9bbb2430a3d0b2841d1232926c765922138 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7b1726317c250b9652ea271d94e3424c256a8ebe |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/622ba1bd959a02eae2ba3b252223a64b480d7dab |     
   mipsel    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/f3ab074f1dd5c652394023b7c586008ae8387b27 | ORPH
   xtensa    |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/7406933f2ae9537cdaf57fe6daf2efda1fc46016 |     
   mipsel    |        ghostscript-9.50        | NOK | http://autobuild.buildroot.net/results/f6290f3248397fb91538a47af7720fdf4e8c480b |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/66c188ba1c9e0f6b818bb314d4d6df878b97640f |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/90ae9b6838ca60f2996848c64b8ea50c14b45f00 |     
    arc      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/baedd6d0293171415e75cd05338f54b3307105b6 |     
   mipsel    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/e76b71dbb99039d6f11efcca79164e1d8c8c3423 |     
    i686     |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/f14742a67f8b94ef0b410588744c1e5fb00cd995 |     
  aarch64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/7922ceba5a32e8ef3a71ec9359987d77708864e4 |     
  aarch64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/61869a714ea0c6e990699ecb5840565b746df309 |     
  mips64el   |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/95bb00e0be197c45ec4bb19abec8fa6b7cec2e3a |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/761cd86e629021b0eba06e0dda86508a18ff8966 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ae316b3e25a678189c23a38899ad5400afcffdde |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a8841accfa95c59877da7760e0ca8ae67ddb2d57 |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/d8a983b127eca484ab0997c6740597cc73e88e18 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/29d8aee3b907d81dae425348e4594fea7aa93016 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/6b97f0a185c5cb1c8502db7bafdf2a3878555770 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f405762e267305f984ac1c266f8737a0e7221d59 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a02d29d251819becb8863c8dfbd6bce32fc17e04 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/53f079e538824d5d0b9529d929ff55bca439e3be |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a18b25e18d1af892676db3716e58e43815b56afa |     
  riscv32    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9abbbdd2735991277c0b821a47c579b053335caf |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/34151bded9737f7c128b7a2d763c9e0af8018068 |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/12d2c27c38cc52248d3277995a9bb5eae4b8bb9e |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f034f59d0663419ed8fe885650af0ee23695bdd0 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d2307820c08a3e3ebd4c19faa0799b906a3c2e4f |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/be0f6e20a74f6b28f2a53fca435c94b4a1070d16 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/690549a686ad4296f4baae9e82b34d7fefa7f543 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7e6c105f14b438dab9f5b7612c5a86ac025835eb |     
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/bfff465b7e1ca9a93bbde57ebb0ae6806759b7fa |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/316b14579e2c0ac6ec690d5c875e2097c13f82c6 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8231c0dd556a893ededafb963beb19e593d03554 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e3289051569292f7148fff2bf7f915a16efe4515 | ORPH
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/fdb67297e551c5422fc5f4e058463876682b07f9 | ORPH
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/9ce597cf2c06f8d8451194701bfe00c4fa39f7de |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/2b2be32fac82f3b291f1304f977655ff8adc286a |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/2187e5182721c7567f4b1b847f3628bf3de96f64 |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/330492ff303e2077d89046c9c1aa306c33ca17b4 |     
  riscv64    |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/297d72b13d6e0d0e999564d47939dae3a19712cc |     
  aarch64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/dadaa808f32f12ce9ff261ef84f70afdd547a3bd |     
 powerpc64   |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/bf1eaf055660915cc677fe61b3ef5c67c74177d3 |     
   x86_64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/4844e4f36b3244a52edbd7f09c5edef633184b6c |     
  aarch64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/0378914c8997d67b027195772fb86f0ecf88f368 |     
    arm      |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/f6f0a4196797483637debdee38b4151337ea76ae |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/29b95210b15e6d8bcbba5ffc9d1d9a7457dd8749 | ORPH
  sparc64    |         openjdk-14+36          | NOK | http://autobuild.buildroot.net/results/692820b4b6d4da42cd557fa7badbbd11806bbeba |     
   xtensa    |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/042e08afb1c3d86be9c38ea3c13ca18309fbfbf2 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/25b8bdd7f30d6b0f05b91e440b170ad0e13ec586 |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/02ebfa91f26e975e312e487dbd7ef89e0274480f |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ec2942172c1951bf7d80d2a8722e05d799bc6dcc |     
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c779dcb9eb55d73e3a4904b01fbc93f36b37c037 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/74f6549e6f6e52cbe8672a9711073f6bb7161d68 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/749820ec884248c7245b543de5317d4c84932b0f |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b28a62030a8be58d374e0883f93c7b1bfa921d7a |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1a1b5655657af847b676acb0f2ea3e5059c32e4b |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c8dc259797c334392d7ec0c8a07ae6a2a3a16ec9 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/2cc2383bfaba161165817109bcd51e0cfd101bef |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e8e96c59d7ca3d9205ab48184b53b933fbca9810 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a34b662611843bbe2939279e5617cca68da037e6 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b02a86081bddc9c84a7f8bcfbb4ae168f74e7f88 |     
    or1k     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/6c9680335a7c132ad3fcc136fd054c9509644902 |     
microblazeel |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/aa3c08bb61d7e2602b563c9245986b820f670938 |     
  aarch64    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/b219e6e3075e89af36c165bbed9818f250f5c3fe |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/b07a2613b33461618b94cab8d6cf63ff6fc8cc73 |     
    i686     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/1ec694450cb7e60521b67b96161afbd27bb34afb |     
   nios2     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/beef7358401bf4a769cf7cfb4888f9a114f9297c |     
  powerpc    |      python-enum34-1.1.10      | NOK | http://autobuild.buildroot.net/results/34a229adf813a3e4dfb86be601fe05c7f190be9e |     
 powerpc64   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/6efc7c70765930f23150c21645d76c425b0c0c96 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ae733181c4b3d6960984faa5a16e121a7ee01bb2 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d5320b755a9b1659086f81b26eec00587cc32e2a |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7c8b4f9641c24455aa35d4fcd77045c8de5def1a |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/979b33ddeca66a5d8318bae34ce18704df3e80d0 | ORPH
    or1k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/483efd717835f7fb583da54337031f0ba0d51e4b |     
  mips64el   |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/fa5275b00d63daaf2e11d54755453be431c76398 |     
  mips64el   |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/cea5eae0eb319dd261694b89606dbb6f269a0fa2 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a49f90d9d5574a2655df0752d7749fc4bc7a5149 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/71e1cfb0544600c6d5bed2d3ad26f305e8401255 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5a4c4ef23fc05f58ce21960d16e98e3b43d8ff00 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1507c6258a7d9e5103c5773eb47f80a4c564d584 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/872408fa6b3c485c0c34f4994da4797421ab5b08 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/aa6e67a35e73a96ff449fb537be2e2ab74029e89 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bcd0c925ee323b932a56c502a139f4bc6460620c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/5ecdcb0f402c09bd7f070cfaf3623935b3e78bc3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c30ddf4b912b86fa34e92a5cb5f889428552514e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1b6d3fde275c0fd38c29d0af76b2fff9b335ceab |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918058  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918090  |      
                      nitrogen8mm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918160  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918169  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918167  |      
                         olpc_xo1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918178  |      
                       olpc_xo175 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918177  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918202  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918250  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918349  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918410  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918412  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918416  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918422  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918425  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 2 
gr-osmosdr-46698a67e7e06419... | 1 
          host-asterisk-16.6.2 | 1 
               log4cplus-2.0.5 | 1 
              python-pyqt5-5.7 | 1 
        qt5connectivity-5.12.7 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/4192fd14f0f8de5188130f6b4ba76526e2b7c318 |     
 aarch64_be  |      host-asterisk-16.6.2      | NOK | http://autobuild.buildroot.net/results/4c39fb898e6bf33058e9f9bdd6d44d400626c17b |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/19ee9c3d04706254b7a86368e6ec3542175fd51e |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/494f281c4ba16d3bcf059adf467c32826155b1e5 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/cc19831271b0ca22eae4389865dfd634429df42c |     
powerpc64le  |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/da62bbb27f80f288ac951ce5c77dd979348816f1 |     
 powerpc64   |     qt5connectivity-5.12.7     | NOK | http://autobuild.buildroot.net/results/802c1990ec9bc8d9d7df5907566762c3a5b0c7f0 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0c7ea9e773787ecf2f997d1dd2c7f05e9164f28d |     



-- 
http://autobuild.buildroot.net
