From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 08:00:48 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-22
Message-ID: <20171123070048.4320F20396@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   7 |   1 |   0 |   8 |
      master | 141 |   6 |   0 | 147 |
        next |  29 |   2 |   0 |  31 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

         python-gobject-2.28.6 | 1 


Detail of failures
------------------

         arc |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/330e96c7ce801a2aa019a85254a991a59e0eb103 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

google-breakpad-7515ab13768... | 1 
              host-erlang-19.3 | 1 
pdbg-77158819158d1d7053a737... | 1 
                    php-7.1.11 | 1 
             qt5location-5.9.2 | 1 
                     xen-4.9.0 | 1 


Detail of failures
------------------

      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/5a1081f5657e991d3b6aecc3140f03dafd779777 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/63f103e50d54c154d397ebe8706b15c7f80f6722 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/f0801b43442de83b6ab351a756a87b93a55d4177 |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/6f5922901fdd3f9ad5b9da76a9d7d77faafb3530 | ORPH
      x86_64 |              qt5location-5.9.2 | NOK | http://autobuild.buildroot.net/results/83dff750ac879962b3933748546dd695b9b4e3b7 |     
         arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/c7f74f862bf482fa13c5b13f5821f9dba339e436 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               gst1-imx-0.13.0 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

         arm |                gst1-imx-0.13.0 | NOK | http://autobuild.buildroot.net/results/48dd782161fa5e8860b5ea00a5d60207cb623108 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/829bee459d7c27392b1c55ae3067607434f0b7f0 |     


-- 
http://autobuild.buildroot.net
