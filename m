From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 May 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-16
Message-ID: <20190517060050.39F3688302@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  29 |   1 |   0 |  30 |
      master | 215 |  16 |   2 | 233 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 5 
                suricata-4.1.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
           host-mfgtools-v0.02 | 1 
                       mongodb | 1 
                          opus | 1 
                qt5base-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 
      qt5webkit-examples-5.9.1 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 
              wpewebkit-2.22.5 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/93154283617fdfa416abe18fd2ddd55402e8dd75 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/45cf6b11a45497b205222a2bce5fd1890a78d8ff |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/beb0e11e90e2ff2fed73ed7ab707f6c8c3ef7b87 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/494e6aefda2d692c17c98b3fd8337eb16079f3f6 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e34f346667b54789ce447adb320bfd26ef05320b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fbe23c7965ce28d0085911f85c64c3dd493e9bac |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e70fad7dcb49e25ba0d2d109b98b898e0b4131cd |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/bc4df75247b214b5b2e35d48dee7c687a2f47bc5 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/24c0c8511bbc751eea8de31938459c726bbbfabc |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/faee9e1d5aac857e842e554e3c1cb7c7f7a8e597 |     
        i586 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/98a068ba0b0a4f5b422248e7807ed9f684fb1870 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/db8a6db0cceb6aeb24cd6866dfa12ee29b24fc5d |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/83e8f2704e8fd0456696227a99fea15d77bc5126 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/9cf1210cd7abf0bfdff0555a5b665785a8006539 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/a315e8c2e15fcc658789f682a5c2790a53f002c2 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/5dd22dc4a19388e17c7abcc91c04fbf813397e18 |     
    mips64el |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/304956dda8e580cb39107e57a139cd1ae08ee655 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               openldap-2.4.46 | 1 


Detail of failures
------------------

         sh4 |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/2e798b5e5ac38ae26312e4bdccaf8c544ac38740 |     


-- 
http://autobuild.buildroot.net
