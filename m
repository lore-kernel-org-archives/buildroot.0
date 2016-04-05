From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-04
Message-ID: <20160405063023.6F2A2104FED@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-04
===============================

        success : 206
       failures : 94 
       timeouts : 1  
          TOTAL : 301

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 16
                  connman-1.31 | 7 
                  ffmpeg-2.8.6 | 5 
                   erlang-18.3 | 3 
                sg3_utils-1.42 | 3 
           lksctp-tools-1.0.16 | 3 
                    ruby-2.3.0 | 3 
               opencv-2.4.12.3 | 2 
             lirc-tools-0.9.3a | 2 
       gadgetfs-test-undefined | 2 
                 jack2-v1.9.10 | 2 
                    mosh-1.2.5 | 2 
                   mplayer-1.2 | 2 
flann-04b4a56533faf8c8228d0... | 2 
      ca-certificates-20160104 | 2 
                blktrace-1.1.0 | 2 
               valgrind-3.11.0 | 2 
                     vlc-2.2.2 | 2 
                 lvm2-2.02.148 | 2 
                    yajl-2.1.0 | 1 
                    libiio-0.5 | 1 
                 libgee-0.18.0 | 1 
                    ustr-1.0.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 mpg123-1.23.3 | 1 
                  c-icap-0.3.5 | 1 
                oprofile-1.1.0 | 1 
       openpgm-release-5-2-122 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                 igmpproxy-0.1 | 1 
 lua-messagepack-lua53-0.3.4-1 | 1 
               libsodium-1.0.8 | 1 
                    cups-2.1.2 | 1 
                wayland-1.10.0 | 1 
                  psmisc-22.21 | 1 
        host-gutenprint-5.2.11 | 1 
                  trinity-v1.6 | 1 
                collectd-5.5.1 | 1 
               openswan-2.6.46 | 1 
                   taskd-1.1.0 | 1 
                      qt-4.8.7 | 1 
                     mtr-v0.86 | 1 
                xfsprogs-4.5.0 | 1 
                pinentry-0.9.4 | 1 
                 qt5base-5.6.0 | 1 
               cannelloni-v0.5 | 1 
            gst-ffmpeg-0.10.13 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
            webkitgtk24-2.4.10 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9e6ff23417ccfe4b65caeca7e92ab7d108bf574b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/08ec991d8b6638d1ef1e8f1d970b631628ec56b7/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/45911c4ac3a819f8ac51dd0083147d6f27c6f44e/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/9e6e5b2a65206a07a3236bf2b1d9c19716163ee2/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/49cbbb0b325132a9ef100e3716a71a55c839aa01/
        i686 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/99ce2d9b11813c159abb396d71b241a63bdb446c/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/b2469b22ef0352fcaff2575bc3963d126da35bf5/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/057de5ff6b0252ce897da55ec79cb029de800d3d/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/2f4dc13d336cf12dea6f81d1afb585163aecdfa1/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b16c2853024046bf84064ab3df8568ae9a54821f/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/30b45e50adbeadcaa17ed162d60c4e1d7abcd77e/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0ac5284f07a2dba1fe673291547a6f586bc07d2d/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c7291e1eaf994c29f51c9f48714a160ed28f4df6/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bd91c6bf89396ddcef73da10bfb2c89c08d80f81/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/f018653ad5c5fccd2e8eb1b5179ff4dc0647ef42/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/bbbf74cf6d914f6c34f3efbc3607a925d054577b/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/498663090a0c3cbd3258ddc5fcb15706d85b097d/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/e7743f3efb6c9839e6aab5b85362d7cf2583ad07/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/bb28e9ab2571fca7761d8b3d8a6d6158001ca442/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6393c055b6a7d0a300ace3096c5fe9f5f2de0485/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/a65a9732f8cfa1d0bf5e27cce35b669e867e220c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7f86133d255999e83e85c8cb5808b47caf348329/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/12193bd5ab62e9f177a6ccdeb2f9db69fa37eb87/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a00286fcb9edb5ca57c740ec5f78cc4f22b1da9d/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/b90510b2e327b69baacf1dcc6edf9abe2a98d26e/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/268cf2e1a319d622a4cb0a63d614e080e1ee296d/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/56ce13144f4015579f79f6be93a451f3ebc3f06a/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d6c07a6db5301b19812e1be867a91fe9f33bf6bf/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/3a44e4b8cabedd8098c3c09147a6e88f81f9db88/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/673a00bdaba2d77091801311b064afef7c055e7a/
        sh4a |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/4c4b53a976f0b01e4daeeb8fc7e7a2abae03bce6/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/bcb68a62b92041518068a5cee7f8f841b4da9430/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/44082f0919d9696513c346d5bfd7a4dc0ce66922/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/35585a04f9c0dd6fec472a15499a5f9d3e7f5c07/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/47d9cdaf4753f2bdc78f8a95551c974740fd7aa1/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/647321cb8bf105bc629c92f512114d1235f31315/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/2a5ff84b058967681bd68d3a04703fdc2db52cab/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/8a31efe990c4c643b547edb554a31d922b76bb82/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/3720923403a3fd8e7c2f6c79bc66dfadf551dead/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/9cea584c3b38a13c91ae27731a53715ac8e22529/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/75ed062803ccff13b726c61cb68e3334189f9266/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/9f1bd2dcea1fe90a18cb052f3e71374b31fa2301/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/a530c3dc4655a28c152ebb7653c18a2dc0cdb8ee/
        sh4a |  lua-messagepack-lua53-0.3.4-1 | NOK | http://autobuild.buildroot.net/results/f61b65b06614cecd6ea5fd4270c53bd954ae3a91/
      x86_64 |                  lvm2-2.02.148 | NOK | http://autobuild.buildroot.net/results/0477425940ce3261b9d14738dc095233061bc08d/
         arm |                  lvm2-2.02.148 | NOK | http://autobuild.buildroot.net/results/e523da59c050764faf20ef104352d82ecc9e7e64/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/a206849cae4ecb8b2b9afb077852576ccad3536e/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/86b99fe4df64b47c9b76e75896a7470d84d504d7/
         arc |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/06a5b4d85b9ab648e26b040b4b6e535fb5acbaa6/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ec11caff48a516bda51bd2a322bf51d1fbf8e1ff/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cc34e197b350a5337fa1541d16aa35dbcd690e4f/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/e13277d2dfc6358689a648a22613c32bf07da8ab/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/3219e9f71da0809aaecf27953c4f9656ad8fbb5c/
         arm |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/6a397de789c809984b851a304078e26b2ac58974/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/eb5e476c33a0036a088ed85b1002f80a71eae837/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/7abf4baf772bffe50ead4c82d3e0641949e6788f/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/bc5a706c5f5e324c982cd80cb5668687085270d1/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/59baa33b7cab2ed66202911986296c2ec094e383/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/f7f493fe9ef0c405a90a1878aa79a3d569858767/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c75a7d658a098da31b57895038aaf24c4f53e1a4/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/b0aefd6405ca55920e13bbbc302787ff171bde25/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/40f2a8196fca130615077ff3b35063ce91efae01/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/6af9bdc37be37cd25834ac6c8adfc48ef2c528f2/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/07efd0c2b1a6fe21bcbb3132fa225fc2d0384e5e/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/eb72cab95d27b3e0475c25724be2d91db4e822e1/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/aec7f25b3c939b5eb7dcaf4b8b287f6bf2364831/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/0cacc9d92dea5b593851437c1f9d1b248f2856d8/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/ea8f887faf39303b7802f10cb9e92deb2b8149bd/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/371a1eab885d1a6b5b06bdab6c2280b20593eed4/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/dcf45a8632b41ae4471f2bcb3108e7f7f106c2da/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/8654019bc4757307eb0bc4b74456da4067bc0cdc/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f7be0e654ff158210dd0f1e6f51479d751945bfb/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b08bda246161072206397f977d9fcf9d17528294/
microblazeel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/41a2a8f976484a9712591099df44d6a67c149a33/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2b68dfb5c402abc5452f433df419088295df9eff/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/627555aad44808be0fc8318fa0d0128ab4308be0/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/fcbe06f0b865bf11083ab811b6f948da2e4c238d/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5d77d01bf3a15706fe0d5e76d485664a7e3b3814/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/705250210b80726b257e55e3f652829f48f0864a/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1d51c20144e01338f74759e3acb6d5eb9be25eee/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b31540f4f42de0ee3568fcd904223ff4785c5485/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/409b1f1d70f4665ac1e3c54780e29f1598abdbd7/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/01d88cabbde7cdbb7650db916fcc8994e8b08da5/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f3836fbdb1fa38f1c41118c9a953e7ff4b599915/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e3716e81c7143c6835030d94d28185676ce27c27/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/70b18e972a00c4b77bd017d8bc80d69abf0b60c6/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/f78a8804f6085962904956979b12b4baabea643a/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/88d8c365fb06e9eecfaffb1d4fc720ce80fcbed8/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/507b951de250b4da037de3068b2504e013669f00/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/664b3e7a42c48867840c375a8805201a8ae3c6dd/
         arm |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/429d7887937b3d5ab182eaf889a6cf19ff54e920/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/74905c624523ad1c9b522d4b5ea57909710a3ecf/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/c30644a72f91fea0e92aa220b20882dcc5a42bfc/
         arm |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/e3332f9c27d68c3861c1f6fc8a33c6d1237f4337/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/cbf59f67defa9618643bc017e8b69a6919577d10/


-- 
http://autobuild.buildroot.net
