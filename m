From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jan 2017 08:29:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-15
Message-ID: <20170116072927.6672620BA8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-15
================================

      successes : 142
       failures : 60 
       timeouts : 0  
          TOTAL : 202

Classification of failures by reason
====================================

                     tslib-1.3 | 13
                    ruby-2.4.0 | 11
               sdl2_ttf-2.0.14 | 7 
                 jasper-2.0.10 | 4 
                  fbterm-1.7.0 | 3 
            host-heimdal-7.1.0 | 3 
            lttng-libust-2.9.0 | 2 
                      mpd-0.20 | 2 
               qt5webkit-5.6.2 | 2 
                     vlc-2.2.4 | 2 
                  cppcms-1.0.5 | 1 
                espeak-1.48.04 | 1 
             host-nodejs-6.9.4 | 1 
                ipmiutil-2.9.9 | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
                 libraw-0.17.1 | 1 
               nfs-utils-1.3.3 | 1 
               openswan-2.6.46 | 1 
               trousers-0.3.13 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7d91d293b66407b780b8e45f7baa03e80f343486
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/baef9888b1979d18171668a675985e3f3b45fda6
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2d8864ca59a163029d4c32fc7215a3f32116ca6c
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2385bfcb3b05a7fcf7fd5dfe3214062fbcabac6b
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/69354b130073a3dbd73bfb03844020db3b36e246
         arm |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/188f2ab9fb148e6588ebd65f85425b39a8d08dae
        mips |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/80237c452db1db519f54a0e12709e0d6c61bdf72
    mips64el |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/784f73d3c81d51c0ee5d426dec083b7d7562b81a
     aarch64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/4c7fc92a42405e25f41394fa44f5bdc27a4538c4
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/11aa73da8d36e4f7276a2a5950cf4fcb1ef005f0
       nios2 |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/6e720a3f00bab5f75e4e56b27d6c721bcee4121e
    mips64el |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/4656d0d3addaa694994d4da55848ffbe63252470
      xtensa |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/f3ce999d70162f7c2e8bc8e54dea53c09ddee7d9
     powerpc |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/223ec088abe922f23c11cdd103cdb80d78e7f13f
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/925fe52976404a5c1df94997b049605331d9169e
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/b7e39f6c043ed95b14937c37de5c76ba6ae2906f
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/1da55443fd659bc41cb3310d5fc0cdbe4575d571
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/f512aab5d4119de3c80c70a72965d68b4f3481dd
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d6e26e7319efe77272b5c7baf50430e884fdc77f
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/5a7a02e2a33a9bcd7ada51303343bc78f1ae3819
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/796b57ff406cb727b5eb8aa7097f2f04ee4a3c7a
microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/6c814998b20775658d550f116b9b5e19c1990cc0
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/183548edddbc66a8ba66e33695004385bf8791c4
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/9cb3bf1d44a210d9db1e22762c841cbc3efd0030
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/8ceba510ea577280b0403e3dde43ebffcd0eadcb
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/76d09af120d58850df9e781e407351f59431ab7d
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5f34643698cf1c6ccdbb4b38b46301f89071fbfe
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/79451cc9df01bc4be078566308bbcae9ce667e63
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/0064adc1805b5049fb75532f2963a4bb3ccb5404
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a4efadc26121f430f2a5a6cb02673fcf805715be
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1407b975cdfdc673019f5ab4c112814c737bcc87
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ce3f4524275415aefef4c54711380fe35f12206e
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5fc47cc6aef1d79c436056ba13221a13ad7f9ea0
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/e5da543a77d0a830b69d58b4abf572fc377c91a5
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/7723628fa8028c5d310fb1578365338a2faeba2a
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b726ae7c70b8f036e89b9b1cd3ba71842ea4a711
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3f705d790bab8251680ef6954ff7fed58e2402bb
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/19cc1932f1d48aed36a8b2766b02f5c91623a5b6
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6efc444b0edcb8ed135c39dcc213aceed063ffee
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1800db6f5d364da1b1f072bd996b5017f49a5d10
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a2850fa37297173972cf621a792102775c562b43
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4dbb05b0d571aa5ce4193ee959187ba9ea479c7f
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ed5b91b413eec09c73bfc598a086c3f771916f21
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8f29fbf1f35bc3d7288392db098575951f28a8c8
         sh4 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/f067ab1a2a23ef80b295aeb471d09650b44709e9
      x86_64 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/c9853d41057712c42a39282c732e2a66cb573d6f
         sh4 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/fee01c8ac98fd6de5b5f8cc2c845de2c5a64b863
         sh4 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/e53e3213e27fa9267393dce3ef0613fabc8e14ea
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/e68ceb96c43153b6015e3f7005fc59aec6a6256b
         arm |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/08e2ce21f7ed8b870be0fdc3745d42d708f6cb84
      x86_64 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/9324968d12038223259e090a9da70c0d1be6dbfb
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/39d8a4175acf0a20f01311e0bab0129a3f918723
        bfin |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/897cc760008d7bea2e5d5fb0047f7865f3ca38e0
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/1322c894a14cea233819b097a76d23c7b2ddbdd5
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/864caa9629b27ed17c59be2903e6e33286be22fc
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/eb8f4fea208ecebbd1e738e740754a8f9daabaf4
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/8695046d4bec37bd793b5bab4659840f490a119d
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7fe0dfe68a624e6c0b862450e7637813b7c4706a
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/846aafee6d917e70f57657ce4cfe2a2c69041377
      x86_64 |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/fa05a1e37b97b65fee89adb97df371fc7b25d071

-- 
http://autobuild.buildroot.net
