From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Dec 2018 08:00:56 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-11
Message-ID: <20181212070057.002AE20DBC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.11.x |  31 |   0 |   0 |  31 |
   2018.08.x |  38 |   0 |   0 |  38 |
      master | 116 | 152 |   0 | 268 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.4 | 29
        glib-networking-2.50.0 | 22
                   ccid-1.4.29 | 21
                      iwd-0.11 | 15
             bluez5_utils-5.50 | 11
                   netsurf-3.8 | 9 
                  ffmpeg-3.4.5 | 5 
                  linuxptp-2.0 | 5 
                 mesa3d-18.3.0 | 3 
                    php-7.2.13 | 3 
                   libva-2.3.0 | 2 
  vdr-plugin-vnsiserver-v1.5.2 | 2 
             xapp_bitmap-1.0.8 | 2 
             xapp_oclock-1.0.4 | 2 
              alsa-utils-1.1.7 | 1 
               asterisk-16.0.0 | 1 
                 dmalloc-5.5.2 | 1 
gstreamer1-editing-services... | 1 
             host-grpc-v1.16.1 | 1 
     intel-microcode-20180807a | 1 
                       kmod-25 | 1 
                 libdrm-2.4.96 | 1 
                  libftdi1-1.4 | 1 
            libostree-2018.9.1 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                    owfs-3.2p2 | 1 
                     pcre-8.42 | 1 
              pcsc-lite-1.8.23 | 1 
                qt5base-5.11.3 | 1 
                     squid-4.4 | 1 
                   strace-4.25 | 1 
             stress-ng-0.09.47 | 1 
                   trinity-1.8 | 1 
        xapp_beforelight-1.0.5 | 1 
            xapp_viewres-1.0.5 | 1 


Detail of failures
------------------

     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/d7f1f368f11da302d8fa2b9268d5ea7bd737b5f2 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/826b3cdd34b6681e57af74fca4566267f6e9d586 |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/543d79a87b7a1c105447e8689f8016fcc695cf82 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/483bd3865d628e9d1c66acb08818f3c999835ef2 |     
      xtensa |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/b080e874b6166ba30f26f118c794c4530776e13b |     
microblazeel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/db8061f998b36cdd9733a3ba61a864b6112ef179 |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/8dd847be33e36bc3c5464600939905dcbddcc82c |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/9489e59a4fb93ba1bd227fbcdbaa34f58b893def |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/82ec9a09398aa24bce1a5cfe711cc25116d1fc4f |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/3c950a9576c6daf2bac571920e019761c54f0f5e |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/62bcdb743d7ae5faf4f1eaec97f9a9fbd01d1e76 |     
      mipsel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2d6f8f88a0cab234aa56fc794ca9e73ba5a4ebf7 |     
      xtensa |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f44bd472431f5f2fe1b1e147238a2ef2de82cfd0 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/e09fe021ba0bc480738cea1757196db513d1aa37 |     
microblazeel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2577980fb742d8ca535d67c15f6d94a6afdeb051 |     
        mips |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fb0b9f9b06930c00076455ffd5699df6b7b3365e |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/bc6b5aaa3debe2695c827f1616e75ba699237c54 |     
      xtensa |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/4795af687b128ea671ef0f315eaa8e8b7e1f1a72 |     
  aarch64_be |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/8a517102f6ae23a36e352194b900681ffd2e959b |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/dd85268b262260d748cf3969acf7f878e19c2a8e |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/e3ababa679071c6c8325c5e8e5c636c78e8d7b91 |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/c869da7e1b380bdb4166c83af85bd3d91c48152a |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/047b0fd6886e2a343ba91a635bad68358a34cb26 |     
      mipsel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/999a526c72a24613c88836eee8269d19fb526819 |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/89ca65684d463039e693b926602996618538b2e5 |     
      x86_64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/050656be21b3d2acd77273b8a486367081d5d458 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/97143418ad1e9dab59470730a87639516e44aea3 |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/e252a86dd29e6bc703cc9d01e7579cab3b04e340 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/db5b46701820283defc4e6bcf1c7c9ed5c53b705 |     
      xtensa |               alsa-utils-1.1.7 | NOK | http://autobuild.buildroot.net/results/3179530f9e9db25feb184707f6f53973432d840f |     
         arm |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/d9cbc66f8a616d449fcfb73d00ed1e44b350b6a1 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/afdbd2ebda31610cdfc39a8a9f969f1619754784 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/6531a295c03d8cfe32b7d0d2cd7f1a0984b13004 |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a83dffc216748bb6566ea6dd7a294ad05e33ba92 |     
      mipsel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/919f9023c66c141955c3c47d232078fb833d8659 |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/97e217c9e6834e19198a97defc4c80da6eef9f51 |     
        mips |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/981609b5620d585f46957dc5d30d644f3a4ae8dd |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/4af913718dec4a8c8afd648e2f9685cc7f5b41f7 |     
       nios2 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/65462e67058076fd3ae4b5052fb4b92aade41c92 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/2740f1ac7814405cf24a27f2516474128844a404 |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b1fdc726b42b2fe28600f5a7732c12e1d3b6f35a |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/36bb8dffb912c727ec3bf16170cb527e1cf7dce8 |     
     sparc64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/5b8eeab5c8ca6e7e9525a9d773431a73b9f0a0c7 | ORPH
      mipsel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/f7a8a88163bb27b2a90bbd320ed4fcb6677b27a5 | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1fecd8ae1c4526da9ed6ff22cd146ae3186b750c | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ef45b0a43639d7409faf227dab0154784529a5d4 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/a9d0f8a39a83efe68127e1139e45affd501e13cd | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/012b58a019f2dc264ac6c3bccc2f11a7064a57c0 | ORPH
        or1k |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ea24f964294e49515cf42ea0516c039b91c671a1 | ORPH
       sparc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0b3a5668afe5b443bb42dc336662e81a8f8e2810 | ORPH
     powerpc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/51e7aa066a1d7f3251a7a98f04b6de863405ae9b | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0824b1d19e33f6d14a50742b489c03a345b4716d | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/93f5dd82fd871d0fc7a277825b972c215f62a233 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/9b9071a803943dcc7b903e48f684c2381c86344c | ORPH
       sparc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/180d5380ed9e08e21db078372e2720eb09b9a840 | ORPH
       nios2 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/5c2dad837b7f13d192ec479fbf744d5e801381e3 | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/5309d2b6ed46ed503bee657ca018b3a2b2f526c0 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/16132da942d12f806c7d0b055d21811180dd6a4a | ORPH
      mipsel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c38c050733ec1b6162fd5b0b703eb2da99f1bc54 | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/93110cf2663e32815f394ca772c1423e92a76e2a | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/9b889f15bc0a05e04711242c15d831be82473f02 | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/9a5c10ba53579fb7b0d1c427d8bca4a555dddd49 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/043b1a3654a20927acb007136dc0ab47a016b473 | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/6653169c21b01c8cd485363b7e2161416f4b7654 | ORPH
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/edbc6364952dc525d448026620d2a38a3dbdb087 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/69bb37c6d8f1e7be980bcc29af1adec9e81a3098 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b925a22ef8148d6860195cbca5a5d2023eb03bca |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/73f72248555f33a94190ecda63ddc87365e61839 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/319b4916cb8690a30c9b9d008c83cfa0def20809 |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/62de6e5ef9cfab115b736961ad1dfc975610c1ff |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b3f43ca9401f5a46c54b1e10784292cdbd4c9795 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/714c35fc2f8dc2ca0d911c4879a300bb38d1337d |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6c78ccbddb4cb7fe170fdbd4f059f1a99cce9389 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/01ad257bf33916085217c648fa4cd63c9b85d4a2 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d9c6a4a777ef3f55c996e32836d71b78740ee0b0 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/cfbb13b12a53f9d2575ffc3f91abc483e9c42e7d |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e2e144ca09ca4f75ce05e39754001a48574371d3 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2efa18dfd32e5d6de214802afd318aa93e6e90e3 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f5ad1dddd8f12b1e5c3194fa539aaae00ed4c8e7 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/06d86cfbed6e1052e21897ddf424c9e3a88b1c91 |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b6b01a83b8dcd33967f4691ca8119b6fcb875536 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a059b6f25a8b3ddefc41a420ee6b41a310a7ec6b |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a748bf4ee0dbae0a66f190fb73b7edbc1078139c |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fc2fd88c00cd0946b59fdc74e1df84ebcdecc0c2 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/378e57c6ac056748b5f1867f9e9af11c0e90dff4 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a09e5db82569c24e48768af03490276482c54bf7 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5d0b6dec08ccf612917e191959483b3a01663d63 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/922275d7712f58d2b76f9672e156d6cf4ff1c854 |     
        mips |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c8f41071609f6aaced90846c74dfade46261b4de |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/986e59da1044ed2f1594389587f037a344ccb881 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/744845a0dae26568b2ffd6326d4b8e6d3a4ff2ac |     
         arm | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/66a2ba8a9ee2b3aba658fe5321766e527676ba9c |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/768bedbee285c7061af498e21fdc0251497c9f45 |     
        i686 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/aa44f9ff90f296f886be6309b3355ed075494fb2 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/81096eb447b1c3ef4e27e686e38873eb1472289e |     
        mips |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/5b06328693b2c61f4b16026e8fd2698a6935422b |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/bfbae25e39035e27ee7d1809989dfa82810663fe |     
         arc |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/38e0e401d249b9eed204d8fcdee44f7da1d36160 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/cffb46aeee12c4532b40400b49cbe624e2f97c9d |     
         arc |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/973713f049b087db2e940b4a8b7c89d489fde752 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/89f500873eeef6cd36dab1a88de308927a64ad81 |     
     aarch64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/2e0b999ba37c3c98070951fdff040ec4c7d5d6b4 |     
microblazeel |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/fa40d33b18c2413251de48faf7cc7230bc3542df |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/dad2f0f46224ddf8e8b55f2072a0255b7a2132b5 |     
     riscv64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/34c66a9a7238b79ad2b17a649c01e09c2c40f7b5 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/f10aeec920f15634ef5044611aef7bdab2a98d37 |     
     aarch64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/0c233820d84c3aa09da39c774b00be98824a9447 |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/893059fb6a38593954b2b9fe7e6de9e7b8eafc33 |     
         arc |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/6586745f740129ebe838ecc88ced18aafb2545fa |     
         arm |                        kmod-25 | NOK | http://autobuild.buildroot.net/results/b2f7b24d1a30bd3fa097524e0ae0f684ca5d2441 |     
         arm |                  libdrm-2.4.96 | NOK | http://autobuild.buildroot.net/results/77363b8a349e7e030007c84ff91d90c1c022ed79 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/8854ad75e425ac0fe548921bc67242f425bbb9c4 |     
      mipsel |             libostree-2018.9.1 | NOK | http://autobuild.buildroot.net/results/087f5b0dda5f732cfa9de7afd03879e5c6330789 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8508e03aadc64ff92a1a264897f19618a9cb59ae |     
        i686 |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/836d3a7085c576f607b1532d5204a54d6c2c1e66 |     
     aarch64 |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/8b462285e672f6e191d4b3cfa864fb232fa31ffc |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/49547509bcaa11fd117fe90f3cac26ff2f02f3ce |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a6bb6c044e2e96e084b9ecd2d967e1f1a8e60281 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/98d7b4ee0626887d389fdc1e0ece99eb8ec4cf25 |     
     powerpc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/862cab2335eecece532b10a4edb6f7fedb41a04d |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/bac9da348abd5b90549cc258b270274bec77a9c6 |     
    mips64el |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/2103057ff0e0b22d67a2ae3f0a730f481487512a |     
         arm |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/cae2053f6420a81f78724198a8495c7e288102b2 |     
     sparc64 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/8700ea2f1c649657996102c15cc2730caa898e8c |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/50070515e43eaaf7b76cc7ed61cb6aa399785fd7 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ad4ac72df53795ec1d348133ea9a4fffb0586230 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/58bf2447c27ef646312d31bc77e91f0fdf144a03 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e778d11ad6a6cb38007ba63f0cade97748bc1dae |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4ef39177d98f0cefa9aaed680af1485cfc0e1a89 |     
        or1k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0e41da2e13c6f4da4c04f25fdb623cb27da2ecb1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f4b87ee9306550c79f40cb3cb32c08f09a89c29a |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2719215813752f947bdc91308df6d17ca07bfd6b |     
         arm |                     owfs-3.2p2 | NOK | http://autobuild.buildroot.net/results/43f9aacf39494cfb46cf2de3a75f6d16b780c18a |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/b6526b4ee409532f7a692d8f877503e114ca522e | ORPH
         arm |               pcsc-lite-1.8.23 | NOK | http://autobuild.buildroot.net/results/3113b8c20fdf41637f1e7831a15910a132e7a15b | ORPH
      xtensa |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/ce998c88623da2faf51478b4d0a172d8448ea31e | ORPH
     powerpc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/8831b327bc460ea721d58b9edb3b951f339eaaab | ORPH
     powerpc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/f411382219680c72a53b698d99e643e9949001f4 | ORPH
 powerpc64le |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/9242beb1146a5e1e4f568156962fa37cc05ee427 |     
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/475639b52019693cb44178ec0516440c7d01a96d | ORPH
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/78666c21a478c683b942a89de23cb8142c977292 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/c4275b2fa2d471eae8a4fcb87800b998717cd995 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/c7aa75fd8faad7ac49492497807d1a7fe4c4f955 |     
         arc |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/58c3125abccc288b910719a6147311364e71aa40 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/42b7478f228f6d0290599392b9bd40217598c0f8 |     
         arm |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/32cb2d8020de5612d66c9b2b0a1af67c9c337b23 |     
         arm |              xapp_bitmap-1.0.8 | NOK | http://autobuild.buildroot.net/results/76ca4cfb61acd88590cbace58e911ab41a67d10d |     
       sparc |              xapp_bitmap-1.0.8 | NOK | http://autobuild.buildroot.net/results/99a485401b4bb4c0886077d4bdaa37940fb3aa00 |     
        i686 |              xapp_oclock-1.0.4 | NOK | http://autobuild.buildroot.net/results/77c57f68039b4490e70a3d15ca6f4b9e945d12e7 |     
        m68k |              xapp_oclock-1.0.4 | NOK | http://autobuild.buildroot.net/results/28fdf39c6ffdc132f7cd266812919fe4b91ac6d8 |     
      mipsel |             xapp_viewres-1.0.5 | NOK | http://autobuild.buildroot.net/results/84c42fe771c92c6ae0794ba50bfe22148727b6c3 |     


-- 
http://autobuild.buildroot.net
