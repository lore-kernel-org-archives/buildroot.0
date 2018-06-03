From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  3 Jun 2018 08:00:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-02
Message-ID: <20180603060027.3FE2420890@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   1 |   0 |  28 |
   2018.05.x |   8 |   0 |   0 |   8 |
      master | 192 |  32 |   0 | 224 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 


Detail of failures
------------------

       nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6fd4d1b4eb498e388d31431e5084314697b71f7b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 19
               aircrack-ng-1.2 | 2 
              librtlsdr-v0.5.4 | 2 
         python-websockets-5.0 | 2 
                    efl-1.20.7 | 1 
             host-dfu-util-0.9 | 1 
                libmpeg2-0.5.1 | 1 
               mono-legal-info | 1 
package/mono/mono.mk:63: mo... | 1 
                      qt-4.8.7 | 1 
                     znc-1.7.0 | 1 


Detail of failures
------------------

   powerpc64 |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/3d92343342b51e710765866d6dd9383d26ba98e7 |     
     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/ab36e30b3a62543f1e824dea3c922a75f7a9db1c |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/af26ded35a4764e4c48840376708a06932580bf5 |     
        mips |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/844b935c4b400fac1a7df2182d76028c42e3b03b | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/9d893bd6ab3121ddb39c0a4f0c7e26837ac923c1 | ORPH
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1ea7a1f6a53aabb627dfad48790b40132a184623 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1809c273402acdaaae51d8a9c05ddd254c63016d |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/bcdcaf05fc293e6bfe9078697f48229788403522 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/d939b62cd588a121a1b2e3f2fb6530e790c34f54 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/8370cefdec82a416c716f52e24a90e5e1d723e38 |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/672fbfb1c64ad254b4e22bbded4435d8ba251a5c |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/5b2c4936e342bea11196959c7b4acd4b060f87d5 |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/2c159101868ee591671748e217434b94e1a42161 |     
     aarch64 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/2b4c0d16b1d1b2e4adde1c1cc06ba9eab8a4fba1 |     
 powerpc64le |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/47adf8e9d51ab130baee78a2dd87f24f433e58c1 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/b05097ef139aea0c769fa5234da99ba87778bba9 |     
   powerpc64 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/6e47bd5cba3ede35158f00429663653c43e68fca |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/19d21a39dde495c9012c36854bec803dad737f77 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/70adacf85154d2a663808cf0db69849b6a490457 |     
      x86_64 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/bb25363497dfd7fd5f8a81c28110fab87d5c2dc8 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/31fe428584ada680f30d11e5d1abfbc533c0a70e |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/3d5d3f759c52452a12b0cf6e8c98c40527ccad4b |     
        mips |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1ae9f136ed91bfae6e3f87ce3e8ea1e0fc1d41f5 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/344d14cd2ca6c7af0e63484621125c355db20ede |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/a8613e9ef1656df1f55d5ccc4facd396f6f8a2f9 |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/bea78bf580be6fe109b827b72af9587c5324daad |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/8b66c460997d4c5315d10b507531704dafc6ce98 |     
      x86_64 | package/mono/mono.mk:63: mo... | NOK | http://autobuild.buildroot.net/results/95c03c142233e60eba6f8d3faee9752c65f7eae2 |     
        mips |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/1059b06d55bace393ad5e60ab230446f321aabbe |     
        mips |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/9bd0a9ffc0afdf9811e73be9711064e89747d05b |     
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/61153dea70d2006a29ec7af880bf904249f4788a | ORPH
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/d06176f00109ad0707032b0d76fe94f1d414106c |     


-- 
http://autobuild.buildroot.net
