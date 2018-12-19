From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Dec 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-18
Message-ID: <20181219070027.8D03420834@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   4 |   0 |  20 |
   2018.11.x |  20 |   0 |   0 |  20 |
   2018.08.x |  17 |   2 |   0 |  19 |
      master | 106 |  65 |   1 | 172 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
neardal-33b54a55032b047fd88... | 1 
               pulseview-0.4.0 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/974c6b8af7723cc0bc02e3563503acf138b7c3b3 |     
        or1k | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/ab153dbdcb7cf99ae8685153455664fe6fbc5a05 |     
         arm |                pulseview-0.4.0 | NOK | http://autobuild.buildroot.net/results/e32164284d79b4bb814a962907a35fc45bcbb89c |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/89a88f0711e34d50aff27091ed33f687071c585f |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/815c1a23b519f019d3306103a4923198d7ebbac2 | ORPH
    mips64el |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/f14fa1bacb2b6af40ec37214579d7e84390fab7c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 22
                   netsurf-3.8 | 7 
   libtorrent-rasterbar-1.1.11 | 4 
              drbd-utils-9.2.0 | 3 
                  linuxptp-2.0 | 3 
             bluez5_utils-5.50 | 2 
      libva-intel-driver-2.2.0 | 2 
                    php-7.2.13 | 2 
         xfont_encodings-1.0.4 | 2 
xfont_font-adobe-utopia-typ... | 2 
            btrfs-progs-4.17.1 | 1 
                  ffmpeg-3.4.5 | 1 
                  libssh-0.8.5 | 1 
         mono-gtksharp3-2.99.3 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                          opus | 1 
                qt5base-5.11.3 | 1 
                    ruby-2.4.5 | 1 
                     squid-4.4 | 1 
               util-linux-2.33 | 1 
                xapp_xgc-1.0.5 | 1 
                xapp_xmh-1.0.3 | 1 
              xapp_xmore-1.0.2 | 1 
           xapp_xvidtune-1.0.3 | 1 
 xfont_font-adobe-100dpi-1.0.3 | 1 
  xfont_font-arabic-misc-1.0.3 | 1 
xfont_font-misc-cyrillic-1.0.3 | 1 


Detail of failures
------------------

        mips |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/fb4b2ad04db4497bf8366a5521567865169eba05 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b7f7808ebe58a2548d432b1d0230acf9546fb8cd |     
      xtensa |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/44725b591bc9dab0a42e8fd835b2101568285684 | ORPH
       sparc |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/326c875cd8b97a40b20f98b3fb5280390d1d6b5d |     
     riscv64 |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/5c824b3a1dcb2dd64739d13e31d2b5ccfe7f7a36 |     
         arm |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/9c8c2e2a79bfd59747de1eac7ac2ae5988f7b4c7 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ef204b1b10fe1b4c15e8187b1c5c57192a8f7a07 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e8a568b489372b99e2a0d21cb9db0e0546974d2c |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c8954b003d528242088670adba78f0b691f30d9c |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/453401caf75dee153818f0d699b97795d4e5ee43 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8810523dff49575c5e0c7c682b695bb0b45ef8e7 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/216b15d3811d4b125fb24ef9b569023426e8706b |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1e700bc18b70ab267a96377fbda0a97170d6ff9e |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c9a27498e67cc4b7ce92d355ca3054d8d9ee30d4 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/49f09fbd3eba35d2349dfbb4e183cd74eba80972 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9823ad2a7f02e0dc7c4a86ba8a15388079d7970f |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e6394cd32bb69ee78e13e8536d366caf420ad44c |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e2931000bb916080525e49d8d2b30bc7a4d235f7 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8ecec7e6b90ee9b830ab72f2ae79dcc46637cc71 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/63ec33650fb1c6bfcfd033b574eec6810d08d405 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/72e6bb62d189a3024bcdd32818d8fe62d6315d02 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bd09fec2a8c23fca665a452a1617fce7f31a5f3f |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b86870e1569756e2b9b3762e9f2562e639eb380d |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b4db11db52b45138658137a2647c0c6b3853d611 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/03556396fea8752eb17dcfe32a0d822c9c5cd9a0 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a22dbb3b2310a6943c05f8441c14f82693eb03d5 |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3a2932729a30db7a67db69fd284444bad04516a1 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/cb6ff2259fe6c8654f244a7df5bfee9e11f8cd3c |     
        mips |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5f6beec6d5b981a3270dee7597e08943b57fef4c |     
     powerpc |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/1c4731ffa382d178b6562617fc8841a123687a08 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d43eab253dc0d00aead86672a31bb0c856b9bf39 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/1c007388cafc8226fc6b25b616d65fb94650856c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b0ce6d43e044504655d65a10475274b7435357ce |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/92a2d1e2cae4a88cd974ff8396bea1f5ba9242fa |     
        i686 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/d605eb10e29af1053bd3cc18b2400003b6b8b4fa |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/f3a57031cfaa4aada8aa06e742523903d68762e6 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8628c8151b806e5cbfe1db389f021633dc64c12a |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/45dc143eb4b5b1988f9e3ec56e65eeb72dad6f98 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5662110c451d4ef766301e35d228faacf6a70eb2 |     
      x86_64 |          mono-gtksharp3-2.99.3 | NOK | http://autobuild.buildroot.net/results/f7b3d22673da8e920d517fff3954dd6526f17a23 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bdbbb33ac1c26498270566bed86c520bf8f796b2 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ed419b37cc9a70fce8e73a1e85b998d7c4462616 |     
     riscv64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bad1b55c0f4f3d9419ee1bf21b462755a496a1da |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4244c36c915008b0ba0a39bfc60f585f358b5871 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4967e750197d4ff5396d8b0975d9daa4efc6dd9d |     
     sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4a4fa2a7ff6b56e9e315eae4e3308ff4388027f7 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c8acdbc2655214dac926ea4258a54a93d95a32e3 |     
     aarch64 | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/4322cd28319e7c3c6b10feec14bb8b151024d73e |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/a7979c5e6f7cddfbd6c8050ca683a7133a07de98 |     
        i586 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/4cedee85479e81ea78fdfe1899b8097340e6d3fb | ORPH
   powerpc64 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/67508e496eed7cbdd707d32176a4405ca680b4a4 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/eb0ba16a36b953e6120423397fe73546071511a8 |     
        mips |                     ruby-2.4.5 | NOK | http://autobuild.buildroot.net/results/5e7fcbc6670b293e7078d33d42aa372085499e8c | ORPH
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/1ea6870367a42d2cba472afae688925156a6f104 | ORPH
     powerpc |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/60c1e825afd4263019aa8c225649b0e63a9c5b85 |     
      xtensa |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/a04860f622f6d4e9e84a2994bdb961c215c3bc7e |     
     sparc64 |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/d58a85da2319cb4866927cf3f0f14ee48ec753f3 |     
         arm |               xapp_xmore-1.0.2 | NOK | http://autobuild.buildroot.net/results/f6733de836c7eba199193aad0d94f4605909b959 |     
         arm |            xapp_xvidtune-1.0.3 | NOK | http://autobuild.buildroot.net/results/3bf48c1d644cab5acef0ecec0245a26acdc41231 |     
         arm |          xfont_encodings-1.0.4 | NOK | http://autobuild.buildroot.net/results/7a6b0068d6f4055b939392ed859b43acffe27842 |     
     sparc64 |          xfont_encodings-1.0.4 | NOK | http://autobuild.buildroot.net/results/9eb36f5165d622b9afa05897911aeab25452b2a0 |     
       nios2 |  xfont_font-adobe-100dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/672b7e297a35fb87a361a6ca160ae52582c00d36 |     
      x86_64 | xfont_font-adobe-utopia-typ... | NOK | http://autobuild.buildroot.net/results/32c4bf2273f4a2cd431a79aa938fc222dc611d8c |     
         arm | xfont_font-adobe-utopia-typ... | NOK | http://autobuild.buildroot.net/results/33c38a643a930b3f461478b5c5112a63a4991c52 |     
         arm |   xfont_font-arabic-misc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7acdd3fa44f5a919d584cfdf8c3937e0afb5adba |     
      x86_64 | xfont_font-misc-cyrillic-1.0.3 | NOK | http://autobuild.buildroot.net/results/3968491d111c998c6091f735800d035e74666a60 |     


-- 
http://autobuild.buildroot.net
