From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Jan 2019 08:00:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-16
Message-ID: <20190117070022.6625320994@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   0 |   0 |  21 |
   2018.11.x |  27 |   1 |   0 |  28 |
      master | 150 |  62 |   3 | 215 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              webkitgtk-2.22.5 | 1 


Detail of failures
------------------

     aarch64 |               webkitgtk-2.22.5 | NOK | http://autobuild.buildroot.net/results/a57320701c726b849eef36596d53c8338978be3a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 9 
        glib-networking-2.56.1 | 7 
                     php-7.3.0 | 6 
zbar-006b465a267ad3c6c754b8... | 5 
                  ffmpeg-3.4.5 | 3 
              libserial-v1.0.0 | 3 
               skalibs-2.6.4.0 | 3 
                 gnu-efi-3.0.9 | 2 
                 gnutls-3.5.19 | 2 
                  nettle-3.4.1 | 2 
                     pcre-8.42 | 2 
                    postgresql | 2 
                    cups-2.2.7 | 1 
                 dmalloc-5.5.2 | 1 
                  exempi-2.4.5 | 1 
       gst1-plugins-bad-1.14.4 | 1 
                        jasper | 1 
         libcpprestsdk-v2.10.8 | 1 
                  libftdi1-1.4 | 1 
                libmad-0.15.1b | 1 
                  libssh-0.8.6 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
libubox-723730214732862de7e... | 1 
                  linuxptp-2.0 | 1 
                 minizip-2.8.2 | 1 
                   netsurf-3.8 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                  quagga-1.2.3 | 1 
                   strace-4.26 | 1 
              swupdate-2018.11 | 1 
                   taskd-1.1.0 | 1 


Detail of failures
------------------

         sh4 |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/53f5bcd9010c841838f51d65427d9a97ef35e08c |     
        mips |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/67ee02231c2f97fd0c0a57f5dfae9b7abff51a6f | ORPH
     powerpc |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/a77a891683ae9a135dc31be1b419061922d0e1ba |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/7758c82e5841858ae9d3bb09b090d84bb21bfb07 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c523331dbcf1ff11aea950d761e8c97fdc7902db |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/8dc5b4212b1d8d0bf5bd5e8a27eb02753dc678e4 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f0725938909ca8d4b3c963fc5d3a6959df583149 |     
      x86_64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f8b5fc45eea91cf51c6d43d438dbfdd7b8ba3e02 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9a65abb15ca4e64bfbc148b07ea553e8caba4893 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/19e64630a056b793c649af28f34e5bc9fdcb88d7 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f0e2b38379b09b6d5a1fb1626e2bae218673d95c |     
      xtensa |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7374e0164ef0c6667d846d687e4e811e23225c00 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a0b60c3cd8a3d80c7166e8925fb8562aecb7b92e |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/e2df3371e09f62ce1136a9029113b972163f1522 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/381e4d8fc559b014eb3bea1407d2284b5fd5d6d5 |     
    mips64el |                  gnutls-3.5.19 | NOK | http://autobuild.buildroot.net/results/f8c38ea6ebbb78269d620d19d760a0566f742640 |     
         arm |                  gnutls-3.5.19 | NOK | http://autobuild.buildroot.net/results/08cc1f68a07f63042947098597cfb8c87ab4ef93 |     
     powerpc |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/343249ab34ab77be3b8077f544b9d1e2d4852796 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6d00a09e0683ef0ab7c2035963344695d0ff89e2 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/aa2cef26418e45a19c65dcd66b2b9edbb5e5bf3c |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d1e237e95ac890a329c98081da59eda16fcab3b7 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/4ba50076dda1e833c5510f277f9ccca73e085ca5 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/12cecfa4d1294217d35fb0b115f8357fb77ce815 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b0a1fe0806ac2dfe1c4e408cf452bf639051cacf |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e9fe96604a2eca55add04b22bdc78c0d82d26cec |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/126bbdd52101f89ebc681a11d09b4cb98146ef09 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/4aa2f44186f030937ee94273100a3543bb1f4f3d |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/2256b8f281700d79ce5853b200bdf89018a83e54 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/f8a771c44b0c7e2192fd40516a2732f3b005de94 |     
     powerpc |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/5b847b04b47ac6fc8fcc4d3570bf9d7a20e70a0b |     
microblazeel |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/988eb64b31bd28f4971e61fcaba57d3ac6c8b556 | ORPH
     sparc64 |               libserial-v1.0.0 | NOK | http://autobuild.buildroot.net/results/c3a0597043eb981176a385dd69f1572cf817493d |     
       sparc |               libserial-v1.0.0 | NOK | http://autobuild.buildroot.net/results/6d881b5ba9085d4c9d04ba6f4c1b3ba606a68afe |     
         arm |               libserial-v1.0.0 | NOK | http://autobuild.buildroot.net/results/91bc66f1293fc7421bafe2da6412090c4973de09 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/fd9d30a1c3d192c4a2bd0bfe0b20f5be93237015 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/341d7a8fbd79e5f424f23e912ab319334aa5445d |     
        mips | libubox-723730214732862de7e... | NOK | http://autobuild.buildroot.net/results/f86439caf2b5ee8215a739b818dff838b3403e53 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/62e30d7eab73090f0e5e7ddbde6a6dab1b2c58a9 |     
         arm |                  minizip-2.8.2 | NOK | http://autobuild.buildroot.net/results/2e83b694b91fe96e1a044385d327d7abd2183e24 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5f22b7765f5757a3e238c2d268039a042781b09f |     
     powerpc |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/69226d42e9a483aaff44fb3f468b4724415e71f6 | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/84c813f318a89e12e20f9d8881ad0813568cc83a | ORPH
     aarch64 | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/1c6f0d1f2fcd3474af81b3851d875f834a3a0a4f |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/83eb474d7724afdfcfcd86001714d811b931b9c3 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/c6c404218b698e9bfc20842c70814d83b9e3af20 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/40ef339019203d2cc49d388e222cf17c3ca37944 | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c1a7daf7b94ac1047a59872063dead4eb8bd1518 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/15cdd2ed3d4b697d0f20e208d1abed38ddf5b8d8 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/488ab631a8eb9feb2ae101318384c9dafa870fc1 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/68c1958aa6a0cb8793cbe3d1392d3fa027cf0529 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4da3fb09c58aaae84b6fc65174bfd979a6ace254 | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/0084c6590383e3b8bec790f13355e322226407e2 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/4868f6da0637f3a59481448350c2d5f176d643f3 |     
         arm |                   quagga-1.2.3 | NOK | http://autobuild.buildroot.net/results/0ac598c2259a8d7e8b72d4e8ed95079675b31b84 | ORPH
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/7a34b47913ea558aada108994dcb1de665422865 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/4658de4e175d0d7ee174e2f28705560f18ea23d2 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/fd78e38e3e39a1ca6ceccc5ba4f93b5cfa7ae66f |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/8c7ee51a7bc70abeae6f2cd377b465e8f3260594 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/60ffcc23aeceddda3246c6cf3d20ba07eb4a9c6e |     
      x86_64 |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/be3e29dff9fa0a476852876b60248521f0486712 |     
    mips64el | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/3a6c060300f609c178244b11e12d75e67852b1df |     
        mips | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/e08ca257c08f24091412146710b7ff6a4ac81764 |     
    mips64el | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/ac3b543915d80487d7258827939cebfd7913b693 |     
      x86_64 | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/292235056088f3cea8009b0b2a573a917d7e53a2 |     
         arm | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/52939b60c1a095397e6bf8ff5eff9bfc6b1be1b8 |     


-- 
http://autobuild.buildroot.net
