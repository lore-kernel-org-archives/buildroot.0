From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 07:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-24
Message-ID: <20190325070043.DD54C8495A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  34 |   0 |   0 |  34 |
   2018.11.x |  28 |   1 |   0 |  29 |
   2019.02.x |  29 |   2 |   0 |  31 |
      master | 229 |  84 |   4 | 317 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              swupdate-2018.11 | 1 


Detail of failures
------------------

         arc |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/009fffe13d58eb8977f1cf626691751364ac2626 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    uftp-4.9.9 | 27
            optee-client-3.4.0 | 13
      host-uboot-tools-2019.01 | 11
                host-go-1.12.1 | 6 
           uboot-tools-2019.01 | 4 
               wireshark-2.6.7 | 3 
                       netsurf | 2 
                   netsurf-3.8 | 2 
          openjdk-jdk-11.0.2+9 | 2 
                qt5base-5.12.2 | 2 
                cutelyst-2.7.0 | 1 
                     gdb-8.1.1 | 1 
                gerbera-v1.3.0 | 1 
                  grpc-v1.18.0 | 1 
                        jasper | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  linuxptp-2.0 | 1 
                    postgresql | 1 
                 python3-3.7.2 | 1 
                   qjson-0.9.0 | 1 
                 qt5base-5.6.3 | 1 
              qt5enginio-1.6.3 | 1 
             qt5wayland-5.12.2 | 1 
              swupdate-2018.11 | 1 
                   whois-5.4.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/d0dfb3dd4afcffb61d79e391dc43dcff20e4c40f |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/53844855f5a3e465265c3633344ea08690d40bdd | ORPH
     powerpc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/42956d8e9b793d9ea2189e5047323c17f539d3f3 |     
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/752cbe9f4061a09ce9b7bbea241c1b6f52107a0d |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/5356962eb973de3b0cb8c01b1c9ac52019b0a6f8 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/eeda3526162c2f21ed99cc50374f3619915f080e |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/e4df70bc5a99e9d3fbbfcded26b022fc8f389c2f |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/66b66c06509ac60c93b5d63abeb4bd06eef36c43 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/599f3952abbec075bc2493afc4f8a63f2f803523 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/5522201e8b02a228919c31b26f0e8e238e0fe501 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6ab23f681a2f8bafcfa3738103036b999611bcb9 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1cf232fafc696e77a1e9f0f76ccc0242476513f8 |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/288137b8eea6154dfa255f2c9a23d5bef352e9af |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4337bb926d8bc5cff3ffcc30534f225a2f1bfd65 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/61f38f983d3bdbda42507f82c3175a9b70120967 |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4220a1e5cf5bbc2b3abf1de24fde8070c5700d60 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d135dc1103b8e59b3567fddf47e1353357e71337 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4ba9ceb90f8cd96b494fd5e6039893f710d16d24 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e2faf516cf361721df325b7c0894fa4f876164fc |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4aade69c770c16cbeb84495555796df6dc545517 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6fafa1b11a37cd6fb5b21f3d549acb50a17521f8 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/65e6b7cb5218fddcbe3aa5da089e3974596a3604 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a326a3e08e0f66af0bd698e18882b87ff410b760 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/74945f303c7dc511fd479eb0894fcddbad509796 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/dd3852b4a835ae1bc8e45fa206011f6da26aaad8 |     
        i686 |                        netsurf | TIM | http://autobuild.buildroot.net/results/b4545731de2593334fe3594e6b1b67a1cba002dd |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b4ebcfe2af80ef91e0c59c6bb8138e3d7ae2c51f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/24af78af1c608c3f5a0f4d9190858d59aa51dbc2 |     
 powerpc64le |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/8df61bd3bb6973cedf9cfed55681261cb0ebe76f |     
       nios2 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/f36b96c91604dda021ee05dd0a79c4f7e89e5a5b |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3506f6311c21a0caf35a298b171062588ca64d6b |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1c2ea6b0c521e48e9fb9ab058046deae38116399 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8c8585181322cb0143609b28212d57d9648a9738 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f936db6b0031d09040a734f3b1561cfa74119acf |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/55d560b065f4bd60cc8646cef7f1a381a4c3383f |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/faaf7be45e29682e6e78ead9fd6dff764ee74208 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/813a6948688b84185d96512887ccffc34869d4ac |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fca756b034f315bb55ba60fd7f02ae2e0435b3c9 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7d6c268dd4e1714c618d8fb361eb7671d8d9f3f0 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/84c7e85c11b415527f935279b4df668fc6e025d6 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/469a286c819616319a5040c172f214a0d8de7508 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cc5f16fb541f753dae976951f9efe59982731a26 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d2b069166b7d12dd734d0ff2cc4d5224272b5160 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/4e63181f1e47cb9172be1a6eed7fecb909282b19 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/13bdd37fc0c5fc3eafaf06cd7dc94a7b5b4f1e24 |     
        mips |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/51659ce27d4c41e22ff876ec7f53cb315186bccd |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/23f9f8b8e903e60493f7c64183dda6aaa199cbb6 |     
     riscv64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/213e2bf40a06b77e4abc7ad6dbb1e116bc89c6ca |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ce1afbf6b37a1f01c53e93c15bac6e6fe32f57b7 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/abe367e31147c02eeb4e7cf78602cb4cd60fb697 |     
    mips64el |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/3eb29ba2e8363b4cbef6a2fe26f063bf219336a8 |     
microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/31ba19a1e4be90623724e6b986c5ba2706468915 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6d774eae0f015ecd1c3577f3c22925c1ab1f0507 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/25420ff831b6d5d1876d133ca1a79208e08a3eed |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/090d3fe9e58db49fe939df81512687db75d40d56 |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ba0c9705166b6da455cbf974a1ef305ed6a5f8ea |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/01a455ddcbc16cd2111352d22bf6603842df4ab2 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4321a0f1f709a9b118da8397312623024f454cd4 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/fe07c48f5f80dea79fac689b249f80a6cec9ed1b |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8b96527f00ec745b2372e386a9637d5ba34424b8 |     
        mips |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/0a9de65ef9c676c9e8fad01176cc3af09145edea |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/210165bf17aff20ba5a0712b6d09b8d9ed910d0c |     
microblazeel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d0c4df32e3b900c0ae48ecd85017c722e6016633 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/ef50e73e3ea545f2506f0ef376800c03f2050f9b |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5e9165001bc1cba52ccb4691df1c07eccc5cea9a |     
        or1k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/9ba3efa05c905a09b070817b07b67d46c2c78055 |     
        or1k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/886d6eb7df7a149b5503502779669a715d7814ad |     
        mips |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/16e7d233cbce3e3185198dae73e260ec0211e8d4 |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6cee3d0f59773a9504ce0e88d5866b4a4fa63b1a |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5cb5d00a0f11e43dc1bb7e59953ce1906eb7ee1b |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8cd3381034c731492c520a6facc3d65c27ace673 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5bd96b6ffc127341453059825de83f0140906006 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/f2973977d6a7b0890531f3720d847589568947b6 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e33f316d4a7beb56bde7924644ac0a43e86ea3ed |     
     powerpc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/cb2e292bbdadf9c7cedbc1e73c49904bfc47da72 |     
     powerpc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d63054709fc27982d27f7a6ce9a3e9ed2c6714bb |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/2936158f3528fdbd26e3d8b004efa7ded20a536d |     
 powerpc64le |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/b16aaf8057dddcefd72700c3b1d90a06492f1214 |     
    mips64el |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e922886e8c927c91325e635feb4dc666bb0bff08 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/c10aade5c2af20129b3015bf32b7f8c88a131e20 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e76a6591271c8bbe35cdb65c178cda2799543983 |     
      x86_64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/47385ade36d1a9f988b9faba722074a05d41bc3a |     
     sparc64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/840c1a579a87cdf3502e6c24436cdf303640256a |     
      x86_64 |                    whois-5.4.0 | NOK | http://autobuild.buildroot.net/results/01338c268c31849289dfaebb735cb0af5090fe1d |     
         arm |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/76b74e8575734c5856ad1dbb3f829851d05e7bd6 | ORPH
        i586 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/6de13f63bcc57529d425afa8bd4058339444cb1a | ORPH
     aarch64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/c98e2f6499a9f7c130989373af828b3441d33ce9 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/8cb9f366a09a3140f02b59196db16ddfd6b332c0 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  brotli-1.0.7 | 1 
                gerbera-v1.3.0 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/cc813bc920e5468da3c643abde42fa376a40c6c6 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/2e5af29078763df75f92974ce4c69280d8da4217 |     


-- 
http://autobuild.buildroot.net
