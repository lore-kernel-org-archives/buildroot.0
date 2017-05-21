From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 May 2017 08:32:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-20
Message-ID: <20170521063225.479D92082A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-20
================================

      successes : 255
       failures : 11 
       timeouts : 1  
          TOTAL : 267

Classification of failures by reason
====================================

                libepoxy-1.4.1 | 4 
                  ffmpeg-3.3.1 | 2 
       host-erlang-rebar-2.6.4 | 1 
                 mplayer-1.3.0 | 1 
           python-enum34-1.1.6 | 1 
             qt5location-5.6.2 | 1 
                   taskd-1.1.0 | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

       sparc |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/6cf90177a444882ad37017bccf41dea6bf752d31 |     
      mipsel |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/f2be9ef177e918a831edb87a52df59bc116141e5 |     
        i586 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/648845c5935e3abc554064f5711e8b1ad635164b |     
       nios2 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/8e35d911aba30777353b743d6dd9ec6e3b492079 |     
     aarch64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/9e0353c85c2e53f7d8092077bf1f13c52c1a8764 |     
         arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/1b117f7def7b30427d16bbbb35c133667825a986 |     
 powerpc64le |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/7ce465c02df08d0e4d948d2fadbd15893380299b |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/57a9d9f4a37627152c651c01ca885cbdbcd21ed4 |     
         arm |            python-enum34-1.1.6 | NOK | http://autobuild.buildroot.net/results/cb678ca9e57382a876f3f6034a47a4e2c59bc8d0 |     
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/3ab8e21cf67a370edf56caba48aed8cb6af8d58d |     
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/713e101bb28c25a2d414075f4720dfaabfab4b01 |     
       sparc |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/7da8b46cda8786422e8293f26b79582b35a433d6 |     

-- 
http://autobuild.buildroot.net
