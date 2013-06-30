From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-29
Message-ID: <20130630063005.C7C1952C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-29
===============================

        success : 62 
       failures : 73 
       timeouts : 0  
          TOTAL : 135

Classification of failures by reason
====================================

                polarssl-1.2.8 | 28
        host-dosfstools-3.0.20 | 7 
                 libffi-3.0.13 | 3 
                  prboom-2.5.0 | 3 
               libglib2-2.36.1 | 2 
           imagemagick-6.7.8-8 | 2 
                pulseaudio-4.0 | 2 
                  connman-1.12 | 2 
           imagemagick-6.8.6-2 | 1 
                  boost-1.53.0 | 1 
             gstreamer-0.10.36 | 1 
                libiscsi-1.6.0 | 1 
               aircrack-ng-1.1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                cegui06-0.6.2b | 1 
             tvheadend-6cb8eaa | 1 
                 libevas-1.7.4 | 1 
                 libiconv-1.14 | 1 
                    systemd-44 | 1 
                 qt5base-5.0.2 | 1 
                 ffmpeg-0.8.12 | 1 
               ruby-1.9.3-p429 | 1 
                collectd-5.3.0 | 1 
                   icu-4.8.1.1 | 1 
               audiofile-0.3.6 | 1 
               libembryo-1.7.4 | 1 
              e2fsprogs-1.42.7 | 1 
                  sysklogd-1.5 | 1 
                       kmod-13 | 1 
             gdk-pixbuf-2.28.1 | 1 
             uClibc-0.9.33-arc | 1 
                  zeromq-3.2.3 | 1 

Detail of failures
===================

  mips64el |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/9eb186c7a31047c055b7ac5779b729b6dbfdd3ec/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e94a69d03ac69fe39c8561a76eba0ba0a9e59f50/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/65496e6c56c0f8038d57815832c9bd52bf16314c/
       arc |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/a21005afb5fe676ee5a43826bfb09d646c51cd44/
       arc |                 collectd-5.3.0 | NOK | http://autobuild.buildroot.net/results/68df415e747c1af4b681ed15b8a966548af457fc/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/1caf418070244c920c57b0b1a6b02b4e2ffba600/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/4f8072b2891f8a13626da68b6ba40b9df6c07a83/
      bfin |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/a4c275011f45135764aae0f1880889c1b0c4a46c/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/b96183cc55ee5e4d365cecd313758638785f3e52/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/9593bb2a410f3441587a485e957cb1a5eea6a12a/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/af22925f40ebee56282a07d397293f61400d14e7/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e63a5e02227fbd73942110c1cf41aa8ebda4e290/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/554e7a2839aa9e1c9598192645969e2565868155/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/56a6c497faf5e35ee6f28896604d29242c00fc21/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/9602c9c190d2210e5bf1e09482ff65e7a2a20950/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/b8b1f98bc487466a6a8375c3066246f2614b4727/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/934b0268460cbe4aee9520222bdd1913b5247c76/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6e1ee12157dd0e38a094c543d7a36cce6972d8fe/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/a335a98a56f2518f49d981e106a023742b03c61a/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/94cc26c30779c4b2bbc03d81805638e8c7e5437b/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/e654e79f7503ebe78445c05d4542a9e6d6faac05/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/8090597d73cf67ade62bc4f6849b999f453785cc/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/b3f6a6cd8899bde17b9d3102c04fe00406cc5ea8/
      bfin |                libembryo-1.7.4 | NOK | http://autobuild.buildroot.net/results/5a35742e150b29631931f1d5e18f02ee8935209c/
     avr32 |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/e429544ceb87705c9fade40337f561f06079a475/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/21f94fe86ac100ead2d4fef0af36b9fa4e1be910/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/04404ce604df3d8db883ac708f82c56d26d0178f/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8b329ee818de0c8c038d7fffe2178457aabe0b23/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/af594ceb52fdce7f7032340500abc6aecae25ed3/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ff54fea4b9f6a1f51772c81cc31459ae24c8f424/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/7162ce190f4d52c68c9d4bd4f73a4c55f03df8a5/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0f971bc33ec9f86d81720b026ddd78a732097ddb/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8203463d6e7254964843ad1524489da5bbe0e528/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/35c93c5b5437173199393813c183c7d94fd14aab/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/6a44353f90aa3a45cf3a13e68eac9aa3bfedb02a/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/14c3e75f179d719766ccac812f3f374923d10fb7/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/4134c194efb8629c5e3577dbedf596c66f0e73cc/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/861a8dbf15459c475a87d73a9722592fc4f5e866/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ddaddc33208567ca3534df0b7bbd8e12531c469b/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/43a51764024b680d5ba5fb8d16fdd655f20f4991/
    mipsel |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/0b036096ee23e602caadc04c3175ef96d4179767/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/9c37e6cf34f3ba4b66841dbc9047e6a15037a09b/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/5ab95114133e22d3d5f9949d6a9524c2f9c340e0/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/e7929cfef509c29e1fcf3ec651228e51fa2da140/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ba371b63743f134940602a7e902a8a76cf67f2b8/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/24a0dd57781f4e3bd28fb2db8c80558c74125e88/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/a02b62201e64a9673c8ef5ddafebbe15a8c93c13/
   powerpc |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/3b80e1616ee8b4e30498002b438016afa5bf8c4a/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/230d60ad19bc0b856ea0d07935c96aec3eb4fa0b/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/899d14a04856f8f1c1444347e03ea1722f56de58/
    x86_64 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/8a3bf205fa29cba3e3cd9ef3566759c5d3925250/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/7d4ad1955cf937c5390979fbadf4903b4572ca73/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/105c77a4e04eda7fbdfdd63f8a1ce5b1524bf2c3/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/b8f78f40f3669a22316c12501ade0486dd23d2c5/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/914ce8ae429798d7ba43a61b1163298cbac08502/
   powerpc |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/b3956281ea43d77477a5a3036924a50d915c903a/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/801dcc1c4c5e6f3e7a5f592d055ce3e7185c5daa/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/468a9f02a31c903d98f08b69d7165e6beaa35ca4/
      sh4a |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/7f07e10d511a6a4e955ca27dea4c3fc8c8baafb2/
   powerpc |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/950d25e6bfe5b0cf55d851b7ba7e7df9b172c2af/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/398b486daf366ddf01475dc2c9b8bd84fe877ff3/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2f6aa9c1c77ede84aa6909f3eebe21e943cc8b5f/
       arc |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/1d33fee6c213c7ab51b1696ac868e5c566991a47/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2ece304302cd14b383416c4a5b40b0f04bb8dbc0/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/eb91a4cbd0181704a267516a921b947a6cf798e2/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/cbb9632aa9e3fa9fbf05277cec977910b375ff4f/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c3c12d2011e9895493f08082c3da649e00c9ff89/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/dd562e335beea346194a034897b34894ff6e8d30/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/238288698aecd02cc4fe02c00d9e46f9cbcdd104/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/073e6040b0f1a7b0f5ff0439b5c825329489096a/
  mips64el |              tvheadend-6cb8eaa | NOK | http://autobuild.buildroot.net/results/b1de679706a622ade5952cb0e5f52dddab8978ec/
       arc |              uClibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/9d4d3c01d4f67cf4832de7399c89066f7c77cf23/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/e3351c841bc08e26370dd24af2e3c6b841dbbc5f/


-- 
http://autobuild.buildroot.net
