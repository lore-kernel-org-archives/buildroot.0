From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Dec 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-22
Message-ID: <20181223070027.602FE20A58@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
   2018.11.x |  17 |   0 |   0 |  17 |
      master | 123 |  46 |   0 | 169 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 21
                  linuxptp-2.0 | 5 
                   libxcb-1.13 | 4 
                 dmalloc-5.5.2 | 2 
                  libssh-0.8.5 | 2 
                    php-7.2.13 | 2 
               asterisk-16.0.0 | 1 
                  brotli-1.0.7 | 1 
                  ffmpeg-3.4.5 | 1 
                  grpc-v1.16.1 | 1 
             keepalived-2.0.10 | 1 
                  libftdi1-1.4 | 1 
              lua-curl-0.3.8-2 | 1 
                     pcre-8.42 | 1 
             stress-ng-0.09.47 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

         arm |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/09192615ba31c3ca4b541e36f469aade127667df |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/9ca683f1dcf026c83ee8d29a5c649adc28f22508 |     
        i686 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/0d1f8886811f58ea9762a4329bc70850484fef47 | ORPH
     aarch64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/a602363d169678ea37f657ae8440ef072b4dee29 | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e149a8b75a0d57a8fb82773287b17c296ac260ee |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/aa6027ae0d9d019e695f4d4f04a819614e333aa2 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ff2c197a3ee9373782107a1ca52fb94756abf5f1 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/85f38cbdee085ae17bef895598b1244734ee30c2 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/afd6bc016d8eb2e1bc342426057c7cd149494ba0 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fb46fc9ae343cafcfd86d8c3d195a533572a6ad7 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/cba4809f7f84c9912d1d63596c6763349b316e9a |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9f0e5c7d9e06c1ddfb61cf66bc52ae6461f43498 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e75b0b2594f4476b31e14a48a018affa99ae6e6e |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8ba9385190f3b997243888394db7266aae416a92 |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a12caedcf94d4a2c4ea82ec66623aeaf07667d35 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bf65ebd94438fdf18c69d78b579a56f159ea6a63 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/807cc481bc04b1bf5425552756f6436fe5992209 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a51f1b68dc93a567ac884096ab0e2c2d316e678a |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bff2181efa11979ee23cd7b03fb5f71ce90d67bb |     
         sh4 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e821bda02674917f15631268b9645e4be5b7a9a1 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c69dd8ce06c6b65a62d433f83c3f3734614c6ff9 |     
         sh4 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/53e1a5a2238af8fdc70bf70279a3fd70cbac427d |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/35f766b74f91f10879b187d9de49da69455062fc |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/dc5b49725b3dc150513c141709e9fdc619f4aefb |     
     sparc64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/eac239d65dd5ae8a9286e9f092d5dc7d0d7a9229 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9bb8553c3e5dd868e85650f7ddaddea7361be5be |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/067bc289f872268baa7ece828052d0a5df38ec95 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/c5c6e303df85fadf2b9491f934fb65b96959379b |     
      xtensa |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/8f26245a3a2763eb4a65ece6ec73a7c90fde4a58 |     
         arm |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/cf63b1f83f23eaf000f2a54e515040299b9e6c93 |     
        mips |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/73282c495dcc893a984f3279bf9afc767268285c |     
     riscv64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/f2d935e8800b7e6db3384b2743045122214e73be |     
     sparc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/ab93292aa644b151c1dfaddec9f58252c52d85e7 |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/392fac04c8876100ec9783eef6de6cc7b0df8efc |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/41a4e6b9e17adc75b023e89b231a2e00e3484979 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/64ec606f6a8a63741131d074ce40a80f76971265 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5f8d651222888f36e54ef5fd846298979bf994d8 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3344a9b18102395244638c9594010849bd405141 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/854226fbf7852add2bb71a0b43dac0cd30282015 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/eedd7eded2daefa6f8ddbdb7f6a060472bb4aee2 |     
         arm |               lua-curl-0.3.8-2 | NOK | http://autobuild.buildroot.net/results/952d4afe6d4cfae454971b01aabb813e51c70598 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/e0e9fa04cc4f11f1227ce7d1ef24f1817c72fec1 | ORPH
     powerpc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/4bc7f33254effdf658c7a5cdf7d4ce2f7d619c85 | ORPH
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/a01ae0e6d31f4c1417458c82439b5977b0b0a1b5 | ORPH
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/8f9d3696bb03763b059b4c732aa176c6c6fd6a73 |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/17e2f974d10cf5eb668aa91c689cadca52d47b95 |     


-- 
http://autobuild.buildroot.net
