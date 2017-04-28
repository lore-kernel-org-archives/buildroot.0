From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Apr 2017 08:28:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-27
Message-ID: <20170428062842.1E44E20E06@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-27
================================

      successes : 129
       failures : 56 
       timeouts : 0  
          TOTAL : 185

Classification of failures by reason
====================================

                    ola-0.10.2 | 20
           aircrack-ng-1.2-rc4 | 12
                    mpir-3.0.0 | 4 
                    mpv-0.25.0 | 4 
           uboot-tools-2017.03 | 4 
             libsndfile-1.0.28 | 3 
                protobuf-3.2.0 | 3 
                 libxml2-2.9.4 | 2 
                 binutils-2.27 | 1 
                 qt5base-5.8.0 | 1 
                    sdl2-2.0.5 | 1 
          shairport-sync-3.0.1 | 1 


Detail of failures
===================

      mipsel |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/3c1a467756b91417b9a2f8889ec50e4f336f7775 |     
microblazeel |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/f60292327b0ad188925523d8e2d7bc55e50c9dc4 |     
     powerpc |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/39c49943b07e362ef1f6473c3a56484e596e9680 |     
     powerpc |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/621588651b5cf54726bbf5361399a2dc301b8a29 |     
       nios2 |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/1211176a82430f555b09606abc64137a196ded2d |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/628a66ef766308fba699f1faa942306e600e5575 |     
     powerpc |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/9d546af634c31d6d745c5267f9712f3a2e7d8ec1 |     
        m68k |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/0bf1dd99a742b505a119383ffe60ca047d526c02 |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/e02e832a49972ba464f7749cb89d2b20b8df4484 |     
         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/14bdbd5f48952d3ce454f048239a6e66fdd66de7 |     
       nios2 |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/248ae80deba887afd2263dc9c258de4e87112d87 |     
     sparc64 |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/e0ae341030f1278a65284a33c68d300115969b08 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/10b523fff4876003edf01223fdcae1004cb6ee18 | ORPH
         arm |              libsndfile-1.0.28 | NOK | http://autobuild.buildroot.net/results/0bf4a305710a210605539d94b65e100b3e619d67 |     
      x86_64 |              libsndfile-1.0.28 | NOK | http://autobuild.buildroot.net/results/d04032c4e84abbce8bdee99802532fda90f64470 |     
         arm |              libsndfile-1.0.28 | NOK | http://autobuild.buildroot.net/results/cdcf7dfcac9b65f5258de7164525da5b983ab905 |     
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/fb6f88934465fab5ebbcbbd65727506e701d7163 | ORPH
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/68a47885bfd17946deeffb50dfa92a57a76d947a | ORPH
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/be1478836b2e7b580174641f48de92c9b02512a7 |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/05ef4b61ce923282eea806db32f539f59e76e4d9 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/77fe48deb073f7310f8f42f0057f17785152841d |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/3cd863fc36ca1e1d49d29233e0cd7b6a80bc92b4 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/afe572dfe72c127aeac33f2f8375b76fe156be8a |     
      x86_64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/e408957b6eb263a97f6c8702228182d50233789b |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/1df718f8dae6bd6dae5324582b266cb34b50b256 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/2524af71ce6dfc8aedb1d287b6d9af018ce57bd9 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/02f731fa25356650367f82482d0560cd91f73fd6 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/f51e44049e75b9459b9a214604d0f3fef2b6c9d8 |     
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ba9d2c9d0547e5ea0ae5c74d03b830983477cf13 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/e2f743a49db9f2be2940a30acfd1a9277a683536 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4975dbe9c0b78edbe4a8ee98a954a95f0945c4ac |     
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4a4ddce130c3e921d37fdc1756f97e44ce7d5cdf |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2c2a0f9745fb0b9043ef83d1e7c3d3c0463f0b4d |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/aa78260d85d22124c62b4307ffce7b9a15b3073c |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ca412df3c23317f20465fbddc994e1f914dc58a9 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/1f3e8ad6e019099f262ec5b7d48678c079c743c6 |     
        m68k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a1f0072c1c634186b6f3c9835c1b6fefd5639ac2 |     
 powerpc64le |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/358980f2ea11de64a7e1f0e1c41672e1c92cecf4 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0e64a8e89a26065946b3d06f654717fd5b06cb65 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2b779b54234bbf5eef99bbc03fdc789c30a91e9b |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/197057bba433136833d3f26733ef090f200ff8d2 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/198c9363b768a9627cdbc7c8ff4da40f55983bc3 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/6cce4b0282f8b6edc39f64ef1edae5c383714522 |     
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d87915146a81660bce24138f3afd48963e211477 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/04100c7c98b3e041409b8f245476fe9a8ce054d1 |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2d75ca65cf60f4332a04c43ed8f9eac670c62c32 |     
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3b3fe16978f19e65a6c6dc1712d72cb349eed0d5 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fc5ea266eecb6ecab011ea3542f0bb680fb8fb3b | ORPH
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f307e9286e5eb069c137340a364f3dba914ca8c5 | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/4081e77196810af391af30fedde89348d61cd7d4 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/005fe68512ac8b6f7baa692a4b15b69cf23ac8f5 |     
     powerpc |           shairport-sync-3.0.1 | NOK | http://autobuild.buildroot.net/results/56edac103c3bf4740b45f0044f4aca9bf997f4d6 |     
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/65e102efb7f692812a10bd47210527cafa847a40 | ORPH
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/1d98ffe53bcb0a1868715257cc69c176a5ae39b6 | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ea73119872a885b64b2e9846c02042f27984d99e | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/22d6cc87bd160b0c973856acddb3d9d05ccb2286 | ORPH

-- 
http://autobuild.buildroot.net
