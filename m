From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Sep 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-23
Message-ID: <20180924060018.84FCE20723@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  34 |   2 |   0 |  36 |
   2018.05.x |  34 |   1 |   1 |  36 |
      master | 244 |  90 |   0 | 334 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/a2d3a56cbd3c35b5575b92e74ad227dccedc7c4a |     
         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/edc3717051061801da41e602a09f612fb1f44b1a | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 
                     host-mono | 1 


Detail of failures
------------------

         arc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/b97bd260f8e1943950abfcf7ac48264b0db6b406 | ORPH
      x86_64 |                      host-mono | TIM | http://autobuild.buildroot.net/results/d5319c1270fca10f72522e6d953006672ee9e07a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 24
 Makefile:708: target-finalize | 11
              ptpd2-ptpd-2.3.1 | 11
                    brltty-5.6 | 5 
                blktrace-1.2.0 | 4 
              e2fsprogs-1.44.4 | 4 
                 lvm2-2.02.180 | 3 
                  monkey-1.6.9 | 3 
               boa-0.94.14rc21 | 2 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
              glibc-legal-info | 2 
package/glibc/glibc.mk:134:... | 2 
                  samba4-4.9.0 | 2 
                  screen-4.6.2 | 2 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
                    efl-1.20.7 | 1 
                 gadgetfs-test | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libmpeg2-0.5.1 | 1 
                   netsnmp-5.8 | 1 
               nfs-utils-1.3.3 | 1 
                    php-7.2.10 | 1 
                    pppd-2.4.7 | 1 
                     squid-4.2 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/77ec786bddb03e6c2776c5c7d948930861a6b7bc | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/52bbd0c62612938fab16261fb8ade950d0ce1af3 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/5c1a7b74825b172041e67ed3ef53bfe69da85c74 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/c9657375c9c68415e0896eed65ba9436cc9a1acc | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/1b15af98bfc8e2e22df05fee4c7d156d4a1644c0 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/ef840d1b0d16e2ade47f7ec5d924cd5a59f3e5b4 | ORPH
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/766965380df6e2a333931b2a94a7b7b224b77376 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/46169846ea48907a5030001f1a76f1b3e697bfa0 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/8903b48175bd27d9e653be38c1e44805d4791998 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/a04d8b4d3d06252d7e3f3e1d83c4e4782b7c0ba2 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/5221819f4469d1836b1b1a9f0e471382919cc372 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/b5d4ccb3b13d2bcab4059f8a368b4923d0f96868 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/ecc22395df97dee5513b9a55b64e629c5bf6ed39 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/1e50aa5f3d6fe671dcef55a7fc398593709dd531 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/eafa558e904afc7f77a0fd2962c8cbb7ca511233 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/f9e03142430c5f82b78ed2dc07ae56a5b4d62f9d |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/20a9dba04549b60d3f76fb103f988c604bbd1745 |     
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/6d157ca1f1586b00871097e92a7b63694c24af73 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/972d723baf4508f0f8f390d3930d16a868b52c9b | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/ec83bf55e234cf78b35ef498cf84e1acb19a6362 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/131dec8b0e37fbd8012c5b570bd69f3c0c2cba47 | ORPH
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/464781279222ddbb6d6b7e87ceb0b33405855e12 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/0619ff364899dcdbf57b29c5402fab7a5e34d611 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/d3492e932a3bbd66334f8f9f50cc995d09296e18 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/647f4f7c4adcf3ee990f28bed05cd9974d771cba | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/529abfa0291b38d8d7e39a5b3be48692c4e8cdf8 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/9d5fdf6631d9e742c43448001228e3af06539932 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0818f0d09b4f2a99e51325ac77d594b36057c10c | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/11970fc2573449e1d55c3b86083531fc54a0816d | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/7227eef7aad1c051f32a806b609e09fac537303c | ORPH
        or1k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e71de1f3ffe568e79328c6cedf07411e5ffa306c |     
        mips |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4aa723cb7b677364d837890235527325356d79d2 |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/2d3e65dfebca4977cd0116da76d34fe24e5b6ce1 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4088df90779960fdac1fcdcf215210d8b10aceb5 |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0dd5b3fbe500a0f005cdb0e17ddde90c845fdb79 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/3b5f848031fd907d741fc1d15b668a9df189bb4f |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/29e45fd76d92a73a650dca562c5fd7c4678670be |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/27e4fa17e798afb90bf2a9ddef58cb9d2e644241 |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b4267501306572e747874678c0dc74ee732396bf |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/6e0a86cb7b5dc0c34819122cdb682983f2fe2053 |     
     sparc64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/514ad912840ff731acbf668d574c0349aa09ff1f |     
       sparc |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/5fd3bf14f92d35bd7ddcda306ffaa49e44497147 |     
      xtensa |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/34146e13a4e7096a195e87bce56a3861b23a29ad |     
     aarch64 |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/b077720c16857b752f4f38b73619a6a62862f35f |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c6e33d11f8bf8b54bcb02170389274ba07c773b4 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/d51d152af52dcf1b24b608b53caa42d38d849bc0 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/00766474ea85f3b0ff69314c69739ebfd2e80c2a |     
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/ec85556b2324e7576027075523a202d27d84b3cf |     
         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/7b5903f761d5c1c4e6c03c2aab4f34887cd51917 | ORPH
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/072dc2316c9cdcdbf7563de398db24241042d587 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9f99f2e7e0dcff5c0a89b54b79930ac0e1ab5d98 | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3eb2b227066d94b28528882f6c6a5d4883cd6ada | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/01d1d96a706f0f601e0d33d252ac36a72d6a9e99 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1321a34c12fd2447b56780e422742c3bca5e888d | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6260ac71e119fc0d230d237f8b60ff3d95bf69ae | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/bb002439651e21d260bf009da39d3cc0067e7e0a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3ef7f91f61828b5da639ad88638dfdf1b988e70b | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8edbf86db941214ae2ada7978409ce740636aa06 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9ae7bcc11e384bb78f973c1fdb5407fdf879771e | ORPH
  aarch64_be |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/36a46f282c3ac0c68fc158573503bfc2d9bf084f | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/83e9d6c448004f194fe0bc762acbe540fc821973 | ORPH
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/69261b7cab03af9c6782092246774f97aaf06aea |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/e4fac686660cee100a210b1e69dee878fd815a27 |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/fca8967d96527815ecafd30080e6c79a27decac5 | ORPH
      mipsel |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/1604197aca033f21dabaad4464323e6e34ca4ca2 | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/425720215e19da1c787b54267ac222a9ef381290 | ORPH
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/4c3cb3e895849ade744687eefdd4bd83bf95aae6 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/328306609b42e42d1e62385fd0ae214189b08153 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a80eeb9acab2d8bc0758e7eef2dc3a8957b5b6b5 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/88fdfeedd854d3a63ada2a2786853dcde1853e25 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/881271df98185241d71fb4edb66924fa40eefb2c |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a470add2ed0bafa933d497ce8d5895d8cf0c4e99 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/28583a3e45d0e26251a0ffabb3899501bfddcd45 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/72bf120a4cfe45916a64b60d1f43cb163a77faff |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/fc629f03637cddf9a7ddab39ad329447dd9c2341 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1cae6bfc4a029c094f2aa650ac0ee531f126f695 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a5d8efa3b3defae127ee5667cca7c38bfee8accb |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ddbc62399669f87ad64963b787e032f7f9e2096b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e5bb59eeb61984c12f578af12f9adee2f8d75cfc |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/81f579b0c81a86e85da0ccb511fdaab08a2e738f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2c4e9a039209a3c8706343b7e8a63854633c8183 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/a7f14a4e99df5cba95f81ef0d1c88c60fd336915 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f363a46fe05a9e70f5b3e3e23d495c5905d2f8ed |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f50597b297b5944924c921f32a57005af13d9bef |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/eeab8456ce923dc956490c669a55ece138f326b0 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/cd84dafb56b3c5c2fa090c22a0024823ee5b556f |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/93ccbe87e66c9be704f03c7030addd616ae9b3d3 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/42390240c86f0e778bc06780cd17d62d2d6a506a |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/e827ec0ea55ec74eff2b0ac2c43a471a88f1bd20 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c03e914f3ecfa88f79cfb4cb04bbe055dcdfd4fd |     


-- 
http://autobuild.buildroot.net
