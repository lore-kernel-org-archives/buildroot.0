From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Mar 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-17
Message-ID: <20180318070012.9EC0A2071E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   6 |   0 |  33 |
      master | 195 |  54 |   0 | 249 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              sdl_mixer-1.2.12 | 2 
                  cc-tool-0.26 | 1 
                libcoap-v4.1.2 | 1 
                libshout-2.4.1 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c1eb516de33cb0a37ecf19f4825bd8b6b34073f0 |     
microblazeel |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/905f122213ad9623ea5dd9d32c352efd151319f3 |     
         arm |                 libshout-2.4.1 | NOK | http://autobuild.buildroot.net/results/de30f2f77f1b7f138a02c082f9fe4d6024bfd491 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6362535455d02c8aeee137981c7294631cd97179 |     
 powerpc64le |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/905808b5175c58683f8613ad9c3d1c571984e3eb | ORPH
        m68k |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/4ff7a0c1c8a5d9ce09c41f55dd0120c6d95f8e76 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 15
                    htop-2.1.0 | 7 
                  host-go-1.10 | 6 
                  udftools-2.0 | 5 
              keepalived-1.4.1 | 4 
             bluez5_utils-5.49 | 3 
                    liblo-0.29 | 3 
                     php-7.2.3 | 3 
            safeclib-v03032018 | 3 
             gnutls-legal-info | 1 
             libmpdclient-2.14 | 1 
                   qemu-2.10.2 | 1 
               qt5webkit-5.9.1 | 1 
                tpm2-tss-1.3.0 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/706187ab6d83488a57dcf9717d163d98a458c8cf |     
         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/d221bcbb1a4ab286b42392f0a9a91b423fa06b20 |     
      xtensa |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/f556182d71721deaee7fd0bd0766125dcc69f1a4 |     
         arm |              gnutls-legal-info | NOK | http://autobuild.buildroot.net/results/fb4d19eca70acb9c26a2fb1aafb73bae0bf98c36 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5311fe510cb2122d25dca7d829ae6dd571aa89aa | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5bbea2c99004626181b645b1a21ffd44b33edb79 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/69142562edc1d745784cf13a4832ade97337e4e7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/0f92786f2e728f5590aa667b8b051bbf4914c106 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/06ab46860921fb53969656bbf70064d4f86b6b56 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ed1d3a80efe879712c46c0db77e6761d06a4101f | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/3fde5f34d77e073bb70481ec8c2e81c3cddfa7db | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/313f97ebe43a3744d6640bddb69ef8386113a24e | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/03a9d39040250a20c3734207e81e808eecf620ab | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/9594e7dd32d2efbd61be5135ce7dc6e7b01c860c | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/113d43c0839e822970138e920a7f5bc9a7f4b21a | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/523e29ffa14133d325f1fc76f9a1f1885412c801 | ORPH
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d7e94c440b50784fc9a8025f6c0532089df056e2 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/3869da6d04bb28e526399d343af718c4c3cbcaba |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/77baacede67ea5dde26b2d636d31913743a3df09 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b0fbde4357520d9a46811d82ea18d4f223110ab7 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4c8260351eed8399a586e54f7e8ab57257a36500 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/7cfd9fa23d601fd556cda6e0e7798a46cc2fac3f | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b33e6c303ce8c0c4d2214ab565edd6eb6e913acf | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/28dfaf37fe99a94aaf9887894e6cb7cf37ed2461 | ORPH
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/6918775eea1d93800b7cf5e7cfe11aef532eb46f |     
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/540eb8751908ee8534b9c8b0533e00019b354fcf | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/f5923089005b394ca31d5acdae7c6fb24b715077 | ORPH
      mipsel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/6b722513ab7d9a896885b0d342a9ee0a23a97de5 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/b13039ba602b9d500b939d259816a39ba24e1ba2 |     
     aarch64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/8781a561ae1a89e4d70ddaba65d8817eabe3ce69 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/0c3944e94d56a4674015d5aab90e1fa338cdd326 |     
         arm |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/2d3f18e27afe355c4ec813829fc4214e2b3a64f3 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/f9315f12e7344a77f1a060961c2e0cfb379632e5 |     
        i686 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/52eabe7b97be5703c73d6d3b04ca503ba1cdd0d6 | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/18fa61bb5a3e9782d1037205bcc4652c8f64da3f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/56c2c8e46c84600e9c1816ebeedec6d7492441d1 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/120d5163c5833090c975a5c26a6da742d7de714c |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/e6d92b4ca6e4568655c4e5bc7851369b5685ca11 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/e0ba4ba4a9ade462e71dd830690dfc9ce9986959 |     
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/15bfc1c057b2c5f94a9fd63c545d7b0bd3af1eda | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/84724f12d73b017b9cea60dce01627c2c16f01e5 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/117d83c012da15cbdb4081b3865d01b75e97db5b | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/dfc7fb503257f73afdffbe34815d893a6bcb583a | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a6c53e359b8e1bf8d3b60683dea3179af7dc30cd | ORPH
         sh4 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a556f7cdf617c7077f9c31a09ccf437a50b370f6 | ORPH
     sparc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/6bbbbd796ff8b794af1adb737b53cb285f285c84 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/77a6a1f044f63085ae1402e5038ca60ee4d01f6c | ORPH
        i686 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ff44a1d33b375d8ef11f24bda4f6e2ac0ab7c527 | ORPH
   powerpc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/00616b8d479806700a0a3959a350c4d54cc7b3a4 | ORPH
     powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/774e1c70783c04128b46ace9989715654bed36e3 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/dff0d893fc538421898f50b85c2c9e5c8413a025 | ORPH
     sparc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/b79c2c973beed6b307b6c0fd9f5792cf6649b6a7 | ORPH
     powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e97c7a32ec6246769b0f6c8df9a27ce3626d289c | ORPH
       sparc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/11714318631840c449daf9f09e0d4c523fc0923c | ORPH


-- 
http://autobuild.buildroot.net
