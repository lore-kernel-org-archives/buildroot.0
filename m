From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-21
Message-ID: <20151022063017.454C81017E5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-21
===============================

        success : 130
       failures : 61 
       timeouts : 0  
          TOTAL : 191

Classification of failures by reason
====================================

                  ffmpeg-2.8.1 | 9 
                   mplayer-1.2 | 7 
                 sudo-1.8.14p3 | 3 
                   dvblast-3.0 | 3 
              gst1-libav-1.6.0 | 3 
            gst-ffmpeg-0.10.13 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
             python-spidev-3.0 | 2 
rpi-userland-b864a841e5a459... | 2 
                      qt-4.8.7 | 2 
                        jq-1.5 | 2 
     openvmtools-stable-9.10.2 | 2 
freerdp-17834af7bb378f85a3b... | 1 
             lttng-tools-2.6.0 | 1 
             host-nodejs-4.1.2 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
       kompexsqlite-v1.10.12-1 | 1 
                mongrel2-1.9.2 | 1 
                   ushare-1.1a | 1 
                  ltris-1.0.19 | 1 
                  qemu-2.4.0.1 | 1 
                ipmiutil-2.9.5 | 1 
                busybox-1.24.0 | 1 
            xlib_libXpm-3.5.11 | 1 
                openssl-1.0.2d | 1 
           libvncserver-0.9.10 | 1 
                 jsoncpp-1.6.5 | 1 
               util-linux-2.27 | 1 
               libupnpp-0.12.1 | 1 
                pulseaudio-7.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    ustr-1.0.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
              macchanger-1.6.0 | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/e2d8166d30a0ca10c2e832e281593e0542a69354/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3a42405c2b937d1610e13cfd11dd4c2e54f93d3b/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/06b3548c5b155b64def64d41143db1ad0f5feb1e/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/bf3e3b807e8bf4134c90beeed72551defc636f81/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/09d9a962b20295d09d7777f873f7bb1c8130dbf1/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9c30eb1b3e22145144380e1f4ab9ab13e6d32121/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2cc84ff0ff94fc32f27389083d52ac2413cf68af/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4fcb7405c6b8ba05337895ba61d4627034359bdd/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/dc2a7a152ce3eb53036e8230615dd53a10745d09/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d80f4f7d894a766ac1838a27376583e9440834b0/
microblazeel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/62ee56c13e3e5a38fb4179ae51d01149a327376d/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a4e170af3b06707d3e854b7130485a9784d948b6/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/e25c928441992b96e580861eee46d4928f262b12/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d9ae579e2695c483d68a1b0205db774a8a28e590/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/706df1076f71d40e68de4c608e3e6f7d8ef2629b/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/e4af30507fe1b26721abc0f3288cd8b5c74928e6/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/4e4a71771b71c68cd32e48e24ddf60ddc628c500/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/6348981a5ecc1aaa0823d9501d24e250025b0e6c/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/05ec57d00efb410b0726e1494944384db724be1c/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/e526091b0c5a71f3c6cb1e1e724553a188d5c2e7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9beb9146c5a5e50e59e2636fa2187a787e77bb1f/
         arm |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/f5b1edbf39848e40f596020a7cbac076f72d5b9d/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/dffe2a50ab5903bf9c9307b5f6e0b17cce7540f3/
         arm |                         jq-1.5 | NOK | http://autobuild.buildroot.net/results/2998f303bab82790cf85f0f4f05af697c4287d70/
      x86_64 |                         jq-1.5 | NOK | http://autobuild.buildroot.net/results/0d55127afd71de359852c18ecc2ef92503282b0d/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/87ec394a96d8af84460d71faf4bbcaa03e5fe651/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/6d3a1ff06bc769f49daeb7fd2589cfa2dac56bcb/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ff168dd00b1ff8fb30800bae74834f88221528e5/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8199960ab65c27e98efba5afdbf353f5c6401102/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/4aa34eb60660cdc73e88c5b9e703f3409331eb23/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/59b20ae26bbfb8f1c97bee6613fdf146d044bd26/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d0bbb66747b223a06206e0a5619444b320d44de2/
      xtensa |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/5b008ae84d116e9a07740272712c21653a7dd044/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/3460e536b5cee59e53539f241a07516733c639cc/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/2bccf3fd7060870a337c0bd7a9a750d0ad4e2c1c/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/b81c88770cffc3240935db1cc26ed76c6d25882d/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/182b42de4f52d5315cc9ee7d3197f669203e01e8/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4739a7e071f8833147ef14e59e0b7d6e3d733f0f/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9a0ec0245285368165604c202fa9af2c890acda1/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c3fe1c8899d11417ac6ff18b42f6d4c6f6015671/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cd46c0e823ce6725c34c70d2b68fe9a9db686a17/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/bbb15394acb25cbea67385dc534526639ea3553c/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c87631b62cde7af65b9b7cc9ed0816ff0966b4b6/
         arm |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/e1a5411be80a75f50ef3d8d4950387f251819efa/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/b42cbb8635cbe990bcd15684b4d6d65790febe2c/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/c20db3f8a5f6df28980fdba88d9355ccb71fdfd5/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/51ade61dc40f1ecfd039ee199c22135459f48f81/
      xtensa |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/0a56d367acd648e5d7522ee9a1d5675cd7094962/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/22a20fba2f634beeb158cc1dc6c86f9e0e527d9d/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/fbe33bd45e0591a963b85ef4d42b8c4a8ff93512/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d0477e5372eb66e0a4dfa05f5e969e2b92360ef8/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/088689fab53dbe12efb9ea6731fe8a5b173021fa/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/78b02f77c45298bf1f84e6543d4c499eccdd3f8a/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/545bb2f5eb412b1b44d9844934fa1f708a6e279f/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/fbbcfd277099cfa92de9d449e71de63bc679cabe/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/40f6df17803e23ec6881b9c8eff2fc319aa49628/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/b0ddcbdc16f2dfa778181e42476a814585e3dcf7/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/d74954af7431ccfea71a68a00225f4d19dfd050b/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7443f2546f52de2a673527da0f16f83ac057cc29/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/bb09c752297e880d6118708592f9c2e56f2aff33/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/54c10e6104084e2810a8203fc1b0dd3254948359/


-- 
http://autobuild.buildroot.net
