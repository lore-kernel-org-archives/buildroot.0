From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Oct 2018 08:00:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-21
Message-ID: <20181022060034.EFADF20DCD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   0 |  26 |
   2018.08.x |  22 |   1 |   0 |  23 |
      master | 216 |  20 |   0 | 236 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
              ptpd2-ptpd-2.3.1 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/0809e6db9ca8e2b77a15046f5726cfe46130f0f5 |     
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/12471bcafed9a4a1f6165e16f87dae09e372bc63 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              ptpd2-ptpd-2.3.1 | 1 


Detail of failures
------------------

         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5411f88ed43a44cbf9d98fd7af58b0c71ea119a1 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
mjpg-streamer-75c6c4a7809c7... | 3 
                  cc-tool-0.26 | 2 
                 dc3dd-7.2.641 | 2 
             util-linux-2.32.1 | 2 
           bitstream-vera-1.10 | 1 
                flannel-v0.5.5 | 1 
        ltp-testsuite-20180926 | 1 
          motion-release-4.1.1 | 1 
                 opencv3-3.4.3 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

         arm |            bitstream-vera-1.10 | NOK | http://autobuild.buildroot.net/results/dd853cbfaf3ed2c030aa9c4aedeeec116321cc3f | ORPH
      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f896c5dd7334ffe8ceaebcaceddd3e1e3a74dde9 |     
        i586 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d08da36e6e46024af63af188f199c6670259b967 |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/c7206e43d43987c798d5d68a1b833d6ebd58e692 | ORPH
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a336e2f7f02e2f61101335a8e6a519f28fdfce05 | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/92ba172be0ade3aa75f9900d2bb2f82499623d8b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/70d66546f2d6e25d7f089ca8e8ff66ac3f460e38 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0755c018f8ef8ce4ead5cd63fcea9cd7371e96a4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/338a08bbab4ca0556153db79cd15ab986e59976a |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d72918f4672d20b33199b7fe04fd4674f61961f9 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/609e2c8b711151bf8a257358bf35a1e2553d346d |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/3d8594c5aca1cbb14fdd58cdda3258be66df7c3f |     
         arm | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/94eaefab5594694a145170405dfc7c35f6ea794d |     
        i686 | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/c8b8a9051d429ed067688227280fd764f7010e07 |     
      x86_64 | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/2c19c0572f52f7b5550b3f2de6cb2d9a2fa06393 |     
         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/6ef3b0f353260fbaeb50cd51f094c77fe441b9b8 |     
     sparc64 |                  opencv3-3.4.3 | NOK | http://autobuild.buildroot.net/results/d27fa3eb3ea600698571837981a3a15d556724ea |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/8f13bddf75092b00739bdcfc3fdf34633345fb41 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/868741fb050410b5291a7570fddf9cabe569f0c7 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/17222646422056ccec1ffde159596b8fa5290c6f |     


-- 
http://autobuild.buildroot.net
