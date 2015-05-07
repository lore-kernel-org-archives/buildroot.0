From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-06
Message-ID: <20150507063016.37D051011C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-06
===============================

        success : 289
       failures : 43 
       timeouts : 2  
          TOTAL : 334

Classification of failures by reason
====================================

         lua-periphery-1.0.4-1 | 5 
                host-gdb-7.8.2 | 5 
                  boost-1.57.0 | 3 
                  cc-tool-0.26 | 3 
               expedite-1.7.10 | 3 
                  snmppp-3.3.4 | 3 
           libmemcached-1.0.18 | 2 
               host-mono-4.0.1 | 2 
                   lite-0.8.10 | 2 
          google-breakpad-1373 | 2 
                      qt-4.8.6 | 2 
  toolchain-external-undefined | 1 
               libsigsegv-2.10 | 1 
              postgresql-9.4.1 | 1 
                jasper-1.900.1 | 1 
                  guile-2.0.11 | 1 
                   sudo-1.8.13 | 1 
             host-guile-2.0.11 | 1 
                     php-5.6.8 | 1 
                grantlee-5.0.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 rsyslog-8.9.0 | 1 
             armadillo-4.000.4 | 1 
                ipmiutil-2.9.5 | 1 

Detail of failures
===================

      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/149cf8e50478bfff521b139b926e5bc2fd085015/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cea553387e3757b7a9677e977a92cb72a4a46745/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6c205df9677e58281c46f7f15fe3d5ce1f75df04/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4904ce2865c7aab900e7d4d33d996b77defe4d5e/
     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1d538706a8d8d8a4764a89167efec7efdbcc3ebe/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a4ec6cdb31616d80a5adeceddca04f1e2e7cea5e/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d759959a742d503e6f8384cc1507a5093360f208/
      xtensa |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/24b578a28455409b7bcc0277abc6b478c51ae67f/
      xtensa |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/e35e4e315489ad4310fe3355b041b39d73ed2eb7/
         arm |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/98dea4384455345dad7294f824373345bd91ace4/
      xtensa | flann-04b4a56533faf8c8228d0... | TIM | http://autobuild.buildroot.net/results/f526214482a755abb43ce2181f2c4d447f4436e9/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/28d5b5f8853759cc8150ab22ec814d69883de3e6/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/f45925e63dd6ce09e41e1ce9a449d8fd57575314/
      x86_64 |                 grantlee-5.0.0 | NOK | http://autobuild.buildroot.net/results/f9354a12e70f2fbdeb71972ff059eabc52a1405c/
     aarch64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c6e031c87dc22130459f4f4ab38ccaa0b697d353/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/de0058deb1db9e946bd834af96493b2dddb8c7bc/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9903a0bca9e43dc6b907fc8190fb65449cb5c6f6/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/be69b376a9d07bc98ec87d7d21c0b270eb12f60f/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/39cadc88d5fd52dcfaaff67ed6e76d2e473c7abb/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/2fbafe30f88becd257f4fee7fd65bfa779331c7a/
     aarch64 |              host-guile-2.0.11 | TIM | http://autobuild.buildroot.net/results/2136e678a5984678aa6da6b039aae92f70fc19b3/
     powerpc |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/23c2cebd9417970787b7d9670fd921f33b58533c/
        i686 |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/57c04e8af4621c8f0ea4758beb42769d6f3859d9/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/06df75ac56fc31e4b55024ade0fe7868ecd0c399/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/7d030671fe7958613305c155776fce1ca733c2aa/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/685d0ee9062effe047e9a119de9f08dd2dfa5134/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/00da76dd6556e7a63928c4b923d5239cb9e02753/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/69a812d420c10dbddbda12140857d80be24d32fb/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/1bbb19d30892e4390da98ed3e133f85f32ba161f/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/ee448d6171f73630e08e49274ee847535871aae1/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/bacafba602ec9e476073bd310e759c46ade104d7/
     powerpc |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/9018f5c5f4611ea7dda9065750124086316a87a2/
         sh4 |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/70f732eda3f3bbef59362a86ed1392bf3014bcd6/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/5f47a63ba3bfbe7adedf91f6ab67b0628bed90a4/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/ad248d539e1d267fe03c986d4bb5f76a615478b7/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/b7cc1037f6ef3bb95334ba52ae3e3618dee0a30f/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c0719c762c28fe7c2c87c0e1a2c8205bddb1b524/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2251b45fcb33db0090ef9e7cf2ee2246a61ea2e9/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8e8991a66c218746f835a0f1f2b2ec9f2bc56c03/
      mipsel |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/b93431d45f08fb6766d4474f041c22c860ceb351/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c7a154a68bcc89b66326d7d724b7912a34b7ac0f/
         sh4 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/80c06e11adb7bad5675f8dd7e4f0454a666bcddc/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/876aeecd286e8543c7deb6cad021707f518f38db/
      xtensa |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/7edafe66ce0eb66946ccae7343c302ff6f93a6bb/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5caff6bd239d2b93e4520efff48755498520527d/


-- 
http://autobuild.buildroot.net
