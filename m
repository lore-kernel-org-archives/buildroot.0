From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-10
Message-ID: <20160411063023.C7AF3102566@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-10
===============================

        success : 191
       failures : 63 
       timeouts : 1  
          TOTAL : 255

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 11
               valgrind-3.11.0 | 5 
                  ffmpeg-2.8.6 | 4 
           lksctp-tools-1.0.16 | 3 
                  cairo-1.14.6 | 3 
            webkitgtk24-2.4.10 | 3 
glmark2-499aa81a68fb4c8aac1... | 3 
                  boost-1.60.0 | 2 
                    yajl-2.1.0 | 2 
                 libdrm-2.4.67 | 2 
                  connman-1.31 | 2 
                 igmpproxy-0.1 | 2 
             lirc-tools-0.9.3a | 2 
                      qt-4.8.7 | 2 
                    mosh-1.2.5 | 1 
                  psmisc-22.21 | 1 
            lttng-libust-2.7.1 | 1 
                wayland-1.10.0 | 1 
                 mesa3d-11.2.0 | 1 
          usb_modeswitch-2.3.0 | 1 
                   taskd-1.1.0 | 1 
                    cups-2.1.2 | 1 
               ipmitool-1.8.16 | 1 
                  stunnel-5.31 | 1 
                blktrace-1.1.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                  quazip-0.7.1 | 1 
 make[1]: *** [all] Terminated | 1 
                   systemd-229 | 1 
               iptraf-ng-1.1.4 | 1 
                 libgee-0.18.0 | 1 
                   vnstat-1.15 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ea7d9f1ad6daf913f2411ee89aed4530ab9fc142/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/892ab9e00f4b1cefbc39bb9e3d9156982f081930/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cfd5c0cfd6e26b88f846ef2b72e49b93762ae092/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/0cd32907f78e2e9872cb425191ca77f520fa3262/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/cd1327a18bdf8e376ce29ea5db54be6aff3eb4dd/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/00290ddc86c3e6eae689c1f6aaf5a35f58033e01/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0e5e3cd4c7d1fee5ada0f536e2de245532061322/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/461a28b760ab5a99b692bbfe52275dde58497e5f/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/f7ae3e4dc8c332213e3022ca13ea1e06e7437593/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/1ffc5f1f8ec650b1a113dd0d97c08618230e8b6e/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/00d74e3e779b1eacbf83fc3922e331315b10ac09/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/a1d9df34e559f677509eb42f4209581d64a3acc1/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/a2841319562debc68236ec3da3c7fec500709e82/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/6e47bb3bfdd5f6b66f8a96d1aadf865ee5d0998b/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/726f760ada0c5d1ffabdaa1c8eaba1e385b6ef1c/
      mipsel | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/5e20d877ac81155b7c4afbf1ccdc195a17b3d9d2/
         arc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/179cb9ca5b74373d771ba89e6a5dfa461934bf1e/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/3f4bef4e5628acb86dbfa6cff81296eb5f81a4dc/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/aca644d3a516aec24aef62db8bf0dd3e2f84417e/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/cad966d2e408bc6571c09a8f9b7585e8dcd1f560/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/3b2100242a4db559b21c7624b7f458bae4d59c33/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/04cb192e65676aba0dfc4ecf725f6e247fb993e1/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/c6929caa3a6e4a321c60aa8ca087d7c92a14a5d7/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/e45918b6958d89277d96ec9b2fe5836539f6361c/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ca98a430f4ea4f3463f67632c72034ea411ce125/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/63ebb88adefca720d56e976754c9593d51d64761/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/af2ccfe0eb67ff72376c8cd57c98362155810826/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/1d076dad10dc4518638712c73c511ea474eacb5b/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/f6bf875f04f9ed2dcb33f9aebd0557144fdce785/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/cc6331d88aaf28775776f85cea6fe2e877f97c3a/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/0fb7449fb169f051598a6a1acc949ec83463d9c4/
        mips |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/70c2e93f7afd2a567d20ece2c86e20fc9e7565b7/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ca7c83ff1a19e6ab338cf6e2383e091dae7fa558/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/e9aa810a4fe7ed8031e3e32bdd83a3708b64f200/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4b630903316de3911cbda9b699a959a3f6623506/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2634299c23d97f43f9a3c8d7d94e7bbc243b623d/
         arm |                   quazip-0.7.1 | NOK | http://autobuild.buildroot.net/results/4596b9c69cbc387f1071c730aaac76723afaa853/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/6dc35919b966d85d2b22495c46b15d713d78525b/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/b494a5f6c528397f325357bc7a5a298fc21aa86c/
      xtensa |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/a4813ca9ed08eff5516e287f764124bb54c445ec/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/7257b6fe1f6139a692bb2da47ec24f063c979056/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/fa49deabe28e6c1b75b3c722395ed51fd139d438/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0ef9255428995fd3d6f4b60bffce50132ec301e7/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a66ac65883079c793da46e83b877bb3e4df630ab/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9a8a51a27835c4597ca1441022b50fab20e49948/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b4b2af8ccb0d4e8a1d3077bd66322f6124a56247/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/fd62680a614e99831b2ea88e7fed71b716f6c1e9/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d68871356e86ef7a1f3f45a0c3529928b762cee8/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5c7fa756bfbd3c678b7555c2d79d58e7a72329f6/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/fe0d5e7b929d238e28038b023244b8012e15f6b7/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2bd399a7a68bcfcc47b6e6370bb0025e09bfe66c/
microblazeel |           usb_modeswitch-2.3.0 | NOK | http://autobuild.buildroot.net/results/b11df0218500ff29c2a067f58f196a7b26c027f0/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/51601ee4cd020b5daa05752ae47f85301fc456be/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/166510e56c1e2459092e7e2d853fb11462d4155d/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/28e162fdded77c779082adaec00ccc746c7d3935/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/344ef1666e3c7332ec63675f4179bcca2af06b19/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b7026ab63ea8e81035d0a7122364a02f9c6deba0/
         arm |                    vnstat-1.15 | NOK | http://autobuild.buildroot.net/results/4ddb0d7d7fe2509ff9c4753d918e0bebd7725c13/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/20fc28e3a8e7fddccb6d876121912fd7857a8c24/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/ec5ad43d645731df2c150706d7b7c97f0655437b/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/f8bb7d833df5dbb0350029d6492f620ea11e6e2a/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/adbd07fbaa58e9ce9ace951d6c470e7d4eb25e4c/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/0f3d8cf98f106f5cd88912e55869fafffcd20b3e/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/0b4e7a29a3ac66125203bff95fd53befc6bf05aa/


-- 
http://autobuild.buildroot.net
