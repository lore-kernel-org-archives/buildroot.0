From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-29
Message-ID: <20181130070028.54EB620D17@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.08.x |  18 |   1 |   0 |  19 |
      master | 175 |  11 |   2 | 188 |
        next |  31 |   7 |   0 |  38 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    php-7.2.10 | 1 


Detail of failures
------------------

         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/282fb757f316f32362ed60a760b340d7105f8b6a | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4e81cb628e28c6c227a5e873cbce34756a678b6e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

      docker-containerd-v1.1.3 | 1 
                    host-clang | 1 
              host-clang-7.0.0 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.9 | 1 
                 minizip-2.5.3 | 1 
                    php-7.2.12 | 1 
         qt5declarative-5.11.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
                   systemd-239 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/cccd63f081a78d87cc7830f48981a383f81ead6e |     
         arm |                     host-clang | TIM | http://autobuild.buildroot.net/results/35b8962be190c1b54ed041b38224c7d57b848f67 |     
     aarch64 |               host-clang-7.0.0 | NOK | http://autobuild.buildroot.net/results/db3adbe0b66f706994db019a86dae7b61a773fe9 |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b350b1ba237bcee95369e913a37c1dfefd5f4cb8 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c61a455e37f240f874e67fda279748366787bae1 | ORPH
     aarch64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/7830c305682fc9aecf96c23a6b8bbb6e6e76ec24 |     
         arm |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/00dda26e26403e2648c2b9019e26ad49ae6ad901 |     
       sparc |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/763aecdb580fb0cb1ad8ec44b7d9ac98710a8932 | ORPH
        i686 |          qt5declarative-5.11.2 | NOK | http://autobuild.buildroot.net/results/6fce0ce5aea943e097532efbbc8d1e28f41e5866 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/edc4e6bb2ae96dbaf8392ae6caafb7f08153144a |     
     powerpc |                    systemd-239 | NOK | http://autobuild.buildroot.net/results/ffd71c473d3b29618c18cd2e04705370266696f2 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/c198d305f9542c681a663ef7270b6982f4cfec37 |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/8295ef33054ac9db0f3adb9f7541593b8c05f3af | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  ntp-4.2.8p12 | 2 
                    php-7.2.12 | 2 
              tpm2-abrmd-2.0.3 | 2 
       shadowsocks-libev-3.2.1 | 1 


Detail of failures
------------------

         arm |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/66c4e055692f8e058f7e6ac3572ef65dd7d7ee6a | ORPH
         arc |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/833c99af2ef9e252a0cf3e81972692d6451c0988 | ORPH
         arm |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/82d0430a4f9a14a6ba60441ca83444a3b9b136a0 | ORPH
      xtensa |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/4ca65a3f6cd79cde94e0db7fffbc4eeae451c525 | ORPH
         arm |        shadowsocks-libev-3.2.1 | NOK | http://autobuild.buildroot.net/results/c413c460d73d8fafa05dfe7a1eb69a9e13c947ea |     
        m68k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/1fac8a8997cf42b37de5481a7904947d93bc4e29 |     
         sh4 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/34f21b36fdb5049bb8a127073cc8631b55e4df7b |     


-- 
http://autobuild.buildroot.net
