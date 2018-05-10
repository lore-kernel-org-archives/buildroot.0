From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 May 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-09
Message-ID: <20180510060016.A06A4203B7@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   2 |   0 |  32 |
      master | 189 |  22 |   3 | 214 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

     glibc-arc-2017.09-release | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

         arc |      glibc-arc-2017.09-release | NOK | http://autobuild.buildroot.net/results/e027b9e6283ec42bdc0d412c85d9d8fa1917e53a | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/92c087dbb37f82601703cedeeea50d2e309b399c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  host-go-1.10 | 5 
                        libnss | 3 
                cifs-utils-6.7 | 2 
               log4cplus-2.0.0 | 2 
                      qt-4.8.7 | 2 
                   woff2-1.0.2 | 2 
               xfsprogs-4.15.1 | 2 
           bash-completion-2.8 | 1 
              ghostscript-9.23 | 1 
                 host-rauc-0.4 | 1 
                     php-7.2.5 | 1 
              traceroute-2.1.0 | 1 
              wireshark-2.2.14 | 1 
                     znc-1.7.0 | 1 


Detail of failures
------------------

        mips |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/612afccb9f459121d339aa23baed29364138d73c | ORPH
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/158f2fb2ef800e9e1a42d59b3f92bcd411265c74 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/be060c98f29b468187f6679cef6474f18f675a7a |     
         arm |               ghostscript-9.23 | NOK | http://autobuild.buildroot.net/results/b535f39432b473b5639b7d532fdc77064d165828 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/47651c8feb292610a3f0dcde84ec7054ae155e9b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/50ea06824ac2eec863828694570c3c958fbbb2cb | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/dc4750e831193cbb6491a783a8c6065d049430a9 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/fd34089a7343a7abbfdd6aef97e263549db6e58b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ffa62e3d567eaf5ba6ee605dfc70674e5cb2d2ae | ORPH
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/a7f4cd593cfb3a4811e5be5fcc7727d01e114b55 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/eff30c0870be2429ab1e0e58570f50ee4eab4667 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/831121524e80b0eebabc5e6333eeefb0e3ea8e72 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/3d7035d1a204b3989e5eefc4169aa08267b351dc |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/e3e6e028d35c1a43b0aa25d1c5942a2569e85505 |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/4f4e9ed5dd5bad76eeee5d151e958f22603615b3 |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/8200b4c3d101e72ec00a9ac86802a3b8b6578296 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ef6f4bf437cdb2d005d1df9685e730ca7296f14f | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/332b041ac6de8cb7b0a960b001fd061e98ad1fdc | ORPH
     aarch64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/38cd6c4dedaef17e312095482db71394693617a9 |     
        i686 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/28a586d954038464216b7a3d40e3ef2f45dc0bf5 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/78d25015ac464c985e5a550ce9a80d85080dc6f2 |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fbb525b3f0bb90023ef07 |     
   powerpc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e8840a5b894a5bcba4a3e873975e6dbe03a6f6ac | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/95307f0f56c7ead1bd1f0ab0049aeb8b30fdc11c | ORPH
         arc |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/9e44159820789f1d25efcbd24318b0e05e132371 |     


-- 
http://autobuild.buildroot.net
