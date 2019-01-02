From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  2 Jan 2019 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-01
Message-ID: <20190102070030.62B83208AC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.11.x |  26 |   1 |   0 |  27 |
      master | 164 |  39 |   3 | 206 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          qt5declarative-5.9.6 | 1 


Detail of failures
------------------

        i586 |           qt5declarative-5.9.6 | NOK | http://autobuild.buildroot.net/results/145d00a7b56692c4d5efce2089a3bf07e0d5bd50 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d540df5dee872313824336fe0aa5ea9c6dbbe78c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 9 
                collectd-5.7.1 | 5 
                  linuxptp-2.0 | 5 
   libtorrent-rasterbar-1.1.11 | 3 
                host-libsodium | 2 
         libcpprestsdk-v2.10.8 | 2 
                  libssh-0.8.5 | 2 
                   netsurf-3.8 | 2 
                     pcre-8.42 | 2 
           php-memcached-3.0.3 | 2 
                php-ssh2-1.1.2 | 2 
                    atk-2.30.0 | 1 
                  brotli-1.0.7 | 1 
                  ffmpeg-3.4.5 | 1 
                 libdrm-2.4.96 | 1 
                          opus | 1 
    xserver_xorg-server-1.20.3 | 1 


Detail of failures
------------------

        or1k |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/d0f5b727789bec254d3e2a990f3a2db469c54cf4 | ORPH
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/67714334d7fb3fe8867391b55a8ee38f70d5dc71 |     
        i686 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/df51b34e1a3ce08def95b5fc961b02eb6f386299 | ORPH
       sparc |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/9140f1db9e3df7f4a29d7b72903b04e1a05d9d3b | ORPH
    mips64el |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/8f8a1c14dc604b9d4e04175b2765352dc5f79ba1 | ORPH
     aarch64 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/c74da6970e6e594cabc8e7acc68b03133e5dfdf5 | ORPH
     sparc64 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/18c64ed86be05e32420fff8a2abee6b50122cfbc | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0b0939b682f1e22a6c05fa3f8d09a33135c37e23 |     
   powerpc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/966ba41efd06f339481c8ecb52a9ae6455449e9e |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/e477e23353be3be40f955e99e5201b288e124e63 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/93e614036415afc93dbae5e1a17f0b8a00192f1a |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/e2e0754abd14a43e6219d3234399028de7242925 |     
         arm |                  libdrm-2.4.96 | NOK | http://autobuild.buildroot.net/results/307cdfb2404636310bf806d581509b327f82a460 |     
         arm |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/d68fe1b0e5cd6a11bbc3500d834740a030854385 |     
         arm |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/7d2ff6fadfe5e88b74b785baa1fda06ded1656c6 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/accc219bb37235c6eae2513917e3af648af1c9d8 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ce0091b466d5ae28d603cf30dc9a3910c003c9ba |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6156bdf4fb02d382f9ece753dbe4d5e0d81c116b |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/10fc30314a03023f73946f861a3a8b65a271c09e |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a2d8f8d3aea26aaf8a764c6c1515bb4aca7fef8e |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8c9ed11c0ede53eb7453039dee11091284e2d522 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d7bfcb4fb08633d49466b409699f559e91af195c |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/af261487b32659b5f0f49daf3de1a87d4a5df85b |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0c89d5fa5c7d51491eb77e33008b82b1755f8cd1 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7efd76ebf5c3d81267f80438e1788aaf3304e246 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/ee687b4671aefc490f5fae161d81fd5d19f47c25 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/8880d7dcfe28d586fa8e118ac55c5f61610afa12 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/6a873394d03c21f4bf5fc611ea1bae7e616a3d72 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/178a769574e2f9e61d9fcec8c0fe1761a5449de7 | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8ec830a4a2c14f00181523d99333344d9c4f08d3 | ORPH
      mipsel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/fa1b1d024b8106e5e40622d2d28e1f7f7adfa513 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cf2400ffca1e4f9c59d948bfa907c41ea64ad75f | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/036ee3632c51a327e01011672f0ee286805616a2 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8b1a55d2e90ebe0269e2331bdf1621f55002d470 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5d0b5b1f09da3a79b56c78961632b84923236603 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4c7ba3cd60cd2ee9de33dca4aeb743311a479cc7 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1d55f9a82120185e588898c54fe50c24ef3f8abf | ORPH
         arc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/be4f8675e55a37c645f2fa28751e8caba7cb88c5 | ORPH
     sparc64 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/2100f26463403867353286a648fedd6294dca83c | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/b3445bf1300ef6bf2cc6f8c3d8a4514c92b2702b | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/e005a013a64188c404d6a3e1cffed1cde0626bdb | ORPH
      x86_64 |     xserver_xorg-server-1.20.3 | NOK | http://autobuild.buildroot.net/results/1e626889ba1bf7dca5b2441b7e91892f7a422a61 |     


-- 
http://autobuild.buildroot.net
