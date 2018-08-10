From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-09
Message-ID: <20180810060017.0EEFE20719@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   1 |   0 |  11 |
   2018.05.x |  14 |   1 |   0 |  15 |
      master | 123 |  10 |   3 | 136 |
        next |  35 |   5 |   0 |  40 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/c42a6e12e5f555bb8dda47e7144a74361dd41536 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

            qt5location-5.10.1 | 1 


Detail of failures
------------------

    mips64el |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/314462318bbc43cb5bd8f142455cb417a937c050 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    f2fs-tools | 2 
           host-libselinux-2.7 | 2 
                    ncmpc-0.30 | 2 
               azure-iot-sdk-c | 1 
                  boost-1.67.0 | 1 
                moarvm-2017.05 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
            qt5location-5.11.1 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    mips64el |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/df878f5129d34e8916b9723db727ecfdbe4d1327 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bd77b0be062f273e336b4ef578d17b9c9bdd38cd |     
       sparc |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/cf71468807f496a3d2fca1405989ebfce08a4900 |     
     aarch64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/c826f38e321b999d0fc21ad9aae5e1d713f20417 |     
     aarch64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/66c03506e10071ec44ca509304595f4f5150e4d9 |     
      mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2b41afe7841feba626fc29c9474e82d9934e6173 |     
 powerpc64le |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/c35ac4bbc5fb04aabf5a719eddeedf55f7f1f4eb |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/20942b594b08dabbfd6e14f4a2b257b2eb0a24e1 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/13a079965b2b3d246a647152b6ec33e1ec5fd51b |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/d23103a6fa18cb77e14fa901e9475e53382be6db |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c |     
        i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/8b5531e44c4f4258c950902b2cd92d1ac8a8491e |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/0fa860faa1cc5d007574bed4517c3e9db9ab389c |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 3 
             host-gauche-0.9.5 | 1 
               mono-5.12.0.301 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0a2c7b4dce19bb4b08ad193ad1cd928e3586b65c |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1ab6781555aa875fa1e3c2cd583d0c2846916c21 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/269228fa1581dd4045777c3c7cafd8ec64a7658d |     
   powerpc64 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/98b6d8dae4d774e9a860ccd139bca57c1653fce6 |     
         arm |                mono-5.12.0.301 | NOK | http://autobuild.buildroot.net/results/1ca8d9a12e6b816127f35f653580e2ca64f1c0d5 |     


-- 
http://autobuild.buildroot.net
