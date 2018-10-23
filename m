From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Oct 2018 08:00:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-22
Message-ID: <20181023060047.926A2208DE@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   4 |   0 |  19 |
   2018.08.x |  29 |   1 |   0 |  30 |
      master | 201 |  26 |   0 | 227 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 2 
              ptpd2-ptpd-2.3.1 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

        mips |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/45d949d13b4c43bef388b7f6c5c81137132ee906 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/51e13e9c390d86666c318db54e285b516836f2bf |     
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2a837e3d521dd6d9d846bd6c0858dcc43efe9afc | ORPH
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/09ffe677b7788a517e498523a102d7a40eeae04f |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              ptpd2-ptpd-2.3.1 | 1 


Detail of failures
------------------

     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/165fb1c0bf74f1c6e472f82021f108b584dc5e77 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
                  cc-tool-0.26 | 3 
                   luvi-v2.7.6 | 2 
               postgresql-11.0 | 2 
                 dc3dd-7.2.641 | 1 
               domoticz-4.9700 | 1 
       gst-plugins-bad-0.10.23 | 1 
        ltp-testsuite-20180926 | 1 
                  mender-1.4.0 | 1 
                 minizip-2.5.3 | 1 
neardal-33b54a55032b047fd88... | 1 
                    pppd-2.4.7 | 1 
            qt5location-5.11.2 | 1 
          synergy-v2.0.12-beta | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2018.07 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

      mipsel |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0fbe90e2562f6f57c139b25660df30b403b7b3d9 |     
     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e0ac908206668dbc2d02c111663d0543a290b250 |     
      mipsel |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d965c5bf60b67182f772d2d1f52ccecf6bfac1c7 |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/d14fffb1e173567beca4f6e98d9432d5730fe6e2 | ORPH
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/dd0ecc65705b142b47da4a472243276d9e771f2f |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ea985e6e84bcd0dec48ae359148165b9aaf2ecfa | ORPH
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8711b236120cae548bdb246a76023ae6d74553d0 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2bd34a605af79aac37f2dab0ca515cbc79a476bd |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9dfb08982b75c714128db08115604bd0ca82be88 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/463282144671b0fbf07a116a8a09bfd5bb9595da |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/926e7fa8d3e48129d0ee6473235e64938d166f4d |     
     aarch64 |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/2d20a9575850c97d88982c216bbdf369fe0e662c |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/6986579cbc98d10e9dbfd5324f46de7ddb55aafc |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f7695a1edcf00c4f54f609e500212eda1626ce6e |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/b0b27eb80ef78163f81aaad842805fc4f3240c40 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/2e0a545fafa173e62e2b0893fc68c58aab5c3c67 |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/b0b17f4a5b0a32631a12bdb350ba7c21f7c595d0 |     
     powerpc |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/b0fc21b0a5ab06a63387f53ceaf50052f18c199d |     
     powerpc |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/b73342a39167ed7f293224d4e3b23dde691b9abf |     
     aarch64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/37c42cd917c36575b719b9d11f4657ba29c068a6 | ORPH
      mipsel |             qt5location-5.11.2 | NOK | http://autobuild.buildroot.net/results/18e4e12e2a9000639dbe2addc0db624815cfae11 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/c4646ee9342ea8bd906bfe2b29996c48cb403ccc |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/26c7b166c857fac952e82daf60f201a2469be898 |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/a60c932f9728bd4f450e14264f7b71fd6fbf0a02 |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/b187b7bd08dfa5d9a4d69872e370c04eb65d91b9 |     
      mipsel |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/8bb74d64b8f56ceef0eaf613b2bf075f84080d2d | ORPH


-- 
http://autobuild.buildroot.net
