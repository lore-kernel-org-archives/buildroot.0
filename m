From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Dec 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-30
Message-ID: <20151201073016.0CDD1101D8F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-30
===============================

        success : 213
       failures : 60 
       timeouts : 1  
          TOTAL : 274

Classification of failures by reason
====================================

                busybox-1.24.1 | 5 
               valgrind-3.11.0 | 4 
                  ffmpeg-2.8.1 | 3 
                 lvm2-2.02.132 | 3 
               libcap-ng-0.7.4 | 2 
canfestival-7740ac6fdedc23e... | 2 
             host-nodejs-4.1.2 | 2 
            libsemanage-2.1.10 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
              gst1-libav-1.6.1 | 2 
                      qt-4.8.7 | 2 
                   glog-v0.3.4 | 2 
libubox-e88d816d6e462180f03... | 1 
                 dropwatch-1.4 | 1 
                   hostapd-2.5 | 1 
                  libv4l-1.8.1 | 1 
                     vlc-2.2.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                elfutils-0.161 | 1 
                   mplayer-1.2 | 1 
               arptables-0.0.4 | 1 
                  connman-1.30 | 1 
                pinentry-0.9.4 | 1 
                 gnupg2-2.0.29 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   erlang-17.5 | 1 
             util-linux-2.27.1 | 1 
         conntrack-tools-1.4.3 | 1 
make[2]: *** wait: No child... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
         qt5imageformats-5.5.0 | 1 
                  mono-4.0.2.5 | 1 
                   systemd-227 | 1 
                    php-5.6.15 | 1 
                minidlna-1.1.5 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                 mesa3d-11.0.4 | 1 
          libedit-20150325-3.1 | 1 
                directfb-1.7.7 | 1 
                 setools-3.3.8 | 1 
                collectd-5.5.0 | 1 
                 libusb-1.0.19 | 1 

Detail of failures
===================

      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/72ed8de6446421998ec19286e88b063ae4f286bb/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/34da386aac37454279f3315547972c8cc8cf14bd/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/144d44a945df1de7c542bde672125a1e3db3d834/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/746e60f53ef26c61a05bc589f819ff4ed6c950af/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/cb830673d4ed516cb3d8f24daee9403ffa1b9c0f/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/3d8598a8a5b9a8957ed2708503ae3ee659a88712/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c20d100936195169292366dcf05f7c065bdcb9aa/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3f1d0d0c097e0a338871b1b356cba839e5c136f9/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/1a3473ce29fa8063e49a8cb186dfcc2eedbdcba5/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/8b700b5abefaa4f03bbb9744c966098887bc54c5/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/f652e894dafe26d3a343fae7446102f521322d77/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/24d8b767952a96480b60bf166682ce15131b90f6/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b2e63ecb9e0e8b94217a518f9365285b630c2a3b/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/57dea08a7c53465cec434186bb64e2113c2cbf30/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cdb2c5e5c46b7be581d680d6e19d236711da40f9/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/6c75d4cce958d4c46bc6990b6b0968832ba545fb/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/e81db08c6a3292df20f87c7e833cf0384e5f0787/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/45fb3b3f4a1b0d2de8cdba746572757f41c379d9/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/96ac1c7a53bef9f2795a8cc851aa714a6b1c89d2/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/1a7e14fe9184c848fa769814ece3e22fd6709a28/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/b5321728e8fb3746f94e6e542315ce33c06ce3b0/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/75caf3b525fd017b4769415ba2276bd0eccceeb0/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/1050167d6f9162de849d2039bea5f095d2182fe1/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/1682561d6508ed5c5c2993a3ba9d49f9a698faf0/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/2c75a0a0c3f9733a8f34f89d11d952236b7b14b7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/eca53ece8763f38566d72bca188a4a5d886115f6/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/c1769098fc057535743fce8f6a16299e5855ccac/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/f8e75a4bfc40f7174aabff7646c2254cbbf8c6d3/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/f612487eaa8109ba420179e2e0ea1ae9afa3fe49/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ee6451bca1e0c22937557655c81c0336f02d286e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/0b0819effb80ba6942ae80ae6100e9a7864d33a9/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d5a915dc8771c3db4bb0f89dd78a00a98fe0d54b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1a578cf8f39aebc39599de08a0388bc81480402e/
         arm |           libedit-20150325-3.1 | NOK | http://autobuild.buildroot.net/results/c476a48936f8810117bb292fb0d8a43c09068de6/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/ab67fb8ce0495644c72df05d0c3fbd3cf0f86683/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/60363a78aad5742b734385b0a8f0f5084b1ba239/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/027e39f0947cfacd8998847d70225d104c791d36/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/1680f1d2e499adb896dbaa12a6d164356e25fa26/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/f2e4e34fb14ce355a6e92afc83024b0445f52513/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/2e857bb3b4b3e60c9577581e06114bf964f5409c/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/be1a65332a30e298433c24874f06a58a3bcf051a/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/d8f53dd3bb966719271fd8176bb2432479328ffa/
    mips64el | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b4e9ec402b66b726dead56766bb8cf1e18434ae4/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/5e9db876e5737e46bf9e25c5bb745b1a39991b73/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/0368f5930d4f2e607e5493fe0441cfc7d3badd39/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8c0bd079b53a0f515038c07f28f2658bbd70a873/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/745f66f57fddca1b105ea0fa034b97820dada6c0/
         arm |                     php-5.6.15 | NOK | http://autobuild.buildroot.net/results/3372e37b5ed09bf5ad256b026c430beb9267ebae/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/950a3879fd2137004e4b3ee0151fc5f8339ba0d3/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/407daab34cc3e56cea98da78f93a836e6740c3ea/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b61456a7adaf12ecb6f44ed4e7847ad7fd22b808/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/08fbb930ba53c29faac7c53c98d9fcd5fbf58a55/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/c2a41b81b9067b349b60987ac22a8d65fa6ecca7/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6e2464eb08f8d869c72a69683bd639bea834320b/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/7b6be4c0f2370d8e907f48c79317672c5b79398e/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/c17b81997a3c44a67a8389fd5cbe50d5b38fdf09/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6ca3a31d1542fbbb44238e296565b40d6afcd5fa/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4a89acdeb5ff018e3a35dcf4134037ed5076b526/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/e444e16246225314c904e35dc8274375b825ee5a/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/9b9ef4bc56931b74935fea7460de545d949a7de9/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/089c10f1ec218c7e6e8cbe3b0aa5fa935f31cc07/


-- 
http://autobuild.buildroot.net
