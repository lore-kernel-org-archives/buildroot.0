From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Nov 2018 08:00:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-04
Message-ID: <20181105070023.14BFC207F4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   3 |   0 |  23 |
   2018.08.x |  20 |   4 |   0 |  24 |
      master | 162 |  29 |   0 | 191 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 2 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

      mipsel |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/9163fac11a441f31cc6b7e7448850fa0b658d726 |     
       nios2 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/7f0ec5a832c5241ea2d92a85c6247d2f7ba11c5b |     
   powerpc64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/7cb072387e88017d125655b58744daeedb399013 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                    efl-1.20.7 | 1 
                     gpsd-3.17 | 1 
                p11-kit-0.23.2 | 1 


Detail of failures
------------------

         arc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/2fbf686bb5a714b4bcf99a046cc8cfa9d689b419 |     
        i686 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/e0cf89445367b6455ca34834a39582744f9b66dd |     
   powerpc64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/7e799fcc6fb85ec16b2c1c437bff53e647a41f89 | ORPH
         arm |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/c70a8d22310ed5e3487ba1feea96f82007aaa72c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

libssh2-8b870ad771cbd9cd29e... | 9 
                  libffi-3.2.1 | 7 
                  guile-2.0.14 | 2 
               valgrind-3.14.0 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
                 libv4l-1.16.1 | 1 
                 minizip-2.5.3 | 1 
                   mpd-0.20.21 | 1 
                    php-7.2.11 | 1 
             qt5wayland-5.11.2 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/435e3a9f43558a7d1634ec7329d04587053775c1 | ORPH
      mipsel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/d77f40721a23c35cb2db03ce984eefe64f365e45 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/e1afe23bf9b84637e7883181e0e21908107f2a87 |     
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/e19bf5ccccba0fb9352c760a2150764798f657a7 | ORPH
       sparc |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/a3c74d979a84c84fbe6793b3b91a33e07e267ec3 | ORPH
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b9da9da0a8b9f720e9bbabad931190a8e7cc25d0 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/902e88c30d3ad1a42cba87943868f42279978268 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/984ae5b7a54f6c83c34eb4c3cd182d7c9c39886e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4a2292679407a469376ba98a96aa42d098b2f1b8 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e896e604cf3d09d87741b7ad566736ab3468fd01 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6892f678fdb136e2b1a6e0143b7b614c687dfcb0 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/203a9cf648b5bf44ee6dc41fe575d06802073bb2 |     
         arc | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/f28199d90693a2cb2a1f72c492d49af698988146 |     
      x86_64 | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/d45ef1fb15457355abd036952e8c0525c64d5b8a |     
microblazeel | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/4f340c68fb1f2aee7ef6e81886242a81ad7ee527 |     
      xtensa | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/ff13b53ac91a0c7836e062f43b61a669ac3bf7b3 |     
       sparc | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/5e950a10b5b775ad9357111f62884e77212f954b |     
       nios2 | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/07d0bb35e60e7d15e013a56bba832c7c0353ee3f |     
      xtensa | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/0f7538850362d5f76e81fe6b69822c9dc262b25a |     
         arc | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/0142a8800dc217e73c969f4ccdd3700628b10a86 |     
        i586 | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/68623f22b49473177c889fe7b12625d779cbd1ed |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/3391705aca7022111ef743212b7cad57f0cdea9a |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/8fcd9db1ad462593e0e2a1603d9186e87db56579 |     
         arm |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/4522014698b9fe50720a71b663e47a75805bcf54 |     
         arm |                     php-7.2.11 | NOK | http://autobuild.buildroot.net/results/c1ac89b17228a6049b2c7a9a9c1b3fc05f233a43 | ORPH
         arm |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/654d4ef21e038194542ab077460fbd7e951b08f5 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/fbe46365f327640c988dd131dd0bbbcb5381257b |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/c83b44d4cfc45f0383cfa51e67315d3eed716cbf | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/3aa3936398e4b6f9cf08ee3f398b9d7b6148cff6 | ORPH


-- 
http://autobuild.buildroot.net
