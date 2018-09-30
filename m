From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Sep 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-29
Message-ID: <20180930060009.DED55207BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.05.x |  26 |   3 |   0 |  29 |
      master | 191 |  95 |   0 | 286 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-file-5.33 | 1 


Detail of failures
------------------

         arc |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/8a2ea2e4426416447705492237f526fc84b595d7 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 
                    efl-1.20.7 | 1 


Detail of failures
------------------

      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/38f5e59697b3da18b922b7d1cddb6132978db171 |     
      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/de01df99a54ccf3b902e1eccac00de7916d1283c | ORPH
      mipsel |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/700d5d2cacdb6ca5e62b3429b1e3ad67e727f482 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 22
linux-firmware-44d4fca9922a... | 15
                haproxy-1.8.14 | 9 
 Makefile:709: target-finalize | 8 
                blktrace-1.2.0 | 4 
                    brltty-5.6 | 4 
                   netsnmp-5.8 | 4 
              ptpd2-ptpd-2.3.1 | 4 
          synergy-v2.0.12-beta | 4 
              glibc-legal-info | 3 
      docker-containerd-v1.1.3 | 2 
               boa-0.94.14rc21 | 1 
     docker-engine-v17.05.0-ce | 1 
                 gadgetfs-test | 1 
                      gzip-1.9 | 1 
             host-gauche-0.9.5 | 1 
                  host-go-1.11 | 1 
          host-libsemanage-2.7 | 1 
                libmpeg2-0.5.1 | 1 
                 lvm2-2.02.180 | 1 
                  mender-1.4.0 | 1 
                   qemu-2.12.0 | 1 
                      qt-4.8.7 | 1 
          shairport-sync-3.2.1 | 1 
                sqlite-3250100 | 1 
              wireshark-2.2.16 | 1 
                        zip-30 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/bcb484c9954bba6c37a25885cdcf3bc1d1a3e718 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/112506c57b1d714a2e8343c5f0a6e8ca68197be3 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/42f4845d8f35018d7a27446a4beede6cece0ad79 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/f64288ffc19969be38a267c4248d35c90b2f1a3b | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/bd531708c011763f1752e5de0cdb7ef27eaa977b | ORPH
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/58da48dd20421458cf7e39ff6137f4cf8e229ae8 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/a403f22681bd35c357c666e368598ab1e20a8068 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/b3db9735e82e938f60c00f25180716c5c07ef8f7 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/fb2d2b9603d4c76d8b946a3b3b19239ec7a21e68 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/0773d43cc37b7a41272b1cb212f2f2269045e9c7 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/a10a83cf41a2193d756078ca439db8b228a160ac |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/d4fd89edf414f34499359a5cea05264c9f49ad96 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/529497ee4acaa0016f152eba36e72755646dd11d |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/bf3f1c2914182fed18fc29100260f423a054b192 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/acbd2412519f7390815d69c0fb50884b428c9779 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/287ee9c9a422dbd9c47378226ef5e6c3fd3b55bb | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/69c5c5a3ec7fb320959f1788f1b6d5a99cfc50b1 | ORPH
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/612e69efb78a5769e3f070d26bd0e31668b553e7 |     
    mips64el |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/e1f475616b14b66ca4dff7ba313ea9e232a64821 |     
     aarch64 |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/e092bd08609849379bbbf5ef642eebe9a0e10abf |     
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/8efeb2dd7373f209e088132d69bccb9c9949f2c6 |     
    mips64el |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/91ba13496f93c713a46fa7c63211e5ce30347d7b |     
         arm |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/7cdb84e4b6cfbde57a5d5496bdff6d8b7e978822 |     
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/1c23a0da259329e8f9f9bcae3196bf3745d0e1bc |     
     aarch64 |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/54f1c6ba61a2f7c2cbbff4f0c9c4d6750aaaa453 |     
     aarch64 |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/4a3f432640fda5ee64406f823fa0380b3af4750f |     
        i686 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/3c82efdd3c472498cbf5ca19d46c70ff68143de0 |     
         arm |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/1d4c52d041a8f7bdd31a698d68e08ad3da5ab71e |     
   powerpc64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/14f8480ae046a4f428721404cdb6efe888fbf0c3 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/30ea9c7a84d849d76b806f0583d9e6e16c137277 | ORPH
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/b1b95d975a515da4e823f04e328d7aa5319358e7 |     
microblazeel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/b4266c4044f769fa2513845b6ecd3c4e353746f5 |     
     powerpc | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/71a6741cc35752477f6806ea888bdaa9d31c810f |     
      mipsel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/4196db844a92404efb33006a44ecf67c59d9e802 |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/4519bf645b27c9f5c936bfaa76cc64e0e2c2233c |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/a7b70ff6c2b2a0f1897d3155d3dcc1a422842af3 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/d31faf6e49899d62edc57b667354a332c8fc6617 |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/10b8b8ee4ef5b031e17ea3005e36fe2a4f4b5049 |     
        i686 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1e9b3aa295117f8d6573304b5f4cc4ffe1c1f8ba |     
      x86_64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1886b754aac5c44b7567e65da3b35ea13181429c |     
     aarch64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/3749a9928947e0b57e7c6919f415af04778f24fa |     
         arc | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/7405a181c2e2649e6133b33a3c8a31cf36554a88 |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/bb734e21a6e6b03ae35fb01a4f0391cc3b4495a4 |     
      x86_64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/e40899cab2e091018f2472b78f1fd41796b9653f |     
  aarch64_be | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/9ae842de03aae5e5f42298dd1164da6cf383d48e |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/e32243f94483e867fdd6b19b31369a755f9aca46 | ORPH
   powerpc64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/5e5c735c898c8538e9a75232419fd5dd90b1c011 |     
      xtensa |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/7e85b581a55f7fe8636c57a0c49e9747aea1f8a7 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/a9bc608f4f3b8478b25ca78691fab3def7293a8c |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/bd0e49d40959b2c9fa27f01eac362773554da9ab |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/c70ee7e838e91f83b30de80889fddf0dcf9fe1ff |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/b7a58406046f95fc84226a7ddf07d5b064bc9870 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/de4ae0adcf6290a1dcea377751ef56a7b19c124b |     
       sparc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/6d266e0be47daab1b4b0602ace77798d67e1827f |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/e13f2fa5daa25437ae5212149e53a8163529911e |     
      mipsel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d329049d69a1c7af2ee461afbd14e49a732e0b7d | ORPH
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9952280dc05b99cc82bcfe9235ee0ce2299fe97d | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/447a0ad203810b5ea7238203128d16fd82c63fd7 | ORPH
      x86_64 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/a2d1ba68cffbf7d47b6c07e126265a2bf9a4d6da | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6e6361cac39d9c3b76092c1aa5d224a10182517e | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c9b82e0696b23a8fcb59e34e73132c1de2a43883 | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7bb4ca0df790f3f75b9c8d1ff748662acbc15a0d | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6c1c25e74ec686e0c67d55c7bd37a212abfca5e8 | ORPH
      x86_64 |                    qemu-2.12.0 | NOK | http://autobuild.buildroot.net/results/8f51e1ea673ae54446d1a5ced7c3f6f9b4890cbe |     
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cc69266a7586f9228a5591c12dd963b678700d00 | ORPH
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/36cbe055bef5a3357a202b62fb48436109b12968 |     
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/63714de94cfcf8439ae3f8813e800fdbdbbfaf02 |     
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/07503bee75ed25e1ab37bed4175704681d4f651b |     
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/1f234cb58b4edd24304e2455709b7d91e92fd659 |     
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/37827ba0981adeba62a6d783839958992adafc04 |     
       sparc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/69113e98833551fe0c6224aeb290fbaddcdb485f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/01ecdb1f3d5450901d54b57dfd4cde4e959c7e31 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d9308d473dfcb76585d43304303300e8a2f19e4e |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/183d82c433d009659419a80f98f3dc0a27546061 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/f02414bec8dec2c2e14905341de8b449e54f8d6b |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/788116a98ffa20184f03ce2f8ac5e635541ed0f0 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/55e35b0afa0b3697fc53d556c9224527413dd9fa |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/c77944d0839b8e1b5eb2603fb19b3dd80afc7079 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6a082188bdd50a0fca1481c3a79be8caa9585650 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e29e87689e24e962c780874f03a55ab63d0bd71b |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/646376e567107c194652e217e83575cf552d9970 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/28e880f70998b09a11996219cd33e37bde37a434 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/309973c047c1cda4810608ee02946843d916271f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a5ad234693cda9d4488032585e78bd2fe3a1fcb5 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/87ecaa4cd4460b9b1819f5ea7918621fd286e5a5 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/bab2e646eb608c0af241a895b2889be82ae3c9dd |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/a2743f06c8625e34a32967782c811da0cb1e74a0 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ac02de3f6bc763b1c509701a66457e2b577a48cd |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/7207cabf6fa8207438a6ec1436ae03bbf8c3880f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/b6bd09015b753bb5bc3426c289addaf04268d067 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/8e365545e2674b1997fcfa7e0f438550e429bbc1 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f27c688c061d34b75bba9d92ae8bb752e76835fe |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/4e9c4629877268958a5ee5b39f4adbe541e4628a |     
      xtensa |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/0923b3400da41809cf2d8d8ab1dd6ac06bfd1ac6 | ORPH
         arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/d02eff7b8221459e3bfaaf2627688dda344ab316 |     


-- 
http://autobuild.buildroot.net
