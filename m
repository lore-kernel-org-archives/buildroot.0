From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Jul 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-11
Message-ID: <20190712060044.72691882BB@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  12 |   1 |   1 |  14 |
   2019.05.x |  11 |   0 |   0 |  11 |
      master | 116 |  30 |   3 | 149 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 5 
                    atk-2.30.0 | 3 
                  dnsmasq-2.80 | 3 
              libsodium-1.0.17 | 2 
           libvncserver-0.9.12 | 2 
           at-spi2-core-2.28.0 | 1 
        glib-networking-2.58.0 | 1 
      gst1-plugins-base-1.16.0 | 1 
             gstreamer1-1.16.0 | 1 
                harfbuzz-2.5.2 | 1 
                     host-llvm | 1 
           host-nodejs-10.15.3 | 1 
              iputils-20190515 | 1 
               json-glib-1.4.2 | 1 
               libcap-ng-0.7.9 | 1 
                          llvm | 1 
                   mimic-1.1.0 | 1 
                    proj-5.0.1 | 1 
       python-matplotlib-3.0.3 | 1 
          qt5multimedia-5.12.4 | 1 
tvheadend-8f1de1621d78c9143... | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                xlib_libXfont2 | 1 


Detail of failures
------------------

        i586 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/0aa64b3de14a682bdc270ac88aafa16ea8370f4b |     
      xtensa |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/abd4720db8ba24aa368333aaeb9ec2252b46fe89 | ORPH
      mipsel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/41682199c3b0d40427799e313d39142ed6eeb446 | ORPH
         sh4 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/63b8b27521f79682d4ba2673e3b305c0a3983c5c | ORPH
    mips64el |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/0fc9ce747012ca517d35da1bbbb367bc7c84670e |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/0beefe97704833246ee337b55b45e78834e65f3e |     
      xtensa |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/b27ee0d4f46e481217f9e2c4af95c4eac87af174 |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/c022f28b53a05aff848abb11bd8bd9b8d040aab3 |     
      x86_64 |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/db08a043cf33e9ab453442ed74124cce8c0ebb95 |     
     powerpc |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/6d3be9feb301495b079eff6283f1cbed9603dc42 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/1cfe75c00e3d92144ecc571674235acf57a215fe | ORPH
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/a4c99411df6466b52cae4ed63e1df740428fb1c2 |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/3efe33d925341b24510f8f7a5186f312c6be4e70 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/06d18b650832ae2b76c4a8beb81b3e7a4c3c90bc |     
        or1k |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/b5db12e656d96b1ba804c7caa7edeb28edfcab1b |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/3b4c48e1e717fb7f72ad9a23c5b2d538375e6bb4 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/b67eab61e7cd0de19d587ac4d3e0c41d0dd77abd |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/cd490da2570da4f5b2e95b69bf3ac3f101574f62 |     
        i586 |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/2b7f1f65bd5e6245e58452e737631a0c2966f1e1 | ORPH
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/8d7b109d085e3931a874c4fb99f465789485565a | ORPH
     aarch64 |                           llvm | TIM | http://autobuild.buildroot.net/results/cab473906e2014635d730106de8aed8f3a2a53a4 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/7a4903b1a1105016fbb4902931a30992ff42421c |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/2b828c4e3118857acc63f9a7f8e68a9ecf1e1e20 |     
     aarch64 |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/890f2df4ac47203e8e7d931c4d7cd4f4ac30117e |     
     powerpc |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/7aa52bf8ed586c614dec13ae4c20d8ad689e5343 |     
     powerpc | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/06cdf5d223ad27b7ab90a7431063821e328e853f |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9b382b164d4d8fce294cbc69db9b83e6ea598741 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/5bef57d35efcc8d274093ff1e5726c8bbfec87f0 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/a620811103c1bf232bff33ba735e22bae171c2e9 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0a94699b7d17eba23be2e15c0475ee477eaf3774 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/92cfe67a26c18dc55fc54371caa48c93adce8370 |     
     aarch64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/8f8d94e6a4c9678271a2f46e76c92289a7a1d216 |     
microblazeel |                 xlib_libXfont2 | TIM | http://autobuild.buildroot.net/results/21099d27c03948daaca2d1c149eeba084427e3af |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     host-llvm | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/ee4b33ac65486655f9e7c7ca89b786d973ba35a6 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/26f278433f97f61a3d50e6a76a2b197738bd8f71 |     


-- 
http://autobuild.buildroot.net
