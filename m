From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 Mar 2019 07:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-28
Message-ID: <20190301070050.ECFC286E5E@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.11.x |  16 |   1 |   0 |  17 |
      master | 202 |  26 |   1 | 229 |
        next |  38 |  16 |   0 |  54 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 ibrdtnd-1.0.1 | 1 


Detail of failures
------------------

        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/bc87110e782e343ad8d26821e7cd19dad1d5c12a | ORPH

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              libostree-2018.9 | 1 


Detail of failures
------------------

     aarch64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/bcbd52ceb15de6369024cd665b889fdb5f25fbfb |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 8 
               runc-v1.0.0-rc6 | 4 
                gerbera-v1.3.0 | 3 
       gst-plugins-bad-0.10.23 | 2 
                beecrypt-4.2.1 | 1 
                   botan-2.8.0 | 1 
                   glm-0.9.8.4 | 1 
                  linuxptp-2.0 | 1 
                mongodb-r4.0.6 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
           qt5serialbus-5.11.3 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/410fa4076b5230918d4c2b71b89c636ad7835fa0 | ORPH
       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/be50e00a90f21b2d980793418d978ccc3b523015 |     
         arc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/f072749062e44c64704a26e22e6b3b5acab2ca7d |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8567ea21f6d2f07fade2fd56e1a6b13f3c73636c |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8c2ae44f08247da5a7eacb387f5e9056b72bffff |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/7d0a0b0ac8bd11d6a0e46bc8854cb53bfaa4a49f | ORPH
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/b3370a485140255c3a1aee022e2a1cd14f8b74f8 | ORPH
     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/8a6dec038cfb961cbaa88d2b33675923477e2957 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/eb0adf62de15378e1be9d3ff12cad900d3c56457 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/20422708e4615bbfc5efc38eb50e034422430bbb |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ed2ed1cc376021bdaab52be7007f1bf7a1bf5c71 | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/7427d70c88b0ce0309e2e876108656490a52212e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1508c014a99c92a8d18bdf8838aa6b82876e89f5 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2897f773dad2b0b55f1eb87cd943f702489ed9b4 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8393b06bcb20ec3a30c7ce89433519cea711b1e5 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d893f0ceb3460b631a828a39b004e771d23d9f58 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/352b85d62bbf514b4005dea0b1febe180bf48e1c |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bfb45950b232989b57087e47c84c514535448695 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/43335b63b2f30b3e5b5438a20b7d733b2e2b4919 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e348194cd1a5e156e54c5ad9e02a3372364aca38 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e0325affb933113d4922a4ec433a1296a332fbf9 |     
microblazeel |            qt5serialbus-5.11.3 | NOK | http://autobuild.buildroot.net/results/8708256a0046ea0d133520f37352329664fba16d |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/e28437e67f64e97da902af7659bd8041feea44e0 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/935f347c2b5231b65335a3f81ebde55227ef9157 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/e9d16d86916f3e8658c9dfdfa054b95258014d14 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/f9776992183381f1d9def5076f855d143655bba6 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/415bb3e6238feb1dee60a22be49ce29a1576f209 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 6 
      host-uboot-tools-2019.01 | 3 
              lua-curl-0.3.9-1 | 1 
                   luvi-v2.7.6 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.46 | 1 
            optee-client-3.4.0 | 1 
                   tor-0.3.5.7 | 1 
           uboot-tools-2019.01 | 1 


Detail of failures
------------------

        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ee63842a815648b0d1dd6c0f641ee050a673f718 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f8501f52df6684d51011e83d71611ad374fec9fc |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/423721ec971bf64274417f1dd7168a5ecd6672de |     
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d2b9c6d4b36d97a2555d1aeba9a4824c4884a3f1 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/96825cb28ba1bc87336119b8148b8cba638c80cb | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/55afce5d32f1bce0b8f2de15dc3ce11fe3353888 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/508e7c36db8c45aa4b4ff6384001dee67f5fe767 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/673e268d924c79380ff07b34fbac4b7c3476abef | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/255f7273efbd52a8ff32a7db00db027f0a058d1d | ORPH
    mips64el |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/d854bf65a1bf4fc9bc6a3a0279202b3fc5cea1d3 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/6861c8b4c09ef9ba302ce8e7062964f998655809 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/94f819e81062d178faf92160cb5b0e9c36ce89ea |     
    mips64el |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/3ff5dd713b7b74a73745859937d50575b16b4528 |     
      x86_64 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7151e186c96d679b621cfa6b77c0a18686f3739b |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/75a3a91bf16571e692af562fb2b12c4d27f733cd |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c5ede0cc5be03565035b5bb9219f5f3ddf0137e8 |     


-- 
http://autobuild.buildroot.net
