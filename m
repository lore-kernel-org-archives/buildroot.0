From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-19
Message-ID: <20160820063023.8EB1A1031CB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-19
===============================

        success : 225
       failures : 51 
       timeouts : 0  
          TOTAL : 276

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 8 
               binutils-2.25.1 | 3 
                  babeld-1.7.1 | 3 
                pinentry-0.9.4 | 3 
                  lshw-B.02.18 | 2 
                    libiio-0.7 | 2 
      trace-cmd-trace-cmd-v2.6 | 2 
                alsa-lib-1.1.2 | 2 
                   fwup-v0.8.0 | 2 
                 mplayer-1.3.0 | 1 
                ipmiutil-2.9.9 | 1 
                  libffi-3.2.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                 openal-1.17.2 | 1 
                    mpfr-3.1.4 | 1 
                   ncurses-5.9 | 1 
       freeradius-client-1.1.7 | 1 
               libupnpp-0.14.1 | 1 
              libarchive-3.2.1 | 1 
                 imx-uuc-0.5.1 | 1 
                 jack2-v1.9.10 | 1 
                   perl-5.22.2 | 1 
               libcap-ng-0.7.7 | 1 
                      qt-4.8.7 | 1 
          sane-backends-1.0.25 | 1 
x264-3b70645597bea052d23980... | 1 
               syslog-ng-3.7.2 | 1 
                 mesa3d-12.0.1 | 1 
               libepoxy-v1.3.1 | 1 
                     php-7.0.9 | 1 
                  cairo-1.14.6 | 1 
make[1]: *** wait: No child... | 1 
                 libraw-0.17.1 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e8a899daa9eb16f0fe6d0a47676491a36b5c3ecb/
        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/35ee666eb3ce631b0b9c7986cf89a04083b47c90/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/5b6161872d76656c9e32ef4e31945a9e35d40c31/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/8a87d42bf83c1b495e1ab4c4bec83e4bdab07731/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/80c19bdf8fab33c5d1cd06103ac89b00ad46681b/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f97a25082933ded328a4f999c8afa8c6c669b8ce/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/0cdaffb24540fc0dac5fc0fa4aa2312b11adbf1b/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/bc9b402098bc4ea0110b0dafcb86b79913b18976/
       sparc |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/066d814acc4dd8a6bc7c4554a7ada00a447fa1c0/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5cf97a3f65228781a8c98dcbde6c25359206810a/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/027c614e35a13d7aeb65d44ad14bf285f27825b2/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/d0cc6b1f55e2813c88285fe1bbf43c35e0718089/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/2a3004dc845f9689fbf846dfe252437ef6ddd629/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/2dcf1407788f0e9dffc83566c090c3310f143f67/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/acbdc75bda03f8c9856bc6bc8969d8c84eb40354/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/f843cf93a0a0677d9593f3e12e4404242a790bfe/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/31dcc2162a03e9c70ad3740f63e2a24fa6e763f8/
        bfin |        freeradius-client-1.1.7 | NOK | http://autobuild.buildroot.net/results/8ebc2b853bcd725f45b2bd7527afc34041a77f4d/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d7a360b00f1fb282f334b0aabdbc67d347aad0b2/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b73929de1c7ad269a7aa6913624418364876c1e8/
         arm |                  imx-uuc-0.5.1 | NOK | http://autobuild.buildroot.net/results/41602c20d4e6a833e72b507792a28b8db74a5f53/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/ef8649621fea7039e210f7492219226135feb0e6/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4765d87d49219e686e9b8fa60e6fac72f10b799e/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/8a3e2ba9e0a698d25e1fc8684784e8ba9a5d2e80/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9bbaacdad1eb1592d99a1a2677eda97c9b226c30/
        bfin |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/6e8ea1ed267db851a25a4da672208f240e8b48d7/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/df813b13b097a536284195fa90789ec565a23ddb/
        m68k |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5c5e9e38402c7ac1489eb64af4c194ae6745b148/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/fa7f7db861c342f4d189f74b983ae9d2751cf29b/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/bdb2d6acc38673949b8909cc929fb59405d8da96/
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/815207ef5854c0254e729de1b0403a9dbb025d1d/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/a99086050d23e21cf2e5e9c09ac94901b5a77afd/
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ccd09d06780f1b11ba0edc52dc6f8ef50fe34321/
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/6160ad8819d3f2fcf9433bcfd1dbc720820959d1/
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/8ac77ccf52f97109633d3739dae38c5611ab4530/
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/8b41f9fd141ae7a59edf282df60377abf1328b1f/
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/7669de08b2b9a1c2983239461eee84764cefd06c/
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4f1e0e6494235568b6a74b0d1e7b448c3978cb7a/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/a34d42e5df649914b700f9290b0ff825c02a9b99/
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/16af4024bfa9753e6e2262dcf2f961c7e9ae90ca/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/687b18bafaa1165425a0c51294ebf484cac4f37b/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/1752451703f3ac4e1730b0781a9c34f21951d60d/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e1ee6235a34d9c0edab7153a2ce328905dd09dfc/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6ea64f692acaebc4d58f3371c632b5121500f17e/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/77c0be073e980d2b8535bdb244299bdaee076f05/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/54172d55f39b2fcfa5b7fb4d4ee01566678babbc/
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/86c0d172f97a09230a1b589d599c54a656dae66d/
         arm |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/1a7e67274f8d440a7df4b96bb7fc9f66f515741e/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/5f8b2e5524356aa4808abf25d3029fd8822041fe/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/26f3aeb8833e3a3013b33772d6271e8a30d9eca9/
         arc | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/a33cbe9c7daf0fd7940deca942adbf75627d1680/


-- 
http://autobuild.buildroot.net
