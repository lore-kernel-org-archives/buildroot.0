From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Nov 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-03
Message-ID: <20151104073020.2FED5101C60@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-03
===============================

        success : 132
       failures : 53 
       timeouts : 1  
          TOTAL : 186

Classification of failures by reason
====================================

                   mplayer-1.2 | 12
                  ffmpeg-2.8.1 | 6 
                 libpcap-1.7.4 | 2 
                    ruby-2.2.3 | 2 
               lighttpd-1.4.37 | 2 
             util-linux-2.27.1 | 2 
                    ustr-1.0.4 | 2 
                      x265-1.8 | 2 
                pulseaudio-7.1 | 2 
                  libv4l-1.8.1 | 1 
                  connman-1.30 | 1 
                   mpd-0.19.10 | 1 
             lttng-tools-2.6.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                elfutils-0.161 | 1 
               linknx-0.0.1.32 | 1 
                  c-icap-0.3.5 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                 mesa3d-11.0.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 python3-3.4.3 | 1 
xdriver_xf86-video-openchro... | 1 
                    links-2.12 | 1 
  toolchain-external-undefined | 1 
           libfreeimage-3.17.0 | 1 
                  boost-1.58.0 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                     lxc-1.1.4 | 1 
               libecore-1.7.10 | 1 
              host-perl-5.22.0 | 1 
freerdp-17834af7bb378f85a3b... | 1 

Detail of failures
===================

       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/c245a7fe7f61e2067f7ac3689b9e0360573b0d78/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/b1edc4b284e8aa92b928836ba51f181e60ccf351/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3b6012673bed989e6817bb113f6625b28a81a7b1/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/6f7d9f0e5933c006ed38f6ef87e5d84f97cd57cd/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7ac2fd41d74d3aed8d35979d58ab8393a68e818a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9f1c0472c79ae35d02de9d2ad0b49d08121dc956/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/e0fc2184953f2b09a09278c915ef6c9ed6fea7b3/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9693576ed8d25adadee4d8848fcc8c562a48d5e3/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5515d4941fc334f561d57db1bbf015057e7b0a7b/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9a6ffa6e066a4c0eb4b24d8a503da0e33e907773/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/429edee89868730a65b672ba5cf75cc477f1fee5/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/cbb022b71275fbbfe91b6d60475e719b68608047/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/398ff9f40a891254fb3359028c71dabfb3753d63/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/2fa952e0dbb97ae9128af371df4e31751ac9fd9d/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/79b75cfa45e8429bacc162488c776dfc420f727d/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/0dc5a05703ed5342cb07c027b070335a10f62890/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b8de940270d3b5fd26aa27b9bba9207690742bab/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/55a630d50d3a2acc4a3b4c16cb7beb36c6912b78/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/c74071907d40b743906325a1643da65507bd7a54/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/fb0d4692aa9ea3380246ae6f1166a800266288f1/
     powerpc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/cb4c775b8c70728566e4c81df455e6567c76aeab/
         arc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/6be17a91373708900082958a59df8b7575df69c0/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/1caea53ba49290ecb3fccf0b8e2cc331c9ed31c0/
         arm |                     links-2.12 | NOK | http://autobuild.buildroot.net/results/9b883d42bff3633f16447d76d2eb4ddf68013788/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/5fb961a7bf39b8b80b81d4f899bdd349072bb836/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/353540912edcb3c6252240fc132a8bec3ef55f40/
         arm |                      lxc-1.1.4 | TIM | http://autobuild.buildroot.net/results/c1545cbc577a8a6bcb593092643ce5e6d2e929f1/
       sparc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/67090593e3d66c931e3bbaeac7013dfd851dcd5f/
      xtensa |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/31212c484f452fe4ea6ae084d3edefc4580830d8/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/55daf09a1dbb630ad26d3bad8113f78c620292d2/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b7c2039390fe32116a622d710f1242dacf254aea/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dd5605604d727f21199e7d5b37375c3ad79fdaaf/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6dc868f34b73e0e51fb0830bb06af70772416bed/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6e3ec9632e9b8996f7670f60449f2bfec3280533/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fd80ec00644821d17949bd9f24cd5ecffd0b75c4/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2f95eded561c48b843f0c4168806d56f4fb26e7f/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6b800ab90ea8a60ff59dcecc6210b5bbdcf0662a/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0e3e7848d8602e37ece67794e690c0d9d7da2361/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d007204c4069a691a4ce30b1d2e770efc6c182a2/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ecffe1873d04bb3166e2a8c3b6ec823c7cf3046b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/78b90a006b031f31f34c7c1d7be6b7febc0df3b7/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/69c5b2c32aa49d1bc154bfbbecf11354e484cea3/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/dd0425a9ba840f82465d99feb2d8f81e369b7933/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/1f64980fc84fa0887157048a39bd09714e870fc9/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/8ef9f0a44d3cab51792035b6739d114686c0d031/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/5667125833d0a0b4c9b59e98dffa9a34d635721b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b8b81f543093fa33223b8f791645ef72c6bda69b/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/62780465c654f43623a102ad9d0b2f583433619d/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/049bb521a99efca2c33468ec602fbe0b35ed937e/
      xtensa |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2e1d9d990e9a8bef0b273d7afdcdb9ed817c99a5/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/f1b5c1dfc2805e7c7b55dfc352709e627ac2dae9/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/df4d3a3beee5fbd87915445bc892bb92f49b85ec/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/65bb757c513af669dfd6b87a09df547a4a947bd3/
     powerpc | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/e20f5ffc08142620c8095398c104b8b1a1d48078/


-- 
http://autobuild.buildroot.net
