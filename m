From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-11
Message-ID: <20190112070027.D3C1E20898@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   3 |   0 |  27 |
   2018.11.x |  26 |   2 |   1 |  29 |
      master | 175 |  55 |   5 | 235 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
               host-efl-1.20.6 | 1 
       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/e430225d162fc4bcb970c1c51e34c0009d095c18 |     
     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/7344175d7c75fe0f55559d1d907ede847cf11806 |     
     aarch64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/fdfb1b3f92f98c9e0ae2232b48c5c5892857674a |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
              webkitgtk-2.22.5 | 1 


Detail of failures
------------------

         sh4 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/93b41bf4373c40ffa0efa90b6b767de0aceb3ce7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/29b896b63832382523f8df8eca67a199ec5a005b | ORPH
      mipsel |               webkitgtk-2.22.5 | NOK | http://autobuild.buildroot.net/results/dd89d219efb711ecaa71a268bd6b36b06b035c80 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.56.1 | 9 
                     php-7.3.0 | 9 
                  libssh-0.8.6 | 6 
glibc-4e2943456e690d89f48e6... | 4 
             host-grpc-v1.16.1 | 4 
   libtorrent-rasterbar-1.1.11 | 3 
                php-ssh2-1.1.2 | 3 
                    atk-2.30.0 | 2 
                  linuxptp-2.0 | 2 
           php-memcached-3.0.3 | 2 
             stress-ng-0.09.47 | 2 
                 dmalloc-5.5.2 | 1 
                        glibmm | 1 
                  grpc-v1.16.1 | 1 
                host-libsodium | 1 
                         kmsxx | 1 
                  libftdi1-1.4 | 1 
                          opus | 1 
                     pcre-8.42 | 1 
                php-yaml-2.0.2 | 1 
              swupdate-2018.11 | 1 
                   systemd-240 | 1 
               wireshark-2.6.5 | 1 
                wolfssl-3.15.5 | 1 
                 xapp_showfont | 1 


Detail of failures
------------------

microblazeel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/35b6e928e49028ff437e0100754ef070f23b8e06 | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/a9322f0f8fba716c672f07045a20ac90eba8f8ed | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/1bbfa2158cbdf1e78121fab9c871649c425c5e69 | ORPH
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/3de3bc8266a54ccb3836f0414c72deb2964b81d6 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c97adc8cde7a5e3489504fe03cc42daa8e924351 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a8f7a46bfbeff53d9b436a5b7d59839920bdaabd |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c402fcdc0d82ce2712d3a34ee128bda7e3a1cdea |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7d0d2ca11c82e44de2b277fdd3be977d17a22995 |     
     sparc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/1eb1e7ab05f8222d351c66fe6aba1251c7942438 |     
        or1k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/1b84102c0f0d491ea73e18970c96dcb21a35b3b9 |     
        i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/17c947e6adb9124a4332173f81550842758e277a |     
microblazeel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5bb5fe2c1f64cc4db1599237fa440b42a95cceca |     
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/60faca0ff51ed119891ff06f3c4d113c7ce4831f | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/5f97b72c88deb5c3d369ac3e10c5958d5d6f4980 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/0f0eb2fe001a0b7419d08d3773fed92d5c03ad0a | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/f0c0253ebefcabe6bb024787bbb373ca5ebc377a | ORPH
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/6916b22a679f3020e7c82220b3ef97fd61f57645 |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/33173f66cf291f66a35051eab5329b2e5f0faa10 |     
   powerpc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3afe89b62646d7ce07e169e697287662e3ee7e87 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/57d398d1c030ecccc9865df538aa261f530e559a |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/99031db9ef0719c84cff6d5b15c0ec92e5e843ba |     
        i586 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/318428357670a814cce3317af98209274e2e5d59 |     
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c0ab043498a023fcc77d4678ceb897053b4d6ef5 |     
microblazeel |                          kmsxx | TIM | http://autobuild.buildroot.net/results/360f19645e76314048c75424bb4b64da91742f47 |     
        i686 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/cca27a3a63965f7397f11a99459bc5d6b017a06b |     
       nios2 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9d0563dfb178750cfea02b706b07ce128bb3b4d4 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/b6a4669a604fe8a44882d5531e35aadcbe3744f1 |     
        mips |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/bf3e6413f39f762377a4c71aea911be091ee2a9a |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/78756f480539df31cbeb940556158ade067446a9 |     
      x86_64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4665e62fbbbfdf022643a29a48a394da11061e97 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/e2c584d7df8bec6bf7878e2dbf853d5d5f9f5aff |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/072a87a98ef9d9941a962a8f4d1893122246c756 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/920a868bcbfd3006e50892a173c9d45d216d6408 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9cb6845e143633e33404e2457a1ffc75619aaac5 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e6e1c02d7f0e9eecad26bfdbc84e07b7e9c1c593 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/42a1394bbf4c1c90359fda8ad47f0a92ed91cea6 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/e4aa8dca952e3f16ce93c299b8192691a35df573 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/b893db3c83ca58faed2f8961a383e531ffc806a6 | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3e0e40eb9a7a5c53a2d1ac75efd35c5714eec6e5 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/914806df3a95958697b43263829d847b365e1091 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/bfb368dc0c4b87ea893d3cc29639186e158bbe7f | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/efbdd40f79e9e838a5708d4344785f2b6421228d | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6abf611b3ca89d7f80dbfde42ef3a0b0a4fdb616 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ba8867eb10734dff1fd9fe099052668ee59b0c33 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e7b430c7364c6e365c49f86e41f8f65341bd6653 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7ded590b0ff445127a16c415319a322dc9e3a09c | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/fe952b07a3026f788d227a5aacbf19173ff0eef0 | ORPH
     aarch64 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/8705b7a27b7b17421a5a1d9fa6979b61c3eeb24b | ORPH
    mips64el |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/57ce77fc1b99a72019dcfe8fe5d55aba315b9e79 | ORPH
     powerpc |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/19ff6cd98c77d0b5dca55ebf7525078e6ad92818 | ORPH
      x86_64 |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/07b10dd36e680ef74465b98f8bf62884e98dfb8b | ORPH
     aarch64 |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/e0fa3a7a75d547b43367d0364521c79a4484451c | ORPH
         arm |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/8d23d9c1b30d104d44ab82475dd12f1c4ab1e125 | ORPH
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/4df7c5b931f7f42b4ebe93e371a1fdc98c8cc7fc |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/7cc5aa971204155dbf00d1d8935f8fa2eb031fd9 |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/55767e58c211656558af7916a4e0975089a2785b |     
     powerpc |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/699c078aa078240c6741da4dbd0871450ceeca92 |     
        i686 |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/4928a4d4bed0c33269ffe630bd0f5d07b9a86421 | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/1f5545800223a964fdff7c498499092ed1a47303 |     
         arc |                  xapp_showfont | TIM | http://autobuild.buildroot.net/results/a2b021451f99fb3c1238d9669f6effbc42e850ec |     


-- 
http://autobuild.buildroot.net
