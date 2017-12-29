From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 08:00:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-28
Message-ID: <20171229070042.8C85520727@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-28
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 175 |  33 |   1 | 209 |
   2017.11.x |   7 |   0 |   0 |   7 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              syslog-ng-3.10.1 | 10
                    brltty-5.5 | 7 
             libostree-2017.15 | 5 
 netcat-openbsd-debian_1.178-3 | 3 
                    php-7.1.12 | 3 
                  cc-tool-0.26 | 1 
                 host-icu-60.1 | 1 
                 mesa3d-17.3.1 | 1 
                poppler-0.59.0 | 1 
                      qt-4.8.7 | 1 
tvheadend-a234e2ff6d140e6ff... | 1 


Detail of failures
------------------

    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5290631d5bd762dbbe71c15ea97a499df4082796 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f09974f2ba24319e55e578ece34bb2e7e8bb3c43 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/7d502f280c46f0d1e2678140f9117fcc59bc2d7b |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/be8c2c5c2cfa7f721fe38da4b6012b7542f23122 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8927398ee7e9ebc37308cd312756edb97698c246 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/00482e41deb99ae160a4c1948303b2ee6563712a |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/789131b62fdec65adfc0439785b0d9a236b8c543 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/043c87b364ede131aa2c22a091e7de8929d98974 |     
    mips64el |                  host-icu-60.1 | NOK | http://autobuild.buildroot.net/results/b26800bec07ecdbd3c3afc8a828cd7ebd0e29b90 | ORPH
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/9d1a7d2721def2cf1bb3428680aeaa7f68600188 |     
     powerpc |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/be408411551b9b5a5ed393ba2dee7e4f2f3168cf |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c848d3d49a9c40aa9d85549c4f5f8a695218987b |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/03e04672da6bccf37516d0bdb428590b72045343 |     
        i686 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e136741b21085b02d3478fee0ad0a0f26f66fc59 |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/1b05e68fd3bf130a26f2e711e80dec429607bc28 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/7612da3e7b0462780ae98c91bfe74e52715e5b70 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/e0702ef646aa3c8221ba8938eb3e2124164f755f |     
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/8cbb8e98381905c8d62257a34c44f1bd0763e748 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/70a1f8638697b7bd83122e27677111577dd8720f | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/aeb4228bf4b2deba303e284193601484e7f95c41 | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/b3af6f3cbed9ae9ef2441e6d24dd3af7f0cee395 | ORPH
         arc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/5cc95823e8ee6ba8b99f802dff9d5a89e98d5994 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/153536d64e6b0273f5ac2b20c9a2aade1f30e011 | ORPH
     powerpc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/cd4f59b720b31503a4426d60a98cf1a9611d9f78 |     
        or1k |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/2050b8d6ad0d6a56e44241366a610883da330906 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/b5c38bd89224a6b75474a694b59cd04535ca73bc |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/fbd97a2573205a6299adb039e0b1154cb62a5b89 |     
         arc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/246669d54169e0a67a794f5f627d016bf8c9656a |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/95747ac7e3194d1b6cae46035300a858d76c3aee |     
        i686 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/ba641cac35778a9452d8823c1cc3001095b51ee2 |     
        m68k |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/10e7b17c1047d2ae8609c1f82e670f5dc771a631 |     
         arc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/22d2e561755f85999db40e454decfeab61d92b89 |     
      mipsel |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/f900bf658cd588c5acd33a33730efc2561a4eceb |     
     aarch64 | tvheadend-a234e2ff6d140e6ff... | TIM | http://autobuild.buildroot.net/results/6564ecdd50e575b642ee8f554ba274c7220b3c03 |     


-- 
http://autobuild.buildroot.net
