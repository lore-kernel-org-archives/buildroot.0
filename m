From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Nov 2018 08:00:48 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-05
Message-ID: <20181106070048.36CDE2089C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   4 |   0 |  20 |
   2018.08.x |  15 |   0 |   0 |  15 |
      master | 174 |  23 |   0 | 197 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 3 
                  giflib-5.1.4 | 1 


Detail of failures
------------------

        m68k |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/57d57ce3ca18c12dbd8e8d08d2ef5654bc48c088 |     
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/1d59b33c72f8fba7c6ba1ac01c1a0e370d3e58e9 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/6220fe3d57daae4c28649e5d8eb89107280e6169 | ORPH
     sparc64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/57d823f898d86450696165fac656e77349de809e | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 8 
                  guile-2.0.14 | 2 
                   luvi-v2.7.6 | 2 
                    ngrep-1_47 | 2 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
imx-uuc-2ae634281a39c82b6a8... | 1 
                libmpeg2-0.5.1 | 1 
                 libv4l-1.16.1 | 1 
                    php-7.2.11 | 1 
              traceroute-2.1.0 | 1 
               valgrind-3.14.0 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

  aarch64_be |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fa976dee3c58d303eff7b6727376feb87833b8ec |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/c1e7c593a1007454d4c13f5f89ca7a6f333e904c |     
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/65942739bb7593b500ad2e8dbc18f3088ed40f88 | ORPH
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/2b23d445e57a5e0f417f5cb9417b0a668bb7bf1c | ORPH
         arm | imx-uuc-2ae634281a39c82b6a8... | NOK | http://autobuild.buildroot.net/results/b39d56c1573308c4f947de23363da7c05e2aaf0d |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e884c0860b31a171a62e48b7f190ebb74da65306 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b6d82bb0953fcd0b2d6eeea08f7b6015f599122a |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e245ae0689bba1e379e3d61a6f947c52abf318a1 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7a95a2cd87ff8c73edab180bfce7b4e3a8ebeccd |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/22bf5712e2173c33055c778cf856c5a666054c21 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dfe2302e1b84dce22733f78b7ea3a2091abc243a |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cf3e8e2480e5c0e7f5943911b837d59b574f257b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/050267b5b568aafd6563d06a1ffbe0cfa6c6e81c |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/66e6394ea65916aeb1d878eb6a55b8fb75c0acbb | ORPH
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/b48f9b284102d94b847a35ed1ca50a157fbcb1c9 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/d9da354b8d2356741b32bdbb9caeb5a8c4fc8a3f |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e4c9355f41213a6afe6f087c4b4bbb83edbf66e3 |     
         arm |                     ngrep-1_47 | NOK | http://autobuild.buildroot.net/results/3dd8c768beef075494d6be7eff4cbb57b5ec8a41 |     
     powerpc |                     ngrep-1_47 | NOK | http://autobuild.buildroot.net/results/b2af8b7d29c0f92c839dadbc1089b11dc7cd3686 |     
         arm |                     php-7.2.11 | NOK | http://autobuild.buildroot.net/results/a02d87c225fb69af0445f32242a84f40ef89d295 | ORPH
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/83660c7f321eaa3a223f31e5da1046589b0e2fc4 |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/35eb5824baf9e774d602db3861b9a20930b22a1b | ORPH
   powerpc64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/acbc29898b21373a556a2712fbbf20cc566644c7 | ORPH


-- 
http://autobuild.buildroot.net
