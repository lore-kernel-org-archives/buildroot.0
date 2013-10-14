From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-13
Message-ID: <20131014063005.4E92252C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-13
===============================

        success : 81 
       failures : 69 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 17
               libglib2-2.36.3 | 3 
                 dropwatch-1.4 | 2 
                  boost-1.54.0 | 2 
                 mplayer-1.1.1 | 2 
                     m4-1.4.17 | 2 
               ruby-1.9.3-p448 | 2 
               w_scan-20130331 | 2 
                 ffmpeg-0.8.15 | 2 
              libsvgtiny-12121 | 1 
                      qt-4.8.5 | 1 
                 binutils-2.22 | 1 
                 wayland-1.2.1 | 1 
          host-libglib2-2.36.3 | 1 
                   attr-2.4.47 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                aiccu-20070115 | 1 
        liblog4c-localtime-1.0 | 1 
                    nano-2.3.2 | 1 
              cryptsetup-1.6.2 | 1 
                   ncftp-3.2.5 | 1 
             alsa-utils-1.0.26 | 1 
                 libnspr-4.9.6 | 1 
                 omniorb-4.1.6 | 1 
                     rpm-5.2.0 | 1 
                 libfuse-2.9.3 | 1 
                 libffi-3.0.13 | 1 
           argp-standalone-1.3 | 1 
                     gmp-5.1.3 | 1 
                 binutils-2.21 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                poppler-0.24.2 | 1 
                  libnl-3.2.21 | 1 
                busybox-1.21.1 | 1 
          host-protobuf-c-0.15 | 1 
                      icu-51.2 | 1 
                 netsnmp-5.7.2 | 1 
                  nettle-2.7.1 | 1 
               alsa-lib-1.0.26 | 1 
make: *** [core-dependencie... | 1 
                libiscsi-1.6.0 | 1 
                  tstools-1_11 | 1 
                 qt5base-5.0.2 | 1 
                 zmqpp-31220ca | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/b93ec1aa2be143bc511da011e487d89bb544c4c5/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/09100fc332717ca3726fc1cadf8e8dca31e4e8da/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/ec4c2910c8437ab43e91cde553143ac653890e8e/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2545f2ee7496edb54d74c0a569ee04a112e9711b/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/f71215413d4f10be82564ebec07362b0e374292e/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c948b5a7af3417e083dcaf9c2515a4e256eee151/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/d3ce520b2ee273c7dde62ec8527ba9ac9ed11a9e/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/69363b7dcc34b75d5df05e04f1eed4d36a70088c/
      sh4a |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/2ee2753221cb365e6f04a00cb3f050c03522fe6a/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/015bf217e7336c76607d905f6e4916e4c2da4561/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/4e2c3320a5f55272494781b3c1b8b06360043995/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/13fe7397e1e4737abb4fc286e35f497d0249a859/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/39b76b2e78c0e68036650f1529781fbbf10e9e2b/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/31de69c489c80636ba19bf36e7dd65811ff5f53b/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/3ffa4b31859df9a041b8ed921e225c74d33c9d26/
       arm |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/ec46abe393a86b0f68e4e55b6deebd41b8c7647e/
   powerpc |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/07e4677dbd247f0b01423ca9cafce23cb0983d3f/
   powerpc |           host-libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0abeb3db7de88a12dc68f7b5b6b88fcd4924e188/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/85c1939be06c0a88bafa0b36a45cbc1548461bb7/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/0cbaae5314e2f98dff9e6b5a51175e78b9067abf/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6faf74c71a51a795e35bfcea8230bcdde21436a0/
microblaze |                  libfuse-2.9.3 | NOK | http://autobuild.buildroot.net/results/67ed910c8e7d57d4ef1ace628adb92bb5cf15515/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/cc2802b5e3b89294b26dc9925acbb3196b6614b0/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6370109747023a18bd14042ba698ac5a05ab3f79/
      mips |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ead048976f285282e2a0411fed3462908f0d555f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0eaf027c46d3828c42c4cf9917d3cd8fdb866720/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/5b5adb4886d4710e2b9582e8fb2fe02554a71ead/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/7b21b4f0a6c388e7b7b5304df572e75c14a5ce69/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7b6bc64a9d0a48b7db83bbeb4705dc5dddcbd1b4/
   powerpc |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/88de25a8491f56320a171589327581b269824a61/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/70ac139a26ac71f7c891005e91bddd36b016b2d5/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/e93381c3852324e6a6f5645583339afa5ce41337/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/988dae249c3f68013dac149bd01358038c34b2a7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f4009999eec6df5084e3e398d7b497593411d507/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/8117767156fcf5850aefa01abbf0a423672c055b/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/51dadfebb405761119dd0f5025bd1bbfa38c47b1/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/2522a2f7b2f6e5ab5c41ca3066f5798d56426ca1/
    x86_64 |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/b0db23370b2bd1d4287a32363dcfc8e21769683d/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5e0dd5b195b477df57ca5b78fad76a88e440df8e/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/9a1c4ca746bd90d69ff831081aa58937cd15a7d3/
       arm |                 poppler-0.24.2 | NOK | http://autobuild.buildroot.net/results/daa18f112ddd08644b4149025899cea2b511a9da/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/de90fb5e17fd759a375c19bf923d68dd4da44225/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b6e47f9db620a5572908dc38e53703204ba14f31/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/3f78938e2cca46aea230796db71315e433239fb0/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/689a7ea92c017c1d4838a39c97c7e247d832b7e3/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/13bccb8167f228dddac8be8356255621017a03ed/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/71c0ede673bc5fc7aa19e3f5341c0a92506421fb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7703b55f728edba0a439095be0987a69438cdc76/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d4c8eeb49ef5140965352bc219209f90d97b7131/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a641f9950890aa7f6af5cea6848ebcddb5051549/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5dc02be93be0537e40dd4bcdc34b6f13cbb91307/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/884d9c0a7ceddec3d27c6cf6c9e796220d5298a2/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/54c3f4c62493fb755d4eaef9e7995fce95a48c47/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/21ced67a0a2efcb4b55a8b38ccb15cac16ef5b3e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fa6da8450c055f77555f87c575025d8e2b496fc5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4c0c9646939718e3ae959796b0d1eef2fb06d60e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/31ab57f914330e2809692ee0e32a3363bb462749/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8f448e58f35c815d09584d57d5a383028fe36371/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3430a4b975db354e25967c6ea9a853fd1cb17518/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6afddfaace9cc6cf8621ee445dbe458e9372e5d2/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9722a2ef3a16205a280b6109ed8cc61a3bcc4108/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cedf714fc5055a36d408739eb21340f7a0927f1b/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/980875810528ac1dee34b8c268d9b3c40b2e35ec/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/dc05a82ed3e9d1b0955a3b14242d24d9cd7f9326/
       arm |                  wayland-1.2.1 | NOK | http://autobuild.buildroot.net/results/a97a81ddd74103962113c20abceaff7bab9683a4/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/ae1b54aad78c5225b780a24c05a3f42d96819c61/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/475e42cb0d36f8b0e515bb914a0f66ba6ada427a/
  mips64el |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/41962ea7230492ccc4221aa3225a5ad8aad11066/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/b47f34c63086617ffabfa8383fbdf5c837aef3a6/


-- 
http://autobuild.buildroot.net
