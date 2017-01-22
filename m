From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 08:29:41 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-21
Message-ID: <20170122072941.43D1720C11@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-21
================================

      successes : 151
       failures : 41 
       timeouts : 0  
          TOTAL : 192

Classification of failures by reason
====================================

                    ruby-2.4.0 | 9 
               sdl2_ttf-2.0.14 | 7 
                 hplip-3.15.11 | 6 
                    mpd-0.20.2 | 3 
                  fbterm-1.7.0 | 2 
               openswan-2.6.46 | 2 
                 libraw-0.17.1 | 1 
             libsidplay2-2.1.1 | 1 
            lttng-libust-2.9.0 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
python-libconfig-b271c3d9da... | 1 
               qt5webkit-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
               trousers-0.3.13 | 1 
                 weston-1.12.0 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/1bc6d03add62ea902bf10ff22518ad5505282a83
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/bec118340d5c353be9c65af1d5ef75f09cd4e499
      x86_64 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/a2d523da6403124726deb131249d8f7beea77920
      xtensa |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/38ddb397edab682c737ca1fcf8f600392dcd559e
      mipsel |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/8fc6462b2229fc77acb0f4d7b16b4b8f57bee409
        i686 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/e5718072f4165894c6ee05a8be58846c65878f4a
       sparc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/d78229079232b2c5cb681abd8ba6cbf4cc5633b5
     powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/dcbdaa6d5fe11eb5e2daa0b8f884bea4e2b71921
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/ba0a5fef9f2dfec1f0b6b1e86c3b65796312fb2a
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/f7df8202257c6fe7e779f8edcb6daaed233666ea
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/81bdf5a34181ac905defabf967fc47dc44c5ad22
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/2ec188aa35dd2c22830c4b82a5cfcc314d3c6507
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/193c262a12240d6a0c1844378076e2eaa267d106
       sparc |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/a98d3a20273cac5ec35b55447787c44457ffd18a
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fc70d64a76dd47447a1a54ab90a0cc49349c73fe
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/e6a9dc333bbaeffdcd9cb41bc553e7ce508fff2f
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/11a367749c5c7ef181a4e514ed1c309273483a96
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f8ce4c437a179821b5ad4541cdab9f645316701f
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2895c279aea0314c2c7f921d89360996e0e686f6
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/2065b76fbeeebf0589d05eaca9e5fff1c7bcc12a
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/af4bc6b57ebb102d86fbf76533fb78b94ea25410
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c0e95623c4a4d883ca3feab414a2eed476f9a061
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3648c89b3c9756fdf0f646ca088c034501023f35
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a0e1252503676ac203fbde5a0896e382f0c08564
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c6b66364c3d10e3c088310f5fe7829489a997c49
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3c175c0c36c07212dca479ef79f0adcb326bcccf
microblazeel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/93ff17b5eceb508744c3bb12ea71808b85bb9eba
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/940159651d36da7aabce49f12c9d83004d58be24
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1e4df2cba4f6590958b055c56b74df46d3db267d
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/0adce980552bbf70a1c2ab22b4dcb3849bd1a3f2
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/298d855c893cbd4382252c480a26a1a38f84c137
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/8fa9c999a0046050af0faa6f67cbed8a1fa768e5
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ce47e946807206f9c0e7f053f43e8f772aa27cf9
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/152d1b1307233bea9b96ed5a1c6fc38d88a50299
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a40067b6f5471d3284f62212b77d0b312da00693
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/d8567e44596411191924f94f62e3a183be6fd748
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9f0f474aea600dac1fe5d98a43f52400838120ef
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a2c3b31acbfe8ac5040cb0c39e8ba489394c80ca
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/a2f5811f6029f8f3c87dcbea905b9747d55c9c24
      mipsel |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/69a91cd113afb196d19e8c02b06ed6cc2210ed24
        i686 |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/781948f6eb328270d8df6eb7f5c603774e717433

-- 
http://autobuild.buildroot.net
