From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jan 2019 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-27
Message-ID: <20190128070030.49DCA209BD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   3 |   0 |  21 |
   2018.11.x |  23 |   0 |   0 |  23 |
      master | 198 |  44 |   2 | 244 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
                 ibrdtnd-1.0.1 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/04d4db4bb7b57cbabf70a7e66aa6f89d7bc269c8 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/9b78c0fa9139416936ab52be45ba148de92f35a3 | ORPH
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/b81e82fc4cfe81fbd60c5e5b37924648dc1ac5f8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

zbar-b3b4e32b55f570372fc3af... | 8 
             libva-utils-2.3.0 | 6 
             host-grpc-v1.16.1 | 5 
                 gnu-efi-3.0.9 | 4 
                  ffmpeg-3.4.5 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
                     pcre-8.42 | 3 
                clamav-0.101.1 | 2 
               skalibs-2.6.4.0 | 2 
                beecrypt-4.2.1 | 1 
                         clang | 1 
                     gdb-8.1.1 | 1 
        glib-networking-2.58.0 | 1 
                     gpsd-3.18 | 1 
                  libnfc-1.7.1 | 1 
                  libssh-0.8.6 | 1 
             libxmlrpc-1.43.08 | 1 
                 mesa3d-18.3.2 | 1 
                    postgresql | 1 


Detail of failures
------------------

     riscv32 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/01260a42b7edd0ebc437a6a5ad2b9ac473a48a61 | ORPH
     riscv64 |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/c3316b2b6ffd707ec0cd96586df5c0df892d39b2 |     
     riscv32 |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/29df2d2aba0dbf23febbd70a1ed6877aac0bdb7c |     
     aarch64 |                          clang | TIM | http://autobuild.buildroot.net/results/74a4109d370c8d210034f58d9cd58326f5663175 |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e532cdcb3ce207484f099e5659e003bcfbcfe600 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a5e3b4a910b84a51ffb88310c5312b2350cd9bd8 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/95ae9083a8bd92f1e7905286952944e27687ebee |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/9a55b381ea868fc634dfca2f1222e9b350099dc4 | ORPH
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/e3d719441e61da4cf0634136dbcf267fbd5cb3e7 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/b8e322f17fd85d9ed1f7990fac571d803baa906a |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/3361a05f83eaa53028549da4a115de09d8c6370a |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/a91bd046e263e3d32258df1c5e48ba3ea0edaab2 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/a3f0004a0335947bce54912f1f0554b5af600b2e |     
     riscv32 |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/d1359ceec80391e5cb66b8c9b64b42f743ae6a77 | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d429944b8b10c2571973e8dd2f1f07e1fa782c5d |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/acb0aad703a6c6c2085a87664182f6a9b6db47f0 |     
         sh4 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/01768fd8b2faf4426a1ae12bfc15667c96ad0e6f |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e5ecd382a18921e1162992f4c2ad0a58a7efcff4 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ff95c7fb0e4c773522a193f839f3cc3b7e124ae5 |     
     riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/65ac0bb01c8248161ed2c0e87b0389daca8cc56a |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/ed0a5cb436c813eb18d3a91e2000e4a9151b714a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/5505759e5744bf4c80e42b43adfbc7a002781536 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/fb7fc946f112332e230c23bedb4046e2011ac395 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/351bbe1a9555eb977a05b7b7b15e4e7599130867 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/1db23b2a20dff903cc3ad7fe4518718b3a0ec38c |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/54428aeeec7a5e41afb26016710f4283d7af8125 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/53c780d62f177cf1cc422ad232d395468e6882e2 |     
     powerpc |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/e1c2ce05204f79940a948ac47ef9c84e644a0d28 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/ab2c9fd43544ca4a6b7d4684a234232c8b1bfc3d |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/2d92688ab3f395c7db7638466ed2f3ebd7d1634d |     
     riscv32 |              libxmlrpc-1.43.08 | NOK | http://autobuild.buildroot.net/results/d579374b1b798d0904cfbd6575f47d811f87acb4 |     
         sh4 |                  mesa3d-18.3.2 | NOK | http://autobuild.buildroot.net/results/097053a7424d3fca039772cd560e2798e0d336a3 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/9e929253e782f7650c897be07a23d7cb662f32eb | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/c56634af169fa26fde24e41af5028fe6667a9988 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/eeceefa84484fba91df554d474622b4613e4f2fb | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/a2c64bcec927c629d5203d6199017f13fb969eb1 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/821462c63f5e0d19f6a71acb431e99074034b6e6 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/bb460afa5b24eddc412cbdc3d245b10d10d602c5 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/dc22f78b8b036df04463b52c0194a38d8e0d29bd |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/d58e6f49311ad7779ec0cef434148d5ab5f88416 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/755c2bf43c608429f3de101bf2124a3158b4e5db |     
      mipsel | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/bb1bc278c6b9f760d8bcb59b6b5db87e372d0ac8 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/2836c89c6c0f5400979400dcf77dfd6673d006e6 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/e76924287d4a6e2e60f4e49d0548975431f8f0bd |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/f6bf1c8c7c07245fcd0568083a9b976c4ed772a4 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/afb76db16b8e1d9f232ca470f4bc7e7c1dae5d5e |     


-- 
http://autobuild.buildroot.net
