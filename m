From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-11
Message-ID: <20160512063024.1967E101F05@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-11
===============================

        success : 159
       failures : 75 
       timeouts : 1  
          TOTAL : 235

Classification of failures by reason
====================================

      python-coherence-0.6.6.2 | 11
android-tools-4.2.2+git2013... | 9 
                    mpv-0.17.0 | 9 
                  ffmpeg-2.8.7 | 3 
                  boost-1.60.0 | 3 
                   erlang-18.3 | 3 
                    mosh-1.2.5 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                 lvm2-2.02.153 | 2 
                       unknown | 2 
                     vlc-2.2.3 | 2 
                    cups-2.1.2 | 2 
                 host-go-1.6.2 | 1 
                grantlee-0.5.1 | 1 
                 igmpproxy-0.1 | 1 
                  nginx-1.10.0 | 1 
                blktrace-1.1.0 | 1 
                 rsyslog-8.9.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 raptor-2.0.15 | 1 
                libinput-1.2.4 | 1 
                   systemd-229 | 1 
              gnuradio-3.7.9.1 | 1 
             stress-ng-0.04.16 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                  connman-1.32 | 1 
                   perl-5.22.2 | 1 
       openpgm-release-5-2-122 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                flannel-v0.5.5 | 1 
                   mpd-0.19.15 | 1 
                 opencv3-3.1.0 | 1 
               netplug-1.2.9.2 | 1 
                 jack2-v1.9.10 | 1 
                     fbset-2.1 | 1 
               syslog-ng-3.7.2 | 1 
                collectd-5.5.1 | 1 
                   mplayer-1.2 | 1 

Detail of failures
===================

         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/630bae50811d5bfbb2360e1c7db2b9d13e6f021a/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ff7cf9c787065086cabe3918d6276c45971c0cd7/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a5ef87103f192585ac08e7fc96ede3b63cf4d744/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/aa3529a042deae13423243cafc02f038ec623d0d/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d87a4bd35cedca94ef6266a06ba05dda103d49ce/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a8312469b4da6142f0ae67a5eeaf255da351a379/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/aa0aeda00703ff03172ba6e4c1f38bd29eff47e1/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/62f0f2707758a5dd2e7fb7b0251b2dcf9b7591e6/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1e0868570c346f5134bad9b4702b77acd8f6f066/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5f5625a570edd933808ed3e789be55961522931c/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ca383533328890f61ec632b5a7088d44af989740/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bcdb1a6ef09a2c171a0815a663d0a9686acfa6b9/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7ec83381fe0187ea94f5e6367843c978f8d79394/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/1475e079cbb1bbbd4aacbc9511a1c0399249fa7f/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/2958a528b78db7055905a2e5f44a1c462c655b55/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/d698d086429983bee5355b5c3c3abd4fd8ddaa81/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a9181911895bce59821c87a5ddbe7e17643e0784/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/7b098165cc6c6565b3a07c49515c0977ab7756d3/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/45ea198fad364ec2484e8d5daea87f2a54ecf7f9/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/ba07679401b0bc6183a54067cb113c0f71b84570/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/5d6743a576e07498ae546792347f7fc769fc2c79/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/3e9543eb27e0fc8f8f4fcb042a71325c61885542/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/9bbe94ec79a8fab079277577c6eb2866f49560b1/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/20cbfdb5ef3cf11c3e55111773b1daf2001acef6/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/f3e3dfafbabe4c7e3554383c337566f43824aefe/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/9d832199e1fccaaa67cd2ebf5fa98c648b8753e4/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/809a0718f8107eca20e4a9b1452fa0dabaaa9425/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/57e667008195c32aa3b89f0b819de5086b033d6a/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/d942efc47605f1bda171429f7a07e45408347c73/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f9cc6a8cd51a6f18effb7911fb4573d0848c09fa/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/0a641e14a78a2c4990bd5ee3c9c980ca7d87d4be/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/437a14fc99a09c43a9e16be65ae3faa33afef74d/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/3fc693b6335df05a3fa24587dc844606d560cbac/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/f0b104d1e71f88b119100a4ae4a3b6cccd8c29a9/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b9b9ba9b5031fd88946c4369f21fa95a2599384f/
        i686 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/3a3f8c5624e8019a6eababbf6e7440fdd668f85f/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/030abec373b47d2c3ffb42008dac6854c77eb57a/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/5d581e64ff8ffa6f2dc9e6286f4747748557bdfd/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f05daa213cbab8ab591155acd9985f9aa5e1c3a2/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e83c366f759ad1b7f37664c583a8432c9d0762ea/
         arm |                    mpd-0.19.15 | NOK | http://autobuild.buildroot.net/results/7912b2057bfb1cb0e82c16cc8ea958fffdd5763a/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/14846c5b186602110632ee9115f2c54d36ae6ff8/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/4fbc90c8a04445f0ea0e641c109b0b39d32a49be/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/99e73470f23157c91aeedfb0bd6fcb1942f6495c/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/d2f1a93fe0aec9e1df3ed066dfd573300aabf3b5/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e546ba843089079daa6df63d2f1202e77e398c75/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/957e6be23f6f74fbdac97c2541709e5c305de56f/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1d59e0fc4cb79cf8241deedb9466023ed38ee434/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/aab97b0edff72cb24c003b480290f1d648ef02ff/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c0ad8b54cb455f84df86628c92d1a8adb5e0aa9a/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9c05c6d2bf55da8d9068f5aeeedcc182c5a7233f/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/d88e26f8d39333b75a114bb61fb2a0313e336e9b/
       sparc |                   nginx-1.10.0 | NOK | http://autobuild.buildroot.net/results/c5a43628265a9f19b9d96aa9b2ec792d6a9f405e/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/887863e7b60ce865c30815710044699b3da7bf91/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/af35bf6052bd2ac851b47098c3de851ba7632d23/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/2ea7a0f70776c63ddac3a8d18b792fad386d75aa/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/f40ea4a0de2fb38a2c1409c8b7bac6bce33070ea/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/a3e8c2a5f8ef6d7dbf621f60db4222801db33111/
        mips |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/54ed6401a2b41a47b1dbebf7570750b1c292568d/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/3044279820355349178a70733963c0e16f5bed76/
        mips |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/1834068873965b7579f9dd2cb3b367053d64eaea/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/bbd03c4ec28b307069e5cb53866db56dcb2b0526/
        sh4a |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/80630f5a7264ada17838b306715074e91e8fab56/
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/5b2409800cd0c49ec2cb759b6950b977dfbd9a02/
     aarch64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/ef8a5a2d193ced48b4ebf2a59f6cdfa64be1863f/
      xtensa |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/27e1b8456babfdcf032d93d2e1d154f6217932ba/
       sparc |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/d012419afca9581006b969f8dccf6c4dc4b5650b/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/62addf4abd2a0df8222a81a83c16b2b9a61c9481/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/754fd5cdfb1a5ed1277174a545f64034c7d8b4ce/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/01478a38b7398bfc6c416d5ec128a789f01dc1f5/
         arm |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/0443cfc1de956404387dc1a01c196e3f24244fd5/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/9d0ba2dc808c99f68c61346ea20b63318a5fa80c/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0260da27c4d6e07f17fe029d019d843e2bb1dd5f/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/fb5b3a2be898da689c3a31249b126c4cdbbd2b31/
        i686 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/4cd4ad0cf2298778d38e68474a24253e3d0294ff/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/994849c39303a283b0bc34531a442d6e5cf37c12/


-- 
http://autobuild.buildroot.net
