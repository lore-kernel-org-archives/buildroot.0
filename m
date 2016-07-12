From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-11
Message-ID: <20160712063030.02518102B11@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-11
===============================

        success : 182
       failures : 95 
       timeouts : 0  
          TOTAL : 277

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 8 
               libcap-ng-0.7.7 | 8 
               acpica-20160527 | 8 
             transmission-2.92 | 4 
               target-finalize | 4 
               libdvdnav-5.0.3 | 4 
             libgpg-error-1.23 | 3 
              gnuradio-3.7.9.1 | 2 
              lirc-tools-0.9.4 | 2 
                   ncurses-5.9 | 2 
                 clapack-3.2.1 | 2 
                 mplayer-1.3.0 | 2 
                   bdwgc-7.4.2 | 2 
                alsa-lib-1.1.1 | 2 
                acpitool-0.5.1 | 2 
                directfb-1.7.7 | 2 
                    mpv-0.18.0 | 2 
                blktrace-1.1.0 | 2 
                    qemu-2.6.0 | 1 
                openmpi-1.10.2 | 1 
                poppler-0.32.0 | 1 
                   duma-2.5.15 | 1 
                openssl-1.0.2h | 1 
           libvncserver-0.9.10 | 1 
                   systemd-230 | 1 
                  babeld-1.7.1 | 1 
                  connman-1.32 | 1 
                cifs-utils-6.5 | 1 
                    ruby-2.3.1 | 1 
                pinentry-0.9.4 | 1 
           libmemcached-1.0.18 | 1 
                   dante-1.4.1 | 1 
               wireshark-2.0.4 | 1 
                  multicat-2.1 | 1 
                 php-zmq-1.1.3 | 1 
                     gpsd-3.16 | 1 
                    lftp-4.7.2 | 1 
            lttng-libust-2.7.1 | 1 
                      icu-57.1 | 1 
                  ffmpeg-2.8.7 | 1 
              e2fsprogs-1.43.1 | 1 
bullet-19f999ac087e68ffc255... | 1 
              procps-ng-3.3.11 | 1 
                  boost-1.61.0 | 1 
                  cairo-1.14.6 | 1 
                  gnupg-1.4.20 | 1 
                  libsepol-2.5 | 1 
        ltp-testsuite-20160126 | 1 
                  autofs-5.1.2 | 1 
                    nettle-3.2 | 1 
                    owfs-3.1p1 | 1 
              squeezelite-v1.8 | 1 

Detail of failures
===================

         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/ae83f8891dbfe5778ef265bb62376516a5fd7491/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/fde040b0dbd7c80f986dfa57962af67952c82b66/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/2edeeb277c0c7f1ad8996aee650e5556195f35f1/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/0a374e7c37c31553fdcff0d6b01121895bdb8322/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/205d54865d608c342590077a9437aa7bfe4d264a/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/715da136e43711e9eb14b8ffdbf3fb0d4904d3f0/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/b91fbd2150c1673c9355cee4ab33de1c5ae1c0af/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/76549915752d8be84e6c79b224f97429fd6d6ca4/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/3eca6a786747d397274135e556c484329b1682b7/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/bc0cf947951d130c28be3d9ff3ccef3ac41224ba/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/8ce80896227fceb075abef6f94ddc72e0a964e8b/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/9f51f04ff6dda3c01f081c8a3b5322d32299802c/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/bd8fc92979903a3b97c61f1761812e1ed333b5d5/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/b91bd2e3c6dae7bc44070c4d60d09d69e9968d82/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/6e979325cfdc30fa6ff2163eefff2b75809cc41a/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/ebaa7205d55dc4d24a720aa55e47191047205403/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/88f98203059cb81b86908ca48c3282ccc28c88d5/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c4207a9b771619acb930d1a881c14a443613abd4/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b2e3fff786558cac0c74c605da9a9d7b6d1f1e2f/
        bfin | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/b783b0a28ba48a8ab3d9819f4339123a0975bd58/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/da6305b668d7404bea5cea8afffe11003153bccc/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/c9d429397eded4a7899665ec0743c869b1bd2b1a/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/4abf24eca8e40f6329cf7136d5be73c3925861cd/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/7821d4db1485b40acf5d767c6e758c9ecf779848/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/f829e334cdade9d1e11200cad99edfa9f25f2a6b/
        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e686ea7b2cc8e355ca642bc4ee47174622e94aca/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/66edbc10d69555d04532d9d75caba773a614cb9f/
microblazeel |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/5fa82cd2afe29f775ea857bc7f99782aa03a8c59/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/c2baf129cb328bc404043b70bba92d22bdb2c67b/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1076d36d092536f13bc97791686b48f94ed48f9c/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/25ebd9c463c32ce120e21a628f2ee501b9bc3f5a/
        m68k |                   gnupg-1.4.20 | NOK | http://autobuild.buildroot.net/results/69602fc06c6d232ba9fa3f3157354d35e3c25283/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6b7c2abb5f260c41b9598342bcb519ae1a1ab046/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/90db148bf4e104dcc91620e7d21b8266a8f3e835/
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0f44ff0cdb8c5703797f19199878b713b5a8d214/
        bfin |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/a3c91d19a33cfad1c9fb24e97e819c93d6d07d99/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/4b9b731a0436a2ea58daefdf7b7caa7102079b90/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/6229bfd738bcd89bce782bb0c54829a79eab9c33/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/6592bd8de94c786a25132b10adeced4a291f51de/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/5474ff9226144244502d15de5f036b28d7599c94/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b84577efb356337d743d72e7b2e595d1dfff615c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/916f5930497a7345aa9765937d02dcbc0c26ded5/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b573e6dfdccab8e62206d89507963467422b59cc/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/76f4af0627948894161e5a9d956bcef763a5a061/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/92b767db67d7475404202e3203a013e7b6ea544d/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/687881f711293f3f95507465728838928c36c80b/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/29720beb33bdb29654f0ef83c7a2fa1e26426c5d/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/ab271c27190c7eb1f1c7bfe6f11051cc9f5283a4/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/7c7ee1eb180a5bbd7fecc602d96bef69fa141e46/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/a843dd225019ea31366d90d718f113dd95c5df4f/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/bb437093947f707496bd1f2054b996efe9dbeaaa/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3bacd405e4e5cab723bfc5669df8fa9ec947d3bb/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f9ab36ff31b9d1af5d22ee9fbee2a193ac3b4149/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c647dfab15ae37fd8b809dfd4d470fccac3380bb/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/c0e8274c05cffd9fc778e1717bc58429b00d7d9b/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/151c15e60013306870e72ce2cc861ecdbcf3e8fb/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/29c51499f88e5f98b88aa1d01f383682d3974bdf/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/c23612ea1e1f6a4ee0d9b3eb82cd60d653760f4b/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/2cdb0b217ed96d24b3233052e5cbe077ec0eeda8/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/eb43ba7e62edde80d6549f12acc87d403504c717/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d1702d1598ea3e068c2c25613258ee997fea2918/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/cedb3a1a63354ca2ca70a4c3285f1e58b46a932c/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/d1b65f2eaf4881aec837759fd6df72b5e0f27b18/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/7734a99017af79fd416addc42e75dda7ea09c076/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/4d4bc51c1ac49d4d0e4e3be2bf8467149867b38f/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/f8b5004617a8e8ea2900063553c5ebc621c6bcad/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/dee193111bce87d289c75d4b5c0edd405064cb64/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/de824899158c5ba1a74a031720c56e57f109cc09/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6242cd99689a2c5fd8b5b564ce545fffe4eb9fae/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/fe5bb8258eb064a59c96a18d84faa499b48c4d19/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/b60cd2524d5fdc17a6dfe005ab75227843315a4d/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/451de06fd35f56d1cf2e340780ec73b15f36051e/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0aa4c752e7802d8ac6fd5ca9c0a9e2b17b21d0e0/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f0da5d23f98f67b8cdc864c57e24f6ec39e063dd/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/22ad4d8b7338e9650f1023c82c167a5b5646cb94/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/35dbb9eb7640ad9dd3858ed2ae709743f1052221/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/c7cec3ceae47b8462f6df47548e8d591242bb74d/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/78b18dd158260a2b439cceaf635508061ee6b9ab/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/c37d4e0e82b234240cb4063b68e65ad2c858b901/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/b56882e3ce73a967e6ea1f0535365c727ae12634/
        m68k |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/439183540083864fa491f2dceea80a05009e89ff/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/bca29c0b2b12c6419fd3874e8895850723a9b876/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/c4a034cd0df5242f92275bf3284848208ab47215/
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/91ca8e59bce56eb23ef02185e2f7b72986defe0c/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/32391b52f96ff0c520673143ba2b18ad46435d1b/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/8868e506b13ad96d992cb6febfd2caae5a06ef94/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/2511dfb5f685090f45060ad4c96ca1afd0a8d9dd/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/4c3f394f446aa5a9a06b8c37329c190227c258c6/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c16eba53aee3c6a31c7a0acde3408b4670f5940f/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/28168b1d0487f9848280e0ed5116520aa8b5e413/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/da51c97049ad162dd9ad8e60dfdc63d4136cd6d7/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/4fcbb23d51158345c72b005f469148ba65c03564/
      mipsel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/41295e8bb5d289a37ad654c4101b1fe1b327ba5b/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/dc1c78a5b11cfd69b8a3e457719a4bdec19e2ef8/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/cfff1a6b570e1db8a364a763b1503c6332dc709b/


-- 
http://autobuild.buildroot.net
