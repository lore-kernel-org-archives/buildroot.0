From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-10
Message-ID: <20181111070015.59E602072B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   4 |   0 |  24 |
   2018.08.x |  28 |   1 |   0 |  29 |
      master | 186 |  12 |   1 | 199 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
               host-efl-1.20.6 | 1 
                p11-kit-0.23.2 | 1 
                   qemu-2.12.1 | 1 


Detail of failures
------------------

    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/66a706c4c55b0c0f9b78a451e141db954d97f323 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/f5bf13d4eb9fcbc1517965a413ae29cb20abba0f |     
       nios2 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/1292d02aa1a8ef361201dbf53d152f6e049d3153 | ORPH
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/d4153c6f456b08c024cc1469ab0b0dcb850d01fe |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 


Detail of failures
------------------

microblazeel |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/ddcfdcbbfb1c78ace5544e78aab57b83af244f5e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    trace-cmd-trace-cmd-v2.6.1 | 2 
      docker-containerd-v1.1.3 | 1 
             gstreamer1-1.14.4 | 1 
                host-libsodium | 1 
          libmicrohttpd-0.9.59 | 1 
                  libnspr-4.19 | 1 
                   luvi-v2.7.6 | 1 
                 minizip-2.5.3 | 1 
                   qemu-2.12.1 | 1 
                qt5base-5.11.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/ec0cc98d21d90b2104a92e8f65a2bba87c940e51 |     
     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/ce8b5bff223cd55601d6bff503c76aa2684637b9 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/923d663b99433095ea41a777deab2a38ddcf31e6 |     
     riscv64 |           libmicrohttpd-0.9.59 | NOK | http://autobuild.buildroot.net/results/910dc7164312637bf4dcd89e4cb476ae198466c8 |     
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/a98db13ea105d627f2a4770969b31550926c2791 | ORPH
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/8217e863c2776d299cb90b90f1a2ed8233ec82ba |     
         arm |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/5fdee934bc55f75d95c386c1bfea23e6b37fa7aa |     
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/50e0d7d1b4f5c2b827b50bb82d8fbc066bf31118 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/e6b07f898196ae6f2ef0cb14902c91b8d9127414 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/2c98b9585ed23d5db21e2f78c1c95be6863fa59e |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/5500858a3d060489330b7dac92603bde9c0ab5c4 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/25ab9c250c2e4dfe73a999ee2fd7f1a4e5a22ecd |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/578b9b11dc65b433b8d8f6d53d09b00c1a2fd5a3 |     


-- 
http://autobuild.buildroot.net
