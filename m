From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Mar 2019 07:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-23
Message-ID: <20190324070053.10948878B8@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   0 |   0 |  27 |
   2018.11.x |  22 |   2 |   0 |  24 |
   2019.02.x |  31 |   1 |   1 |  33 |
      master | 253 |  70 |   7 | 330 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
                libsquish-1.15 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/56d3a3e58bd6964ff508c29b92b5f0b02210f9b0 | ORPH
        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/5700ecc237bdd4c3817401c66367898f64c1842d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    uftp-4.9.9 | 26
            optee-client-3.4.0 | 10
      host-uboot-tools-2019.01 | 8 
                       netsurf | 4 
              qt5enginio-1.6.3 | 3 
           uboot-tools-2019.01 | 3 
                  brotli-1.0.7 | 2 
                host-go-1.12.1 | 2 
               wireshark-2.6.7 | 2 
                chocolate-doom | 1 
               domoticz-4.9700 | 1 
                gerbera-v1.3.0 | 1 
                        glibmm | 1 
                   glm-0.9.8.4 | 1 
                  gqrx-v2.11.4 | 1 
                      gzip-1.9 | 1 
                           icu | 1 
           intel-gmmlib-18.4.1 | 1 
                  libssh-0.8.7 | 1 
                 mesa3d-19.0.0 | 1 
                  monkey-1.6.9 | 1 
                   netsnmp-5.8 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.47 | 1 
                qt5base-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/b719e1a24bf061b26001be934be866e4a57c34d1 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/2035f1fa5558cd40d46c95118aafe11b148cf86d |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/5c38a0bd4f3391238df35424ca2907c2e576b73c |     
      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/90e2bf9b85d9c7ef60b904800ca5b24f75ff5f50 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/e5831e3472c1653bf853f8299104e97f1289758f |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/6a2fdafee637ac7d0460a6fd487fe036049e2fc2 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/430dcd506ed384bbacbdc2540ec64866747be323 | ORPH
         arm |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/15126f00a621de99052523aba04cfc9a314bccd3 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/5fd2a8cf15188942b5e684f702ce381e920ae3ae | ORPH
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/00408be9a520c3076c3a048c8e37fff924a12877 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/851d8ac3d7c51927ea31c37836dba43973c4f58f |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/143876e8224616cb404f165202173476ae947b3d |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e5b9a679e3f8249307cc5d3ff091c3d4622eb4ce |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/272aeff9b46791b4cdb48c851f25ad505d4fcca2 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fd015350ac4346b6083f39faffbed5a16d081c08 |     
       sparc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d232872b34d1e6396062855259359799f7af4bac |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d71501e8d73dd1fc1e90bee238d9d41ac453f421 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fe366a78c648a77a2436f5660a02acd5eb450d6f |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3e63b0706cc4b0ecd0f8336c8c32a6f16cd545e2 |     
      x86_64 |                            icu | TIM | http://autobuild.buildroot.net/results/1c9dc8095ab5d8f13c5352accf875b62bca5dfb8 |     
      x86_64 |            intel-gmmlib-18.4.1 | NOK | http://autobuild.buildroot.net/results/0121befb9b4ba6cffc47ce7f861ed81077fc900f |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/915f1ebc844fa1c73d00db549aa3c0734908acbc |     
         sh4 |                  mesa3d-19.0.0 | NOK | http://autobuild.buildroot.net/results/68a6961c8834da51256765b682e9adee629dfefe |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/c92dfba3cb7bfbb99bc83b54aa90f0ca0d5a1967 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e0ad7a427ef5a427ca5702b9786fc9d03502332d | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/43f1ba144009f8c721a0d4789c089386d2cbe592 |     
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/dfbafe41ecc9f153895f858dceee7fcfaa7ff320 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/88f919108c81fc578b7c2280f2b5182a3c1953a4 |     
      mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/ead67f91142c54813953e5560e110f8951d708f5 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f6077bd360b4c6a1cb1c88f7d854472a9d4edb10 |     
         arm |                openldap-2.4.47 | NOK | http://autobuild.buildroot.net/results/2f16aed3c2e8adc15068da32666f359b71373b9c |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e5414d3351fe6018aa6c491ddbbb76ace41a0f07 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3988013a3653c0b2f5a9ec3d801c14b571323c66 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/68aed16d965493de8a71fc4e4e90662c98d3aab0 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/540be6857bc1029464cbd35cfb06903a37185b23 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/0bf8db2cd94185693c0f5fe078f4abf61dfc457d |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1a7c1713114c044244425cfbf0e5ceef6e7eeb84 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/160b15e6d8ff16d97dc4ffbe750102c796ee29a6 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ad850d59eb20b47dc8dd91f7bc83af3d14793d60 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c88c5a37fbdac79e68051dfd78aa3b445f6191f7 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7d1f3ff0afa23d20e35a75cf19e2e3768ff42920 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/268901b35fdeffc7f4af2e590323404083f26af8 |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/1bde2f4c6ff32a130381d7530356c330c85c0414 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/23d49c1cf6af278092656d2e1b8838990cc6138f |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/88d98ed3312250a36726d1250f215dd22f7b862f |     
         arm |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/cd0999f7f54ca07b401b5f094d1fd685f58906ee |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/740ce28929e194ba8eef09725d56a64fdb1fbfe4 |     
         sh4 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/79082823de29fbc4714d7413d56ac9429ac3974a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2e7a174165ad11eb37488a8a251b1efb57614340 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/771db76501af25f4effab8d2d2f1abe52761a490 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e7b65d4aba95f6d75cf6d0e88e8470e1c473d08b |     
     sparc64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/65692bf5d9436203db015ecbb754ceb331f5d3ad |     
        i686 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/43ec050ac5fe6bc399d276d64dcc3fda9816aa73 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/f1d15170dbd212e71264e0f36c00f4bfce3187a1 |     
     powerpc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4ff01db068a1d451b451cb3281a19399098d3376 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6ee82ea48ef79d4f7955510b8682c13f8c6de81d |     
    mips64el |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e5f966f5e81b8588e8f0bfc41a8a89448a4c2a84 |     
     sparc64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/28c1f078e09ea05ca05dd86c1e132df8a9c87cfb |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e0fcb14d17db46c0304a3a401da64f3352ddde34 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/c0e2e125d34451f698e5b639f38cca6a20191a7e |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d5e08a8a3551082716bf0422c2843b495bec28c3 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d8b17812e251fc02fef793987bacf46a0cced907 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/cf70222e9caf75db213dd59eb92196bcbb9db8e8 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/92033f246e84a00c7144a613e64cb35200b68f27 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/86c762b18adf947eac65bb333d1f452db6d812c6 |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/321cffae648af0dcc7686847f77d4608acf1aff5 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/418dfd94685701f68b7f1177efdf0b70f625b31f |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/3d5dd9b8d32bf06fe3210a8c25c91d434777d655 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8d03482bd09e5072e4a61def0a9c76159eb257f8 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4f08c4c043e73f0aae1167bdda64eb6ea07f789c |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/7d6218ea90b7044c2f5f0da9eb7e47c7ce342925 |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5e67dde52989af10758a911c1ffdc0eccc33e2c0 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/a354406cb1a1becb42330410681d171ea4823606 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5abe1bcfbc0f2563757e8c425c1b606195357de8 |     
        i586 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6d82f18287eb589e06d5d196b0f07b66b548ed3d |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/9665c17fa9cb7db43f48e2bd018c504d1957c3f8 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/8d09af452ad545595a9cb859e4adea87839221e8 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

     aarch64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/b3fabb67de6031dabab0df33004f018bdbfd1104 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/98f940e55ab0038f765f5d1c8bbb38192fee4bbd |     


-- 
http://autobuild.buildroot.net
