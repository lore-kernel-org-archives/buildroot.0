From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 08:28:48 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-26
Message-ID: <20170227072848.7BD45207F5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-26
================================

      successes : 179
       failures : 29 
       timeouts : 0  
          TOTAL : 208

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 8 
              host-cmake-3.6.3 | 5 
               librsvg-2.40.16 | 3 
                classpath-0.98 | 2 
                 mplayer-1.3.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
               libepoxy-v1.3.1 | 1 
             libsidplay2-2.1.1 | 1 
          linux-headers-4.9.13 | 1 
                    mpd-0.20.4 | 1 
                    mpv-0.23.0 | 1 
        qt5quickcontrols-5.8.0 | 1 
                     xterm-327 | 1 


Detail of failures
===================

       nios2 |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/279dd731bd9ecf5f9d54bda3715caeaa7cbcdbb3
microblazeel |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/55eb89f89e96b94a821778bc18ed844af08b7460
        bfin |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/10a06db5edb5243658bd16a41885a20f7b8c7e67
       nios2 |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/40b6694bafd45a9249e80240b7dc88069fc94014
        mips |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/01be357e6d56792371cfcc3f1bdc03b6e0d1c4be
       nios2 |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/7482902ec65e68a5c1e47147d17a084857abdee1
microblazeel |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/bc95760f71d99c7bdb5608cb213758ad827cfa40
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/869e636a71c9574c0fad41cedf3d311f5f4ee8db
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/393145bc9bcb93d6df55ec8c63725c3d9a299957
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/60af583e52d9ff8efff1bc455e4f842721c5807c
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/492aaf78f4d47d80bb813810a54121799a5c8d46
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/caba78cc2706accc187a428364c0e0d10a1dcd60
         arc |           linux-headers-4.9.13 | NOK | http://autobuild.buildroot.net/results/803453df521f258932baf5729d5afe2a084121fb
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/7d70b62ad996830fbeca46dffcc7a1dc030e575d
        or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/47207dfd10ff6e5ec4ccdcf8454aaf5f408ad1e3
        or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c165c47f45f1e5488e718770c06993d30f32f8e4
         arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fb677a917545adee321bdcd2c2519c81326448c4
         arm |         qt5quickcontrols-5.8.0 | NOK | http://autobuild.buildroot.net/results/1ff3e9ad4ba518d0a37f9fc12038bf9020f28094
        i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/92f9a6b804072a521ad0b25086a0a5ed33eaf53e
         arc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a04ba24c6cd61bf6f2128a0e869f679cb3f2eac3
      xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/dfd568ed7eb945cd5e3b53a9c1baa3021049fb82
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c87376d08656e1528fc45cfbef536ac2072d926c
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/78053a5b1954433aeb52fd9cc55cd8ecbe84e7f1
microblazeel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b58156dd7fbf0842311e60cfb18163772557e33e
      mipsel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/38bb7f09f5b37aac7f536feca45cf6d2a8d50eed
        i586 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/d26b76534c3ef3cd98459f27ac06048fd6f075eb
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fc853251d8b3aee5289994f996bb6e47d0e5fb76
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/36c28e7e49b31ed2398a67db2e9b08e3aad5a3ee
         arc |                      xterm-327 | NOK | http://autobuild.buildroot.net/results/28a92049a6ceef005787c5779f77ecf3fe8ad642

-- 
http://autobuild.buildroot.net
