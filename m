From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-01
Message-ID: <20151102073020.2AB8C1019B7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-01
===============================

        success : 148
       failures : 67 
       timeouts : 0  
          TOTAL : 215

Classification of failures by reason
====================================

                   mplayer-1.2 | 9 
                  ffmpeg-2.8.1 | 6 
              host-perl-5.22.0 | 3 
                      x265-1.8 | 3 
               lighttpd-1.4.37 | 3 
                  vsftpd-3.0.3 | 3 
              swupdate-2015.07 | 3 
                  qemu-2.4.0.1 | 2 
                    ruby-2.2.3 | 2 
                  libv4l-1.8.1 | 2 
                elfutils-0.161 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
liquid-dsp-df5a459fa05dba41... | 2 
freerdp-17834af7bb378f85a3b... | 2 
     openvmtools-stable-9.10.2 | 1 
                 python3-3.4.3 | 1 
                  ltris-1.0.19 | 1 
libwebsockets-v1.4-chrome43... | 1 
                 libdrm-2.4.65 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                 libpcap-1.7.4 | 1 
xdriver_xf86-video-siliconm... | 1 
                pulseaudio-7.1 | 1 
              strongswan-5.3.3 | 1 
               dvbsnoop-1.4.50 | 1 
       kompexsqlite-v1.10.12-1 | 1 
rpi-userland-b864a841e5a459... | 1 
                 gnupg2-2.0.29 | 1 
                     lsof-4.89 | 1 
                   vnstat-1.12 | 1 
                busybox-1.24.1 | 1 
                   erlang-17.5 | 1 
         conntrack-tools-1.4.3 | 1 
                  mono-4.0.2.5 | 1 
                directfb-1.7.7 | 1 
                      qt-4.8.7 | 1 
                openntpd-5.7p4 | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/6e1f2501aa4691bd19f8af867715eec363ca4507/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/999fcf9db9e6d1aca7622aec2192cebb10b6fd38/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9be5cbb41ddf784ae7c9fd9de59d50ba6c6a8ec0/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/4cb9479fb3939e5f32f08de677189ef044f48ebf/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/82cc7766d2c805146e94baf82a24d1002f56593d/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/ca4ca362581ee0111cba389d1afbff287692c21b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6735292f05bfdbce26bdfc0b64b03d3a0948143a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4294601089ca798e8d2298be97547fb2d4782b90/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5a7073b6681b0ace23c9a76f0ca8d62b4e5173e8/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/da175d578e9c34e1aee4bd94110ec9b261b7916b/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d13e18e1fed26a2f1f4ae033e63c88a203f7b904/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/003ca371ad0422e651adc0152c690f9c445c5045/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/34350353cdd80c30b3dd640923971bab7189e6ab/
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/9b8a128329b697f8d18d763cbe5004d050d0b872/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/ee1d1300f7314c7b6e1b431efee65516f3cfebc5/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/22ed0d14527702c0ca0d6c5fda39b11170f6bf91/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/244065aec306432e2a2cc6a15679047224926702/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f400b60bb325a5a3762423cac8ca4bf1bde5bb20/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/ee1d3a3512da627e6b180fea05d0e37546c27905/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/81ba83cede91167676cbad8ae04ee2b176dab9d2/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b8a3581881eb158c742ecf8c961c45ddb06b197e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ae6e21070c63fe5a6a4d4bb72a214c5e0c082df0/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/31e73f12250ccc88be84ccd545f2707b0769dfa6/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/7be585d8d9abbd61e88db4409a1c59c0b0f3d34a/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/4ecf6d074a608a58d56e3567727028c0ca8dbe2b/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/d5198d50c2df194138aaf72a1b90bd8d2e272ea1/
         arm | libwebsockets-v1.4-chrome43... | NOK | http://autobuild.buildroot.net/results/5cee52176bacec7da73b3eea02fe5011cd615105/
         arm |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/c4f0596ebc0e9b688235205f9531eee86eca7321/
     powerpc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/7dd4e472035d7396397dd0ab75a0b6b678183f47/
     powerpc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/935c59c066ef37f17890ec25872f619853400ddd/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/f6965c3ef8d1ecb75e9e07296bb11e688b9d0d88/
        sh4a | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/350e9623323157826ad2c394a873ac89b6a80702/
         arm |                      lsof-4.89 | NOK | http://autobuild.buildroot.net/results/f9a06c984e8dff4daa4a3500c52a7dbfd2af4866/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/84ada7f6c2a81b3dd8d64f1ed40db860969e2232/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/b1ff12d5990d6b03e442f59957b48ad02cff865b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5c20d2dd550a7d9d489937d5ee7317ed1b4a31a0/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a20e1d06845f304b9809612437b5ea884ad27c14/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3baae138f13a594cc25dc8fffe44b343e9105a49/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/852d2a774f14f2305cc19697ce08ee20214c7558/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3203281ea4a77ce1b00adfa2465df0c472de6779/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1823946feca200a39bc8c83a8b256588f17f8106/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2cce198cdb328764f515a9f597c521ba38954797/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4b1cf3eb19dec4ae1a1204307225ef517c1ac4f5/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5a1a9c7ec65c0860b95d918baaf09aa661c9d468/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/cca35854be43c06afbb0da9b0a0cadec232bd1d7/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2dda60cdc2c28be758b9d70e2ce09bba072654b2/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/0122b58de7b09f336bf9d41d21afaba82d440111/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/484031d97b1aea1ca7d922d3f4a6ae4f65034690/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/d548552f8666c2d3379b245a7c734e48a1c6c6c6/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/0cb27c66a0699777a0ae2b676ff2e0bdfd83c6a4/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/81ef3d3f02d7517c38408bf24ac9039371496edf/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/917392a20f254cdee0644ce55426f14219762f50/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/93a087fc10a82adbc996e1a9178bd52dd8a4fb5f/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/98d64f08634626a2f0bc37a8d78d4c31fe46169d/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/b8d01b624a9c17c4a3e13e178fca2e5b184cc292/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/87231dcf1cdf16e960ac2d6032d7f82c945e8b23/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/dee07e66b62e0048f5717ef0ca05f35becf54282/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/d2b5687496689c9ab243ad9b801f5104516ab6db/
         arm |                    vnstat-1.12 | NOK | http://autobuild.buildroot.net/results/ff655ebfb1fb7cc1ee697ab58266a2b8b3a924db/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/f42b6425f08b29cd6bc7268dd89aa39f8b3240db/
         arm |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/404f8053ab9ec06ef8974af6edad5966be262168/
         arc |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/fcf8488b70ed9179c68efa83bbe1079916680f49/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/7bf396f347ed11cc639a16e108dbc3e155091a45/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/e96780155f894799ac991cc041f366d4f6f00025/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/b0e5fee638b8ee9ba074048132f1fa61d4c14984/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/059d771cb39532dee73a5f50e24b3441005ed38b/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/798c4a0f3ba28083b6acec9b5690f2f92ff78c2a/


-- 
http://autobuild.buildroot.net
