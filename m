From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-20
Message-ID: <20150921063016.8DFCD1019A5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-20
===============================

        success : 200
       failures : 62 
       timeouts : 0  
          TOTAL : 262

Classification of failures by reason
====================================

            micropython-v1.4.5 | 12
            shairport-sync-2.4 | 10
       kompexsqlite-v1.10.12-1 | 5 
                directfb-1.7.7 | 4 
                    ustr-1.0.4 | 3 
                 mesa3d-10.6.7 | 3 
               util-linux-2.27 | 2 
                  mono-4.0.2.5 | 2 
freerdp-770c67d340d5f0a7b48... | 1 
                  apitrace-7.0 | 1 
                   mpd-0.19.10 | 1 
             gdk-pixbuf-2.30.8 | 1 
                openntpd-5.7p4 | 1 
             bluez_utils-4.101 | 1 
                  boost-1.58.0 | 1 
ltrace-c22d359433b333937ee3... | 1 
                   kexec-2.0.9 | 1 
            ibrdtn-tools-1.0.1 | 1 
              strongswan-5.3.3 | 1 
kodi-pvr-nextpvr-3a205e49b5... | 1 
                  ltris-1.0.19 | 1 
         conntrack-tools-1.4.3 | 1 
             lttng-tools-2.6.0 | 1 
                  fbterm-1.7.0 | 1 
                  libssh-0.7.1 | 1 
                 lvm2-2.02.130 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  weston-1.8.0 | 1 
      host-gdb-arc-2015.06-gdb | 1 

Detail of failures
===================

     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/026eecffd262b0be6675001ee2f5a635207e55c7/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4a53d1d8219f224404482b70afa3fd228c2b19f4/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/75d251cbee694ac38a61eab017406ba2ce41e486/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/5708ee5a32d5212607625c769c2c7704d57e998a/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/1c077a95e533763f391e743920168a25372aa9fa/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/78701a66e5433717d04830ceda937b088c4367d2/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f8a22b3cf8380206d900b063fb2da503b055355b/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/4d4605d00547c87c420bd9989400922ff5416fd3/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d80a0f913b6d6564710a3432462ff46aea8edc3f/
      x86_64 | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/03201d383c0176b3eecb02601f0fdde1941da6ed/
      x86_64 |              gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/175f70bf2a77b7b46004bdba3994dd27f0b137db/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/bd3d615f93bae3d8d8812e733aeb452885d6166a/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/f864ee6eb833187f686fb924a3362ed6de2edcaa/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/92a33924790d245c765f19158f921f47e7592dc6/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/b4723f8669e40db580e3560f609a67e07b3ee1f9/
         arm | kodi-pvr-nextpvr-3a205e49b5... | NOK | http://autobuild.buildroot.net/results/eea7be8691bad11546fbc9b8d3f1c0528ffd2619/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/f818b8ee330d307b44d9e512a1f754ede3689eba/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/f6ca57b4a05a93a6726525cc62c39698b669cff1/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/b23e8608bcb449ed06bb9e8fcf45447f99775b36/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/8d275aa5fc8fdcc554feacc6b06799fa8c7da398/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/55971d112656c43adb44e73c272ddaecedb1fb47/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/7d493b26cf661d1eefcd2817d482179c46d1f5a8/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/c622457960df4a19ff6f72b05b37ff22cbe5ee42/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b46174055f659c082fae8c8a419d3073f8971b45/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/cf26d8051dcdb3f000feca7aabe9da9c65eaaa52/
         arm |                  lvm2-2.02.130 | NOK | http://autobuild.buildroot.net/results/c7a7e97ac6c4a2c8555014ba8e0c6257efd76f0a/
        i686 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/290718018d98e7c60c6e321a18982b044df61376/
      x86_64 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/cd44b7d79de98b5d781bbc7937e2d48ba783cb8f/
         sh4 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/5f4e1a545985f81249aafddfd80ee28ddf8125b3/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/59210ff13b557c8dd558a066d636cb7e727e0d5b/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/7204c27137b04b253309f0ebb930f2d4d3768437/
microblazeel |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/754b18cf3e99e6e0608a4137eec545329dcf9ad1/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/ac387c319e21aaf223c06aa9bf04d26ce6ac1b9f/
microblazeel |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/e7ec63dc09f732f849b8e7ef37c345e5951e85b9/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/4472a158f02922321f0fa883f7095b986ecc3e1b/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/17b736bf688761229bc1cec02e9c61ead8af6247/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a1549c0aebbdaaab60660c2acae4312428048649/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/77b62c96c00a85f450b0b620cef4868c109e234c/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/c5c06d89051107625e48327e1640f114e577a848/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/2a6308da0b820314254a23c389bd880666cfac41/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/5ee44f5e6ff8c940258d26f363d53684ef7f4c68/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/aa65e7ef87e6a47e6766a48501196abb3084ffea/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e80aa097598160ae57ee3c854047bb9a14a6c7ca/
      xtensa |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/ef2614cb48c70722c6923a0a47fcc5cd9e6f5505/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/93ce15bd4ff40a4e787c28cc6a52be1f9b85cd8e/
     aarch64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/88fda33c49921fe063e400c7121d7ea7fe7ad630/
       nios2 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ba6101b47907697975c706a92c5bdd63f93f4a51/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/c72b3d60e2eb50e733700ece9dd7fb3207e05a40/
       nios2 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1a2f647a77a8a5c6cdf4fe1dde7c23bf447ee7e1/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/2c86e9b6de45abf3bd2e1b962c80a6d3bd5145fb/
      mipsel |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e3901f26c8907a2c1b9b4d54807a2057a0aca470/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ea69678b8e9dfd07fd2234bcfe074ed621a98826/
        mips |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/89d22ba2d41e05b407cde04c7e57510b36973ce9/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/9770bc3212331cc3d0a5c06d7c2732587f54ce1c/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/dd83bd56c9f552609f5d9e1e26cd996af4e0db20/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/0cdeb092292a7e66a0fcbf5277f173e737d56672/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d342bd59a8cdec940d7962321b85fd962dbd851a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/97f4cf4103d4dfe8358f65f804030c4791fb1f0c/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8b2a6584ecc5d4b7cd56bf08024c74b77820e864/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/c0659d858ba99fd626784a913dd2c09392c3225a/
      xtensa |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/84ddd4e836ea9e24a458df0adf3eff9079b129d9/
      x86_64 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/c74a893489f83ff7797b1d1648ce74feac32b617/


-- 
http://autobuild.buildroot.net
