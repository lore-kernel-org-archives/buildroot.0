From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 08:29:40 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-23
Message-ID: <20170124072940.A9A5220C15@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-23
================================

      successes : 140
       failures : 44 
       timeouts : 0  
          TOTAL : 184

Classification of failures by reason
====================================

                    ruby-2.4.0 | 9 
                  fbterm-1.7.0 | 3 
               sdl2_ttf-2.0.14 | 3 
                      x265-2.2 | 3 
             libsidplay2-2.1.1 | 2 
                  libsvg-0.1.4 | 2 
                    mpd-0.20.2 | 2 
                 mplayer-1.3.0 | 2 
               qt5webkit-5.6.2 | 2 
        riemann-c-client-1.9.1 | 2 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.2.2 | 1 
           host-nodejs-0.10.48 | 1 
libasplib-f7219142e790a329b... | 1 
                 libnss-3.27.2 | 1 
                log4cxx-0.10.0 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
                    mpv-0.23.0 | 1 
                 openssh-7.4p1 | 1 
               openswan-2.6.46 | 1 
                 sudo-1.8.19p2 | 1 
x264-b97ae0644f16bad2e2c9c9... | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/786bbed593e5727f563fa0ec4ef9ce29b0a0fb17
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8474d75d446b8e7b697bfd2f5331431c852d5aac
        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/04a46327542039d6357e61ef49d7b5de22150a51
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/7f85fa235219348d5cc043426c323b0ac9c54cf2
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d978f9bca9658ce46584dbc2f7a579b6abaeb2b8
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/1addad8750103cd340ca067b56eb29b70de0af52
         arm |            host-nodejs-0.10.48 | NOK | http://autobuild.buildroot.net/results/88c20e24022ea63fa3d0195a07f84c942d72753c
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/62b854ece10d0321d934715527cd79603faeac97
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/869d8815478f22ce2532e6f6eb38513e6249093b
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/538607e178bc4c154fd905f5f72037900fc1953c
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/36f908d47715d1477db089d714d778e948590820
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/59a6e7277733bc7a79f7fb7437404d76c995dc23
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/9c85a89e95203295bc07ec95056e67ae548757be
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/414ca24718a25765de1c3f7007024ce15591fd87
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a90578240cc83319b4cf7f965d3540e1fe169570
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/60b51dcf53f4e5add41f94c3f8e0d8276dfc0c11
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/6f6f93fe9ad53d34549d95bfdef306fb215c75fc
       sparc |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/4ca7467e704e2509720a00d534608301801ea73c
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e7a71e93d7aaa45e3f399bcfeaa3f6a9771e3470
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0e68914c3f192274b777d9567a27fbff0769a958
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/f6f3e39d694dc5cb5b1df60832e3715740376554
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/f7704ffbcd50bd4f13b07b90875d2a329f48410d
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d40bc21f659c5e49cd211a6cc173db2b217fb728
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/6feda94d7bad3c771ef3bd9e12731e4ad9fe9a52
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/f778c84321bd041ab53c2b1fb1743ee973b22cf7
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/deb1059c77151d7cb9037be58b8cdb60ac081695
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/e0e16d2bb5fa1cd092d3c95bf3533a02ef10c46f
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/bcc3708e743a19772feade6e376707471d1fdb49
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/17caf83b418030ac93a083ae8e3cdbbfa7f51915
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/11bc828db4503759f3710682523130ef0ec0c556
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3a88c3246c0dddbdc08a1159392a5e5a2d48a020
microblazeel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/9426b62b7e2245c157f9a3e4b773f4290c7a3c92
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/298567f042622914eaef90463a8a223d9526b18f
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/993843f829db1e6c0f96323fd8ae44261bb95fb1
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b739eccc069be99e2d15b5286cd89f817e76e8b2
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3bbd560c32535718fd24cd836511e62e1a260129
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/245f80c9817f0c3dfce5234da4f3e82aac5e0456
         sh4 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/73f99315832292116cd98a45533e3a0f3070f88f
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/66381fdc12b41197cad8ae361da5f1cda7370cea
        i586 |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/e877ec261bdb8a5e3289e4c2be0da8be311114d9
      x86_64 | x264-b97ae0644f16bad2e2c9c9... | NOK | http://autobuild.buildroot.net/results/3fad29cd5e7bb6c2eb6a88c86395c9e20d3d2b5b
         arm |                       x265-2.2 | NOK | http://autobuild.buildroot.net/results/d54847add51f1bfb76c6b4e74fdd4516ece7b39e
         arm |                       x265-2.2 | NOK | http://autobuild.buildroot.net/results/fd8a35d82c3dd0e530a567317262ae8a58dbb02d
         arm |                       x265-2.2 | NOK | http://autobuild.buildroot.net/results/9961313a870b833b48438d8d258c5b5323025790

-- 
http://autobuild.buildroot.net
