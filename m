From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 08:30:03 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-29
Message-ID: <20170530063003.4239020C46@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-29
================================

      successes : 252
       failures : 13 
       timeouts : 4  
          TOTAL : 269

Classification of failures by reason
====================================

       host-erlang-rebar-2.6.4 | 3 
                    mpv-0.25.0 | 3 
                  ffmpeg-3.3.1 | 2 
                 mplayer-1.3.0 | 2 
                   cmake-3.7.2 | 1 
               madplay-0.15.2b | 1 
make[7]: *** wait: No child... | 1 
                     php-7.1.5 | 1 
               qt5webkit-5.6.2 | 1 
v4l2grab-f8d8844d52387b3db7... | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

      x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/cebeb6d5da3f581be395ef0ad51ded0cfc2f540b |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/15f4c33170dcc0bc5a4e348c3b769fb632c3471d |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/9c0efce0c7d1bb750c7ebf209f77dad51b16c52f |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/2f049cc47ed0a59d743a9b948077227fd83b10d2 |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/4428b0ac0452ce79dd7fbdd473675a90acd3e73c |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/39e5134b2abf58b9a20a20b13d1b0e33e150f960 |     
      xtensa |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/60def1b15ea61d3cb5f50e9de3f354dd2e17d270 | ORPH
microblazeel | make[7]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/eeb75fae7c47c3ba770c53636d20c1ab00fba02f |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/90a4410274c201a22c2e6d15b302179b9e9c34c8 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9e76e46e57fdec477d6b8902d448d219f5275a4c |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/fbfd428c0e18671fcb618dd007b35812f6e71a6c |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/704fa126d3ed62c482285819816d7e80472b620d |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/150ca78deb7d5d94ee85688e9638ed406c2000d9 |     
    mips64el |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/57879e99eca1e0755001af7fd5163646cdaa6b0f | ORPH
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c3a096fda15ef01b527261a8efbab67ac76829fa |     
   powerpc64 | v4l2grab-f8d8844d52387b3db7... | NOK | http://autobuild.buildroot.net/results/9eea759992d2c57764156dfeba5682eed8c39797 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/63153b044e7883b9b6f97c7fd8ff50015f624efc |     

-- 
http://autobuild.buildroot.net
