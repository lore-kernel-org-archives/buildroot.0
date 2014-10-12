From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-11
Message-ID: <20141012063012.C014D101272@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-11
===============================

        success : 170
       failures : 24 
       timeouts : 8  
          TOTAL : 202

Classification of failures by reason
====================================

                 libplist-1.11 | 4 
                 webkit-1.11.5 | 3 
                  thrift-0.9.1 | 2 
                       kmod-18 | 2 
freerdp-440916eae2e07463912... | 2 
               qt5webkit-5.3.2 | 1 
               libsigsegv-2.10 | 1 
                 omniorb-4.1.6 | 1 
                 pixman-0.32.6 | 1 
               alsa-lib-1.0.28 | 1 
                directfb-1.6.3 | 1 
                 lvm2-2.02.106 | 1 
       opentyrian-2.1.20130907 | 1 
                minidlna-1.1.4 | 1 
                       unknown | 1 
                  samba-3.6.24 | 1 
                  ffmpeg-2.4.2 | 1 
              sqlcipher-v1.1.9 | 1 
            wpa_supplicant-2.2 | 1 
                 opencv-2.4.10 | 1 
                host-gdb-7.7.1 | 1 
                     gdb-7.7.1 | 1 
                  nettle-2.7.1 | 1 
              host-erlang-17.3 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/8e41d8fc853f78eb3bd536c00b4eabb9e110d2fe/
      x86_64 |                 directfb-1.6.3 | TIM | http://autobuild.buildroot.net/results/7e9b40d1c808f337f5e4cca14fab678d2eb9c03f/
      mipsel |                   ffmpeg-2.4.2 | TIM | http://autobuild.buildroot.net/results/b99d2b3226a30e9c402564e87898d71fe860514e/
     powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b8cde0c47f3f4cb5663cb1a01dd8c1ac61724f8d/
     powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/57be6f9ae0b856fdcee5df6aab520b12f25d6cab/
      x86_64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/17e0715dbdee5e8ea73a51f64638c14ca37b02fb/
       nios2 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/1f7fe53841f32928fab14a9c1e61e5743b5d1beb/
     powerpc |                 host-gdb-7.7.1 | TIM | http://autobuild.buildroot.net/results/36c08584e8173e01611f04fa16c4e724b5e1b8cc/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/3210e2512783a1282664123e4e63ea9f3d4f910a/
     powerpc |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/1b6674de717bc1290d41363b14f123fe66f6c45c/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/ef0a9403260662dee31d40e04fd94cd1213d4b91/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/117b8ef77edc50b8b6ca45ecb44c91881df7434f/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/685fcd3569cfacbdf618033cc962d9a1dff4b869/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/9e19636ae416e88e27a413f91f46d9d355cd71f9/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/cc46f77eb011e88bcbc3308ba883cc5edf89cc4e/
         arm |                  lvm2-2.02.106 | TIM | http://autobuild.buildroot.net/results/224f84765276e5669e56584c9dcebe9e18d29b61/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/8d59565e66f0c8e69c56cf3e97ec179feea38623/
         arm |                   nettle-2.7.1 | TIM | http://autobuild.buildroot.net/results/1d13940580b8ab2945270b3d407fecfc63af93b6/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/0d942ede957921ae2c3932189a788881a0a7681f/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a2a1d525bba9bf572a69b718a66b69df5c77190e/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/39347a6505551f0e2dd3753da03c9530867b3969/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/a335d1824cca09f609fd50bd27aaa6b1a94e4e45/
      x86_64 |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/e2b0ead21df8512d0ea91203dc7141bbbb8278a3/
         arm |                   samba-3.6.24 | TIM | http://autobuild.buildroot.net/results/8a55f94565145bcb3265e3fad7bfbb113b4e5fbc/
        bfin |               sqlcipher-v1.1.9 | TIM | http://autobuild.buildroot.net/results/920307927591026ae380c08bee67d7412aa9eae0/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/66634e9af63d8ce573ef031fab5af043940c6a2f/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7ed150487344e8c50519a11c7e97337cb2d9cf4c/
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/9af8d0b5a0f262826de0e569de2d9818ec58e9c3/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a923225d2ce4fe740bcdcca558d114ea311a9e20/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/9c5ec976ecd666ef1ed744c4f63c3d4ed3dcf035/
      mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/9ebcc8d6df596f5173eebdb599b3bfc10e79369f/
         sh4 |             wpa_supplicant-2.2 | NOK | http://autobuild.buildroot.net/results/f7d6fa53754029a90f54076b9d9049c942059c77/


-- 
http://autobuild.buildroot.net
