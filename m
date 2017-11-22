From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 08:00:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-21
Message-ID: <20171122070004.9EEEC2094D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  10 |   1 |   0 |  11 |
      master | 180 |  12 |   1 | 193 |
        next |  39 |   4 |   0 |  43 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b9bc20e4f431f43cf8c646c281659315b7ad1b13 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

google-breakpad-7515ab13768... | 2 
host-google-breakpad-7515ab... | 2 
pdbg-77158819158d1d7053a737... | 2 
                       unknown | 2 
                libcoap-v4.1.2 | 1 
                    php-7.1.11 | 1 
          usb_modeswitch-2.5.0 | 1 
              webkitgtk-2.18.3 | 1 
         xapp_xlsclients-1.1.3 | 1 


Detail of failures
------------------

     aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/84d1792c135addc24e452be4750b28dbad0833e1 |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/51829e443e1cb2d56b0d46cb9999db003b05149f |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/3fbc735a47d8209f3d3fa0e5d10dbbc969155ee9 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f5dcc4ad94acd53bbd14454b6451004c530182b6 |     
       sparc |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/4847dd143fbd7242e074a441dfc2cf097ae32596 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/f5ed7e0e2287e0e5854313fe4b5dd287fbf598db |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/de51ba7e44a138aec877811d77d3d9b95bfce6b2 |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/230b94560d6156feac5ca91fe90ba56b07e2b25d | ORPH
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/1db4abfc8ee4d200ff272e8c235164ab72aab51b |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/e88e86d169ebbd7f08a736982d546eafb5c32c3a |     
         arc |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/b20d9f51992a2e7254635754628725465c9d4a83 | ORPH
    mips64el |               webkitgtk-2.18.3 | NOK | http://autobuild.buildroot.net/results/d7cd58b796b7506bc4595b40a07196ffc34adad9 |     
      xtensa |          xapp_xlsclients-1.1.3 | TIM | http://autobuild.buildroot.net/results/d17ae1426fbabf452968189dd9377e7f46f51c3c |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              alsa-lib-1.1.4.1 | 1 
                      feh-2.21 | 1 
    host-libevent-2.1.8-stable | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/8494a46b85117c87a1c3ca54f66977b4083ad45b |     
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/430ec7f01bf30e4830a7d66ce23d460f2d76f347 |     
     powerpc |     host-libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/a2a84692049b0fb8038f1ad4b06554ecdac32e3c | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/61ec486869b01f5c77e2cec57b60a1d3ca42af79 |     


-- 
http://autobuild.buildroot.net
