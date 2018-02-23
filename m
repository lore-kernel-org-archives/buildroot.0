From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Feb 2018 08:00:55 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-22
Message-ID: <20180223070055.2AA572082F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-22
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 183 |  27 |   0 | 210 |
   2017.11.x |  23 |   0 |   0 |  23 |
        next |  32 |  27 |   0 |  59 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 5 
                  boost-1.66.0 | 3 
               host-efl-1.20.6 | 3 
              host-erlang-20.0 | 3 
tvheadend-e06ffd87beff16103... | 3 
                   bdwgc-7.6.2 | 1 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
                  ffmpeg-3.4.2 | 1 
           python-numpy-1.13.3 | 1 
               qt5webkit-5.9.1 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-237 | 1 
                     vlc-2.2.8 | 1 


Detail of failures
------------------

      mipsel |                    bdwgc-7.6.2 | NOK | http://autobuild.buildroot.net/results/95f7fe30c4f0fea36a35e2b0ea0671605379c8a0 | ORPH
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/bb4ed51c49e279cfc7fec7409e6b360ead8a0e2a |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b1afabcc8b39eee6a5bfbe68a5f877835726cebe |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/dfc7db1de58e64c41d51e4757168170eb66447b8 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9c1f891d9798f317575655a7b4e86e7ca5117c3d |     
       sparc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/b2f028d042cf0796f0d65c4cc49b32be03afa1f4 |     
      xtensa |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/801e8bc06277978556a301ddf54f609169de37bb | ORPH
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/193512256b280c13a63fd09a9870f945349f8f57 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/1e4fa47eec024f5a1e83c18aa39380a4f16d2067 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/d83680f52c01f30930711d59d5b5c4cc608705fc |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/5c503113de2a787ca26e0f6662acb1f77f401586 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/e7596c29f1b917a88423e6b53bfa17acb6f88f11 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/0aff4efa12d50bca4c2a6286f8c1a75e4f225e52 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/f647801267ae4cb61af7d4caebd2efd0ccce8a61 |     
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/7bcf000c29c5c54fab53c384ed8afcca6f26debe | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/9008055e71a2756c03fc0fece5b68d2b5e070ba0 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f759d7ebe34df63f07e7a8821bb544dcf0cb38c6 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d800c3581c383271467191b530cf587efb4e973c | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3eb6db372a4fa8f8ea25d29aefdd5c2cbe735ae7 | ORPH
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/c57f077ef7053ed7b2fe26c18f2f73adef69e476 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b5e3846825b5eb37f2068f85e9dadee34b9933b9 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/1e438d77020890da0cd04555d004997f6e3755cc |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/c4390e372430a8e1bf2c63e3b279c4f2a2df5b17 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/e9aeddd1a8d079ccf2468644465822981e18a58f |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/a64c74164bb0ac262a05d90beb0dc1e8004579cb |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/9b80cb67c02d1f4d6aa2a32ea1bc6ee614ce4992 |     
        i686 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/1d2e6c747fdee7e82f2cf14a3f7b0484396e58d6 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 6 
                     php-7.2.2 | 5 
                    liblo-0.29 | 4 
             bluez5_utils-5.48 | 2 
               host-efl-1.20.6 | 2 
                  host-go-1.10 | 2 
                  autofs-5.1.4 | 1 
              host-erlang-20.0 | 1 
          host-rust-bin-1.23.0 | 1 
         libcpprestsdk-v2.10.1 | 1 
                    sdl2-2.0.7 | 1 
                  zeromq-4.1.6 | 1 


Detail of failures
------------------

      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/5de8f2c4bfcaf646caea0140065d8f1af3864c66 |     
        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c2d0a90da251a61a1ce8e3255b008dcf77d79440 |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/b5ff8bb862e625de532f48198607fd2a6f8cb818 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/d39c727af24b159af3e8321f4784e32d58e1db82 |     
     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/f1d76790cd805e37065f0a9b9fb7df3969fd1c7d |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/74e0b019cd8924889ed7648bfbf2da13deef1b22 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7734d235fe75f2140003478d996f96b9f6c15679 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/6c9d508e4f78c55a0b3089c500c794d82b5a6fda | ORPH
         arm |           host-rust-bin-1.23.0 | NOK | http://autobuild.buildroot.net/results/51c98ca5486e7e83725ababa437cbb8204ceb66b |     
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/02350586f9cb18f48f1c6383db824567bb588d8f | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/952a567ad30aa3b30ea50abbdceaf15bd70c00ee | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/eec21cb324f7fa359d879a400d3a3e4896b80da2 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7c14dffc0ec3845f75c4de916bc3fb98128bd348 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/3b86b2dfe288a7d2c3927616919f34d8a67e7b65 | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2eddbaba19841c16ab35f8a7871b36f034623a44 | ORPH
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/fe5f577da0d57a92173a45646471f1a9e6ded149 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f62bde86cb774e267e7bcfc5dd19a8b22f547c87 | ORPH
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/faa6881ce9910519d24a784f79620947ec788b33 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/3220a54ac144f71d1874b86d5506c061ab498e33 | ORPH
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/22e9fc5b1633f3ee06b27264cb1cc3f517beb6c4 | ORPH
       nios2 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/925470dc3145c446da0553a0552e682ea7f15b69 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/502c69f5e5a17779de94ff4a73bb313367f94851 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/6cc5b3847df5f1ffbe3c2b605d6c8c81443627a4 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/5b874ab9ccaaed873b724b5fd6febbbe94a7b55e | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/84e25eb6ed84cd2017ba780b528df72b77a122bd | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/2bf4806169abbc29963de8eb37533651fa98f7ff |     
         arm |                   zeromq-4.1.6 | NOK | http://autobuild.buildroot.net/results/148a5ad17e3e75354408a9cb31d1da6cb85409a9 | ORPH


-- 
http://autobuild.buildroot.net
