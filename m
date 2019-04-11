From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-10
Message-ID: <20190411060100.6EF512318D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  32 |   1 |   1 |  34 |
      master | 181 |  61 |   3 | 245 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                civetweb-v1.11 | 23
       host-python3-legal-info | 7 
host-android-tools-4.2.2+gi... | 4 
            python3-legal-info | 4 
  vdr-plugin-vnsiserver-v1.8.0 | 4 
                   netsurf-3.8 | 3 
                qt5base-5.12.2 | 3 
               wireshark-2.6.7 | 3 
              ghostscript-9.27 | 2 
                host-go-1.12.1 | 2 
                       mongodb | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                          opus | 1 
                 qt5base-5.6.3 | 1 
              qt5enginio-1.6.3 | 1 
 qt5virtualkeyboard-legal-info | 1 
      qt5webkit-examples-5.9.1 | 1 
               tpm2-totp-0.1.1 | 1 


Detail of failures
------------------

microblazeel |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/b225425ee237852bd9fee4ca0b8d24f3e37d64f9 |     
    mips64el |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/ca6b55c27059d2c0e135cb94499cbb039e51b7f1 |     
         arm |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/4923295560b79d928c5c119b1b42dc430d83bb24 |     
         arm |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/b040ef875ac5e0878d49b784fa106dbe28704027 |     
microblazeel |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/e2d6220484592c6e68a3937b2d9c89ba00797a5c |     
 powerpc64le |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/db9f9f70a9c9c012eaa6026b75e6dc239d277d38 |     
    mips64el |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/15ef170a9cd43925f7ffedab151edb684df3ed9f |     
         sh4 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/ff5ab789b47fd9cc897c769a112d209a186f2cc5 |     
       sparc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/bb9241b765fd82b1e209a8b20c0964dc9a4142a1 |     
     aarch64 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/6c1cf1062e0459e37282da6bcaf4fe2999fcb955 |     
microblazeel |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/002e930cce02c855a0633f84bc38a49212e11c78 |     
         arc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/c863d905a9a7190516a392df70be328947c9913e |     
         arm |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/18fd0070381617becc62c1192b427c1d81911a49 |     
       nios2 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/7f23bcf4201d22ea76e6d2befee110577445e288 |     
        i586 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/4df4447fbcf9c1c6d5f6bea768ebffa23766bb63 |     
    mips64el |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/7d088d7992d601fc8e70d7723cc3beb9f212fa72 |     
         arc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/f20a6b490f026093eafabb612ddc78b6803c219f |     
    mips64el |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/120433e1f95f0fa9045e5fb9e54d43c79376ab63 |     
     riscv64 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/d2478d6a0544f4878b6dc4c03cced5d3480fe9cc |     
         arm |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/e3a469bbb2d5b00e03d8ffbcb3e4f5f2de33a826 |     
        mips |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/8baff1ccab206619f9fe6799e4e958ba0632e77a |     
     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/cfc3de0a75bba5b8bcaa66ff09be1df10b52b9e5 |     
        m68k |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/41fcee269f62b53b79bb4bccbb1e3868f9b0965b |     
         arc |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/08db18b870f4d99a1bccf76feca7878504f9b94c |     
      x86_64 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/65e9f54fed6ec1f8196bc38940314db14ffa4ab1 |     
        i586 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/de7e817dbfc46f42f747d346b1a9167ccc569290 |     
        m68k | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/99faec55535ea140732134e453f83198c3bf4c21 |     
         arc | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7b4d853edb7c1eedee871e092f6ceba138b6bd39 |     
        mips | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d192786dd95381321a503fe7943ca5ca37668ac7 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/dd09f738202b35538d31d72c2d9e41f620548bee |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/ec64a1934582cfe1ddea27a47b188405029eac9f |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/a9367589a87a1058f62b4994290bfae8648d2cd1 |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/f0b1dedb6ee99c9b320689d3d9fc686dff03c6d0 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/da8bfffa9b98b6eacad22c0a9dfe270dc5a735a3 |     
microblazeel |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/f8e5f6490d979e3453b6946fc2bae1f53fe73bf0 |     
         arc |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/c8c08dff6c63f78bf1211aa835b2e90e72d90850 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/b5927d6c181465625f89532a5a2b91e938cc5e31 |     
         arm |        host-python3-legal-info | NOK | http://autobuild.buildroot.net/results/ff4fb06c1da0fc62747f6d18650b84d0a63aca61 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/632db4a97ffcf99f281bff4ca76d22de0ff76e13 |     
        m68k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/61f020827baf3ed58dbcf14371cc6c8fd8d855a2 | ORPH
     riscv64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/63205c8f01890714542f347c639a5ea4b09b246f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e0c9a902b5b8bddeae8b0d7efb48738dd016d62a |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0a126186514e014dc56488de3cf5a26b03550624 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/aba750a1e3836248f455b3c75d201b7c213ca10c |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/939ba247085d1574cc2211dd669e8701e95af9e0 |     
      mipsel |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/f502e79d358c45e0fa55bd23261e83167f3ee6dc |     
         arm |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/429edd9fede25d39d019c6b9c4fe21f9f8b8a07e |     
     aarch64 |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/92c3e3dec9af796b900e199372e627d327855add |     
         sh4 |             python3-legal-info | NOK | http://autobuild.buildroot.net/results/dfd72a98e5f8d378de49aaada47b45c62ae67d1c |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/ab92c7b45a7fe1785088cdd42d5ad869edf27185 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c8cfb2dee5c90488fa75d2e08a3ef27474a6f1db |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/fe183abf3a5ffcd1e80381f1831c1461669a62db |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/cbea452bb7f4ac5f95d3d06a5cea476a21a6a0f9 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/17678502bb33dae229064efe3e09df960906dd57 |     
         arm |  qt5virtualkeyboard-legal-info | NOK | http://autobuild.buildroot.net/results/3812f4a6313fab57766c7b98defa723c58a8fa76 |     
        i586 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/3499ba0cf24e313b9c9dc1b47d3f9d62b8f9b8e0 |     
         arm |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/89de8355904ca58764232f3ebe1a466f15a663bf |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d1e03b27c4c4cfc6f62c70602917c32e6befdbca |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/b89d787dd0a968adf99fe9e2bc5987a513eafff6 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/e4c032ced3354d6e70d9c9b0cd1377cc03d63b8e |     
      x86_64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/660e815d6f887a609706fa0a42b8994022aab1c2 |     
     riscv64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/44e0a23bd14861c780bec8205dc06dabbb40de5a | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/e3e055a9dcdd41e4bb2b02d63aa92ca498ba871a | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/3d611b22caabc49e4eeeca6f450bba9b68609c9a | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

     riscv64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/bb98ab4109160e4549ed483dc335c3642a4e9c49 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/5eb48562b25bc0beb981ffa92b0b3fd4c5ffd56b |     


-- 
http://autobuild.buildroot.net
