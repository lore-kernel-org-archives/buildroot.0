From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-10
Message-ID: <20160511063022.50F901027B5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-10
===============================

        success : 131
       failures : 56 
       timeouts : 0  
          TOTAL : 187

Classification of failures by reason
====================================

android-tools-4.2.2+git2013... | 8 
          php-geoip-legal-info | 4 
             stress-ng-0.04.16 | 3 
                  boost-1.60.0 | 2 
      python-coherence-0.6.6.2 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                  stunnel-5.31 | 2 
                    mosh-1.2.5 | 2 
                  cairo-1.14.6 | 2 
                wayland-1.10.0 | 2 
                sg3_utils-1.42 | 2 
                    mpv-0.17.0 | 1 
                collectd-5.5.1 | 1 
                    quota-4.01 | 1 
              pure-ftpd-1.0.42 | 1 
                 host-go-1.6.2 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                   mplayer-1.2 | 1 
                moarvm-2016.04 | 1 
                 jack2-v1.9.10 | 1 
                  nginx-1.10.0 | 1 
                  ltris-1.0.19 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                blktrace-1.1.0 | 1 
                   systemd-229 | 1 
zbar-854a5d97059e395807091a... | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                 lvm2-2.02.153 | 1 
                     vlc-2.2.3 | 1 
             lirc-tools-0.9.3a | 1 
                flannel-v0.5.5 | 1 
                   ntp-4.2.8p7 | 1 
             ipsec-tools-0.8.2 | 1 
                 libdrm-2.4.68 | 1 
                  connman-1.32 | 1 
                  ffmpeg-2.8.7 | 1 

Detail of failures
===================

         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/664e7531978695875b55c2de1b56ca192127aa30/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1b37e7f77edf82264023b3d211ca70e1d6435d4e/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/93398f06133cd95a3cf591cf37d0a934ffa33e5f/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c693e449397c2a189b3e9e701b962e62c2b27c77/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d0e7bf21d23da49e8eada7db0d94b1dec07cfbd2/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a5d5242b4f0d4c978e4667dcb8a33493b2cb9d6c/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0f9f0692036324b17c388cc6d910abc8e6e8b231/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3b7d4eb3de4d438b87cce5a218b0be17e6af79bb/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/21d61465b0841c82af3abdfe7320fdb3afb106ef/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a6c829ca5b0af9e80e1bc05129175ff2661502bd/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9c1d058cd089604b861e39bb11dda7a1cae5faa1/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/a28b077411db50e3d459f8da853e19b37fc7b4df/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/e3ef480be5a1ec972ff954f9e5d9e28baf33e155/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/fe36dbbd8f4fe3a7cf13a89d8030920ad0c1b163/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/68bd6d353eba2aeb1e183ed518114c4231d7b8e4/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/48bee9409ab8a1a25e2b5a2f004b14048995bacc/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/fdcfc031d4620ec8a89d770a4894ce14dc5314ea/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/63f35f3fa759789c78e711ae26244ee2f3b3c48e/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/0a7999ba47bbd809c764d49fad5fa617891f30d9/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/4fb10398d736d1451e3786ae40fdce8fc117ede0/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fa7c52d0f0f4dbfb146a79efc2284e9bab4ac2ed/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/7375abccf28eb6a97633351f982504d3e34fa50e/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b057912153560698a5d9d35de6f59e9d9f35e62b/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/5b55fc65581a8e3cd5177fde28d295caf530d297/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/2ddbb2147a146198b4d7fc5b965818259ac87cd2/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/c24cfce9f732b2500115a5545419047fb4f4f7ee/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4c02a56301e904303fd1e527d0cfa60aec166cdb/
     powerpc |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/db606c9dc69059af86b2945c14e4ade9b34f0c4e/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/d9113aaa5dd47c7ec6ddb306f93079df17d9543c/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/1b875443231179e4734a70840b91361507e2c7af/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/c94e0ef0aca3b58735cafc5837911572b7d2695e/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/61b8dfe7a67ab28a8b0273100f7b81ea9bbd60ac/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a0c183e5883d3ec44c7ccba1c5db3718668ee5e3/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9836f078a8d6fa6b4db5b98140d6bc54e1ceece3/
         arm |                   nginx-1.10.0 | NOK | http://autobuild.buildroot.net/results/4963eba5f110a01cf40e7af8b749cc4801e57205/
        bfin |                    ntp-4.2.8p7 | NOK | http://autobuild.buildroot.net/results/7cc0a194ddba73f670b9f8daf0be1ca037abb926/
        i686 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/acd763e7eefb8be2bbd0bf973bb7855fceee7377/
     powerpc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/daa0da5a60594e6431a7325d1f55b84b7de48b9d/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/cf57463b3a1d6c055b5689587ac6b48a052714d8/
        bfin |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/edf6eb505041aae23a66b035494b5746e3296653/
        i686 |               pure-ftpd-1.0.42 | NOK | http://autobuild.buildroot.net/results/61c18fd00a77a262e45f2fcf496faa4f7b89e4af/
        i686 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/d09a6604414ed79205d95b164e32dbd72268e05c/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/a974f3f075fb22adde720856ec4c9d11d8151da7/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a9801c88363bc64ac3e38f224c3ba319abaf6cd3/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/01a4d20430760b4fa34616af3391d1bcb39ce9f7/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/2c5a4935b69a2973e88f159688f8ecfcad28bd08/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/072b8086736a155d9927c14a8dea85769e654e03/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/acb7e0e8da432134a4897534694ce159af3fae5f/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/9055f9981c6f0e196c97d74fe97808a6485f4f77/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/e77fb4b546fff7e01aa5569d6e3aaf6b2a3b0d2b/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/55c4035d7fb599f92fa44b77e9498d8ad7770152/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/3abd7355a680bbdc4e0e4b508bafdb58e53c6818/
         sh4 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/e48b6c328636ff3877501f401693d98d9d814dff/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/ee1fe94f29d82c4445dd984877bc8d6dd9d5f231/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/20b78635357771f2b028f26cc7781b784dd6acdc/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/3e259e0bb795827412ee21513f945be66237bdce/


-- 
http://autobuild.buildroot.net
