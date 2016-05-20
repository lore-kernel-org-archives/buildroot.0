From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-19
Message-ID: <20160520063022.30AC8101C1A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-19
===============================

        success : 140
       failures : 33 
       timeouts : 0  
          TOTAL : 173

Classification of failures by reason
====================================

                blktrace-1.1.0 | 4 
liquid-dsp-df5a459fa05dba41... | 3 
                 libdrm-2.4.68 | 2 
                 host-go-1.6.2 | 2 
                      qt-4.8.7 | 2 
                grantlee-0.5.1 | 1 
                    mpv-0.17.0 | 1 
                   ntp-4.2.8p7 | 1 
          sane-backends-1.0.25 | 1 
       openpgm-release-5-2-122 | 1 
                collectd-5.5.1 | 1 
                 jack2-v1.9.10 | 1 
                 rsyslog-8.9.0 | 1 
             qt5location-5.6.0 | 1 
  toolchain-external-undefined | 1 
                  ffmpeg-2.8.7 | 1 
                     rpm-5.2.0 | 1 
iputils-31d947cf7156cf78d3f... | 1 
                    ruby-2.3.1 | 1 
                 mesa3d-11.2.2 | 1 
                moarvm-2016.04 | 1 
                flannel-v0.5.5 | 1 
                pinentry-0.9.4 | 1 
             ipsec-tools-0.8.2 | 1 
                     vlc-2.2.3 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2accd01bf4c8a78c08cdd6c4f24d241d88c2e8ea/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/44fabe192aa565e7679ddf5777dc3f2cde328725/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/dd2695f5861d4a6451f4e4880f0583ec14749cf2/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/1db49139edc1108212857e47695f62e82e0d4828/
         sh4 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7362431f62ebb1b436ac41ea3ef85228c763e6f3/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/2316a602d040948ce971df99857c222e87dd94b4/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/bcc5a2336bc3e86f4f7029285501dbd3bf5020cc/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/f9c292943b39f059a1fcd598e643d28687a84f8a/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/873e0a68c17e503b9fc141019f4414d8e55d0fa9/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/cfe98822789412446533688abf1f66a8177ff028/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/87643394c071aa0ca67b05d45006684754cd5b86/
         arm | iputils-31d947cf7156cf78d3f... | NOK | http://autobuild.buildroot.net/results/c56ced8be68e6f7a64d19c701641d47fdb150c92/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/eccc7bd233a6c72a2bb51a9075f0f8779382f30c/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/8de36fe24a8bb883054b56da5842de7f7b44cb82/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/b8ad4ac4ba28c2f17d7e4326d1ecc537c8a6780b/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/01d7d4f34b256bcdf30b16180c015f146bd50e63/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/24fe2540265aa53ed31593d2e50910de93e53b33/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ae5af25390357185ec5dfba53c883afaa3a9ff73/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/ae380104763074d676dcbe56bfa7d6305f445bfa/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/39056c9feb319d1ad04aa01b7f909668ff1b90c6/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/b91638a7e22a7d008c854380556334bb051602e9/
        bfin |                    ntp-4.2.8p7 | NOK | http://autobuild.buildroot.net/results/179a13597e4f5269318a92964e53333f8ef71f1f/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/420367cc4640c893f48336d71fa04eaeff55c8e6/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6b6605f5dd34ef0c11da040dd84e2ecd1596eca5/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/226a483123c1a05694dcc5860e0f0353533862af/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a31f4c64bb2750e9555a9df50ff5acafb99a9e5e/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/90a6914ba3fad0d4ad3e6b58928d2b6f7725aee3/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/13aeac866a634a7acaf8aae68f386813f565d7a5/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/1cda32983fdf9522e4a9d48cc1304cc1451771a9/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/a8b5fe95bbc1b3cc23db828fbc80d815c88f18c2/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/4feeb0498ec66fc72dfd1a89ff5d0b85330adc5f/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a84a1b40065807bdf4ab7c174985453bcb5a92cb/
      xtensa |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/38981ca8ba6f3edefc4e44e1d75d3e20742c5bf5/


-- 
http://autobuild.buildroot.net
