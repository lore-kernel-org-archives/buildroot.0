From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-16
Message-ID: <20171117070006.1BE4D213DD@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   2 |   2 |   0 |   4 |
      master | 100 |  15 |   0 | 115 |
        next |  25 |   6 |   0 |  31 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2017.07 | 2 


Detail of failures
------------------

         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/541ebbc6e79d66caafd68f535106139a733559a9 |     
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/2a3603d6162622bf052c18146356c61790c03196 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  fwup-v0.15.4 | 3 
                      qt-4.8.7 | 3 
              alsa-lib-1.1.4.1 | 2 
pdbg-77158819158d1d7053a737... | 2 
                  boost-1.65.1 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
           oracle-mysql-5.1.73 | 1 
                    php-7.1.11 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/aadf9bb0d1b5181aeb5d1e8c091321f751b9bf45 |     
         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/dcbf68439c3f61b873d93f353be5ab66832c101d |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f1631a566c87f5ac020c5b87343d28bdc40d5f46 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/82a983e3c6e972851d40192d91cadb3dc65a3d28 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/8cd1c28eae7079d76b5e72424fc409d2adc12737 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/de33d779410185699992cfcdf79ba3b4b933001d |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/8b8c3c570b2fdb7069d3a5371511bf2291b21b47 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/6e835cabbd53aae7303270454ef0dcc6f52153a8 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a946afa58ae4da649937a6e378956d7718125d2f | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/b487f643c3e0b26d6a820ceb6665255d5c3e654e |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/9bde69de0440301c87792eb8dde4458b8ba245e3 |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/e16991c39b5fe856dfe3cf6b9ac1e63b3a88b33c | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0913d4f726a38c042870a838e5be12ef3161ad50 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6157bd4506584aac4fcbc09b58839e21e2c1b9b0 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/876ffc0d53c8be22acc1e43e7fdc1ca322533db7 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 
                      feh-2.21 | 1 
        host-xapp_bdftopcf-1.1 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                   mp4v2-2.0.0 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/ff803797ee45d3a573519b8827a3ecfbb940257f |     
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/1caa5ae2ed18974bcfe0259ba00e38c6f9371f7e |     
      xtensa |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/1b4ac51bfea19f1bebcabee86592bbf585d7bd1e |     
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/55b1d1d9473aa9cbd3d8fa236f55d2b5fcd2da3b |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/bfd0722ae2bd9a2d82f6dc7d7b83fde1d784b9cb |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/678e444598b7294b959d0e58c50558547f2c163a |     


-- 
http://autobuild.buildroot.net
