From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-24
Message-ID: <20180725060019.0B144208FF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  14 |   0 |   0 |  14 |
   2018.05.x |  22 |   1 |   0 |  23 |
      master | 144 |  34 |   0 | 178 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

             qt5location-5.6.3 | 1 


Detail of failures
------------------

     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/346d41f02497b4a01c2182e5f726815ac407b2c5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 10
             gnuradio-3.7.13.3 | 8 
              libostree-2018.7 | 3 
                busybox-1.29.1 | 2 
              mjpegtools-2.1.0 | 2 
               aircrack-ng-1.3 | 1 
                   libnss-3.38 | 1 
                    links-2.14 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
                 opencv3-3.3.0 | 1 
          openpowerlink-V2.7.0 | 1 
           python-numpy-1.13.3 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/26d7311fe5d2f5bc6d330634b337bfcb6d910184 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/39a6885fdcb441d869213637507d60ba9dca7587 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c6aba124d7b609a100e970dabca3734725a63b54 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/931b94b61e30745ebcdff50c1b3884d4c96be39c |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ddbc9b5bb903319ba6f9c921bf97b3abe6e971e6 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5c0fff0d01342154a593f6f35c086b737d9e2f96 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/60969df84084dc7ae68dce7316ded872faa2db87 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5dfddaf64cc6c2e4f30cfc024edeb396e928c0aa |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1a3ac954fd0be11a2dd85bfc24bf5e6a5b5c6316 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f5dd7a55121beb047b42c502ca557b4b7be2c97f |     
   powerpc64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b617dab2843c0d3e466acc86bc1b3d3feba52955 |     
    mips64el |                 busybox-1.29.1 | NOK | http://autobuild.buildroot.net/results/779d4d4595f425b689277517854614537f6e5b8f |     
     aarch64 |                 busybox-1.29.1 | NOK | http://autobuild.buildroot.net/results/bf3937882023df7ed319dc76f1af10f79785112f |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d3b962a1bb0ff8a014f1fc6fd91366c2d4e84188 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4eca06dcf24f2479e30da0cf8ca38cf30d1cf942 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/48d11ac1463ea598fed21a60bd0990f6afd35c0d |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/99c5cffe496b15d8e95b4e93f085783d7079f70f |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6539614529193bff3d1ea69f112fb043e541ff37 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3a1c3443230c96464eeb032820cb8f330256ffca |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/547663186a11e9cf5014e74f52ecd4a1cb362420 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/269c94c6d9c99a40f337e7cd78f69095975c6b04 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/fb3ba94404724ae1d6d017c92c5d9eea7f8cf2cb |     
      x86_64 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/a1c4808e0cb64e444c050c4603a91cb609eca617 |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/4995dbd36d2ba0abfa1e44973d154df1931c0c74 |     
   powerpc64 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/6f107bca66b71878e6cc4714fcac2cebf32813ba |     
   powerpc64 |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/99bb9abed93c72dfbe97af9bfb4b0a3552058cec | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/2a1867d4da11edbaa54af2b26110f6071fe8912a |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/ea087ad9de03fce041f67cce8155161287fc1318 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/54f8c879de54403618190d795444b4ae4036528e |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d16fd35b06bdd9cce1db6986ae9d991932906e75 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/69040554f74292e31b169d0fe260ceea5e5cb3fc |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/7dad242f17dcf3b2d10520f8f5df988892c62599 |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/a589f29d479afdbbca09fa60bcbd1dde382061c8 |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/f6dfff96288d964ca9ff89b7b883d1444cb5b417 |     


-- 
http://autobuild.buildroot.net
