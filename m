From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Nov 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-06
Message-ID: <20151107073016.DCC83100931@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-06
===============================

        success : 81 
       failures : 60 
       timeouts : 0  
          TOTAL : 141

Classification of failures by reason
====================================

  toolchain-external-undefined | 5 
                   mplayer-1.2 | 5 
                  gauche-0.9.4 | 4 
                  ffmpeg-2.8.1 | 4 
                  boost-1.58.0 | 3 
                  qemu-2.4.0.1 | 3 
        python-protobuf-v2.6.1 | 2 
                    sdl-1.2.15 | 2 
                busybox-1.24.1 | 2 
                  libv4l-1.8.1 | 2 
                 mesa3d-11.0.4 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                 python3-3.4.3 | 2 
                   mpd-0.19.11 | 1 
                oprofile-1.0.0 | 1 
      host-gdb-arc-2015.06-gdb | 1 
       kompexsqlite-v1.10.12-1 | 1 
                openssl-1.0.2d | 1 
                 libdrm-2.4.65 | 1 
              gst1-libav-1.6.1 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                    ustr-1.0.4 | 1 
                   slang-2.3.0 | 1 
                directfb-1.7.7 | 1 
                    libuecc-v6 | 1 
                rtorrent-0.9.6 | 1 
             lttng-tools-2.6.0 | 1 
                 mpg123-1.22.4 | 1 
                  connman-1.30 | 1 
              squeezelite-v1.8 | 1 
                    iperf3-3.1 | 1 
            xlib_libXpm-3.5.11 | 1 
                    pppd-2.4.7 | 1 
                  c-icap-0.3.5 | 1 
                pulseaudio-7.1 | 1 

Detail of failures
===================

     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/a25834b0b95503e857f5c8571b47df70551f9d3e/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/a53943a3111c233ba616733104576074602fc61b/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/89cc380e51b08355241c23f74fd06cbe6a2ee58b/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/84d868dbffb99e28abcc380c4301b91fb2a3f615/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/3950cbf0762dc67acf2c1795147004e78fe5d308/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/f6f8a5ce83b5b55517bcc38ec687cfbdda63d14f/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/e3703e15f5bc85a022ab14423d62c2a1980a3028/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/6db90e288107a8af38bb8b4d613c65707d300f40/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/11d4b9e8a5513c6d8fde983c78048acc21a75ba7/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5b61fc76399505ee9846738a0b0c528bfccfcfd2/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9b2bc0b8b6f045fce896fddc636ce320c85d6fec/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/516392549af514e8d6ed5bf49a23127231f08cbc/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/3d958619ac1582783a90ee538d389c8086186333/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e449b3d1f079aa26b535bc8c7c92900b19f2067c/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/43abe584b53995097d81e8e75a900fd9f09e1961/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a8f42019bd1f2f3966fb2514c4ffcbadba636a9a/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/390c14afc972df9b9895456ba9d801eb0af69526/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/35cc7793b20f6b393a94abdf1ab0b4e5dfaecce2/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/02f66eeddfa9ddc58479d5429282176a73de7b77/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/9bd533ac276cdf37d73c748129d3bb865feb99ab/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/8e14d1505dce6fafd41ad20c8e4bb9d2c6362f40/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/2a2c8573ab45a384c962ba7bbb542f1cc25ff4ee/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/28d34a69df2cb8ba4a368daf2371a360a97dd50d/
        i686 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/e006e26218e16cd2dd4c95a80da7c29f74e623f4/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ea1a5a12adf086d4bcdd6e6c06fdc8de47d439ab/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/a9124c08c675e044c879966269825f112d8936ca/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/4ec4beceb0e54c51b3d6a52d16262e74e9f5116c/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/954144f2f420b0b20668cad56c1c036206c1f8be/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/93a52fa8cb161300c5ec8ce7ebefeea0061f8f6a/
       sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/b9ebe2f6e671f4e1afe8c10626d6935473bb56aa/
     powerpc |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/79613fda3f51e969ecd46ae1151bd4c3316639c3/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/14b90d3fcf88411ba3feb0bb9323c4ff9b0df771/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/157125c3b29de8cac3d1fd29823575d4b018e733/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6a8c3a70e33cb5b3fc40d036fb0716d915185f33/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a033672c6be13d03a35fc38e554a8b9b5ad0d526/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0857fddbaa2f5078d02f41d7e4adba3a1f4fa9d4/
     powerpc |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/2180b9d900b27103acc92a2932f7ffa560b04831/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/d02b5e288c31113e01a40ad735a46502968a741c/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/298a4c2365dcee06f5cc626348d60605c5c3bd0d/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/67a5d5de3634582ba25b475288f42781fcaad342/
     powerpc |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/6bc369c8afafa229f5a8e3a58305b0edfd47eb5e/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/de4ac4e543fd5c4798e7e155ed0233bc06199537/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/05c7691c0cc1ef4cfa842643ab564a3958e66542/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/dfdbb574708393b627b1244a627444478155c70f/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/a5072146f148a3d09fa63d71cb5a72c3fbd4d848/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/eddb9179d2b4911487885acb3e8e3f936426770c/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/c4bf716d68b5d27fd448f27c27dc03668f87db4a/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/b7476e9d207c81db622eee8376fabd0113d09a7f/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/463c39f159109e14399d269f929a6a3f039bb27a/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/3adf49776a9a06f57e198c4d8241861e67284a24/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c8b4642a23393b0639b8a96905a8771df08c17e4/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/d4a00c165e76be2ca3fd93a5a7a71bf24a4f6ea5/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8184a96d046a0f03f23bc2d028404ecf6ff98abd/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/904b8e509660a6da592a4f6f983417daec4a613b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f51a6b8a03110a9391b9e6665d52f713a3aa703c/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fe99583fcaa45c5e9fef5aa63028f951ea632b33/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c955eb9fafcc02e5e4aa2d62e7a1e58e325f6338/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d401847f5a005b3a03757c49774999ec047415a0/
    mips64el |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/5e5dbc30e1f30f7d2d614f4a9edb7fe439f73d61/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/28e5e356a6c9912e3fb2d34cafb5ff5baa9e7383/


-- 
http://autobuild.buildroot.net
