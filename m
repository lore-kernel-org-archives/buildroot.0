From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Nov 2013 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-04
Message-ID: <20131105073023.37C8A52C700@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-04
===============================

        success : 77 
       failures : 63 
       timeouts : 0  
          TOTAL : 140

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 7 
                 qt5base-5.1.1 | 4 
                 zmqpp-31220ca | 4 
                 binutils-2.21 | 4 
                 binutils-2.22 | 3 
               audiofile-0.3.6 | 3 
          host-protobuf-c-0.15 | 3 
                  tstools-1_11 | 2 
                  connman-1.12 | 2 
               w_scan-20130331 | 2 
                  aespipe-2.4c | 2 
                 ffmpeg-0.8.15 | 2 
    trace-cmd-trace-cmd-v2.2.1 | 2 
               alsa-lib-1.0.26 | 2 
                 fdk-aac-0.1.2 | 2 
                directfb-1.6.3 | 1 
                 cairo-1.12.10 | 1 
              sqlcipher-v1.1.9 | 1 
              cryptsetup-1.6.2 | 1 
             bluez_utils-4.101 | 1 
 libevas-generic-loaders-1.7.7 | 1 
                  python-2.7.3 | 1 
             uclibc-0.9.33-arc | 1 
                  libv4l-0.8.9 | 1 
                libiscsi-1.6.0 | 1 
               uclibc-0.9.33.2 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                  ne10-88c18f0 | 1 
              fontconfig-2.6.0 | 1 
                  libnl-3.2.21 | 1 
                 erlang-R16B01 | 1 
                    crda-1.1.3 | 1 
                 libnspr-4.9.6 | 1 
             alsa-utils-1.0.26 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/9231bc9bdd8dc0c6b4a6f5b93bc18e0bda80b75f/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/1c9e5ccd2a2de3099d33d602779feef11867485a/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/78eb097ca1705894b60f89f35c72a848bf3b7726/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7be2b2f48ba59a0f3db7710cf6e8b1efe8f9136c/
    x86_64 |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d558925ca0a6f1c5fd718d42f8e3fe3e74a92d5e/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f4989e7bf395d9dbad5bbbd1572c9052743c1424/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/a3528fcb7def17cd2ecd0a473ff2e791b8589544/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b6cf5e1414be3913b5eac6310bbd575137f409b6/
      sh4a |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/51f4fd2396ad7c8dd4c36456e1cd67b85f83d90b/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5450424b0fc38ff3bb2306f1b48ec012700c161d/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fdd027b60bb65c06c60bc1f61e32b37ffa20d54c/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d9eef2ef2cbf8bdd9d8e58c132586fbddcb7fa8f/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/f30943e20af19b5c7eba642febc8018c2a60a9fe/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/7dafb56700cb86bd4c20e397cd6e6d568229be2d/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/02796a47a03fc36ce1dfa476a6145be47f283a18/
    x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b8280ef9a52ad9f64cb7c937e94800d027daacef/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/4d52f3dbd4c5f2fb5219217c0238fc7b42a83bbd/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/0d8e7bd8bd3f227fabfb0d5feb59a5d316026d3f/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/09b9b252bd096d0eba1993b623e461ed44a78046/
   powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/bcdc667a31ad8feabf3dcc49f6bb6b2efbec8c5e/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/238502b1c611719db76e8dcdf72bf4c1ee648440/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c91f6771bd9ef5d1275e6a20bfb4872c8b2f156c/
       arc |                  erlang-R16B01 | NOK | http://autobuild.buildroot.net/results/e3a4a750127dc8bb42abbd5d7a8c5e71e80b1609/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/8ce71830fc17435b087fe185c56857602ac411a6/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/ca0dccfdd5528482a56bb5ac79f7b46119a25e9e/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/eb4dcb9298c32b6c3e76b62cab5407273e606428/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/3a60c22e56c4f107aae33e8a84f1717e3051d00b/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/c6142d999cce6692e8fac4948e16e5024f98aa45/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/ad4c598c8b2da61b4a53610531ceaa976c5d8bea/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/575893cd90af353928b0abd09f5f166fcc311e29/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/c54f85884ffa6f0c3a5abee6cbfcce99370c99f1/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/6058df18572ede516cf8928d21b2ee0e145b80b1/
      bfin |  libevas-generic-loaders-1.7.7 | NOK | http://autobuild.buildroot.net/results/4dc39e2290a83aca13f7be3656308978153b0d9e/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1e0cc50bd2a7c89a61316956a1272473b3b43822/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/d181d22932446c1eb7be723907b336710fe0e985/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a57d4fd5b9681492e9184661585c794610bf4169/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9ae53989ee21944280683e3cac39af40ad1503d8/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/28b58a7d13fcc286ce3a176e6ada9a734b19b79f/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/96fa39358d760b131e569c42d2be33b47fb446f0/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/957e70accdcf418fd68614602fa1c18aefcc4d31/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/257ad81ea984624f8bdb055b5167001d05a53974/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/5698241ba51116d713278ac5cfb347d188b31807/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/b68a09c5174d5c50133d45d642d0c90d6872ab50/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/adb8cbd03ccbcb802992886f14af513f5d77277c/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/265a9d06266745c62b3a8c87a010efb3ce853e55/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/3b75c3df7343350e6128fee0da52e75ae41693bf/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/a50e40dd961abbbb1c101728263473447d66a119/
  mips64el |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/5ffab05cddb2d30b79a047ac9c4c0e054425a5ee/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/81027ee7986a2cde155d22b57e54e2fb34464e51/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/e43b9748e048e62dac51b467aa669306c8b85c00/
       arm |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/c29ea7d1fb3af053d014da75c35ba8bdecc8585f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b3219724ae53cce7b8b516638c074c9282e50c95/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/12206e1931906e0a82418d23f3bde7d57331f124/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/f491f602a64cdaf4de033bf6fd22696304a7a21c/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/4878e301a2a301c7e8258c598e5f4a0cc9e7faea/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/c2ba933a08d8655507a5820a7d8f546c97138187/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/11dc8025a253032e6f1465068899cf0590533d23/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/cd0ac7747fd24af1eb8b9cb7d0274d38de4985ab/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/b9f485d517e4ef42d554677767f280ed61edf402/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/0dadccc01e0aa98418323528f521ccf4cc91f16c/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/284d052000e090dc29ce7ca87377336b05af3c08/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/84fab0d6eb3a01721dce35c15174909e0c6d7ae1/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/7b2d0630ea3d4657a99365dfa09e3f1cfbba69a6/


-- 
http://autobuild.buildroot.net
