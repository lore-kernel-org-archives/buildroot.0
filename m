From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 06:00:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-20
Message-ID: <20190621060105.2407887EB5@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  22 |   1 |   0 |  23 |
   2019.05.x |  25 |   0 |   0 |  25 |
      master | 198 |  49 |   0 | 247 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 13
                       unknown | 11
              libsodium-1.0.17 | 7 
               libcap-ng-0.7.9 | 5 
                   cups-2.2.10 | 3 
              iputils-20190515 | 2 
/home/buildroot/autobuild/i... | 1 
/home/test/autobuild/run/in... | 1 
                    efl-1.22.2 | 1 
               host-efl-1.22.2 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
                   mimic-1.1.0 | 1 
                  weston-6.0.0 | 1 


Detail of failures
------------------

  aarch64_be | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/56a074356eeda84d0b4f432250e83290c4f784ad |     
    mips64el | /home/test/autobuild/run/in... | NOK | http://autobuild.buildroot.net/results/3dffdaadc1d0f9ef7b68db8d08a0ac96c0aa34ec |     
        m68k |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/86589a1ba0400fc8e99a26e811b05c267e2194ff |     
    mips64el |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/43fea635b1f84d89e07d61610e0dd649efa161c2 |     
         arm |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/cabaddf238a0bb6a477a7433856ea5cdbfe94ebf |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/e269a471b2a2057e8e12c8868c96d480c946c972 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/17172b99b8c1b3137c1299efe7f82cdbf606ae36 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/9a5f1076431d05ca0270dff5f2838e38e4bfd0c7 |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/3aa20dab0a8a6a8fdcccdcde6678356252b3f236 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/6b11b3fd93bbcbbc8aa501e2d1278eee907428b4 |     
        m68k |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/8c33ec3422d4985382a8100eeba1d5b805ce5ca8 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/d27aca8e372b3dce44b2e1e936035246729292f3 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/43e33861870ca9b85ffb984ddecd7cf9494faf61 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/7538c1d74b2d9b7c473466334ad549a433f4899d |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/910fbae301b3aebb6f03658219ea0d4dc0b6cd34 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/ab7ebc6851e37ca1d77d1efa2b7f6a7026c953a6 |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/33968d743345b452c472744936deef13459d8451 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d24b8f42d3d9ace3535a4e703d99a3609435944c |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1090c83e52f7e098653e8d5bf466b9a63d192ff4 |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/01a8ee7609a54d4cc78d6286943f15b2a08537f6 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/87ac04c70401460363e718f5146c4c7d0553a41e |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5fc4536949839429b1c8bcf0998c5b4fc96a765f |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4db4e441f3dc67037a1102203ded3ee461208f3c |     
         sh4 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9ca5f1fa72ee11b74ce64da66ab52eb350808c45 |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5cb33a857cc4259fd04fdb729c4669b912f13790 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/de5549293a3408d537119059ef2cc85a3f8c1bb2 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d67caa83f7bf4b16a5eca03508a87add78f32c0d |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/65b99dd1d9aa0e65d40cd96646f1b2d487aaba92 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/2155b244a2c321a03629dfde7889b8d9516f976b |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/fdbeea112896c7fef0212708cdff7defe683ae81 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/0dfcb2a4c4d58f3b75a17ed01e1745f89dfb970f |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/b69e80db1f386b25869baa96d2e4ac3344087c15 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/39c62c325b70d1693dd5ce668d858da67c1d7592 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/d501e9d26b37d0c111ec120c61b33d64ede104e3 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/72155c6529b46809a2a5b263f3bf64fd7c03cb69 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/7feed39beae9fc3e5b717084b248a61c62c7a62d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/c9528c45952ab43446a52700f8d290c9a6b38b65 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/f1422dcc12b7adc9330ed52b50772fdf4d4d222d |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c766e26860c36576fbea65c804a34c1d77c2e677 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/2d7975a0a50b5ec69df5fddcf750e2526d095ecd |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/8d7ff992e64d9e00fa4a02fb77b635c4a02a5e2e |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/e7ee7539121c18687ae85a63c23bfa3fe56c2a80 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/bab0a97a4b8ff140cc0827f951e57f7a4f2e09ce |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/fee65b4bc2204da036f6733d4e70dae798eaae93 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/2f24e46b5c03643a527852eda805bf5958bafc0c |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3239145c957ffa68ee70d225c03de1605e956176 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0b7fa1f60a46ccdf9af31440200dad0fec726895 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/cefb364b9b54bc3bbc62ef1e1ed31051add5f3e6 |     
         arm |                   weston-6.0.0 | NOK | http://autobuild.buildroot.net/results/a1b22c7e6f72c1832df01f0e5bedf6e50747a2c9 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b313d59a412fc294e879e156a384d6cb42866469 |     


-- 
http://autobuild.buildroot.net
