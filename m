From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  8 Jun 2018 08:00:54 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-07
Message-ID: <20180608060054.590A020DB3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   3 |   0 |  28 |
   2018.05.x |  26 |   0 |   0 |  26 |
      master | 219 |  20 |   0 | 239 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   libnss-3.33 | 2 
                    quota-4.01 | 1 


Detail of failures
------------------

 powerpc64le |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/949fbfd581530b2fb9725d360a37fac8741ea26b |     
    mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/a8dc80eabca799ce48231a9cf20a0d8616f62b7e |     
   powerpc64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/caba48b3d2b43e27511ec7843c46a57d3c7a04c3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-flatcc-v0.5.1 | 4 
                libmpeg2-0.5.1 | 3 
                   trinity-1.8 | 3 
               mono-5.12.0.226 | 2 
                   libnss-3.37 | 1 
              mjpegtools-2.1.0 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
                protobuf-3.5.1 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.10.1 | 1 
               qt5webkit-5.9.1 | 1 
triggerhappy-b8228880661293... | 1 


Detail of failures
------------------

   powerpc64 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/01164e2b88b5c26de893fd46765746ae73f29246 |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/ba9724ba121f18d37a5768a8be1ddc1da69f781b |     
microblazeel |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/8aa326212dc59ce88d6b5461cb196473f47b56a0 |     
      mipsel |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/28d3ec4dd4d656b9eac476d5822d8a5cd386c57c |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8544d0f34b3ccf77843f48ffb4894782fb5a68b0 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0369135e20ec6a9e7376a7062ca36e0917cf6941 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/585b06994962a0587062ae0ba73d318fa13c9fb3 | ORPH
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/fd64ee3486f9045dfbd83908b8f06ef62c0d9781 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e2508995f42fef23810fa72466451a0598657e6c |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/09f7a2172f4f71fa3cfeb6e69a274e297763e778 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/05c5c81ddacc190e324f9edaf4965b895c386306 |     
     powerpc | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/d9f0311538c8db1196839e36af3f6ef4e403be2b |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/1767c29a5b8a8d4e9585149301c272858d161126 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/89ab525989738ac21443c878f01f2a4a178d05e8 | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/9161f1222cb39d4bc95195865c91541b0c19ff40 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f3512db384043d865e3e38290e94d4d05e2c5be6 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/8986234e18891ee075443879445f602542e24e5a |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/af2288711d1a0939a06ea51e65ed32d39e395e2b |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/39d131048d6eb3cd4d802dae462116f7728c41fd |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/7f600c2b57326da316f3410069ccddbabb37edfd |     


-- 
http://autobuild.buildroot.net
