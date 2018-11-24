From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 08:00:58 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-23
Message-ID: <20181124070058.7F95920DC4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.08.x |  19 |   1 |   0 |  20 |
      master | 206 |  10 |   0 | 216 |
        next |  35 |  10 |   0 |  45 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1e2c63363150095f1306dd58643421aaa956b17f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 3 
                  mender-1.4.0 | 2 
                libmpeg2-0.5.1 | 1 
                    php-7.2.12 | 1 
                qt5base-5.11.2 | 1 
                  samba4-4.9.2 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/1b1fce0b360c7743f4aad40f54d0fb16e3728082 |     
   powerpc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/76083fe45423ba878ee3dc99a7810a93e374a68c |     
         sh4 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/f969718402cae71446d6280ec1f66d357a155293 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/20fa4280492486c58845116c2b438d6f146f1182 | ORPH
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/a4bf4f7cef8baf100f12a0fe18719f0c0d6dcd47 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/7659be08598a04c43c1eaa36245dd652f9448deb |     
         sh4 |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/3b6da316282e7733b377ecef8cca6a4e00d181d6 | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/b09f8f136db659a5a9e2b1e9748fe88146c4118b |     
     aarch64 |                   samba4-4.9.2 | NOK | http://autobuild.buildroot.net/results/a09a065c523931c1892e81a99c57521fbe095d8b |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/1df4d557966b2bf8b4e597c99f19a44af342cc24 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 2 
                   trinity-1.8 | 2 
     docker-engine-v17.05.0-ce | 1 
               libiscsi-1.18.0 | 1 
linuxptp-303b08cbf55096aba5... | 1 
              tpm2-abrmd-2.0.3 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/e9528b06b350ef84c1e2cb59fba87b4db77b4660 |     
         arc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/72cc1622f3913ef90def64e5f5e8036f50ed2467 |     
      xtensa | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/f6699ccd01a9677672a5f381c32df24d38d242ca |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c9606905862f0333db9befdf28eccbe6a23be637 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/10d8fbfd5dfcbe697ae6cb3ef550f65d32bcce7d |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/471ea1946e68c01d5ea1d426fdbf59864e98215d |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/ddf6b1cf4e4727928ffba7387953c4cc9719df49 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/c3e51f4c54960a6eb6dc5106429295860b44f8dd |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/62101e3a4e13e28e71affbf677370a2b311d2eba |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/0069cffea05fccede75d4c0b726327b22f61cf7d | ORPH


-- 
http://autobuild.buildroot.net
