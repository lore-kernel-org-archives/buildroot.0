From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Dec 2018 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-02
Message-ID: <20181203070035.8097120D0D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   2 |   0 |  30 |
   2018.08.x |  22 |   2 |   0 |  24 |
      master | 135 |  91 |   0 | 226 |
        next |  17 |  24 |   0 |  41 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                   dante-1.4.1 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/90f993087466c6ecdee1321c1c7cba6602812c16 |     
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/6b874bb49c53861711b7124f1c57655c063ed7e2 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                    efl-1.20.7 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

         arm |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/f02ad3007db56250de108b20404b520d304244ca |     
      x86_64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/6503bc4fc74af1707c6e97a4ed7d82f30a27b69c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    atk-2.28.1 | 20
               dbus-glib-0.110 | 17
             fontconfig-2.13.1 | 8 
                libsoup-2.62.3 | 7 
               util-linux-2.33 | 6 
                apr-util-1.6.1 | 5 
               libgcrypt-1.8.4 | 4 
              tpm2-abrmd-2.0.3 | 4 
             gstreamer1-1.14.4 | 3 
            gdk-pixbuf-2.36.10 | 2 
                  bcusdk-0.0.5 | 1 
                clamav-0.100.2 | 1 
     docker-engine-v17.05.0-ce | 1 
leafnode2-2.0.0.alpha20140727b | 1 
               libassuan-2.5.1 | 1 
               libgtk3-3.22.30 | 1 
                libmbim-1.16.0 | 1 
                 libqmi-1.20.0 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                  linuxptp-2.0 | 1 
           modem-manager-1.8.0 | 1 
                poppler-0.59.0 | 1 
               postgresql-11.1 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.11.2 | 1 


Detail of failures
------------------

       sparc |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/6bc7fe87d3cf4b42f168e06e9e51df60caaa64d7 |     
  aarch64_be |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/a054a866fc84427c11e1ad46dfeb9ff64d2abd6c |     
     powerpc |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/3a115681910ca6cd24631e72177847baca2bdec7 |     
         arm |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/29e93d7842bc47f8de8f73a15c09833704b91c16 |     
         arm |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/7639d8467f4fbbf92c5357c64084793892a48d91 |     
      x86_64 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/03ee2be42c0ce667f41441e78671bd8d2ae417e0 | ORPH
 powerpc64le |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/a7c4372a0d2e099e70a2fac6c58fca3f503c4723 | ORPH
     aarch64 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/d9a23722ab2cd98c665179723ad7e86b17c42062 | ORPH
     powerpc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/5faaba306c8ad6518738b29e7971d9b51cd7f0c8 | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/f544327b475427e79ec5e63b7ba3e4d8eaa165fb | ORPH
     powerpc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/ed04805b3643e0844951b3428a9ef0a54dc54e5a | ORPH
        m68k |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/2e4d5d03443090c3648c99fadf6c604af2c5addf | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/ccfa363bc102f74aef383174b8a3bb9c673c6ab0 | ORPH
        or1k |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/2dceaec6f78c62c86a12c5ccbbe445f4aba7d06c | ORPH
  aarch64_be |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/12c986b04df437f4faf6a4e232035889f5eb898c | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/b2271a8eccb52342f41ce4c20054c0d34b8cdec0 | ORPH
        m68k |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/5487fb331b1eb21d7af9938c51a46d637717ca1e | ORPH
 powerpc64le |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/ae52daf7247beed0a289d37b1f1815a7e90f9c6e | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/8d33ccf2561fcf809b241ec1d29d46ad0a96551d | ORPH
     powerpc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/e9ebc4f7d6ccf90a9a0800511472367312432137 | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/b4ea5f0fce237d0209087e2dfa1438d0bee5c347 | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/d7fe26161d30794a52f77ffebe9114e1dd325159 | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/e6cf1e86be3bfae23b39ef442c4b829d62f273cf | ORPH
      xtensa |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/0421d22f4b21cd1a0f9b7ceba6bf79131a14e538 | ORPH
     aarch64 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/a437965f387d22101e8823eec9b66d8a54bbfb7a | ORPH
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/22c7615ec91cab8bfd18049f49bed7e260d832fc |     
      mipsel |                 clamav-0.100.2 | NOK | http://autobuild.buildroot.net/results/4246887796deac98bab5f5eae79e8b206b5fd169 |     
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/9d250a2f4f881e5515cbc65b9b5a92e1cff99fa3 | ORPH
         arc |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/3f59afdc31a2fba02e6b6428aa7e4d6d04e8cda5 | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/716228d66f7903e4f7afe792fc01588204c07a15 | ORPH
      x86_64 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/0d9f9481075593576b251a1791093f9b8827f329 | ORPH
        m68k |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/11d398d80d138a629768a1f8a1522b086e86131e | ORPH
   powerpc64 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/e69f7d3d2389255433c52e11208eceddc2d0eb56 | ORPH
 powerpc64le |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/084e5adb5b8879296c8784c6c723ec84558b52ae | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/375c13c5e7cd45ab93134f525223f8a4807f8fcc | ORPH
      mipsel |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/4a2548e2a5868f3814e5f8635cde69baec6193bd | ORPH
        or1k |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/64d67d930654e4e922eaa1b99292ae9937400fbd | ORPH
       nios2 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/2e4285d47f6295e1b9f9c05abe34df443cad7f9e | ORPH
        mips |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/211367100bbe6d960769381414024bae617324ce | ORPH
 powerpc64le |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/e02fca528f902efb435839c78278a6857173b6d0 | ORPH
 powerpc64le |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/550377bf2eafbe13e6ff29e93a4b0bc6a06ba1de | ORPH
         arc |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/869d541feb7f8e2d69e1b814ff5e0282c6662715 | ORPH
       nios2 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/7da4bd1fb5f2acfd732833f403e5f189698d5c82 | ORPH
       nios2 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/cdd8c03160b6c08d21c6f662deb7898f466fffd1 | ORPH
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/e9fb61de1451e082180efe0c783698aae36af9cc |     
    mips64el |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/17e4d9b9fd114f53fe3be0f08588bef91b337f3c | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/40edc77665f588780fb083450aae757eefbcee42 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/cb13b7b59cda46ae2b0007b98405480c494c4f04 | ORPH
         arm |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/17e5f9ce5e7566f5a88abfd27b7db5614c1a3086 | ORPH
      x86_64 |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/4a1de13d7eaa795074699c9d0f5b1280a22bdc36 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/e865cb3bebc8a6f7c39d02e6ece660ea0b9d4ae1 | ORPH
         arm |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/5cdab8f30c8962bade1bbc0afc3c4fa8a5402ac2 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/bf3efecf022941bdf39c8b421af8188af44cdbb3 | ORPH
       nios2 |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/f122c552e0b1b1c660764f605c8095c446e1d5a4 | ORPH
       nios2 |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/66f2eb98258e6c79f34d7a6ccc593fea8c8ba465 | ORPH
        i686 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/d7f6226a72094736c14d57466626f5e56609c779 |     
     aarch64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/789179d5d1446873813d65ad7cf407a8a9b6e2c5 |     
    mips64el |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/7c9d9e7eb45498f617477fd7b3b4a5541301a918 |     
 powerpc64le | leafnode2-2.0.0.alpha20140727b | NOK | http://autobuild.buildroot.net/results/08ab170b95d4edab2d2b6274736f47139765b94e |     
 powerpc64le |                libassuan-2.5.1 | NOK | http://autobuild.buildroot.net/results/b1e530f4fd7225f64281c978b4812cf861b7846d | ORPH
         arm |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/b1265ee0734a11be49db82a064dbbd92e95a6449 | ORPH
     powerpc |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/bf9cbbc0c4c6214e5f82ff9cc3bdf3045bc2658a | ORPH
    mips64el |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/9fe759c02ccd8d07a09146fbf343b550d35ed4b4 | ORPH
         arm |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/5b21eba927d17a1f87a2e8331bf096469508481f | ORPH
      x86_64 |                libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/ffcf6bb5464639ea85435db9e32a91b202859ae7 |     
         arm |                 libmbim-1.16.0 | NOK | http://autobuild.buildroot.net/results/cedd6411b1efa3800d1ead504e1f03090457c89a |     
    mips64el |                  libqmi-1.20.0 | NOK | http://autobuild.buildroot.net/results/15526a366078bed294d1f2ad33d7c4d451e13079 |     
microblazeel |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/5785bb8f62144381ccc656ad9b3c585468c7f1b7 |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/a393d31f94a67cc852b52dad4f3e0a91e223903c |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/9f81c341c3f5a2c68ede1118fc47533a13a7498c |     
      mipsel |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/6a015cd5b9d65219f8741bf30130fd430458f0e6 |     
      x86_64 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/e449948077bc03cee57c567332c17f51371b6086 |     
 powerpc64le |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/9b95e74309a991f56d33a8ab9590570769918a3f |     
        i686 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/d66d2f36267165a8449bfe6e7cbc0b49819dca18 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8dad2e540e13c48292838a83c4d811b04fb09578 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/100a4d922d0eaf0ddd5e2907c615a67d5e68cb16 |     
        i586 |            modem-manager-1.8.0 | NOK | http://autobuild.buildroot.net/results/c2601b0859aceceeb1068f0ecdfc8bb16a6d353f |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/9faddc489460c1feae3e28f423dacc29f633f42f |     
         arm |                postgresql-11.1 | NOK | http://autobuild.buildroot.net/results/807333a130f21e83520e0f4bcfd754ce6c63874b |     
      mipsel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/20e05c9212c627e68faffa06dd45a7f852e8762e | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/5b9ef3c4bc5640b1c7e38a941e343fba75bf4742 |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/671f474e41d1952551a63823dcbe8185c868ee1a |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/07b58466052270fccd97fa63f3da2e8fef1db511 |     
      mipsel |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7ac2df930c44f9b1be18d686b3fed89fc4111802 |     
         sh4 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/f8bc4368d5f69a270664eb2338c481a3ed8677cf |     
      xtensa |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/0dd9eccd5cfb4fb4ca3719c4c6593d93f35d6b83 |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/b55d8da5e47b8da2b11dfd3c92f7e4b94fc6ab2e |     
     powerpc |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/e58c6eb689b39a569b9abb95c3192634a2a4f743 |     
    mips64el |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/0e229cf22a61ba933e4ada3d95a1ba030df9afc2 |     
      x86_64 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/e8cdce5202b0b89c950d7de9007b78febed1d484 |     
       sparc |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/16f44f31799a38f462114fd95303f99783f5bfa1 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               util-linux-2.33 | 5 
                apr-util-1.6.1 | 3 
               dvdauthor-0.7.2 | 2 
                    htop-2.2.0 | 2 
               libgcrypt-1.8.4 | 2 
              tpm2-abrmd-2.0.3 | 2 
                  bcusdk-0.0.5 | 1 
             fontconfig-2.13.1 | 1 
                  grpc-v1.16.1 | 1 
             libxmlrpc-1.43.08 | 1 
                    php-7.2.12 | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.11.2 | 1 
             stress-ng-0.09.47 | 1 


Detail of failures
------------------

         arm |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/0590ca11ca5ee7299a9875e1e50e1e5df003dde2 |     
     powerpc |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/8f0f0cf6566fb1f729cc70f6869c154472bb6094 |     
        i686 |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/0ce9e31cd59044a1ac03a1b289457fb02c465280 |     
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/e08735ccd8fbca9f69e4eebd85efb20790ccd787 |     
microblazeel |                dvdauthor-0.7.2 | NOK | http://autobuild.buildroot.net/results/4cbfbb6c215613eb309a5ed5e7ba103b677acc61 |     
        or1k |                dvdauthor-0.7.2 | NOK | http://autobuild.buildroot.net/results/b3f7cd3cde57458d71eb2dd2f7fdae760123ab15 |     
      xtensa |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/7ef806d054efd5ef1434e489097baecb0ced3098 | ORPH
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ea5a406e642a356c913dcbe525238668e0e16ff2 |     
        m68k |                     htop-2.2.0 | NOK | http://autobuild.buildroot.net/results/f368a5eea9ee3bc2f4b0e43decc49852ee943ebd | ORPH
      x86_64 |                     htop-2.2.0 | NOK | http://autobuild.buildroot.net/results/49028a26b446855492c90cdb5fcc198c03341df8 | ORPH
        i686 |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/97deddbeefdbb993dcfa5b33ebd4d9f6c07c1abc | ORPH
    mips64el |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/be103ea9367cc29a8110188bb1cde7a517c426be | ORPH
    mips64el |              libxmlrpc-1.43.08 | NOK | http://autobuild.buildroot.net/results/9118643d6e6c06a9fe86f65326eeaf5c77df0eb7 |     
        i586 |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/d491b52c206ad1faa0bc8a4aa8e66cd873ba085e | ORPH
      x86_64 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/79ed29bdd1eec9bf7cb5003202da5ceaeb8101b6 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/608b763a62d229e8c751baeb39071d69fc305b23 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/b10c5cf1c3aa3191e851eb50b2155891b75693a0 |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/43f8d1e6fc14666e80009fa1ed615b8d501912a4 |     
        m68k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3eb90aa6cc2260bdf5ad54c337e98a97c9fbecfc |     
         sh4 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/6a6f8f879c1ff555a46ac550775c8f7453ea2b45 |     
        m68k |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/0743d63a0133dde22fd8a9ee39f826bd76312f8f |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/a0b6340055d8c7dc6afe7a247ede67d34d7c7db7 |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/d9e26da51ef4e6fcf76c071379a4ae3b844d42e8 |     
         sh4 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/f2ac80e9e059c7e96fb3136b18c424652c701b7a |     


-- 
http://autobuild.buildroot.net
