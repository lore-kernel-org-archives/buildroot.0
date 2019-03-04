From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 04 Mar 2019 07:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-03
Message-ID: <20190304070051.66CA5854C2@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.11.x |  27 |   1 |   0 |  28 |
      master | 219 |  17 |   0 | 236 |
        next |  39 |  23 |   1 |  63 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/1631839e91e2214cbdf0dab953492575b367ca72 |     
      mipsel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/f0f08b332948235fb45f3abbbfb1a43ca13f3910 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.2 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/62a78960c8e056bc0386fae9505e032a2e3c1aee |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 3 
               fftw-quad-3.3.8 | 2 
                   glm-0.9.8.4 | 2 
                   netsurf-3.8 | 2 
       gst-plugins-bad-0.10.23 | 1 
                  linuxptp-2.0 | 1 
                mongodb-r4.0.6 | 1 
                   mpd-0.20.23 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.3 | 1 
             qt5location-5.6.3 | 1 
              sqlcipher-v3.2.0 | 1 


Detail of failures
------------------

      x86_64 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/2d9724f169ccd60c7feb1cb549f1e2e1e9219ac3 | ORPH
        i686 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/7aa3adddb4adb0ada70b76319acb123dab8fc4ca | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5b8f3f9ce7eaea8772dddd81dc477efbdb74668f | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/0bbab4854bfea53b8a92b10cf6c9334c68284119 | ORPH
     riscv32 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/007c888dd34b303068dd68d1a5b6ac0349125a95 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/724a64b36e2de39bff3ef4c9f4ade0df02d67ac9 |     
     aarch64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/713ec2f31cb218cd95b6887b7a98ca5b81106927 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/49953b09e2717288dd10f1b9673dfe792194757e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/96f04312ae4247624589e4e0e64d6065b04e1deb |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bd990f6e9bf5363b54b06a324189c9c26a1ea181 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e92991308d47649cecc4084e41ab5711ec96831f |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/dda50dfe95e64d799038acf3d39e4c8d553f2e79 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/18276a1a58bc04f98d7163aa7972ed7d9d223e62 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/b96343428206f6b1211ece316e3889530a3b5755 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/31c69227787549966a706d701aee0e13029d45d8 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/65993efd45b108d4cecf3b327df0c2e95853a624 |     
        i686 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/c6d9672e583bd20f8a0b601dfde483292df05942 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 5 
            optee-client-3.4.0 | 4 
                  brotli-1.0.7 | 1 
                    efl-1.21.1 | 1 
                        glibmm | 1 
              lua-curl-0.3.9-1 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
package/imx-mkimage/imx-mki... | 1 
                     pcre-8.42 | 1 
                qt5base-5.12.1 | 1 
                 qt5base-5.6.3 | 1 
               runc-v1.0.0-rc6 | 1 
             stress-ng-0.09.47 | 1 
            sunxi-tools-v1.4.1 | 1 
           uboot-tools-2019.01 | 1 
zbar-681b0f305fb5c5bb0df843... | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/80091c0d72bf971250860131450f25b0a22ceaef |     
     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/8a5de266838d8cf6ca2ddd3df67eadd271118c39 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/25763d7e25e6ce3b911880c84ec6a84e2899197b |     
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9ce71cf70bb8aa9e5a30fea3cc226574b514af79 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/bf71f44e02bae8333a16a75a4269852bb17e034e | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/64aa4b0704bc5cfd681d7eb76e98aa735dcdea3e | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d44da304bd9b232af2daed396cb6a80ab0529ba1 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6bec5c06626be8b52034a9ffe49d9d2cf60a4a9f | ORPH
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/6f0ec79864cc2f29041e49f1e08b99050084b398 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/29f4ee704f7fc8b2a4a86bc8217b9b7ef7ed6dda |     
       sparc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0181cedd28e5afc95e0dff2e918ea6c36682a9e5 | ORPH
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1f13081f904db393d537bad7fb041d1e7bb02f35 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9d8444f6016acdb91ceee1e569addff197479878 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e8ee45623503d1922d0a81d6c8aac0d3102e3028 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/80b199cf0be44e9da36c3ddb87b071526df542b0 |     
       sparc | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/c3d3ae0a43906705636bcc095895396339a886a6 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/b16b71972a3a45c0b96408d06167ce5421a0c5b0 | ORPH
        i586 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/80604059e13908c8414f8e3d8f2e8df544bf619c |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2d22b480806a034b002797f0432c855d14e34b70 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c49e8361a1d4406eefd8fc1b35c8e5b061aa403b |     
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/daddd8c50ac6ba635e9af4fc131ad5c8d7399f17 |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/5d53efb1dc6b7bbb5f3fc3c3a3bf02c3ec9e4841 | ORPH
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a1371c93a24dbd1ea871185c9a1bde53e44eab67 |     
         arm | zbar-681b0f305fb5c5bb0df843... | NOK | http://autobuild.buildroot.net/results/2e410ba2a4c50d50eeaa43227e5f6cab66d7e53f |     


-- 
http://autobuild.buildroot.net
