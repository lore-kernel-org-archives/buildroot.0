From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Oct 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-23
Message-ID: <20151024063015.AB9DB101CC2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-23
===============================

        success : 141
       failures : 54 
       timeouts : 1  
          TOTAL : 196

Classification of failures by reason
====================================

                   mplayer-1.2 | 7 
                directfb-1.7.7 | 4 
                   dvblast-3.0 | 3 
                 sudo-1.8.14p3 | 3 
              strongswan-5.3.3 | 2 
                busybox-1.24.0 | 2 
                 python3-3.4.3 | 2 
             host-nodejs-4.1.2 | 2 
                  ffmpeg-2.8.1 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
               syslog-ng-3.7.1 | 1 
                  connman-1.30 | 1 
                libgsasl-1.8.0 | 1 
               libgtk3-3.14.15 | 1 
                  libv4l-1.8.0 | 1 
                  qemu-2.4.0.1 | 1 
                    webp-0.4.3 | 1 
     openvmtools-stable-9.10.2 | 1 
                    ruby-2.2.3 | 1 
                    sdl-1.2.15 | 1 
make[2]: *** wait: No child... | 1 
                mongrel2-1.9.2 | 1 
                  guile-2.0.11 | 1 
           qt5multimedia-5.5.0 | 1 
             python-spidev-3.0 | 1 
                    kbd-1.15.5 | 1 
                   mp4v2-2.0.0 | 1 
                      qt-4.8.7 | 1 
           libfreeimage-3.17.0 | 1 
                collectd-5.5.0 | 1 
                oprofile-1.0.0 | 1 
                 fio-fio-2.1.4 | 1 
               dvbsnoop-1.4.50 | 1 
             lttng-tools-2.6.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
                    ustr-1.0.4 | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/a016498b09924fef5cd78bd9d8bc1a0829b92d71/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/b0f78b440638baa95347a97a7cc2868c30b17b36/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e8bc26ae3d925f358c30b102ab4b259c015ae38d/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/87844100012a52a356eba9db7930566ff181529a/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/b97cab4bcda6aafac94b6f76f78129e2bbb9169d/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/663b81d44fc39ab5bd09f92b15af22dfa6f913fd/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ae05a2d52ff2a7264bdc4c7a0513b2f9870bf853/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/041c1742e4016fd4f3f1e2ee7b7824ae25c934fc/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/d2ccf611afd8dd6ab9e1296872163a0e7c09a18b/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/e088019958cdff72cb80787527756ba0c6c93d3a/
      x86_64 |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/6af3abcdced1cc689a59fe11483f5cdcae0cfd38/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/584b088324f2723ecfd5c5f9a569bee0a4c4c31b/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/3a98ecba026236a214141663ac4f01bd25d37311/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/c8be7ace3a28e6ee3de79ad34ea57f64dca20599/
microblazeel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/243b6af06f1759078eba9091dab6975a6c51ac5f/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/56a0f25d525b5855acd2f0bb18e1d3bfa2c303e9/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1d864588f71b8c13a67781cf91ad058c74eb7abc/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/b6104f9a7a9b8e6b890de6c4130a087eb4803415/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/2fb4c498e3fd854b94aced0ca60a0485246dc3de/
         arm |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/098b97f7bad0b24d10f8f21452f00211391a6264/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e7838cc2eec86e441b0b10fc030147a689015a40/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/0c4866e59ab1126a379944a102e746e37dad52d3/
     powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/5bf47650936124ae25cb4a9507a87ff68836312f/
         sh4 |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/2b14cbcb18880b98163ff4ac66011a38f7722ad6/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/3dbe4f3690ad29bbd72e7e4047229cf07cdda580/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/9ded41685eb47024f5c45bc237a6fa8bdd908485/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/19dadd591a042aa77b3aeb2141301a239385bfcc/
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/d1fa4ea959a2a41481bac605758d907c755c936e/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/d77d245ad501353037cde5610aad7566075b9f08/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ecca502d7c37524a30b090222620bfd614f1c802/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/23ef46f448f356cc95dfd40776463309f521b792/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c23f3bd6f631bcb00a25823e062f272c27a3bd39/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/76e0eb6caa2bd57dff24cfd091f37460c4f70608/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e55292466d1d8e59a57b75996c5c48fad9f8cc11/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/aa7cff4faa02cfb9d9f4ad833ca47cbedc22d8bf/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6611b95f765194046dec7c2a55e111b4b6b38fea/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/18e6e15b0bcec008e9e52ae5f348715b369e0f98/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/cbbd1c6fea77686da8c3d3cfc993beb7545219a7/
     powerpc |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/1e89c87a704fc01f76f7334e5c03aedd4c4625ec/
      x86_64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/f2ec7af840c1c2fc52347778ca2141c0bd99709f/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/149b3f33716e30649de09b0e7b4ac4f141d74785/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/91895f03cc02823d2d483e982084081a6d696f86/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/33b034ad1a062629f263ec65e8b5938b88991809/
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/05e2e2d6094cc03791a89a56f7ef5465cb47b1f4/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/c4859633ea06abebcb443c8cac402f83c7d22efc/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/fab1902cd8660474c7b7fbcd208544874f756a24/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/2c9f5b5c00bc2bd3ce8bc265c2276de9a84e09a6/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/d9608c9705e693686249b1ddc01d7da4d0a54894/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/81e4027b568c18c4cfd9ccedfc64cf2157581f8e/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/adea6f8716f627f5a134b9435c0af0b4edbda8ec/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/9d413fc00112d6bbc8a30b99a12763bc7b9a5043/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/c9e3408ae2962dc2fdfe123b67d6988ffe493ae7/
      xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/9c8fc25cf63e4c51f7b6920577ecb0d86775528d/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8a5c65e538d6982e7416a809db04c50fe91ca55f/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/6caaa969bd1ca5e706070430046f0e4da1e8d711/


-- 
http://autobuild.buildroot.net
