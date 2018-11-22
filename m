From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-21
Message-ID: <20181122070027.B388420D31@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.08.x |  26 |   1 |   0 |  27 |
      master | 185 |  11 |   1 | 197 |
        next |  34 |  10 |   0 |  44 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

    mips64el |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/64461dcb59666eb4f068087a48a686ac0fb297e1 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fa7a016c537ff3b2930a41398649e22190befd49 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 3 
             host-gauche-0.9.5 | 2 
     docker-engine-v17.05.0-ce | 1 
                host-libsodium | 1 
            motion-release-4.2 | 1 
                     mtd-2.0.2 | 1 
               skalibs-2.6.4.0 | 1 
               valgrind-3.14.0 | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/ebecfb93bdef2179b1492a5aee49eca8b6af46eb |     
      x86_64 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/2fdf59c627a1cbfa8d2cba6f118579c38f0ba7ac |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/f4935e29ce6aaebdaa47d46c56120b7e97145d1b |     
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d212f25433632fd71f4739834ba03de4b6adc5e1 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/42023c8d9798a8c3b79a3b7f899587ba83ad37f8 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c0fcab923518aaa2739be416fed0dff42c522453 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/86916c9c94ffa925f358388ed065ab991327fef7 | ORPH
         arm |             motion-release-4.2 | NOK | http://autobuild.buildroot.net/results/4d4e72808300ba1ff79ca794930112b554eb2533 |     
     riscv64 |                      mtd-2.0.2 | NOK | http://autobuild.buildroot.net/results/fa82223a60e2d6b8504e58fc994243157f023dbe |     
       sparc |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/d32654226229bbebc2f79995d04fd9b6fb9beef0 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/f56c5ac5104e63fe54605d47bf0a9f44ddeba572 | ORPH
     aarch64 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/652750b8b75595b207b092ddae8e9b65c87c3e83 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 libv4l-1.16.1 | 2 
               valgrind-3.14.0 | 2 
      docker-containerd-v1.1.3 | 1 
              keepalived-1.4.2 | 1 
               libiscsi-1.18.0 | 1 
                libmad-0.15.1b | 1 
              tpm2-abrmd-2.0.3 | 1 
               util-linux-2.33 | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/96b8576071eb3f03c37922203b1794a4ae0188c6 |     
     aarch64 |               keepalived-1.4.2 | NOK | http://autobuild.buildroot.net/results/df4b44bd42c931067e4ca8aaf4097a0fd173c168 |     
         arc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/44b3a90d73dbbca406f3e67bfb10108da7e8481d |     
microblazeel |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/1c5f9b5bf2a0fb574c40371f9b77f1c9ef79e771 | ORPH
    mips64el |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/c9bf762c012015f635c047426524e2a9c0db9b75 |     
     powerpc |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/050355d08c3725b478d39d7feb1d6d5396e344da |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/fc1bd1035c7c68719d2966dc4f050ff9182d416d |     
     sparc64 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/e7e3469717ab27d66d2528087fd7c3a41477ae05 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/8f1ec5dea4c640ada911290e213a27ac0048581a | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/dd66a4b91c497dfe73c2df58b93a3b33a06be646 | ORPH


-- 
http://autobuild.buildroot.net
