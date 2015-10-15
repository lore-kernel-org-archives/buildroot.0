From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-14
Message-ID: <20151015063019.1138F1014A2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-14
===============================

        success : 164
       failures : 61 
       timeouts : 0  
          TOTAL : 225

Classification of failures by reason
====================================

                busybox-1.24.0 | 5 
freerdp-17834af7bb378f85a3b... | 4 
zxing-cpp-fa34227d26e0b388e... | 3 
liquid-dsp-df5a459fa05dba41... | 3 
                 sudo-1.8.14p3 | 2 
               util-linux-2.27 | 2 
                   mplayer-1.2 | 2 
                 mesa3d-11.0.3 | 2 
                    ustr-1.0.4 | 2 
                pulseaudio-7.0 | 2 
              gst1-libav-1.6.0 | 2 
              swupdate-2015.07 | 2 
                directfb-1.7.7 | 2 
libbroadvoice-f65b0f50c8c76... | 1 
                 jsoncpp-1.6.5 | 1 
           argp-standalone-1.3 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                openssl-1.0.2d | 1 
               linknx-0.0.1.32 | 1 
              squeezelite-v1.8 | 1 
                 opencv3-3.0.0 | 1 
            libserial-0.6.0rc2 | 1 
                 dropwatch-1.4 | 1 
make[1]: *** wait: No child... | 1 
           host-openssl-1.0.2d | 1 
             lttng-tools-2.6.0 | 1 
                  guile-2.0.11 | 1 
                   slang-2.3.0 | 1 
                  mono-4.0.2.5 | 1 
                    ffmpeg-2.8 | 1 
                  snmppp-3.3.5 | 1 
             alsa-utils-1.0.29 | 1 
                   ushare-1.1a | 1 
                    php-5.6.14 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                openntpd-5.7p4 | 1 
         conntrack-tools-1.4.3 | 1 
              sqlcipher-v3.2.0 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                      qt-4.8.7 | 1 
                  libv4l-1.8.0 | 1 

Detail of failures
===================

      xtensa |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/431379672412e9364e3b2a5bfc6dbb2f311599f7/
      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/32e3c7799d9f10f87b2fd115c9261b05532f7298/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/4ed887423f72c85a48ceea63dd5d21ee25bf8aeb/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/490ef73bb3d4ea24b6f2722e015f7f98d67941b1/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/56cf3023df45070f212cceabf0835ebb9fcc270b/
      xtensa |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/5dd3da6cd4bd7caa9d2171c849dd6cad7b676cfd/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/e6a2af088b7509f14dbf69697da3e8e21545ffcb/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/d236a923d68c3fee5dbdf43a6b361bdc560d2204/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e92f7cc0e4aa637887ecf71eb1a87addc45271f6/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/96a5a59da4ea5d1cd194ce1c82b5846d5c70a849/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c668b1b87c75af6966a4be81ae8e27a8bdb9d50a/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/24438efbc9171b748024e6bb8832aaeb4158be42/
       nios2 |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/e7d1f31a8bde1ed3d4cd0aefe6a7c5223dd424aa/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/44eb0e9d28e4800ae9ee55a5f07ce52b8da98a3d/
         arc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/93c26eded23fb2ca5cb94c03152e44e9fdb0e2ea/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/1b4020ca5a71305c4378938f6293535dc2912e25/
     powerpc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5df3679bb8d00e0459ccde47c945eb3d0b597731/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/7ca5e2f1e767a948a523b1c0fbe85b8b7c3464ec/
      mipsel |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/af5bdaae914849d06c040ee5777aa471adf5dd3a/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d0a8ad9d3f19592e06df36408d6af745f7908165/
         arm |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/6826edb5f832d4b2a85c05f92ffc5612701cbc21/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/0d90c7c13ae1640b07709c4c686e0237ada1324d/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/5dd76fdf07af80dae6c3c5b463f33ce5eb5f3a23/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/81f3bc289fcd52edacc0a7a05604b465eb4947ab/
       sparc |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/ec85f71be15976f4db92e8db60f4ee032338db79/
      x86_64 |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/40a12c0d1746dcc51e4f221eefbbf31bd427cac8/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/be8ee7b625f7120b8e19db777d79a8613a5ae7b6/
        i686 | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/5856140d6b9474ce16235d8e48d6652c76eff051/
      x86_64 | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/eb002463ed82de461fae11211415c07883a95386/
      x86_64 | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/92d371d74fe5df884bef37882aa277989b8d7b2b/
     powerpc |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/054440a0eaa9c533bbf9c018f0fe4eebd08cd0f1/
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/c0029a1227348df51a706398f431517900864e01/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/30352e67228299545f4027e5bc47ea723bacc9c4/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/22c3eb2ecd7910520d436b6247fc17fa4e337b69/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e6d5048a0855ff8467f8d3ebdca56d0f5e8ce62b/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b9098f76489327800a02ac53071f602343ee6a09/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/92b4c42f8ddcc897a8f890691f071e22c56cff20/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/0e26480f2ad48f39e9e4a909ca523d67e4df4fe4/
         sh4 |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/ad8f66509b0a58f5eeeb22979db13fb7f01591a5/
    mips64el |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/f4d7021d15d6ae1eb3eb750587e94034146abe9d/
         arm |                     php-5.6.14 | NOK | http://autobuild.buildroot.net/results/1b6e571e307c2b190116601bade382c43e8d3858/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/c43db31455b5d907146234ebe54a2eac4deacf33/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/9f91548a470b4f366e83f2120ac6993b6fb7a5dc/
      mipsel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ea866cc07375c536c74e7de9f645935660a46241/
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/51ff079ebbd363e0445d226ec80bc28e524fd88c/
      xtensa |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/21b804c3d5d144112dee71a70c32075ef7955a4b/
      x86_64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/0572a9a1f69ee214efb10863f5d2852b25bf4f54/
         arc |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/369df6d80ff321d093c6f5b7ef7a7cdda2f9cfb1/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/6e3da5a0cf9aaaa3e722bad4f6ab5aac8e2af4e7/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0b83e80a00b5344ca8d97302a283002c136a5466/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/27c04e9c83ac94f7a03bd9285fc57be792f75db7/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/5ac6d8452c0b812b53cc36a049738733ce8479ef/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/bee969404c5ec112d677cc8335c6583b2fd99a5f/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/dd99c7470ca5e086bb49e62717ed0b77b2e1b81a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/49f1f5c431fd13b6584dbebaf3a3fd17a54112ba/
         arc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/88f2449f7ebe81e1d982b84329e99fc948ace4bb/
        i686 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/e534c2117cdb61c1f70b55241932c6397bafb908/
    mips64el |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/47581a39d9438db5353df344686ba0392ada2e5b/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/66d1269dfc20a206d0ff70288596e0d922bf6d26/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/6519ca3803516a4cf02b8bb59c9c24d1c35b13c7/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/6307b7002e47b0ac867c45a28e7f93341209c0a2/


-- 
http://autobuild.buildroot.net
