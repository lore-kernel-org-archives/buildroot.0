From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-06
Message-ID: <20130907063005.8E82352C1CB@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-06
===============================

        success : 57 
       failures : 80 
       timeouts : 0  
          TOTAL : 137

Classification of failures by reason
====================================

             util-linux-2.23.2 | 27
              e2fsprogs-1.42.8 | 9 
    trace-cmd-trace-cmd-v2.2.1 | 4 
                      qt-4.8.5 | 3 
                valgrind-3.8.1 | 3 
                 qt5base-5.0.2 | 3 
               libglib2-2.36.3 | 2 
                     m4-1.4.16 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                  prboom-2.5.0 | 1 
                  libusb-1.0.9 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  ne10-88c18f0 | 1 
                 ffmpeg-0.8.12 | 1 
                 libnspr-4.9.6 | 1 
                     apr-1.4.6 | 1 
                libtirpc-0.2.2 | 1 
                      pv-1.4.6 | 1 
                   mplayer-1.1 | 1 
                 zmqpp-31220ca | 1 
                 binutils-2.21 | 1 
                 cdrkit-1.1.11 | 1 
               binutils-2.21.1 | 1 
               nfs-utils-1.2.6 | 1 
           imagemagick-6.8.6-2 | 1 
                      udev-182 | 1 
             gdk-pixbuf-2.28.1 | 1 
             tvheadend-5956233 | 1 
                  tstools-1_11 | 1 
               audiofile-0.3.6 | 1 
               alsa-lib-1.0.26 | 1 
                 cairo-1.12.10 | 1 
               qt5webkit-5.0.2 | 1 
                  poco-1.4.6p1 | 1 

Detail of failures
===================

       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b72aa08981ab532b53cd428847d8a17b9db2f443/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/9aa42e38374203f13b1f5ec95b7a5ece8eecdbd7/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ec97e89bb609c4ad8816954f1b6771816ab53204/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/01bc62fef2b47abca4292bcbf8507cff6ef8d121/
   powerpc |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/c7b2b5cbe36726f68c062ec573d699fe7963d529/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/18dda2a146bb640683b5963cde64aa754fc4bf39/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b58584327a89ceb4f7445e28968936794a6fa15b/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/26ce9bb4b7f7058854a22462c6bd7732590882ff/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/e36b9be21f51dda59c9aaccb16333c51eb625be4/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/ddc7dfabea7f931cde9deef612f59de3afc4ba51/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/81bfc31d8c6f18e8483055109d4e1fcbe9f004ee/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/c620112109a3a18cefc497f1b1e318014e79eca1/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/6de6d625dd44cf2f03021e87427e96ef04d341f0/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/e6e72563ce9a98bc657d650ed3b94c0ae5ca3d02/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/1c9764cc46aef1141863cc0be484ce0f8c682971/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/eb508da2dfbf21ef6d14bcd844d9b1ee49d9bd4e/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/8c6bea0ed7a3e54934847c02534168a8c442daaf/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/309887d1abefd3c85ceb52d4549835345156562a/
       arm |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/58ca8b5bd54b03393f37026c4cc45799a5cc4d19/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6bcebd608c26c751b0d15b2efa78544ee4461f36/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b6238da7577f803bc75f55d0ecedd04dc6cbc2b7/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4f3d7550cdb4fdd2cc69716d5f850510dc9d09b9/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/25008a6f0a854e1e29a3340536eef817eeb5752e/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/0d760dc99bd505fad3c00979ab160b809188b406/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/28bdafea4db224ab68023a692973d48daf982905/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/e5d64a5713cfb48318481aa9cb9fa0838399c7b9/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/aa1a2a408facf102c1975832260de864cbbf5370/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/a47b74a701f49aa13a0e324096e88d869737c258/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/7ac32ded6a355fe86a4a29c7368a554e91d57959/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/48009025cd89d5d5b0c82d14950af179dc169bdb/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/b2d50c50c1db04ec0496d6bc81fe508e65c2364a/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/361fd5b555d89b2f41bb8165ae8410451c5f506f/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/fb0a2e7addf6c2e4cba5a47ba2a64a9ee0c01bf0/
      mips |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4019ae872fb0209cc2a83d261b96aeb042888e3b/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/d5ad37de80416fde19644d0eeeb958aa6c76ff8f/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/f53542e140e8e6c7cc76628228e21c0eb4fac2c6/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/e1aade97c04fc098b54206aa47556e0778f9f6a8/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/dca4b25a9bb7aa3361fd37ba048d1f7a7aaec64c/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c05acc61b99600aecc9ea61b69410ebb742acb8d/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/29d39031744be4f79e47da6b56fa38f038c31919/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/94b5b9ddabd943140db10006c18f834590d70f11/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/624ad7101b1535a00468a155191800488723ebcf/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f3223816b43787acec615098c7097293922ffb11/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3e2687db819cfbfea2a38e2537adfdeda5bc3493/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/d3a80640912a6ee9a74ed6dadb5e910d39b6ae72/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/473866163260a39cb5afcefad146f418c0b92088/
    x86_64 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/09beb5ec31fa35e06aed38e7a8f3c3b7a045c0ba/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/6667ad8aff80a31b84d3b9f81cbea64b9b11429a/
      i686 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/853960128aa09c55ea6ce418a7b768c59779a5d2/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/1be3d6dc5fa5f51294fc3550fa597391a7f8b13f/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/81400f33b9bddf8ef82d67ee8f5e140faccd4a29/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3f3f116ac2e9a8243795beb822d1f96fea75fe22/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c37edf81faa450661652e44ba661ed9d94e78dea/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/17b281d576b9eb83db4b621a519ce82d5a7f4aaa/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3ace2596e4ba6d55cf06e1f301b2a1ed6eafd50e/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4fdb450441744d8031a4010e32e536dc5ab5efc8/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/77e575a8a6de89fbadf9cc31466cd63734f920f5/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c08a627cba4a87ff3b8cdad7c8c31455053322cf/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/600b49ae48b5c1604272d36ce7f335e780a29bdd/
    mipsel |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/21296242d0cd2d82073a983cce0eb97fc3ed76bb/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/931a7e31e5cd15d044ef7510855484ecc561efd5/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8b78de8c4593bd4f9d9067dbddeac9c73d5fce2c/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/497ba9874a8b1c54c3e02102e3347f3e18f1868b/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/e49b52cdaa96ca639adb5af6d175f60c21f88661/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f6c3667065ab54facd553d5a4ba7fde6bff2efaa/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0c2d55029e783d2e4061193ee0cb4b55fb8826eb/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c1a005d4ddb87fe90d117c9da9ead8156ee2877a/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9540cfa5642f38faf6ae63f4170dd5545ab41e5d/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a91ff4499094c3504b29f3b39c5bbef5893922fb/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a7dcb76e3a6b5d6f05fa22dc0e2254438c9cc743/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/85f9cf74563e6fee531b8336df38e95af3650da8/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/25dd98b0b79246537b056fcaee55ec7eb095d660/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/81c0a24c0a7c02db5f420981802009015b54a982/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c450c2974681c5ee788879ac671433f9c9d7f194/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/edf99e5af8b98d6097bf702e3383c0b292f3ef38/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/3f0f64493262ecb52f64aa0002c40563191c7e52/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/907e189503aa262ad33f4a4058fc4b40f9adaf93/
    xtensa |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/4e7dff5b0e26006d3aaca1be71c89f6ab89f25c1/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/53b913688493f9034536bf4330af3582cca4bcb8/
      mips |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/d6fab0fd75e8eda7d31e105c05b1fb93ea2ca571/


-- 
http://autobuild.buildroot.net
