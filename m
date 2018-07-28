From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 08:00:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-27
Message-ID: <20180728060044.7436E2091A@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   1 |   0 |  24 |
   2018.05.x |  22 |   1 |   0 |  23 |
      master | 132 |  56 |   0 | 188 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d7745f52afd55f652ec19e4f28a4817b526cc8e8 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

           uboot-tools-2018.03 | 1 


Detail of failures
------------------

         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/835de6d4ad98e3c421971f44e3c3149c6308652b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-dtc-1.4.7 | 17
                     dtc-1.4.7 | 11
                  boost-1.67.0 | 6 
             gnuradio-3.7.13.3 | 4 
               aircrack-ng-1.3 | 2 
                   libnss-3.38 | 2 
              libostree-2018.7 | 2 
                    ncmpc-0.30 | 2 
                 copas-2.0.2-1 | 1 
             host-gauche-0.9.5 | 1 
linuxptp-303b08cbf55096aba5... | 1 
             lua-bit32-5.3.0-1 | 1 
              mjpegtools-2.1.0 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
            qt5location-5.11.1 | 1 
                    sox-14.4.2 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/0d7a39e7747633433345df9d293c72c9497ecf59 |     
         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/8b00d25ca310ab01fde0e67c0693cafd8ec1e15d |     
     sparc64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8837a95596e7f16c54ba47e817f5325710d37065 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1e6651d918b93e2dbd2b1046f6af7aee418db087 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7c22358172a09b09e56fadbf6037a46c28ad21a4 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0373c9524105a171cc74d6eb5ab1679126df4b14 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/be05fdc2aff5a883b3469facb2afed6ae5dc5d22 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/dd01fd226d3f6e866e5c4acb98026402f6c9986f |     
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/e67722377d57ac6b07a1d32723d583fe4fb7e6bf | ORPH
         arc |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/192ba5737b4121b698f53538376e46a65457a61a |     
   powerpc64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/af93849d2086a90906c20d2900a092434ce1b517 |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/6bc7bdaab5d6a6d4ab2bff0b1aed2a28feec1c72 |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/07dc34c67c8134190ab327870d637445f142ae17 |     
         arc |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/d4a0ca2e0db8831f9463502db06c291acfd2ae60 |     
   powerpc64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/462291c95fef7667269ba1f032e0dde0be4f644f |     
     aarch64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/1b77850d10ce147d5b3132b1b914ab29a18eb659 |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/bf7bc6b215212b1ea776377e97198e329079771a |     
    mips64el |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/b9db1d2491d6787a094f0805a3aebbc6e4fc02a8 |     
      mipsel |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0d431e521c49ddd02fd6b6e5a395ec97557b81e6 |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/06b2d3ab1f1494eb0dbbc7f9583dfe84bc52011f |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c5175d4873c00f4a8e320997ecee1e621b6a93c9 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8925ab53c0b1c7a201000588f97ec3b7bfc023cf |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8a30d0955ba25d3c037e12f1d20332d23b64244f |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d28b5ab37a6fbdb82b01a126fed62b0b37faf15e |     
     sparc64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/4c6d9016b05b17e836e36806b938be953d2581ac |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/1384ccbb9e54b14f8c1ca99db795e48deb579060 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/2afc01bae45bd2b086c9350e1323c3aacace8288 |     
      mipsel |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/76af31781e53ccca5d6ecacfc1b1b05431cf018f |     
     aarch64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/88423e715222eb7ade5648a125186863a44c3d7b |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/6b77b340f44597eb32bd1154899595fec3a43e7c |     
       nios2 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/a6e57bb13e587ca5eb27fb51b30b955f3bef7b8e |     
   powerpc64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/b010bc684bac2533cdbee804ac26eb28a33cb823 |     
 powerpc64le |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/8362e7957765e24a321abcae46ca124acb9d09a8 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0e5be2886c390c34d2444a643c62cde5358478f9 |     
        m68k |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/2bfcf83964a98d2ac7053517f7cec0a96b6629e6 |     
      x86_64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/9bd7a86fbdcb58288f30bc7d59446560bc6b8942 |     
         sh4 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/caabaa313ef5531733805aad84cb495654b97323 |     
 powerpc64le |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/b474d2e06cba234bcd1796b82c2f74b42a51009e |     
        or1k |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/61b7628c301c62a18ce36d9239fe48ace31adbf8 |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/28185f9c29b27b4cedd9993d9c36b72c6fb71e10 |     
microblazeel |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/8df7a1f967ec76cff0468aecb0a24dae072511ef |     
    mips64el |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/84ebddd7a860bea4033e9885eae609c9453d8d28 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/09669909118828c3e93f4eb7b5dd30cf14423860 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/4fca771980f9b049ce2690971ddd856652cd5b43 |     
         arm |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/949f701cc4f64de84c600a37cb504e1f2cdd65d2 |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/7bf319b62eec5783bff771aaf35878736b055bbc |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/30cb5c9ce35ba99ddbd8c751cd2bae052efe7ba9 |     
        i586 |              lua-bit32-5.3.0-1 | NOK | http://autobuild.buildroot.net/results/3bcf52eaf27a7328a4a9f629afb5e76c9dcb4c13 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/b49f899e561dcd70a6564c8e13f35d7e414431b3 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/7fba40c8950fe46f3e3bf7dfde92b75ddc4bc99f |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/c597b353a8a574e06fc6ab90ef0399e38fa24195 |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/d5d71bd38a36f685636619cfb2956b946db3ea68 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/5daf8e239804a67089ec993e16072f786e430ece |     
        i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/a84182145122935c8f10105818dbf0e3aa23fd11 |     
         arm |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/c59e5fe47e7b9e340453a98a39302265af3770a9 | ORPH
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/a7c9747deaee21d84a0bd654e8b6f76bc29751f1 |     


-- 
http://autobuild.buildroot.net
