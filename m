From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-20
Message-ID: <20181021060025.BA9AB20890@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.08.x |  26 |   0 |   0 |  26 |
      master | 192 |  19 |   0 | 211 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4022fb51042296dfff840e2c38f9f67dd7c4afa2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         host-cargo-bin-0.30.0 | 6 
               nfs-utils-1.3.3 | 2 
                  cc-tool-0.26 | 1 
      docker-containerd-v1.1.3 | 1 
        ltp-testsuite-20180926 | 1 
                   luvi-v2.8.0 | 1 
                 minizip-2.5.3 | 1 
mjpg-streamer-75c6c4a7809c7... | 1 
               postgresql-10.5 | 1 
           python-numpy-1.15.1 | 1 
                   qemu-2.12.1 | 1 
                qt5base-5.11.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/88a8aacbd090d08583a2785bdde9a166ba4ebe02 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/ee0eeea3e4990bbbd0bc393b03c418962c37a251 |     
     powerpc |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/11848e6feaaafca03f5819d7167c0e1bd5c09030 |     
       nios2 |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/a78f9134dfa6501f94b4e3b66882868dfc3c0264 |     
        m68k |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/c0e433fd828cd3d8d94b6a81ddb2c6c515b93fdb |     
     powerpc |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/86898050574b5ebb59bea253561b83a91f1b57ae |     
      xtensa |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/7a8d3995d54b7eb776f0afd319f27d1be5a4083c |     
microblazeel |          host-cargo-bin-0.30.0 | NOK | http://autobuild.buildroot.net/results/501327e6688be3f266925e633551c898a7cf42a3 |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/55c642eec71aab3d737415c51b46251557db9ba1 |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/d012b2621f9ed320b0c1a80a067fb165d89ecf84 |     
         arm |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/e623f003dec4074b3a191f62169c287704bf73ae |     
     powerpc | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/4f8dc7520ee692c665167fda69dc3af66263008f |     
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/6796c96a355071600946eb3ae02b32303ea08632 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/6f184db385ed29f4b6975210bfb7e62cae300855 | ORPH
     riscv64 |                postgresql-10.5 | NOK | http://autobuild.buildroot.net/results/deebc4b8f615e1216279d6587e91f5654da2ad68 |     
         arm |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/55d5017bfa35c3fc09628f0b359cacd1386a6518 |     
        i586 |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/09fff59a5c6da4f36fe2bca6c42fa6356485466b |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/b568cf1115f0edddcfb179161e9aeb265df05e66 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/739f5a549d4f3422599576e0bef931f0115c5d06 |     


-- 
http://autobuild.buildroot.net
