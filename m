From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Oct 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-20
Message-ID: <20131021063004.CAAB352C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-20
===============================

        success : 84 
       failures : 62 
       timeouts : 0  
          TOTAL : 146

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
                    nano-2.3.2 | 6 
                 libffi-3.0.13 | 4 
                 binutils-2.22 | 3 
                libiscsi-1.6.0 | 3 
                 libnspr-4.9.6 | 2 
             alsa-utils-1.0.26 | 2 
               alsa-lib-1.0.26 | 2 
                   cups-1.3.11 | 1 
                 dropwatch-1.4 | 1 
                   ncftp-3.2.5 | 1 
                 mplayer-1.1.1 | 1 
                  tstools-1_11 | 1 
                 zmqpp-31220ca | 1 
               pcsc-lite-1.8.8 | 1 
                  udisks-1.0.4 | 1 
                  nettle-2.7.1 | 1 
                    php-5.3.27 | 1 
                      qt-4.8.5 | 1 
           mysql_client-5.1.70 | 1 
                   bzip2-1.0.6 | 1 
                    ola-0.8.31 | 1 
             tinymembench-v0.2 | 1 
                   git-1.8.4.1 | 1 
                  gnupg-1.4.15 | 1 
                  ne10-88c18f0 | 1 
               libglib2-2.36.3 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                aiccu-20070115 | 1 
                    systemd-44 | 1 
                 ffmpeg-0.8.15 | 1 
              cryptsetup-1.6.2 | 1 
                 omniorb-4.1.6 | 1 
                 binutils-2.21 | 1 
                  fbterm-1.7.0 | 1 
               qt5webkit-5.0.2 | 1 
               qt5script-5.0.2 | 1 
                 cairo-1.12.10 | 1 
                  aespipe-2.4c | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/1ef2941350894e2ab6342a9f7a6d9cb840f838a3/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/00586fa675acf2941a39eed2a7e238d435aaa7fc/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8fd8e249b0629c29934826cac9937263be837ea4/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/096feacc0e5c8623be4d43b2ae787362c3d3fbc3/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8c767c427a962f7bc1fb222bbba8b5a2acb7e100/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/074cf094ae83dda64d52421a45ea651e262d14b5/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/dbbce523ae2dfb002fdd9212e056386bfcdb43d0/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/1fefa8b4fc1dc22e3667b25b0d93d3f30424629f/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/615495c9a3d55e2c3f46d3cc86678453ecd95ec6/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/4a73f7380d493359ca1593a5c6a5cc8d11fb7cf7/
       arm |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/fcb6990eddc655a6d087980794740d01bcbf0618/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f96acc2bfb88aaed82093c4aa989ff01e43393da/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/a1b30fe6ee22859e049f8312db8cffb59158071f/
       arm |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/3f0f8237fb2a5dc159732d0f201b71392a0c735d/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/956f528d4fecaea314dc26f82f742afc25ad74b2/
   aarch64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/173bd7467e520d24ba0477d69b4c3044bdf60713/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/234653f0f297c7583d60053937c5259511335386/
    xtensa |                    git-1.8.4.1 | NOK | http://autobuild.buildroot.net/results/9165ff9669f3fa83a7633d4b36f08f0a73efd64c/
       arm |                   gnupg-1.4.15 | NOK | http://autobuild.buildroot.net/results/1dbf1afbd818f9b8b1226b01ed5209eec3cfbe82/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/dbfb9db833ee520100e18743a2eb8db372ad3bee/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f0a31035638c089687ca4d7e190db1cd48ed254b/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/574cbbb3a0b0612b11c3abcdf5c6f934e695cf6b/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5d99eb90837fcf16302fcb9ad593bdfe7ab6e192/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5900131c43577e18fe48f866355e639869cce8c8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f10fc655880f08c96b61668bfec8a5efc9681dfd/
    mipsel |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1dbc9ad64fa304a7ed5a25a74a9869d5ec5974fb/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/4680dbc6afbad5f3d431fe5ee1bc0100e1ff70c7/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/ff3f7bd8f1302907b7b4fb820ba5bc8a4aeffd3f/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/69875a9231074184345e496c80260255419500c6/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1cc45ca10751acc16a866da652bc12e62466f54e/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/40c2e4ba1a820c39db3a76e881c240febfccc89f/
       arm |            mysql_client-5.1.70 | NOK | http://autobuild.buildroot.net/results/9c08cc9ad891411c7736b71368e1c741bf236b35/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/a9d5872a9eef30857021e419b463138e50e912ee/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/79d03a71213aef93a531313114c160fbf5215a42/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/b35b9b52b58ba99e14c507d9c21138993e004926/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/3ddda6585c5fc1f25656409eedd6ac9f4e9f021f/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/6a7f816bd5b4bf00d8f8aeba0ed8ac5e26eb9a6c/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/c38eb5f1f596a2482a1db603d9b265d1915ea766/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/634d691a7507a0a9a9f51655497c4be2849a40ec/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/2b33ac5d20454f419f2c865a206a01cc8b738d5a/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/983e28293b3fdb8dedadc385e060e581719590b3/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/d1587ab584b955108f27d66ff4276d923976aef8/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c8ad5994630534eb4ee72a468560c545a072e82a/
       arm |                pcsc-lite-1.8.8 | NOK | http://autobuild.buildroot.net/results/79f28b6e36fdc07c3789bcb36d6356674c73e8c5/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/3b961c57a0dab987255ba1110ba1d8af499f4991/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/46ba061f558e106e01a1eceb96ca779999b4ffa7/
  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/beb3985b8282bffe2b67ae6ed668afd36a17ce1d/
  mips64el |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/7e9f89cf2b0c1af19c8f469320b7711b87ee919d/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/970275eae59315da7a496e31cba60a247106de3c/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/3dc9615d9ab29565b48f5ad4a78821b58d49b872/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/91289fc77e7dc7ed6342414df91c35d78d7eabc2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/30702b6bac23674d0a6377e418761a0c1e6efb48/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/28cf3fee4a38b6b1e44dadc871b9b5decb7bcd10/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a3eb722db14b220695cd4320f8a3cd941c557937/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ecc688e0a0fde061cddcbe9e6e82f36d71f87b5d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eb3054d4f8895a5c3c3991743265f806adf78522/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/00ae7a44b4ac928bb4c37fda03241f9c70fe49a9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3995056a3be8cd209b0d1f3e135e0ea12cb1ce46/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/950ecac6d3254a7c0efda8eb90f79c7539c8a589/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/3508d8a5d76bc2de45494cf84f81a1254e07278b/
       arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/5087c57fa6efe5ee0b1cd9ec290d65bfb2c6a042/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/8ce554a2476d9c75ed909fdd6c6899dee018a976/


-- 
http://autobuild.buildroot.net
