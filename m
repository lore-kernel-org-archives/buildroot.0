From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-26
Message-ID: <20180427060011.1193420999@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   0 |   0 |  19 |
      master | 171 |  42 |   1 | 214 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 10
           libfreeimage-3.17.0 | 6 
                   flann-1.9.1 | 5 
                  host-go-1.10 | 4 
                  zeromq-4.2.5 | 4 
                 host-rauc-0.4 | 2 
                  udftools-2.0 | 2 
               asterisk-14.7.6 | 1 
                         boost | 1 
                cifs-utils-6.7 | 1 
             host-gauche-0.9.5 | 1 
                   jamvm-2.0.0 | 1 
               libupnpp-0.16.1 | 1 
               log4cplus-1.1.2 | 1 
                 mplayer-1.3.0 | 1 
              procps-ng-3.3.14 | 1 
   qt5quickcontrols-legal-info | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/7707b5255766ebf0f95bb56a8b8d56389a16665a |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/059acdcbc1d099ac07e0d43ed895a435d6bbf230 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/62982e6e712898db2a46affd3caad777eab9a095 |     
        i686 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0623c62f2b392e1ac685d1dee3112f0518f28224 |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/d994f6a37695d034b1f571d1ea8c88ac61390231 |     
        or1k |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/866dd80423873b05728eac5819a42d4e440d099e |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/29676e4b742d891c2d628927a64c4f81d09af1e5 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3cf2bcf06a352e501f35ccb3323c756e35140621 |     
     powerpc |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/0f6aafec1ba52cfa0047f697e022d0208d8476ee |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/f309de9f6b07cc6723d5e0b3b55bc804401ce1f3 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/466c4e6a3115ca10df3f99f70b211bb71fad70ac | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5786eb2e89fb687f6f94ae2df721ab28374639ee | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/75d2de32ed697df341f282c6c43fce7503c807ae | ORPH
microblazeel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/a3226fefea5e1356f15a20ee4cd465d6a561ff00 |     
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/1e5ba9d0c3fc252bb922894c4d45a4f571f8a823 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/87f6c7f89d43d87743baa02e8c9080ded46c534c | ORPH
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/44e8a12f71fe6511024966c3c7387781eb9ea959 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fcd5809fa777c39bb52b636ce13a3faa56103903 |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cfc5c2dd61b503b187ca411e540c027068cfe8ec |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ce2ed6919ac073652621d890c171405596dbe729 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c2757beb237234d26539d8ad918187299b6fffb2 |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/831cef51f73def9e6565a75f1ff3d404b4245f6b |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/50b012f20c6e2ef85c21f887ee9a102ea33e86d2 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/638194c430a37e2cbe3f98c3e9a54096e3c28ac8 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1c5786b057e4c66b2fb46d5d41d3a0edd9fa88f5 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b8535ac465ef8fb3fd64ccda1f1b6d7949e02002 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f2c56f239c35d4d07135190c169d4c2486d599b5 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d8266502a985a4586979bd5f6fc1a5e1b3060e08 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/865dc185a61b87828b6ed6ee4bc43bd116658576 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/41336bbfc7d8c17a16d40e0369ff037cb287affd |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1adc747158284dededd62a9671be94c8ecc5d8bc |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5cba06d47c6f870b53274c69f33b8efa75ea2b16 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c84c806ac426819258a4ae31917d11ec053677bc |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/01f2f541ff0f69e10b8ad8cfe52d2f6e333c710a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2dec969455c0797d1016e7a99804c1bba51a2e25 |     
     sparc64 |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/b02bd2e4032287d3c5c58255d621ef785c5d1380 | ORPH
     aarch64 |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/56eb8015371d55c9f897a6143ba1a3676366802b |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4862d78fd754172cc855a82d82b888e5db90e200 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/977fac11a95710669d2a35ad92fe6c7ff3fe954e |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b800902509e656fd600df4e4d275c0255ad0b2a6 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/787c392459692195c291886cea4c7737181fad93 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0de99cb6c6a767401e0384796c0415be820d248a |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0b94432040d06b8be637094e538ac0e7908ed884 |     


-- 
http://autobuild.buildroot.net
