From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Nov 2017 08:00:38 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-31
Message-ID: <20171101070038.CCE4C21D3E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-31
================================

      successes : 99 
       failures : 60 
       timeouts : 2  
          TOTAL : 161

Classification of failures by reason
====================================

                 libdrm-2.4.87 | 10
           argp-standalone-1.3 | 9 
                     nmap-7.60 | 4 
                      qt-4.8.7 | 4 
             core-dependencies | 3 
                    gpm-1.20.7 | 3 
          usb_modeswitch-2.5.0 | 3 
                  boost-1.65.1 | 2 
             dbus-python-1.2.4 | 2 
       host-go-bootstrap-1.4.3 | 2 
      host-uboot-tools-2017.07 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                   jimtcl-0.75 | 2 
           oracle-mysql-5.1.73 | 2 
                  dash-0.5.9.1 | 1 
       host-erlang-rebar-2.6.4 | 1 
  host-gdb-arc-2017.09-rc1-gdb | 1 
                 ibrdtnd-1.0.1 | 1 
                   libidn-1.33 | 1 
                  libsepol-2.7 | 1 
                 mesa3d-17.2.3 | 1 
                openjpeg-2.3.0 | 1 
                openobex-1.7.2 | 1 
         python-gobject-2.28.6 | 1 
                  tremor-19427 | 1 
           uboot-tools-2017.07 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a9cedc54829b7bd2dd7ae6ff2bd6c6db242f1c35 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/563cb6d5de981e72969e683cf547d682c3ad763c | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/bccdacf6832423d02bd901a7cf4a95aeb2997ff4 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/fe28c8b704e9bcaf72fef7accc1f5315fb9adeb0 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/65f2d771389e82ac0a7fff1561ffbfc834b60f10 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/08c0d86282018d71c1b2c00834c3c6d83d6c73ef | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7548b8a88f40f7a0eac4b0f38e57329f7589969b | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/bd10d08fc3ec168f22174c8412b35f5cac220ee2 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b52b3324c9adba157d7bfe0245e4b493ce9bb0a8 | ORPH
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/76b4afbb9fef1a84c2010742df44d6719d766ef9 |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c6049923fc8a18b02de6ae9aead1435e2004fe05 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/66563f5517047ac86c537c6679708280883c9422 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/4909399dedd08dc798e86800bbaa526fbcdcb9ec |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/8fd16a3e06a17c476ae2a07f8eb13e3eb4e7444c |     
      mipsel |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/95052e3e7e332f43738171d2f1a036834b0763fa | ORPH
        or1k |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/bdade026ed0431b8d5afd520946cc52e26ff3a45 | ORPH
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0fc783f351a665e7169b45dfa1eb0559c792a50b | ORPH
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/806f41aaa3099b24174d69a6028ce00c2821be47 |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f3450b073c3d706a168d74687313663a0346c255 |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f438d1e14f186654948ab3c61d4b80de262a8d36 |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/fbcffdb96da86f19206ee6ce2357f20017a8c98c |     
         arc |   host-gdb-arc-2017.09-rc1-gdb | NOK | http://autobuild.buildroot.net/results/f39fbe3c86c0c6b61bbcae5050d8101024acc5d8 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/cddcbf42ee87ed9d1fc079ce9cd890cb8f0f7d5e | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/c20b44c83a87467f15b90448fba916f171696419 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/40be2990934b138112d226dc998e9ba384a3d6a6 | ORPH
   powerpc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8b64b7607c6e825f13f27bb539674b329bcc787a | ORPH
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1b6fd8c17cc04ab1ba32d456e15d7c770f88ed6d |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/15d685060f1ba0429f1a71edffc1ef13cdc5a722 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/f2eb21ba737a2194c9f157e43d5f5d4b0d95a137 | ORPH
         arm |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/e8205068d059f7ec6e71797c08d94d40e20332e0 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/6ea78c4c8c9fceb694b3899643d3500335dee177 |     
 powerpc64le |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/7e0ac0f23e8c2d30ddad0f10757830cba95e141b |     
microblazeel |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/3738938ea84b0fe108e932b9512d2332b14c6c08 |     
        i686 |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/72543f32b357d08e1b10ed376823864173296d3d |     
 powerpc64le |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/b4b2bc450cca46679f4463e688ffb5a5cdd4eb58 |     
        mips |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/8a3e28b74abedca6a5f9000e4904369c3164abf3 |     
     powerpc |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/e64e45b24bb87f3f6d85e2557d5e2f27f9748ad6 |     
    mips64el |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/2af68e78124cb98d2e00b6d5f5ac3c30613f3495 |     
      mipsel |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/9e5bd41e0d637e59c6049b5d9235c20122bcb220 |     
       nios2 |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/40db09dc0ab39c8576fcd024e776dbfe76a061bc |     
         arm |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/ae368c105282d4deb0d84cab6115d51ac0ac3e80 |     
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/4994dc079f67b2f57be701d7c5686eaa19089640 | ORPH
         arm |                   libsepol-2.7 | NOK | http://autobuild.buildroot.net/results/0a46987d60d77b7ac77ffd35a7c4f3e581a4f3f6 |     
     powerpc |                  mesa3d-17.2.3 | NOK | http://autobuild.buildroot.net/results/df04147dc15191a5f43d13049998388d1e78a9b5 |     
 powerpc64le |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/6b615ec75352d8f618f883988a2beb30917bb834 | ORPH
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/a47daa9bccf6cb1f8f876bd836fc4e81e9237f04 | ORPH
        i686 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f7b9c2f2a249f7b16048e593e505108aac940a19 | ORPH
      x86_64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/d8233e82b343374bab8eb908e6b8701e58345fd6 | ORPH
         arm |                 openjpeg-2.3.0 | NOK | http://autobuild.buildroot.net/results/0ea91c498d6a1011ce5440cba893dea8a551d742 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/b0fc6f4c4bb536fdc7afea28fdc4901fd4e028dc |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/eda91876e97d2c93ea9dbddc7d6f9b06ad7e35f0 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cc83c1d245665456b1fdaaec04a8c2fcab44c757 | ORPH
     sparc64 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/32bdf3075b78960a824b1b1f58061eccefaa759f |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f5f23392bc788ab9745b92e18dda89a78f76214 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/50c2c78c5d37a6e949abcd71408b0b353a437318 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2641bb167cdf9c0ffb5619deb2afea03972ae3a4 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0b665d4572724ecfd7d8ccf2a8a9b26fbe011f1d | ORPH
    mips64el |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/d451723a39171e31ac551ced81e43c3d338afd3a |     
        bfin |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/294a10f4b7c45cf21f227812f29f4b00d54b0d85 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/c4195c83f545024e11fe1aebddd41e63835c4b56 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/7351db75047331237c6f7fe1858646dc73b22207 | ORPH
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/e5323acaab1bc6c4b1df28874e04337f5b5839d2 | ORPH

-- 
http://autobuild.buildroot.net
