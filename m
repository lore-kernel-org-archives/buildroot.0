From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Aug 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-07
Message-ID: <20150808063018.735131014E7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-07
===============================

        success : 157
       failures : 53 
       timeouts : 0  
          TOTAL : 210

Classification of failures by reason
====================================

                 qt5base-5.5.0 | 4 
    xserver_xorg-server-1.17.2 | 4 
             libselinux-2.1.13 | 3 
dawgdic-16ac537ba9883ff01b6... | 3 
            c-periphery-v1.0.3 | 3 
                   tinc-1.0.24 | 2 
                harfbuzz-1.0.1 | 2 
filemq-482797b8aa30fcc9ea13... | 2 
                  boost-1.58.0 | 2 
                  opencv-3.0.0 | 2 
               protobuf-v2.5.0 | 2 
                    qemu-2.3.0 | 2 
               libplayer-2.0.1 | 1 
                  guile-2.0.11 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 mesa3d-10.6.3 | 1 
                    webp-0.4.3 | 1 
               qt5webkit-5.5.0 | 1 
                  bcusdk-0.0.5 | 1 
                  mono-4.0.2.5 | 1 
                 tn5250-0.17.4 | 1 
                  gamin-0.1.10 | 1 
                netatalk-3.1.7 | 1 
            libnfnetlink-1.0.1 | 1 
           qt5multimedia-5.5.0 | 1 
                    ofono-1.16 | 1 
                   bdwgc-7.4.2 | 1 
                 cdrkit-1.1.11 | 1 
              drbd-utils-8.9.1 | 1 
                elfutils-0.161 | 1 
                   systemd-221 | 1 
                    libev-4.19 | 1 
   qt5quickcontrols-legal-info | 1 
                      qt-4.8.7 | 1 

Detail of failures
===================

         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/46054f28d3fde173dd8f880fa8ac2784c8e1750f/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b0ef923267153f1df0bd863f7c5175e8ce1789c3/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2658feb999f457c4d88342f822c03aa7f9f983ed/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2e3e004d1b53e9b01d6071452ab2c95c1855f0d7/
      x86_64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/ebfc9a44a305ab45305f8b393761304576ae9077/
         arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/5322032525dff6a6f2c99ec09bff47b99566b2a5/
       sparc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/a5d34ef58d45be6fe0b6c8a71ed665d5dc29dfd9/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/66a5cea527ce4624b378e049243d0a8d89b33530/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/d51f51bb9554a8d4ae5d0f6e7de6533a66ccfe0d/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/38a6a6208abe10e8e159da970940f95ff8358b02/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/7faa7fce7b03be8ec7fd541535d74f7c6fe8a8fd/
         arm |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/631e7ecd468e258279486fc95844a0ddd328a12f/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/2e46630d655596aa13ee3704c4d0c5ac5b66d8bb/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/ee7eaf80247dd96548d66be9884b179e20204a98/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/e0fdfc9782c0529983d6a868dc17daf4035c20b0/
      xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/db049849f2011d444cc2b299f40313c73b653f18/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/5bc483843aa2f603f01795c9353c286893d5f839/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/701ec868bed18d18a99316c6f81c57013619566a/
        i686 |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/3dac814296ebb514b1dc086ae7fd7d0aa0a33405/
       sparc |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/dc02e3a1c94f06c3a8ffebbfe437b854600692e6/
       sparc |                     libev-4.19 | NOK | http://autobuild.buildroot.net/results/55d6190b60a08c9bc4d659cf009df52388db676a/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/17aac78e49d016b1044be4e600033b85a3420c5b/
      mipsel |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/fc0d3e8d6a819193edc414d5048419aad3fde8a7/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f252d616c90829304f5c5c4d7a25012b40769c62/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7f871263c2342e050034e359870cde72b6ddb986/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e92bcb6a3b671fe61453d5c616ef6e4e8e31a150/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/160539b688ac134784af885359515e5e8f1351a2/
         arm |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/79e55e64885d64392407e830560175c556953a20/
       sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/c7fc69066013a4f523509dd2ffd3154558cc60e8/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/0bed0779685d9ed83466a4d29a0281ca93043a2e/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/6df58ac5a4d224bde899840d37280b42e66f4396/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/0231c9d6bda7862970bb49e2b54d4edaeffb1748/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/6be3c49623d308bcf9888e0e7e4f52dac199f37d/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/a698f81ff4667a94c75592d907a26bbc8aca73d4/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/d020af055f1192876758d32026fb6a88240c0d5d/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d1c30ce27ff8cc6b19c3130f46a4109ad04bd74b/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7fe96e575bc7390af0e397edf5b8722e70d978da/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/54f32e19796dbcb62fd19768d1121a1e7f40bc91/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/86bd540d16b3ca8819eec1094bf4925216fd1f35/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/09f8575202cc8791230e6ce4a501183b26cb2171/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/b7380afc69646c5df1c84a6d6fc0174c3be32ede/
         arm |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/2b0b4c170dfa0d95c10bf030e6f249b3305dd318/
        i686 |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/3774f53e42b2cf8cd05a59beb7889234f17a6e0b/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/d98c9febc713404ee41ea494b8dbc183e25ce7bb/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/2b1aa474fc432f3f79b03c4577d68642bb7e0f9c/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/e16588f02f1f576e8769ddd7be997904fdfd5ba1/
     powerpc |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/d6a7125c21b4f92b69bb9e30b05c4727eedb63ba/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/5568935d610b58a9173efbaba29c6a644277e848/
        mips |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/21a1e4d8f01959c65b7feae2e0170e4a5afa84e7/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/f26018d5ad62bc7b61623dd173dc1e92e2c958a4/
     aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/2e12f1a91812f027d89fcceeb41d6c88ef7b9d32/
        i686 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/b9a3df05b479025d690982518f23f0bcf6fb7303/


-- 
http://autobuild.buildroot.net
