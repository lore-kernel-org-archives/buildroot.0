From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 08:00:37 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-24
Message-ID: <20180225070037.C7D9B2036E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-24
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 156 |  26 |   1 | 183 |
   2017.11.x |  22 |   1 |   1 |  24 |
        next |  41 |  22 |   0 |  63 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 hiawatha-10.6 | 7 
                     php-7.2.2 | 5 
                  boost-1.66.0 | 2 
tvheadend-e06ffd87beff16103... | 2 
                alsa-lib-1.1.5 | 1 
             bluez5_utils-5.48 | 1 
                  c-icap-0.4.2 | 1 
                  ffmpeg-3.4.2 | 1 
               host-efl-1.20.6 | 1 
              host-erlang-20.0 | 1 
        host-util-linux-2.31.1 | 1 
                           icu | 1 
                  libogg-1.3.3 | 1 
                 mesa3d-17.3.5 | 1 
                    mpv-0.27.0 | 1 


Detail of failures
------------------

      x86_64 |                 alsa-lib-1.1.5 | NOK | http://autobuild.buildroot.net/results/2ce8e313bcca10b097b49e5538100453e3b0ffc7 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/4ff4470662dea07361762b2bdc9e13a9db9d280c |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/798ca20030688c79a596794b9a61f9d2092c0af5 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/292ec391d3e8907e52b5021ebd5598d52e3fca7a |     
microblazeel |                   c-icap-0.4.2 | NOK | http://autobuild.buildroot.net/results/6044fcf4178f4b360f6de579044b9c835e3d0781 |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/b6d7888f6852acb49a281200cc78c94271ed6a26 |     
      xtensa |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/eb9321a95ed813118cdefb7b6b5d3da53d136444 |     
      xtensa |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/de6749180c83c8d7f7fccdfc3f2bb9ae863adf37 |     
         arc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/82b8fb3f7d7338a561cca7286314a1ddefa103c3 |     
    mips64el |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/9c1aec09c03f60bee9dc134da5a29e2671fc3b5e |     
microblazeel |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/cdec7ae3565d5b76a9bc50156c6244b44197534e |     
     powerpc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/ce6b4a50e6aafd06f82eaae688dd8720b982e9c2 |     
    mips64el |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/941fd4f37736d089f058897b875f0ce121d29ecd |     
        i686 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/469dbb248807f378a604fb2b6f09618204d0ea41 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/eccd369dead5160f75e6bbe8df1454e579bb6b66 |     
         arm |         host-util-linux-2.31.1 | NOK | http://autobuild.buildroot.net/results/86db4fb6c21b73843781df30cb0b8c935204d48e |     
      x86_64 |                            icu | TIM | http://autobuild.buildroot.net/results/5c1bd6f965423a5cea3287c5a5b0bfbadec2b11f |     
      x86_64 |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/96926924398f186cf7bc4a3a2d8c749b89064545 |     
     powerpc |                  mesa3d-17.3.5 | NOK | http://autobuild.buildroot.net/results/eafda37587d58f509bd309cf038c294bee9ff970 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/80d2b80a4a8bca0e7d490bc078cc8bbb66eaf075 |     
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/834331e065ea9b8cc294b52f24bbe8453d444106 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3273b4ae925d99b2159d2820bf9989d4abc73e55 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3f2f5cf40bf360def2e9f7602714aa464af8fa2d | ORPH
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/5c1b305a7e7afcf9039d690b1dfcbde368cbf676 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/631b3c97d8cecaffe25b1b3faf821564d491c40e | ORPH
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/a4bea30e17934379d61ffec248dd9653afc62c4f |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/36fd5a21b1f299d4d63d65050b705b9d0529bc05 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

               host-flex-2.6.4 | 1 
                          tiff | 1 


Detail of failures
------------------

        i586 |                host-flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/0a561e55b130014df4ab089cd6425239a8fa404c | ORPH
        i686 |                           tiff | TIM | http://autobuild.buildroot.net/results/66c98ce2c724b825c11fc8e5ff1c17fb15fc9d0e |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 3 
                  boost-1.66.0 | 3 
                    htop-2.1.0 | 2 
              keepalived-1.4.1 | 2 
                     php-7.2.2 | 2 
                  udftools-2.0 | 2 
              host-erlang-20.0 | 1 
                  host-go-1.10 | 1 
           host-mono-5.4.0.201 | 1 
                    liblo-0.29 | 1 
            libmaxminddb-1.3.2 | 1 
               lightning-2.1.0 | 1 
                   pcre2-10.30 | 1 
                   trinity-1.8 | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6e04a0b972e1fca4f9565b2457e1193748fb1dfd |     
        i586 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/36ed72ea3ff04ecad81f1c7256e8b6f8aff54dba |     
        i586 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c2291fb0be0b8b466b9f5c36ba6501b5a5f8bad4 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d173869935594a1b99e7d203a6593803e8df53f2 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b7930cdc7544a742fcf62654e22decaa92a8c4aa |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b73ad79c5a319e92e351b57a888eb91343bf0d57 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/475dbe2f2c19f4731081f8fed0559db53130afe1 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/bf6de8cc1891e26cd0cb5b5eae13f150d9af961c | ORPH
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/2553988bdcc820051958131ba2df6a08ac147e57 |     
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/cd4ca28d4c2599d409301ffab22e50ddfc4aee19 | ORPH
        i686 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/52260e46f6be9c61d3c4293c8537e9c7a086d542 | ORPH
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7bcdfdb03b4ad9ead12329a630043eeb158a88d5 |     
      xtensa |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/c40736cc31879fcf907e346f2eea7b29c7e05513 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/61ab7e23d2ef62f055efc74a998e3c108a3cdb43 | ORPH
         arm |             libmaxminddb-1.3.2 | NOK | http://autobuild.buildroot.net/results/e3825a6a5854ef9017980e6bb8d83207fe5da2f5 |     
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/51b2a5599f632a62bd5d7aaca68c89ef89f3c068 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/a8e8eb62a2062ed65163b6825056d53c4609be76 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/19ddeaa61e1754ab298e68c997e8f2105af64d18 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/03b8be7b67822a6c65e91bcb1e7fb91fcfa66541 | ORPH
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/147712e050c67c3d6191103e0d87738f57367b33 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/0ea17d7954eafa012632936c741c65a6e49769d3 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8ce7c458e1df7dc2b8dd11637f1a8f15b9b6f62c |     


-- 
http://autobuild.buildroot.net
