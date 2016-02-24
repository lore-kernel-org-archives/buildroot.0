From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-23
Message-ID: <20160224073019.32AA4101B8D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-23
===============================

        success : 192
       failures : 67 
       timeouts : 3  
          TOTAL : 262

Classification of failures by reason
====================================

                numactl-2.0.11 | 6 
               trousers-0.3.13 | 4 
               pax-utils-1.1.4 | 4 
                  cairo-1.14.4 | 4 
          chocolate-doom-2.2.1 | 4 
               valgrind-3.11.0 | 3 
                  prboom-2.5.0 | 2 
                    sox-14.4.2 | 2 
                 rtptools-1.20 | 2 
          libpam-tacplus-1.3.9 | 2 
              gst1-libav-1.6.3 | 2 
                  boost-1.60.0 | 2 
                 libraw-0.17.1 | 2 
                 mesa3d-11.1.1 | 2 
                  squid-3.5.14 | 1 
 make[1]: *** [all] Terminated | 1 
                       zsh-5.2 | 1 
                     gdb-7.9.1 | 1 
                      qt-4.8.7 | 1 
               ipmitool-1.8.15 | 1 
                pinentry-0.9.4 | 1 
                    cups-2.1.2 | 1 
                  trinity-v1.6 | 1 
                   erlang-17.5 | 1 
       host-erlang-rebar-2.5.1 | 1 
                  kexec-2.0.11 | 1 
                   luvi-v2.5.1 | 1 
                     vlc-2.2.1 | 1 
                    ruby-2.3.0 | 1 
                       unknown | 1 
                   systemd-228 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                   mplayer-1.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
        ltp-testsuite-20150903 | 1 
                  connman-1.31 | 1 
                   hostapd-2.5 | 1 
              quagga-0.99.24.1 | 1 
               libcap-ng-0.7.4 | 1 
                 opencv-2.4.10 | 1 
                     mc-4.8.15 | 1 
             bluez5_utils-5.37 | 1 
                 opencv3-3.0.0 | 1 

Detail of failures
===================

         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/4d4f126d21c72f83091fb6a88a2c7ba39abb3bac/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e67aee70bf8b13d4eb18d938b34f0ec77e98b3f3/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d4da3b6e44bec189d2ac6500af7e94a8c1189692/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/12377e1db2cb23978498fe7b9a891f3cb9986c52/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/07f1021284077b7afef6cc33ad2326a6a2a6b764/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/477dedf0216b5321fb59056b4c76b6b9bf6857df/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/21f31ad569176feb613ea18ae6b2ae6273de355b/
        i686 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/55b120a44a00b800f4b3fbf9d9aa4d82b649e6f8/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/a3e6a7acb73c14ddc3ea1039cfe23c1092cadafb/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/f95719a65d6d9d873a0cce2d730a53f75630c3fe/
     powerpc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/65a7704c132111afed048714eb2d9863a4395749/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/03e6cc4a413e1323b2056804c24f0a56e72455a6/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/87a0eef9c9a2e910f3094308d49d028cc7122d3f/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a1d04ee729285042430f161d4fac4a3841670729/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/f687d975d54bf2f8d15e36bcaea0029a939068fb/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5d167ae923ce09f2e016b9c52d485dd105ebe0b8/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/62a3a6dc6d6fa577318f9b144bf0ba69c8aa767a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/d2a101c30db857ba5fe614f974e85e096985bfb5/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/784f0f335c1df72c625e366116180918766adbf4/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/42d8be008dcb07e9ec26ce10c797deb43ed86568/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/9a1f03506958b629f302c1cbc61f7a50cc124b56/
      x86_64 |                   kexec-2.0.11 | NOK | http://autobuild.buildroot.net/results/c06a3eb0d3728d2601bdcfeb0d022543529471fb/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ae32d75bfb9c975f62e8a7f1fb321478b3f1da44/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4a762300a43c5bd1215e9f3300c7b60d51edec35/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/a42748d0bc92436b6acd0006cb30dfde0f67efdc/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/c59af4d5d93f745ec24d4f3d0e7618ce46ef743a/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/adf43fd4e0f9ec080a980f606b1b5e03a326b5ee/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2af4df5111b99786902f62545e7f88564da0c0b1/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2d90cc6d17c1b8956bb56c4e795dfd8813200f1d/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/7cf037010439c4657ee348a5e3e2c2ff8055a21f/
     powerpc |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/88722e8b302f061a62a954079699dacc86a8bf8f/
         arm |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/6bd39edf1e198558bc37b1768c2cdd987213547e/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c59a6c0a295ee4b2c2b234afd0ad48c464d7feb2/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/0d4224e5377600243188db93f5273a825755fef1/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/47c7afd97c2ecdf92013eefd190b5ed089f8eda2/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/8287ac089d4d390e9510a36f6adaec1d462ff7a9/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/a8729c301a52473899a3e3110802a41cc8afe9db/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/6ecc5ad58525f62e964c6a846a8bc71cbd046866/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/b0e29ef934da3a4d664cb8f377af205759a21888/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/fba6ff3b378169a5dabec7e87d147bffd12b4fce/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4367546edaeaa841cdaed6a50bf489ad760f7069/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/0bf5dad576a62641f4df9e13beb182a3d15dd021/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/55fae63b2671fefc50ee3439cdbba43e842890e1/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/98df790f74ed0376ccd35b4cadc2177d17a51706/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/08b01344730a33cf629d1bb8bdd824dbe37bd8cd/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/3d84310197749541630d0a486ba6d88fa02a3a74/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/e41e7a9e452507c571ac82e5055bb02282d3571b/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/526343252c6b8f9f2d9b685d242bed50acdeb35d/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/542d6f5045dd3c9b6c6572c207ef4566cb696bba/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/0f259423e5bac5aff9d2685c976a52ebb5ae96e1/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/29f20872b595d7d6363fc186d0e600638629af4b/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/c640c7d329c561e9349499bb6eaa5642aa5ec063/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/af7ec3eecf1cf72ceb874010e71cb9c546f4212a/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/da15cffb0fb28acdf6c6ff2a4204b2574adc2604/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fe5aba9ad85c7ea28e40d41048fccde383760656/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/948d78b5a0b81aa94a336eba275bfcdd384bd2e3/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/4586b03bebd77db15b1ea10fc878bf3a302d8458/
         arm |                   squid-3.5.14 | NOK | http://autobuild.buildroot.net/results/0ddf8cda83432605bb806a51350d9bbb3ed804a5/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/68f99f6964a904c75797c90a898bc680a435b06e/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a7532a3f63edab42654a93cae154a7767e5fad42/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/59504bcaa04383c7414ede87a9f6ce548d6174d9/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/e2790bcccb5b6b8eb75d7e39c4d7a99294b3642c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f7d6afaa808adadd1c86ef6229c8ae7cb04e3728/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/491af94911ed34c6e02d47aeba1e1eeda72cf173/
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/f03ec58e62654dfc851a49c5568044ceedafecd0/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/9423dedf27c25ade62a56c1f09f726c142561d8a/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/208bf1a12c2b1345e9c64a42fbc8698d4a263671/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/338eda3894972e936fbcf1ed8c3ed4b09ba8b82d/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/9e33fd2a9a2dd5ceaf000dc04b851e4c81c20590/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/b0c553540c53e5dd8aac591944beb4c4934e94ad/


-- 
http://autobuild.buildroot.net
