From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-17
Message-ID: <20160718063028.BE31F101F3A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-17
===============================

        success : 59 
       failures : 50 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

              lirc-tools-0.9.4 | 3 
                  cairo-1.14.6 | 3 
                   dante-1.4.1 | 2 
               libcap-ng-0.7.7 | 2 
               qt5base-5.6.1-1 | 2 
                 clapack-3.2.1 | 2 
             bluez_utils-4.101 | 2 
           uboot-tools-2016.07 | 2 
                   bdwgc-7.4.2 | 2 
openblas-f04af36ad0e85b64f1... | 2 
                acpitool-0.5.1 | 2 
                    mpv-0.18.0 | 1 
                jemalloc-4.2.1 | 1 
                directfb-1.7.7 | 1 
                fcgiwrap-1.1.0 | 1 
              alljoyn-16.04.00 | 1 
                     mtd-1.5.2 | 1 
tvheadend-8e637f9f903f6d820... | 1 
               openswan-2.6.46 | 1 
                openssl-1.0.2h | 1 
                  libsepol-2.5 | 1 
                libaio-0.3.110 | 1 
                flannel-v0.5.5 | 1 
                  boost-1.61.0 | 1 
               netplug-1.2.9.2 | 1 
                 omniorb-4.2.1 | 1 
                     php-7.0.8 | 1 
      host-uboot-tools-2016.07 | 1 
                  multicat-2.1 | 1 
                  babeld-1.7.1 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                  rt-tests-1.0 | 1 
                     vlc-2.2.4 | 1 
                    lftp-4.7.2 | 1 
                alsa-lib-1.1.1 | 1 
                  nginx-1.10.1 | 1 
           argp-standalone-1.3 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d2c708fc2aa18ecfc368a4ce93400cfc44366102/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/e5b30b5e0d86b44b97410d434b771e1fb7b18de0/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/3022c04aae34167b6f88b5836c628f4623a580d5/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e89d3e3060bf8371311aeaef2b3c34f6d8b36178/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/4d372a3fe0760e5d495fdd9edb5fb23a145d317a/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/136787d4b7c6bbe6263ad6913ea1f66cde2eed37/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a3cd13a2f0d55043931628c5f9cecb3b55c6ffe1/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/37aa2f921272f99d111073f82fbd3b126338c99d/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3bc2da28dad914541d5a62f7c7840265fae9e253/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f91854bf03adced7244566d15d239dcc769e28ba/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/b5a46a4976dabd9570e3310081fda42a69c66ea4/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/e866954786869c2302b7b3589f6d034c2b785a34/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/efee49518d4c6495ca588b18347a6d7504e14fd3/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/849e5eb4d1cf4929fe25ce1d719e8b52a7e71ceb/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/1a542ce9600c4696fdcd9c86940e279b24d2a66f/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/44e3de3738a9dc8510461a1b460df47ab79b7b56/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/94b9367eb6545d7b4be9b843d6b5f483e76eb404/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/78999fd8ae84b058f4438e73f8551b154369a99b/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/0656fde5005c7472e9e8ae8da32a6955ed5093cc/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ab726d8e94d4bfbeb5e6d6b2a601587ecd8fd5e1/
         arc |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/7494a5b22e3df1c05cdcc47670deaf54d9e04133/
         arm |                 jemalloc-4.2.1 | NOK | http://autobuild.buildroot.net/results/73c437fb932a30bae17653173e8ce35cc91757ef/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/94597db4c8b0fd79394985c1813de8ae573d2c3a/
      x86_64 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/2ea1bdacf15ed2d087be54c0dfcb40e8935820d3/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/7b3277338005516b2ff3501a8caa90627b866465/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8b7a648c3532f24a41ba6515b1884282a2e3384b/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/5d76cea79b2cf2046ebaa9e9142e5dcaba5ede89/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/a7b966d9b907871f1f6c737420fb0584154dc1b8/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/3925bc84ec0bc50468280e22e309bb85d9863957/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/49cad9fc0657059af95ac99e4a25ebf73eac975d/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/5eea307f36268df561cd271170e77170f9cc78da/
         arm |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/308ee9fda0c153dac96afc3567bacc4b8cf999b0/
         arm |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/2526598f561dc66ae02c53ec82f6a2a1395cdaf6/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b60ed99b8a6b0b22f64ef5b0555ebd1478df5870/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/76de971f547825758d988e10b3565cd47f112f2f/
         arm |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/cc775ac8ee6dea29a23b38e003f056ee0090676b/
        i586 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/ea49ee0b75edfb1ff4404f8091a1bd39656ce5de/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e52896da72238863303f67f31e8a61dcbf1c68dd/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/b201e4072b0b634d5ac86781aee24c698f88d689/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/f83c653f285bb0c69de56d16a12bc8fc09d3648e/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e8e00af4facde1df621452445b2f4590e3ee84b7/
         arc |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/665df82519df71498f390368a14d790263d316fd/
      xtensa |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/e625084ccd71102880cd63bb5545f689f764d3d7/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/dab4089ebd082336fcabd560dee2758ca871e947/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/0c6ac983caec1c2ca3ebbf5de29a778438f8acc4/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/00693865be97b59d602fd8f0fc54fdc29bd9eea6/
        mips |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/f98f30bbf9d4cdde37a96b9310873d83dd649c54/
       nios2 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/2976341d424970867c1608c86a3a794e81a0b084/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8cd27d6cdf8ce319ef4d9520dd7189139989b3af/


-- 
http://autobuild.buildroot.net
