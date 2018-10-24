From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Oct 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-23
Message-ID: <20181024060019.48006208B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   3 |   0 |  24 |
   2018.08.x |  24 |   1 |   0 |  25 |
      master | 195 |  25 |   0 | 220 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              ptpd2-ptpd-2.3.1 | 2 
               host-efl-1.20.6 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/ae36caeab5d498a5274fa2e08ac6ed2a23cc1780 |     
        i586 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/db0c97b3bcb48b9fd24885e196453d18c594cc54 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/700f50d2f1876327337a682981c465d2ef796942 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              ptpd2-ptpd-2.3.1 | 1 


Detail of failures
------------------

       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2d0d04e4bec8557d8841c0ab98aad3c38c9b4c23 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 4 
               postgresql-11.0 | 4 
                   luvi-v2.7.6 | 3 
mjpg-streamer-75c6c4a7809c7... | 3 
      docker-containerd-v1.1.3 | 2 
                  cc-tool-0.26 | 1 
                 dc3dd-7.2.641 | 1 
           dt-utils-v2018.05.0 | 1 
        ltp-testsuite-20180926 | 1 
                    pppd-2.4.7 | 1 
                   qemu-2.12.1 | 1 
                qt5base-5.11.2 | 1 
                  redis-4.0.10 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e26262c6d58485a0dfcc6e29b26022b244ae4d4b |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/3208150090c8b559bfa08494849618a0168261fa | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/3329e13e9fa956a8a9db15828e00fe34912ea320 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/b1eadaa40accd1efd254a35b7702bc7eeb5f8e0c |     
      mipsel |            dt-utils-v2018.05.0 | NOK | http://autobuild.buildroot.net/results/c5c78e287d049d6b705bd8f35b171e84345db448 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5f08a96a53edd0149d384b6281a28428c51a0974 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/15194406c70a4ca33f013a27bd6c663bc08a6f6b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/639b73bf82fef60848c12992765005549295cf0c |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/85aff63a187b6912dad0c367e545d8474ce75164 |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/809e45e03073dff5be7adf3b194f494f369f8a00 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/6b0fc04d26e362909b9746cbb0c02881da2bf301 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/71dfe8eb24ae5335ae9c91951d091128d53aa6f4 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c8dba89cf94975b487f5561be9ebcc51a6595a3e |     
microblazeel | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/dad054954de76cab56333747274520f269be2066 |     
         arm | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/247a55398aed37a08c67cc21db6836ad342d24ca |     
      xtensa | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/323a19f9a859105e08b0476508d30553577fda69 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/a366914c0d8ca03b5e841c80479ebf9194d83763 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/696fd32aa23db9a7c6cfc95656522ff09fbcb311 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/dfb25b9cf3421dd77d8678a75ed4ae5fd9a2c740 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/9bb3758ebf7ad9f21c073430cc312b5ecd3dc388 |     
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b3b9fdd61e3637b6c85b48023a24713bc979f385 | ORPH
      mipsel |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/1c9d2920dee030f6caeece166e2f61ba35d199eb |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/7ba864153ea482f67b76a7165e69a45bf7610df2 |     
         arm |                   redis-4.0.10 | NOK | http://autobuild.buildroot.net/results/fdda0ee7461dfc9ea479d4d80ab42c50006a3b13 |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/637351c51852970bd4914789318d12441e8cbdb9 |     


-- 
http://autobuild.buildroot.net
