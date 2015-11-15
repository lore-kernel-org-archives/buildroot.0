From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-14
Message-ID: <20151115073021.9F51A10246C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-14
===============================

        success : 163
       failures : 75 
       timeouts : 0  
          TOTAL : 238

Classification of failures by reason
====================================

                  gauche-0.9.4 | 11
                   mplayer-1.2 | 7 
  toolchain-external-undefined | 4 
              gst1-libav-1.6.1 | 4 
                   ushare-1.1a | 3 
                busybox-1.24.1 | 2 
                  connman-1.30 | 2 
                pulseaudio-7.1 | 2 
                  ffmpeg-2.8.1 | 2 
               libnspr-4.10.10 | 2 
                   jimtcl-0.75 | 2 
                openntpd-5.7p4 | 1 
                    libuecc-v6 | 1 
         conntrack-tools-1.4.3 | 1 
             alsa-utils-1.0.29 | 1 
xdriver_xf86-video-siliconm... | 1 
                  c-icap-0.3.5 | 1 
                    yad-0.31.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                oprofile-1.0.0 | 1 
                  squid-3.5.11 | 1 
                mongrel2-1.9.2 | 1 
                  apitrace-7.0 | 1 
               dvbsnoop-1.4.50 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                  autossh-1.4e | 1 
                      qt-4.8.7 | 1 
               libcap-ng-0.7.4 | 1 
           bcache-tools-v1.0.7 | 1 
              libethumb-1.7.10 | 1 
                     fastd-v17 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
libwebsockets-v1.4-chrome43... | 1 
                libevas-1.7.10 | 1 
             host-nodejs-4.1.2 | 1 
rpi-userland-b864a841e5a459... | 1 
                rtorrent-0.9.6 | 1 
                   mp4v2-2.0.0 | 1 
                 mesa3d-11.0.4 | 1 
             util-linux-2.27.1 | 1 
tvheadend-1b682a46a11ea821c... | 1 
               linknx-0.0.1.32 | 1 
       kompexsqlite-v1.10.12-1 | 1 
             irda-utils-0.9.18 | 1 
                libvips-7.42.2 | 1 

Detail of failures
===================

         arm |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/beb0f71f5b60108146a09ac0d538391ba479152c/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/d636e88509d2b3494d2e2d2d2cba3bb9e831d145/
       nios2 |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/d46c4c2ceb596951acd52a0dc4f8f594203d3abe/
         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/a2b3d299fdd6fa6b284d62a446e861597a745e19/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/cb6d1ed5814d08e9e67164e8ef6e693ebec690ed/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/7c3b3cd77069b622f9caf7ed31b92102783a2ce0/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/99b5c2f79bcec00be212df7d8eabb8e206b01e2b/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/4fe642f55d9ae986c8e8466c448420447f58246f/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/f577589560f1e4571b2f29cbacafe5f1d59baf2e/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/fa1a418b7abd669da02deb7e7eba32d5071edde1/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/d8680c829dcb659471c751cf5f4192a2ca142a2f/
         arm |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/05c2760b7cb5ff1cf13df6757302f9a540abd0e2/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5bbc986dfc3e6b972d815d956e897bed2af5bf5f/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d1045c391f9107bd2dbb825bb856ada7844209f9/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/fd398b5e853e13ed549924ef1baef88f03a52558/
      xtensa | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/076ec2f60fd9aaea685e91f6a48e3790239e19d1/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/8aae7deb0072bd1c318c98ee8eb0b9d88bd90e9e/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ca56809c510e97b8c4535dc69c0c2ecfdf3b8f17/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e7fad8fd9a2f516e934d8d246b69daf8a7a7414c/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/5ed1581a76f86c9782533f8fe222e56ed5ccb166/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/db30660098580a56e5cf98f2620f0c5cb28b895f/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/6211aad66a6ebaca5412991afc52ecf194698adf/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/fbb2703227b4acb971d42794b3e237aaa7aa63c4/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/0a2fcd361a9ee3887223f3a7fd31ddbfa8716164/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/19ada627bb7442897f3f6c445de5743eaa7432de/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/bdd61ee6a8fad5653a8867fe13ffc24f19281ba0/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/9c46f820bf0d133100dfeedff67ce67546ab2421/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/bafb381b8472f14532b79b037b97cdd47fa77dcc/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/89e9f62b7f005a6e65f4f4bf0d09e64d7f6b0c58/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/1e81a23e03eb846c026b8c50a72351efa322e90a/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/97335137bf56066c78a3f7e9faba77a6d3b9f7c8/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/ca088239d03c4daaf92b942772d6df9846ecdc2e/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/92ca7ad9d44ec91b4f2dc11fa13dca853de29b00/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/ab42a947f5c794c942ae93e80e306f1dfd9f0e87/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/56928fee48e5b1f0abf908939b0517fd8d99b91f/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c29e49e31feb8163b60e1cce122b59a36f8dc181/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/262a696a50ede1d733978a58e82a663576aa93d8/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0e9d42116ff5ec03620d96d613792ca11875f0d3/
         arc |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/d32beb0898c877584cf669d05aa928badd70de8a/
    mips64el |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/0383f304a63128ce38080f7784f1c1528a59b9d4/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/5b73252bec77302ddd746581b247cbe0be741d66/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/1f790e824b57fc19a21961b50eab84fd0ec01bf7/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/6a511c02f60c6156fdd2c08e1bb1626591520758/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/b62bc30659f6fbbf5adf4bcd0254f5cc3d516c0c/
         arm | libwebsockets-v1.4-chrome43... | NOK | http://autobuild.buildroot.net/results/08648f3e49a094ccdd098cf17c0587dcbea1c39c/
         sh4 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b20dd34094b5bf54fe7497b10b55786ceb1117ef/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/bd8c26747645531ab04d54249865ab98c79cc0d7/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/54581bc21979a39769b238171b76ed913b30a9c8/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/2b21f6df6d821022028097f3a9fb60087def1888/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4ac4bac876cb9f821322294c27656e776f095db4/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d4203d4306a959174ac705d51002490b620e6adf/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/eda0ba806aea50f83b5932eda8fb5d71642031a9/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f8ddeb9fb09217a2ac84a708141a173e2f851599/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/28b7c8c564d63ff94bffce48b9c46147966639d6/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9620d21992fb656e2382430024482851656aa107/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/89cbdbe367fa072ba823daeb3b26d589bac72d0b/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/d085d06c49947a66da8d905ebdb424247dbf18d7/
         sh4 |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/566a369ec17404d9901554acc4a9348cca17c3d9/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/4adf98ee17cfdbbd6a0e0dfd9e395fd2a47ad607/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/c624b4cea0af788b2c64f666fda295e9ede55f6b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/41723af0550ba4b2e323f1bf6e6a500f959af1a0/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/c7355492dbde653d15fe870f353e05e3e54463b2/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9aac74e03dadcfa376238e4f7d3e55ee99792eca/
         arm |                   squid-3.5.11 | NOK | http://autobuild.buildroot.net/results/ca9aeff7d15b7b8523d410d0fc0d6b96581ce2e9/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/68cefb59f2f50a526f48f193c90298c447dd92e1/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ba1878121563b22b04823db00f161185e0c8513c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/eade51269124836254f089df8fa57d836785e349/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b36319948e201a61b16e34ba345eff940173a590/
       sparc | tvheadend-1b682a46a11ea821c... | NOK | http://autobuild.buildroot.net/results/517e808d6f70e200690969db065baa0943dc83a2/
     aarch64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/1d4d621f3bd7862a75bd7e95e275ccb6694b54c9/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/a88ae349d4d7cdff4f15c8ad9e3a1eac74dc6c4b/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/140767a7437b60a62f553ab49c104c37a4949c6c/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/45b8187ea6e3fa9b2941f4527e01932c6a868ff8/
     aarch64 | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/487be5bd5ec747aff33d05e48cf6f6f8272c0484/
    mips64el |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/f933c6c7cd8af4090d47fafd2053f8dbc5bfb69d/


-- 
http://autobuild.buildroot.net
