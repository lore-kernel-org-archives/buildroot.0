From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 08:00:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-30
Message-ID: <20171031070013.AD75D207B2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-30
================================

      successes : 131
       failures : 57 
       timeouts : 4  
          TOTAL : 192

Classification of failures by reason
====================================

           argp-standalone-1.3 | 10
                  boost-1.65.1 | 5 
             dbus-python-1.2.4 | 4 
                  ffmpeg-3.3.5 | 4 
             gstreamer-0.10.36 | 3 
      host-uboot-tools-2017.07 | 3 
             core-dependencies | 2 
       host-erlang-rebar-2.6.4 | 2 
                   jimtcl-0.75 | 2 
                     nmap-7.60 | 2 
               opencv-2.4.13.3 | 2 
                 openssh-7.6p1 | 2 
                  tremor-19427 | 2 
          usb_modeswitch-2.5.0 | 2 
                busybox-1.27.2 | 1 
                    cups-2.2.5 | 1 
             freerdp-2.0.0-rc0 | 1 
                    gpm-1.20.7 | 1 
  host-gdb-arc-2017.09-rc1-gdb | 1 
    host-libevent-2.1.8-stable | 1 
           host-mono-5.2.0.224 | 1 
                       jose-10 | 1 
                   libidn-1.33 | 1 
             lttng-tools-2.9.5 | 1 
           lua-sdl2-v2.0.5-6.0 | 1 
                   mp4v2-2.0.0 | 1 
                openobex-1.7.2 | 1 
                poppler-0.59.0 | 1 
          qt5declarative-5.9.2 | 1 
             stress-ng-0.06.15 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/25e4ff4b8cecd88d56bd75fcdef64ad9affed959 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/204d17c639e8a38648dbc15c4abbc0c6fe23370a | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2ac87b1ea118366df4c816a13fa7cd02f8b10dc0 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a818230518d1197a9916019a955437fc3611ad33 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/3663fc12c6d5908ba496efdfaa1ba24ed39f0104 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/af51008cdc92645adb20664aa7b3c64d9ed4691e | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e033f008b4731d41ec426884b45a591dda7adaf3 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1be95e26fd18e9772e42b5e6cb1e93fbac9c1c8a | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c94d79b9eaecdb36e0894ae0f965ae39cdb35386 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/53359e0fe1408f3816d3091b49462320239f39c1 | ORPH
        bfin |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/5874155f0d722c004971bb9ae9df995f052744c6 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/06bfcc0ba0ea9a125e89a54235348564d1a074a3 |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f2a0bd030cce31a7346f05442a2d16c462713768 |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/38d80d117f346ed630b10b6cdc951ec9a9dd1576 |     
        bfin |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/19ddca30994e3acf223e54b91cfda9725838d71c |     
         arc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/2cb531b9f9c75bb5dae10c02f2afeca225c65947 | ORPH
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/30d398c5764350609ef37d158c665347caf9f134 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828 |     
         arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/0f1cb8d72d0a78eb8b5c46548bc7c7bade93c674 | ORPH
   powerpc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/1588d1a2fec77522857fd22e344b1a89ad04bb44 | ORPH
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/a1b68de766d13628380dfaa4e4db893a6c8e8af6 | ORPH
        or1k |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/bf1124aed79210f16acc08e056e744a0dc17b418 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/8a7203b7473b5500b456344379dfa6d6bde4d52d | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/b8fd41b127ab7702a2b69998076d737ea2e092b5 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/43c90fbad3662101ef4eb5958f73700d1ff57b38 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/a152a190108986392346efbba001b9dd0bdc89bc |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/60d44246fe6a54b02b53564761807204b9a190d0 |     
      xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/81aa66ddd88919295ccb5f34b527b737627263a7 |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5a1404cf52c9547533a5b04c40d6118b43a07707 |     
      xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/bb0a52f08ce07b3aa7301e69e9be12f3e45f45b2 | ORPH
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0b6feb96ba877cb4f3b8c6a05c977a1c12805fac | ORPH
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/daa93d58840c77c980d040e2b740555dc3b36951 | ORPH
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6c4c7b3094bd48a72786f5be3d760f0356557403 |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/a17d5eb1aac01dab19412aa28d523625577730db |     
         arc |   host-gdb-arc-2017.09-rc1-gdb | NOK | http://autobuild.buildroot.net/results/43eae264991aa369490236c7bd59c0b6a67fcf25 | ORPH
      xtensa |     host-libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/dfb5009ff4289086ff6ecf008d623cad92e7d1fe | ORPH
         arm |            host-mono-5.2.0.224 | NOK | http://autobuild.buildroot.net/results/51dcf8908157393a09ce772e6099e73fd0cd0ba2 |     
         arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9567703c95823be10400c0a330c3997a4cd6a62c | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e3ee47e30a01e68a80fcbef3178f8eb051fe509f | ORPH
         sh4 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7d60ebf31fd9df7a5fef7e7723859c32d7972f5b | ORPH
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/fb939428388a53dce3a141147e6bdca15cd9c9ea |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/d5328314675e47534658884a9b249cefcf237c40 |     
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/e5badaca8f078b84d3a2135634a96729a20f2a9b |     
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/d3c3abf9966dd023923235c3879f521ba3a2daa5 | ORPH
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/16791e9548715d06efe37cf99fb07e4e27d98383 |     
microblazeel |            lua-sdl2-v2.0.5-6.0 | NOK | http://autobuild.buildroot.net/results/46f93012342549c44e100522eea0852586311ef4 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8be30492abe3345dc9411fe3e5636c4f8e4311ce |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/9e636919c98cd31b5067c8306d0e481a672434cf | ORPH
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/912561f505ad10d1eaa96dbe247d5838e9968e14 | ORPH
    mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/b27d324331f6e351e95dd4742f4d0a50af60c590 |     
    mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/44ed0be0bd94028b7b37e7bf21233adc1753d94b |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44 |     
         arm |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/3dcd2ab22b75bf27afd963d57e31df5e0bdedcaa | ORPH
         arm |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/8cc30818a400c7a392a3de787cabc9cd8425495f | ORPH
        m68k |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/c35599e6bf09aebe456ea959d7c238f82090fc62 |     
      x86_64 |           qt5declarative-5.9.2 | NOK | http://autobuild.buildroot.net/results/d9707cc2f47c6906b7e4872e185b7866301c3322 |     
         arc |              stress-ng-0.06.15 | NOK | http://autobuild.buildroot.net/results/296b14584c200593f88af75cdda65c4ca03cd863 |     
        m68k |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/5bff9fbd24264b3515a669d585e10ef23127d569 |     
      mipsel |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/d1c8e74477797b597c38186343e4d6c69b05560d |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/20a9a75f701ce70c2ae434085a85ad8d34adc67b | ORPH
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/46844b028989808aa7340c14af22f2855ec803d8 | ORPH

-- 
http://autobuild.buildroot.net
