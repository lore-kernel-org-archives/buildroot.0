From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 08:00:48 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-24
Message-ID: <20181125070048.E2A7E20DBF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   1 |   0 |  21 |
   2018.08.x |  23 |   1 |   0 |  24 |
      master | 213 |   2 |   0 | 215 |
        next |  26 |   6 |   0 |  32 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 rings-1.3.0-1 | 1 


Detail of failures
------------------

      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/97ddc2db1c809b9e6f7ebe8cfe2858aa991b0481 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.1 | 1 


Detail of failures
------------------

    mips64el |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/5b6f5cb5e3c108a59ee0ae7e6de360e0aec1abca |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/dbb725e6a576da2600a258615ad48ff771b8c7e0 | ORPH
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/b1e1299914dd501124302cebb1cbf2f37d5b24e9 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               boa-0.94.14rc21 | 1 
                iptables-1.8.2 | 1 
             keepalived-2.0.10 | 1 
                 libv4l-1.16.1 | 1 
                     squid-4.4 | 1 
              tpm2-abrmd-2.0.3 | 1 


Detail of failures
------------------

     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/fa071a8e1e6e5433f02c77c411122adb048532be | ORPH
        i686 |                 iptables-1.8.2 | NOK | http://autobuild.buildroot.net/results/23ff396a568a865751471bf1f9e5dff2b73c8ab0 | ORPH
      mipsel |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/067ef9ae106b3e0740a70f6f9591b9da00d3da6a |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/8ac6d271dda370e59fc8e627c82de7f9d8f82447 |     
         arc |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/13082cea836a12ac8bf85cbdb53a56a5d30c70b1 | ORPH
        i586 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7c4a25a1eac8b614e24aed0d1244310911ab3d31 |     


-- 
http://autobuild.buildroot.net
