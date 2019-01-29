From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-28
Message-ID: <20190129070035.08974209BD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   0 |  26 |
   2018.11.x |  25 |   0 |   0 |  25 |
      master | 169 |  39 |   1 | 209 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
             qt5location-5.9.6 | 1 


Detail of failures
------------------

         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/7e18bb206447bd8c7cbdda68c065d56398cf644b |     
         arm |              qt5location-5.9.6 | NOK | http://autobuild.buildroot.net/results/cce362ab0309c6baf9c6d8402c04f965de5e6890 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 6 
             host-grpc-v1.16.1 | 4 
                 haproxy-1.9.1 | 3 
             libva-utils-2.3.0 | 3 
                   netsurf-3.8 | 3 
zbar-b3b4e32b55f570372fc3af... | 3 
                clamav-0.101.1 | 2 
                     php-7.3.1 | 2 
                qt5base-5.11.3 | 2 
                civetweb-v1.11 | 1 
                 gnu-efi-3.0.9 | 1 
                 gnupg2-2.2.12 | 1 
                  grpc-v1.16.1 | 1 
                host-libsodium | 1 
                  libnfc-1.7.1 | 1 
                libnice-0.1.14 | 1 
                openmpi-1.10.7 | 1 
                     pcre-8.42 | 1 
                 qt5base-5.6.3 | 1 
               skalibs-2.6.4.0 | 1 
                   systemd-240 | 1 


Detail of failures
------------------

     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/1cb5f63d3be1277345641d4cec24115d46f8b86c |     
microblazeel |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/be14aa571309cda32a5963feed9fd7f220e87fe6 |     
     riscv64 |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/8d6e8e076819d8a10012b0552b77faa304233b76 |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f96991bb74c8e374aa2bed9c9aaea045fcda1f18 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/9097a2b190f4032ff51eda531f4379a99da5181a |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/08ad9df616e5dcb0a3a87bd85c9eccd2fb90b41d |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/cfa0f8b68fcf03ae993ed936a88d6e3a464d7439 |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3885647ff2093530232f4e1a9823c1dbd977e127 |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/68077e6c22604ecdebb81f7c1c6e3f40d912bbd1 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/57e6af4b53936edaa94d6b7ee2b21c6a45bcf32e |     
       sparc |                  gnupg2-2.2.12 | NOK | http://autobuild.buildroot.net/results/3d00cd1250f73da252e854cf5ddf138706254cb3 | ORPH
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1bf386466eb84a451c7c78710cdc655f74f97c9f |     
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/e0dd78c4c61935af6434cfa656da5b870333efaa |     
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/7f9a0ad99a157fa7d8ae46bf6ec9f3828f675df5 |     
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/5394f894959d24ef576b329848b57e80e0ecdae1 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e97ef5f45734633820d79b3aeab2f40a12d2383f |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5279273b13c6139fb52da3999f53e3223d98680a |     
       nios2 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/4e15a01618a3dc04d5f891a75cda4b772b296b2e |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/24f451c98a6e294ab62a1f0aaad6a634c3dc1449 |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/01312f7d0169aac68d87ef88e9ef743c136e95ed |     
     riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/6be7b5923a0907f1e1e5b731701d7417b4250319 |     
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/3da21d36ae38ab4a4a530211fd7c1b53295b4b47 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/b16777cffae4106e8397f1a1e2ab58994c063052 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/674594c09ab5f8569fcc9f1ef42c8490efb8b9ab |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/eb1a905a6f0c0146ce464e6b21a4548e2cc0e401 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e382206ac47a9b6cac301ec532078c40d9b524ff |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/05cd82c39bb1bc7feb99c21940f69ce05265438c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f387508f33daf4e23848267b7d467c91f5c9db6c |     
microblazeel |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/b93b9184141ccc25b70f54bd7242926e18cd6319 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/d1017906c29382ebb5b392df7b03198d67f9ab22 | ORPH
     sparc64 |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/80f3ef1ee4b7dd36483a396efeda3311c63f0f55 | ORPH
    mips64el |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/7b41f4e4a521b1e17aa885aac4419b26e0dd8700 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/89ac4405966ee4c5d443f25a71c0a3d18799e97f |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/a098b573f6ce093124844ce135b6edad9e75daff |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2a7dd8b6fe2600e6f9540c6cc2a226e28d437c66 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/b4641c68299053c9fa7c49733d2690a88aa56e77 |     
      mipsel |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/db7249e5c165a4624ed210d1e7a3700cf30c78f7 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/216ad6baffc6a4daae0ba627f5d92be762455b7f |     
      x86_64 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/55cdc099beca6257c5d5e89310cf25100f6fcc1a |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/c04d67711a66cda039ba2b359b09a47f971f6ba5 |     


-- 
http://autobuild.buildroot.net
