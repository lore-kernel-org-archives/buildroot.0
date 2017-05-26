From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 08:31:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-25
Message-ID: <20170526063140.E17A320E27@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-25
================================

      successes : 281
       failures : 9  
       timeouts : 3  
          TOTAL : 293

Classification of failures by reason
====================================

                  ffmpeg-3.3.1 | 3 
                 mplayer-1.3.0 | 3 
                   zmqpp-4.1.2 | 2 
       host-erlang-rebar-2.6.4 | 1 
make[1]: *** wait: No child... | 1 
make[2]: *** [all-recursive... | 1 
                 sngrep-v1.4.2 | 1 


Detail of failures
===================

        m68k |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/bcaaf71311899861c257078e347a19ff0676f374 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/c017b85802c10700d92a38d582327781a34ab677 |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/ea76e7a1b9b0eeae68b0a2e5ec5d6a672fe65aa1 |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/bb08a31261ad72ab29bd4eab3408b715ecc3aa10 |     
      xtensa | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/973d51afb82fade38cc524bd52b89e89d2a5277b |     
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/79b4c881ab8764755b80bf96c2220fab8b717849 |     
 powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7995d7996c95c9f3e697963186ac54355b38f524 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0fc8082f7a217b32feac73bf70e726bb5a6f2688 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2df7e601dc5ab435994ffc59c7bf334185606806 |     
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f0dfad2a040cf3e21d4ba2c1799ac17db57518ff |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/bd08c1f748ff6ec8f32b8d1e86775f46274c8ac8 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/54114b7ec9cd9c58ee9f7927d31e5bc25fdaf65c |     

-- 
http://autobuild.buildroot.net
