From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jul 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-01
Message-ID: <20160702063031.9B1E4102B8B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-01
===============================

        success : 156
       failures : 96 
       timeouts : 0  
          TOTAL : 252

Classification of failures by reason
====================================

                  libsepol-2.5 | 24
             host-libsepol-2.5 | 13
                     audit-2.6 | 5 
                  boost-1.61.0 | 3 
                flannel-v0.5.5 | 3 
                   efivar-0.23 | 3 
                  autofs-5.1.2 | 2 
              libarchive-3.2.1 | 2 
                blktrace-1.1.0 | 2 
                 jack2-v1.9.10 | 2 
                   dvblast-3.0 | 2 
                 ipkg-0.99.163 | 1 
                collectd-5.5.1 | 1 
                directfb-1.7.7 | 1 
           linux-zigbee-v0.3.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                    mpv-0.18.0 | 1 
                    cups-2.1.2 | 1 
                  cairo-1.14.6 | 1 
                    quota-4.01 | 1 
                 lvm2-2.02.158 | 1 
          obsidian-cursors-1.0 | 1 
                 mplayer-1.3.0 | 1 
                 php-zmq-1.1.3 | 1 
                    lftp-4.7.2 | 1 
               libgcrypt-1.6.5 | 1 
               libdvdnav-5.0.3 | 1 
                     php-7.0.8 | 1 
                    owfs-3.1p1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                      qt-4.8.7 | 1 
                   fwup-v0.8.0 | 1 
   webrtc-audio-processing-0.3 | 1 
                   taskd-1.1.0 | 1 
                openmpi-1.10.2 | 1 
               target-finalize | 1 
               libcap-ng-0.7.7 | 1 
               host-gdb-7.10.1 | 1 
          libmicrohttpd-0.9.50 | 1 
               libsigsegv-2.10 | 1 
           libfastjson-v0.99.2 | 1 
              gnuradio-3.7.9.1 | 1 
              e2fsprogs-1.43.1 | 1 
              libdvdread-5.0.3 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                     gmp-6.1.1 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8a3d26269a5bc83f90af6069937898e735aaa554/
      x86_64 |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/992af3a7a625ce36227ad69460ab75dfee4dc59b/
      x86_64 |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/e0f7a5a1c64c6ed904bac85c50590ce4b7287438/
        i686 |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/68874153846ce99c0303edcf59abfa5073892910/
     powerpc |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/af2369539fbb8e17e32f83b669b0014c99ffc587/
         arm |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/bedb48727410e5bcfffd9b3c7d954c3b2254b481/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/810f8e35c28b62855b7af13bd281ca2b33500477/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/1b34a72d3e42d26f8413070c9ebcdf73f4f0c15a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9cc5f87eefe514a63dae495014d1e16a2ea44f1c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0a15b9d798e8a9985a4a0b9773c6ac17b8d55a76/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f95511e839d85ea18c5b150a59e994ef069601a1/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ff2b8be247e50c170b6317886509cc2922e1c77e/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c342b76173347003e9cc756b8b28569bedd650b8/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/e5d81d07e6096b6bea4bd74cf34a20669a515984/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/0982656ae3be2a4f65ba73b54e2eba48652cf822/
        m68k |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1dc20a982e0a7f6621bb21050a8dde1f2ffc1552/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/04b4e49bd3e85ee553b14f144e8f388b21f243a0/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/cb3a06f0ba8373542d3a32fc275463cb2634ad58/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/2294a3c57e2e8d6fddef48ac9bf31b2eb56674ad/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1185407de43e26a25644260787d29b6e3485a286/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/41f84120faf4c11c2ae39b929f10ba7e7a34be6b/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8f63e026e5962c2c5a85c06ef66848e273543221/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9c123c837938b86e1d9c13fabb8bf0ee5e343972/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/be305fe525fc7c76340179107891cf45bc925445/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2b4616949a94e2b1576cb59b55f5fa661556f975/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8eb5cea88cb034a25acf0a4a5b72d5d3625273ad/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a275b14d9ac1f78624b2bd08afb1c2854ad6b54b/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/c9086c165bebea3ce4ee7df569f663987611a213/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/baab8bfa93b76e88094a033107cd1c20caadddb5/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/402046ce40374f1eb1b3931779029bd6c9f5b285/
        bfin |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/51695091aa771b3732cf7894f84af5ae355e6b40/
         arc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/ae3416a213aa812a7c79ee68383edaceadee4656/
     powerpc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/0377f7c43861d6c6724745a2663263d7e625ef09/
        bfin |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/f1bed62a8b9ba933c9f5e952c18cb584a6113c76/
     powerpc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/77b828f0378cea72522a4ca1fd948a5c9af7d0e6/
      mipsel |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5a6d5120a6b5e9045122583f7cceee22db699f9b/
     powerpc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/57730c7765a15f73fa78bba022786e060e8df756/
       sparc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/65c9cc0be0fee5f05648d5f6a8ab9fa55a082e13/
        bfin |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/dff89b794fb37963d856de5d38ac312292e5ea92/
      xtensa |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1848fcf0c2a86cef44734d6af3bffa89e2e3d5a2/
       nios2 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/7a2831971f76403041e8530c7758446d5ac357e8/
     sparc64 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/55366d1b203fee34da92fac53e5ca4a35ee658a4/
     sparc64 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c848829f7cfa8b4c85795ffe9f531c4b47aec1e2/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/ce7c4d5ab5f90458ca57dec456a8a95fd0f8082f/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/72d7ff969fe8871f6dcd7acc3a7bca30fa54a650/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/fd7772e141f1ccb3f3bdafa01b32049a53fcaef7/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/ce8e5932eeea19808d2abb68e9a57bb803fc5589/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ce0c6902d55b16888e47a30ad0c73b79f5870712/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/260ba595aaf52c40d2d410af793654ed6b229c62/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3759047189e765c29a7bca6e9a9ba4ed9b76b338/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/4d7a567add4efc07804a03b401319a4d95c928ba/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/e694e6a5aa87e9b1aedf10a067b9ad9d73d02942/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/
        m68k |                libgcrypt-1.6.5 | NOK | http://autobuild.buildroot.net/results/068623acea90efea4a5b3794adc14c8bdf93fcb4/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5eeddab40e37782b99614a36adc2bb5a784b2295/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/ce5916fe7103a548a964d68824f3c991953a6291/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/f49401426050b3283b69d20320beaa07c613c0bc/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/d850cd884f471d74bd19ef6005d80d4f53556c22/
        mips |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/ee450e2539d43c4e86508b17850ccf2e344e3134/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/9a14e718da778a19cdad4e83c5c17469c8fc99e8/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/aebfe07a710a1e844ae295f43cf0bf19affb25b1/
     aarch64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c1be31a9f787cf1d43e38be07432ba3f552c78c5/
         sh4 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/04b222d57bbf1e89eb529c6c2b320d15d5add352/
        i686 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/4cf82b45c829d09d4820c270c3db5e6e3d0aaecc/
       nios2 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/86c970cc9366880945e4327fb5ecab0d246a4a10/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/7446248acf9df5b653065766178b758d00aea3c8/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/2b1fd4422225e61f19a321b5fa92cc38aa461036/
      xtensa |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/edbfc04398dc622478007451e87b366b4b5f277c/
    mips64el |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1d1be564394508b7caa6f6cd92add831b21c7fc3/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/90e5cbd4291439bc88ab8d90451958889c12ef31/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1bff8764e0ddddd8966060cdbb46c7d5e47bee5a/
      mipsel |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/54f2dfbb7258aba6e2e3a4cf03d4f0884ca3d743/
    mips64el |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/9abbc0913715cad28ba2644f27ced9b7a6753e05/
        sh4a |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8e4a415f9c98d574f9f1ee912e5aec18bcb768e0/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/530186016152bdf5f9ef514f0a46dbeaf8c340b8/
     sparc64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c23c553dcba7f3377f2d99783ccb82c45dea78d9/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/a0ce6be78348fcf0a83f7427879ded713d9b90cb/
      mipsel |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/db16c8cd952ae7f7e623c972f9d41ab46719f378/
    mips64el |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/001b5bffb2dc41e69d256495baa8fdf48976287a/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9c55faeac23e76136ff5038b825e669dd3db49ff/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/be086d209d6a7b4cada4a3c532ae6fa99a4475de/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/d8c62a99425d345fdb661994c1fd0fae7d784105/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6306757da3be9bb7e3cdcbfc8abb4e64a3fb7913/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/4015665b335df6e3cabf52b29778544e9b73a7a5/
     sparc64 |           obsidian-cursors-1.0 | NOK | http://autobuild.buildroot.net/results/85fd9b26ae1c8bbda3f99f5ced857ed90e765e95/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/bb384d3da0cd48e49e6888c23dca1d1dab5445e9/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/165de0e7f2dcb0fa64f40b37c55a01dca11b8494/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/7b40e46669b384036d15485effc8052bf965cbb4/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/1261f8b9e38719564576caff80be7ad266e94caf/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/30f1d260fe62dd19368fd0eceec43e1d7eacbbac/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1914e5c1846d4d67df02d265025e77a4072c975d/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3caeb12efb5bea44995563fbdc2b1f08e7b175cc/
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a08c865ed53a491c5e4d9a609c34db7feb2898d1/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/deac9a02e818fd3a407696ded012d0b7dfa030cb/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/5d21346363f0edcfe1ac90ec3fac38a3fb48d0a4/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/da4bd1da5e2c412c789e174bc4ce75bd7e84c1ec/


-- 
http://autobuild.buildroot.net
