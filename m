From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 May 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-24
Message-ID: <20180525060009.E646D20D84@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   3 |   0 |  21 |
      master | 195 |  15 |   1 | 211 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
         libcpprestsdk-v2.10.1 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/0379648a92b0440a20b88abb3300426549f8339a |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/e5002a946738d426cb740f0cefc947b638e8528f |     
    mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/056bc43ca494720e37b884f236b894d98785e034 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 4 
                    quota-4.01 | 4 
                  samba4-4.8.1 | 2 
           bash-completion-2.8 | 1 
                  flare-engine | 1 
               log4cplus-2.0.0 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
   qt5quickcontrols-legal-info | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/8cb9a1c0ac8be92c2126e2b5cc74b200920b018f |     
   powerpc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/e055ce6ca2263cb3a80591e4058274813acee561 |     
   powerpc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/aad99edf21b1986ac6504b423681f146db7140c8 |     
         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/567e2df494eecead4e74c77db152ab8da650fdcc |     
         arm |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/7eea0f512695605714cf2d8c971778d4784b4c75 | ORPH
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/7065e14917a8bbc0faf21b29183ac55b6c800ee3 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/700ee1b9b9af906db878b9a0f7e300bf7f5dc799 |     
        i586 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/1300b5cfbd21fbd508167ef73682165395c65f4c |     
        i686 |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/104a84f552e47fa3d2fa9d50dd93b70949bbdf48 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b0e2b7653ebf3cea7b8d851a3cf27bead42a8665 |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/071da7b02dc10626127f6d48dd436a2070b89a23 |     
        or1k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bb36e944868d16b62989ea9a1ad82c3ac17e840a |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/4aea346b0346fa62d930e3aead72fb9fad0983b7 |     
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/80483e17e981d7d9949cc7cb95302cb2de05f954 |     
     sparc64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/07466ab84d922d1c521aff85ba1e7b22dbd0ae66 |     
         sh4 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/22c6a81a0ed7f814d84adbcaae240a9271b7859e |     


-- 
http://autobuild.buildroot.net
