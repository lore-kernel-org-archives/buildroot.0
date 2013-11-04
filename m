From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Nov 2013 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-03
Message-ID: <20131104073022.54E8952C702@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-03
===============================

        success : 74 
       failures : 73 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 14
                 qt5base-5.1.1 | 9 
    trace-cmd-trace-cmd-v2.2.1 | 7 
                 zmqpp-31220ca | 4 
                 dropwatch-1.4 | 3 
                      icu-51.2 | 3 
             alsa-utils-1.0.26 | 2 
                 omniorb-4.1.6 | 2 
               libglib2-2.36.3 | 2 
                     apr-1.4.8 | 2 
                 binutils-2.22 | 1 
                 libssh2-1.4.3 | 1 
                 libraw-0.13.4 | 1 
                   mdadm-3.2.6 | 1 
           imagemagick-6.8.7-1 | 1 
               qt5webkit-5.1.1 | 1 
                pulseaudio-4.0 | 1 
                      qt-4.8.5 | 1 
                openssl-1.0.1e | 1 
             util-linux-2.23.2 | 1 
               alsa-lib-1.0.26 | 1 
               libsigsegv-2.10 | 1 
                 libffi-3.0.13 | 1 
                  tstools-1_11 | 1 
                 ffmpeg-0.8.15 | 1 
            host-gdb-7.5.1-arc | 1 
                  connman-1.12 | 1 
                  ne10-88c18f0 | 1 
                libtirpc-0.2.2 | 1 
                directfb-1.6.3 | 1 
              e2fsprogs-1.42.8 | 1 
                valgrind-3.8.1 | 1 
                      cjson-58 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                beecrypt-4.2.1 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9a81260d553116ad17e94c7c91fe5eca047fe216/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d8c5139ced7b9a4b95ceae70e024178aa1b991fa/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d092e73b8c0c9d6ca25cb8f85035896a1c410715/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/9ee5ddec4f24881701a02cd3b14e4276c44f0ef5/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/13d8be0b5802a79ab360bea631c691af38560e16/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b633d87617c35ab2d6bb6bf2936e562240fde934/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/e514a5122b2524453dff8d5617be4b8de65c544c/
      bfin |                       cjson-58 | NOK | http://autobuild.buildroot.net/results/f45371af148ef654c65739071e73dd6858dd9d2f/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/42bdefa3a590bf8dc55ebfac60c702bed9af5a86/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d002f7a6d7304a5ac919fe0bb70ac7d12638ca6b/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e7a18b58b5e7ef7e007112f967e8088d5aa4a899/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4bd3d687bb888baaaff246ff404ee9822678208f/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5e17607e7ede827b1d1a029b17f49c55b05c69f4/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/495a652a8ff7c0b82b1f573b5439fbc3f63c99e3/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/aa0e31be3199ccb6a1595d74201f387eced6ff02/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/ba035c3ce2d916ee5885c01ab7c9d6c8935f7f5b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6e81889b1b64fb3e9ed3839f72fcdd88adc58715/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/704a04118fd965068f6ca46be125f8abe8a1d210/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1456b93e06c2969bdd463564d8fb81c52d294105/
   powerpc |            imagemagick-6.8.7-1 | NOK | http://autobuild.buildroot.net/results/f49352def1e167d8e72b0b116de5aa26d8353294/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/15b3927d1773621ef6dd8509d058e2bea414134a/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7309cba01410f9cacbe3a534d3a942f758500cbf/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/105e80c515ab078a24a1551940ddd6bb4aa96b78/
   powerpc |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/44986d4b7b0ac4c94ee9ddca600b5ec52c12bfc5/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/174852b964eed15b326a7a7edddbf2b2fdd76092/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8b6798373f50bb81ee14c147fc17b2c60e886de4/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/d5206568ffdf1a34b0d0c05106bb84075df293e8/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/57979d01cbf762073d7b1bb4fb447f0d59be0e59/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/54388bad3ff25019d0a126194e5f85a5ed81c90a/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/6b75c14d7e56f43e0e20121fd4b0621f6a36a45c/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/18545cc99a2a537415983f5c17e72e1f51eae1e6/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/8950c5a23ad4300aabc84f93981ab3cee6fd9f8b/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/c4e2a8c9a62e225599b4a9f5fb8311c04447b4e3/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/8620ee205c34c8a48eea2bd8ccb0ff2aba5ecf6d/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/51771ef294382a256d5c4f83de53b53b12d7531c/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2ce75249449978e7a382d22ea2f62ed3a3908b82/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/4b54385e87e5c2ffd3417740b873c55a0f9142dc/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/9d17b1c2ba79556f09f72dfca2368cb390f4a925/
      sh4a | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/219c9e01ac20a286753ae9b69571c216711e3552/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/56f84c97667550d8551c059c4b9e3148b43e864f/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/896f8afef52c3ff89b15db5ffe160aac7efe8e07/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/71e8973858adfd844b7f3c05b30a5415e1352f6b/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/8392196996060939b6f7a851b759ef08e7f2d527/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/297d9eb2341827155da7663ad10c33b8e83961ed/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/cc22f3457e4a01acb9ef0c70117f14ba63d7bf29/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/3682917809579a9c237ab263cfcfcf196e45101b/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/df01db57585cf259eab9690ca08d34698609141f/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/fda9d3070272f775d3f454ffe77d27a374d57c28/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/a714331bd919fc3de21710f5f2e0d94292c0c366/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/794b706bf7a8f1b6e7f9df3bdabf4d843e0f92ba/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/f6cb70e62e3d691188e9a0a8213f6aad170dcbc0/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/0a6012fba21257fe93e0a2aacb73e2459090bf2c/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/347577bf1dee0fec3302a45f278eb253118a5b6f/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/396db7bd0f9fc835ad82f5652d12c1e3a6d75b61/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/91afe50a2dc9a995a7d21485f5c8c9cca723ac1d/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/9447549a701bb5ce81ee59a04ab5e2ff91bffb7b/
  mips64el |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/3671b6792c9a582940c900721d9e9e39de5747d5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/35dbeee7a11b6a19d1c7524cdc3ed554250b3cbc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2393311f54741204f1a3296861d30d468d8846ca/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/bd1ceff22995fca5519c393e3b733ce0cd5350ff/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/56095c12d1002016697a645795937a3921254feb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7de9b88e98f94c707158acbd80ff7e53a9b9bb39/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6b99281b74e223132ec1186a0692642b36f7a358/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e1611cf32df750e3fa30db9cb0ded046003cfa32/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/f2b849a579df35987589362ffd7c5d6d49d286ab/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4155e35c02ef79248633799520a09268f9f13024/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/996761a1c2bb4896ed0fcaf273590e945395bfee/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/f459258731867935d11791fdedcd622f7604e0fd/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/e1a8c6aa0b3dc6bd18b8be16d9ba3ecbd1164380/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/ea57e27f77bf5516139e049dde610bb90e2b110f/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/4a2f8b423cc757211d071424f4090b0414e7cf8b/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/235b0c411aba437b7be2580d9f577f039b87fcab/


-- 
http://autobuild.buildroot.net
