From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Sep 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-02
Message-ID: <20180903060012.A4AA920DEA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   1 |  23 |
   2018.05.x |  12 |   0 |   0 |  12 |
      master | 173 |   6 |   2 | 181 |
        next |  15 |  19 |   1 |  35 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                     php-7.2.9 | 1 


Detail of failures
------------------

         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c8ada43490015bb088dcf60841b6cb97634f4557 |     
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/80226270ef871d9768c1fffabaa4d87a86e740ec | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 2 
                chipmunk-7.0.2 | 1 
                host-libsodium | 1 
                 libreplaygain | 1 
                     php-7.2.9 | 1 
             qt5location-5.6.3 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f46d38991385cbc2a4fa14eb31074e770cd79803 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/14475e346e9bb447bfcb28a73542d1838240ebba |     
      x86_64 |                 chipmunk-7.0.2 | NOK | http://autobuild.buildroot.net/results/e5be2f8eb9315a9054e1c8d854dec37cbb28eed7 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/cb827df141b3af1b0ff02276ff16395827106353 |     
         arc |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/bf35f2b0677e4b9f64f27719196d45d7eb10f731 |     
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/4447536594ed1a555191b620ecc9923e6eda08aa | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/f0eccdab06042b22b5bbf06654bdf0a0eb317041 |     
      x86_64 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/f40aa50f8537336b1ad078d2224310f3d2008618 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                rtorrent-0.9.6 | 3 
                blktrace-1.1.0 | 2 
              glibc-glibc-2.28 | 2 
         host-e2fsprogs-1.44.2 | 2 
              ptpd2-ptpd-2.3.1 | 2 
               target-finalize | 2 
                  boost-1.68.0 | 1 
                   botan-2.7.0 | 1 
               domoticz-4.9700 | 1 
                host-libsodium | 1 
                 lvm2-2.02.180 | 1 
           python-numpy-1.13.3 | 1 
          synergy-v2.0.12-beta | 1 


Detail of failures
------------------

         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d870dbf1800f6da69189ac32000a73901502aff0 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a3d1c073b1391ca4e091776485ca61dfd6d91a04 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/7c583a9b1f7f8482378fc45e46fc01fa4753a260 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/1a6d624e62093cf5aee35182f9256c08aa526909 |     
         sh4 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/192b07e4727ab75bbf54cd20e40d3861ebce0dda |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/6462fac02454c0ece775ef3f5c2e565b48a61d74 | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/23089ddaa4bae690ef6d6f2f08c890b354de4e6f | ORPH
        i686 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/9d0d308ba9f7acc8ef1af113c971d1cd10814909 | ORPH
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/cb22a0e58defedd20328fbc9e7fd345718b22037 | ORPH
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/27f36e6f60eda2b9e0fe0a1294f1cedbc8f9a8fc |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/84f4bbb9f20148bac9b63cb362d750a26bfbcc27 | ORPH
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/678ebb5fc10d153f376af90a604b259df3d2316c | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/57a8990efb8beff0d0f80124725544669e192445 | ORPH
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/4026df000f7a5e5018460f26489aaaa3f7efa3fe |     
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/d468bf330c1725d6d1563b9eeb1d7c306845d74a | ORPH
        i686 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/67b4267216c0951ee618a5c6b32b3c68301fd779 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/5d61c7a698c90a4262d66c5915244021429210fd | ORPH
      mipsel |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/82ae9a378b70a3d27e78e1d80a63495b37329e16 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ef06ba459afc4b4a237cbf8fcd5caa3aa76e0faa |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/f764da2a4200818807e9c6391b202e9df4beaf9f |     


-- 
http://autobuild.buildroot.net
