From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Mar 2019 07:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-21
Message-ID: <20190322070050.6267E87C63@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   2 |   0 |  24 |
   2018.11.x |  31 |   1 |   0 |  32 |
   2019.02.x |  30 |   3 |   1 |  34 |
      master | 212 |  67 |   4 | 283 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        m68k |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/85c3510213e8ea82ac6f2c4c4b6ce89938dca479 |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/be616cddbf4b7f2ed359cd328c53343e170da5d3 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                   mpd-0.20.23 | 1 


Detail of failures
------------------

         sh4 |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/9e1c01c8d783659b3e635105809ec571894fe03a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    uftp-4.9.9 | 24
            optee-client-3.4.0 | 8 
      host-uboot-tools-2019.01 | 6 
          openjdk-jdk-11.0.2+9 | 4 
                       netsurf | 3 
                qt5base-5.12.2 | 3 
           uboot-tools-2019.01 | 3 
                   netsnmp-5.8 | 2 
               wireshark-2.6.7 | 2 
                 xenomai-3.0.8 | 2 
                     gdb-8.1.1 | 1 
                   glm-0.9.8.4 | 1 
                gnuchess-6.2.5 | 1 
         host-e2fsprogs-1.44.5 | 1 
                host-libsodium | 1 
                       host-m4 | 1 
  libnetfilter_cttimeout-1.0.0 | 1 
                   mimic-1.1.0 | 1 
                   netsurf-3.8 | 1 
               pulseview-0.4.1 | 1 
                 python3-3.7.2 | 1 
                supertux-0.6.0 | 1 
              swupdate-2018.11 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/11d8cc1ecbc0808fb5e379f5b04693f43b7624bc | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/4341104f678776a8bbc5377cafb1ad6f146bfff1 | ORPH
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/9af1325e655a6132bd90f001fdb606cbb13bf944 | ORPH
         arc |          host-e2fsprogs-1.44.5 | NOK | http://autobuild.buildroot.net/results/7215f3a4d35293e8f8666ca077654d5bd32a7752 | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9c7c7946a77717e66977b4e35d7237dfc2729165 |     
        or1k |                        host-m4 | NOK | http://autobuild.buildroot.net/results/9e4e74c1b5069f9902a00a4e77864dd6114bfb64 |     
     sparc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ca4756322ba7cf46e1da359689b27c9796b11121 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9d27e7ed1a868524eb5745ba795b6dc0417748c8 |     
       sparc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c3bcd9f7277b9f9ee32ec9cc56c606141ada92f9 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/793db095c1c5739009377b8744b94c32cb3a769a |     
     riscv64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2a113b54d825d46b17beb2912c7d09ada9ecf002 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6a18082cee79c3e2d902ed36a812d403630eab75 |     
         arc |   libnetfilter_cttimeout-1.0.0 | NOK | http://autobuild.buildroot.net/results/5f3d59662b1d3bfab1fc3d1ca6c8b58740a05137 | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/1f0f00543929bab519ec1dddc020d08b5890af4b |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0c76ecf72eb24a324b5f8ecbb52ef0f63318c118 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/26aa0319da20198c78cc78db83740528d8013d8d | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/a9addba83c64c6c3e11e8a1ab1debf3b691ba119 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/d1e27f13c73339f6f85d40e46fd2ade8b4192b65 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/d7340f58e9346581b5e0c392905472112ad828db |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c1e5c86b4b36a8745a385927047a293207fd7d0a |     
         arm |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/4fd34b3d4ddd014f0986900d4e4d9857d5c61642 |     
     sparc64 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/8be3251b4d91b3d2509367844d06e5fbb778b975 |     
     riscv32 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/6fada4af6cd67d43cca8e76c63f77b8cbd5c6593 |     
     riscv64 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/df7f393ec62f0e38034837ffa591ac5af424c373 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2822bd239f3ffd58fd3337fb254423b195cf44c0 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/dd3bb1f3141840b10fbd899869e504910b839dc9 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ade0f8356533c104198b9fc5836bb3401cad20b4 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2b211d950c529eba62148c9d5efed0fd12ff8827 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9116e31548d3b91141cee82e8e5c0e508a714385 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3732cb08f1e1ee0e463714579f787caeb6ec096b |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fad20924dc1efd4274ea3c97485fb90ea01b2d59 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/89a1e398ce4c2f102f82fd5ceef2b812578f1899 |     
        i686 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/47e2c79f97c2a9b762b7c2b82f8c734aa4ae60bd |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/ca8cae3a968619df8defb6883e4c16f16f4c6f3e |     
        mips |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/eb4d80e900a7ce56b86912e7293546a3dcdf22d6 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/f8db8b4919a489c9f22a980c8ca4ab5de8b42a06 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e403a66d3dc6a277d23a0b6b4707d4d857a0cc8d |     
 powerpc64le |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/c484079b2736eb3c21adff257f3e3ab1acc67f9a |     
      x86_64 |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/a6f5169382cf60f74ab197026e93d6e4eef17d9d |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ab16f6a7e76a72b3769cd105a0b19146dac9593b |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ed696f5c058610e6b0c522dfdd1db77f284727dd |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/259b93262c4c0f08670250f82842725b8961c69e |     
      x86_64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/40ee9a63cd89cdbbf707b0fc0c770489bc6a720b |     
        mips |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d67896e9bf5236b4340dd8a8929194ad331fdfa6 |     
       nios2 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8396f5d60182dda0b80e5307aee0cd9a9fe726ca |     
        or1k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/c339eb14860c2c498b63390c827307348020929d |     
 powerpc64le |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/5bf4961b7dfec4cfc1905a84be21307f66cb3ee4 |     
  aarch64_be |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/fef4a2736ee7076b50d80407af3864b64e4bb6f8 |     
         sh4 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/38fcbb343f48015fda78bd2207c98f21bcc4fe0e |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/cc67b4b0e9bf6c05f8db56845649ad7a96362145 |     
    mips64el |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/b92e00ecf6a464a13f85f785b6ae7ab5eafdd907 |     
     powerpc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/f4188a10462382813861132254eb8114a0182455 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/c5ad2dcd368afdae7f954de14a94c3c85110ad5a |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/ce58b90a68c686e81df65a24c9df3533c453a944 |     
       sparc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/9803edb607542ac958f1fb5728fe63d52ad19a5b |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/fee7da94e77e46c3f207671ddf5e4c63da086836 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/7ba73e390a04a302756321083bdd69436e2cf335 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/fd5c420c62357b7ac45e97e1b912f5d0834e321f |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/f5216637cda6d2f95fcbb3a40f603c730d6cc767 |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4b6d99d650799a1ea6212be948f5bdc7c194b38f |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/70680f4c467baf8e068a92f33c4a555f4b38b08b |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8715bb6947e07d82e14d00003fec68734bd156b3 |     
     powerpc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/aacb2ceb4f20d31d9a0d138783394d3baf88a1ea |     
        i686 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/159c394ecc592a1f5bb5b284a570adc7afcf04f6 |     
  aarch64_be |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6ba002dabe6ee86f71b69bb007e78c906995673a |     
    mips64el |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/79ab2a6748e2b15371c91e7ee992da6d0bbf93f1 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/88546b516d3846d14b882b24f6efe46d75e2c831 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/e57b58d94139890872d3647d59bb48aceb85ee32 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/a8b59538f5621fc634db9154dda688b1f81594cd |     
         arc |                  xenomai-3.0.8 | NOK | http://autobuild.buildroot.net/results/f27b97ac10cfd9b519f8e8e249e6903b54b3dbfe |     
     aarch64 |                  xenomai-3.0.8 | NOK | http://autobuild.buildroot.net/results/502fad4d7a016b1cd12a9bf171d6dacbbe248cca |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                gerbera-v1.3.0 | 2 
                       netsurf | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/94795ff20096e9642f25ac9babb5add49baf961d |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/c904db09900dcbcb2601a54d54bb516db6cce1fe |     
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/07d2ab392cac5bb68dc169111c6f998dc9216b71 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/044ba3a92d0dcfc94062c062cda781cdf4177f10 |     


-- 
http://autobuild.buildroot.net
