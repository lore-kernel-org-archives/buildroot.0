From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Jul 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-07
Message-ID: <20160708063030.EAEAC102520@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-07
===============================

        success : 177
       failures : 77 
       timeouts : 1  
          TOTAL : 255

Classification of failures by reason
====================================

               acpica-20160527 | 8 
openblas-f04af36ad0e85b64f1... | 5 
                    4th-3.62.4 | 4 
                   dante-1.4.1 | 3 
                  boost-1.61.0 | 3 
             transmission-2.92 | 3 
                 log4cpp-1.1.1 | 2 
docker-containerd-1b3a81545... | 2 
              kodi-16.1-Jarvis | 2 
               libcap-ng-0.7.7 | 2 
                jemalloc-4.2.0 | 2 
               target-finalize | 2 
           linux-zigbee-v0.3.1 | 2 
                   fwup-v0.8.0 | 2 
              e2fsprogs-1.43.1 | 2 
           libfastjson-v0.99.2 | 1 
                   ncurses-5.9 | 1 
               qt5base-5.6.1-1 | 1 
                blktrace-1.1.0 | 1 
                wayland-1.11.0 | 1 
                    mpv-0.18.0 | 1 
                    efl-1.17.2 | 1 
                    libiio-0.7 | 1 
                  babeld-1.7.1 | 1 
                  libsepol-2.5 | 1 
                  samba4-4.4.4 | 1 
                  autofs-5.1.2 | 1 
                socat-2.0.0-b9 | 1 
             libgpg-error-1.23 | 1 
                    lftp-4.7.2 | 1 
               openswan-2.6.46 | 1 
               libsigsegv-2.10 | 1 
          shairport-sync-2.8.4 | 1 
                pinentry-0.9.4 | 1 
            supertuxkart-0.9.2 | 1 
              lirc-tools-0.9.4 | 1 
             shellinabox-v2.19 | 1 
              gnuradio-3.7.9.1 | 1 
           libmemcached-1.0.18 | 1 
                     tftpd-5.2 | 1 
                directfb-1.7.7 | 1 
                 libunwind-1.1 | 1 
                flannel-v0.5.5 | 1 
               runc-v1.0.0-rc1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
              libarchive-3.2.1 | 1 
                     php-7.0.8 | 1 
                 php-zmq-1.1.3 | 1 
                fcgiwrap-1.1.0 | 1 

Detail of failures
===================

      x86_64 |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/1e288dabbdd0c5131c18e1426ed6ceedce046b9c/
     aarch64 |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/94cb201103421b48dffe485e643da6d79caa40a3/
         arc |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/e175c6efd8c94f4c4eebe023a0554a27b7545d98/
    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/564244cae9d0865c4c03516807b4dfbcbd0550a1/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/e1dbcf89f37de5f554486ac319d87282f75fd18b/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/ec6f1a50e6bbf9916f070b2696e197a6db6d5057/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/8dcb8ad3731e0a26fb5a5f748b53a0c06b84dbcd/
microblazeel |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/dfc5c9015b079e2a05e7a2a15a2bf6d497470253/
microblazeel |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/41842508ace7f6bf8e5190497af023f7d02a979d/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/3e39c138d4dc2e3311b71756b242ed2667a22588/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/29ffedbc282a2992379fcad5f870741496cc5f52/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/a6183277addc41a93f13a7c929fd6537d6938af1/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/49944a34cf74eb107c001406e9882897cbb4650b/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/4fd7eebb29c4f88e6e81ce963a177a80215c2f1f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7bc35faa770bd878c6db34bb9d6b283a920fe11e/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/205710525ca6899db8c68767787415c7bfcbe325/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/1257155355697909c278130bfc3057f3f2e54152/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/83f4c9315c0b76271c88169052e7838f8c14d141/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/bc4a61991002eef590c92220252359f45a56560b/
        sh4a |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/8e4e3e3e0771b554878b34065a43c50a4d8d108e/
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/43ccab961517efdc5c4f4d0f0ba022ee5426e258/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/4cc4ab45baae456027fbbef773cb9ad78e97b95c/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/7b3e8e60447b87f424819342fc9a1d0938e08c2a/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/579e97fa3d79dd7dbd5343991d2f6feb0fea6d22/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/284141c62732dcdf0df6f3f183e91f0809d2bb2a/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/78f96a27ec6e1514883a7ac6e7f1c6adfc4fc077/
     powerpc |                     efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/ff1dbbc6cffdb5b2550b3613295151ff9fa964d6/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/bf8f17c5214b5cca83343abbcb1421fe5a839f05/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a3c5f168ec18b6cfb1a551fe6f9ef6b8776efcae/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fbfaa44d9d45dfb4225fd94375bbd120f62bb64c/
      mipsel |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/475472806df046ffd37c0db08f10df5b8863093b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/23a4ceb454f819584877b525806207e16fe9d31d/
     sparc64 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/661347c5a38b6751bdf83e4848e2890e91dbaabd/
     sparc64 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/59dd9f3c51804e6ccfd7bb1faaa89f6cbbb39bf8/
      x86_64 |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/282f30922c1bbc9b12daa9c843f6bc79a8270392/
        i686 |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/dc3788c381761edee5d1e191299c44fb39be2074/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3f89d4c29bc022a05351b6a62f46b6b54ac35416/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/7f6feac93ac7db0ac9a3a8296d0ee2065e96f4c1/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/fb73aaf3c8bc52a617a7abdec42958426216217f/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/26bd22db5ab181cf455139b939a62b441b267f47/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/7108d26b26b3c5c2e240f56b8cdc8443763d4f4f/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/b410429ae90c50f209d58503b75045110576b90b/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/9b14c196e6d4c98da7e88a71157e956b998bad39/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7c4c94228ca01dfc7b4af26c9236578c43d940d5/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8e36a95fc7c5cdd406116fc935f84af3fc6a1f1e/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a62e8a35133531f53ba504dc86c61f32173619ab/
         arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/83d4cb74678b0dc7aee2955b262fb53a7b82309e/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f7c45e88b51c88f5391335f95ca1a639865df8ab/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/884e8438497594a2342405ed669c604a9bb678f6/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/183c639966b467bac53b8d8dcea68891cf714064/
      x86_64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/f65baae71dd1b67464294eea65c2e79e222e12ac/
      x86_64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/170943eff2fe2fc2f45da0d0d5699042f7651fbe/
         arm |                     mpv-0.18.0 | TIM | http://autobuild.buildroot.net/results/5db961af4eb63d008d5f7bfe189ed31a6555c73b/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/05b066f38401a1b360516727f96dcfac4ee3fec2/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2c8970bbf799c02e48ea49a979b214ae06caee8c/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/82b763cd357633062915cf50dfb61f917bc808d4/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0dffb448eb5999b1359786ce5683d03f548ff9cb/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ee58af9bfea56e09b9e45f7404a708c95c555cf7/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6b0eeca0859d021a27f9eea206dc411423025c68/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9fe9e7158c7c82e9c1083ceb00f6ff03dd4dae40/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/33e7fa96e4861f91939ea13d45943463aec25932/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/bc6c818390d65d5625ec38338994035af69be90b/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a06aab5c4bbb6a5d414abc8d37fbe5ea3d1b1077/
      xtensa |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/2d580f9439679fd8fe292e2c4dc768dff1ad1867/
        i686 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/6c20c9e222f94e6b70b97b87e1393dd16da2718c/
      x86_64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/fea069fec671b32bffd3d133898d71d45abab552/
         arc |                   samba4-4.4.4 | NOK | http://autobuild.buildroot.net/results/aa29920b662e5cc58e14202371601f4ef57a650b/
     powerpc |           shairport-sync-2.8.4 | NOK | http://autobuild.buildroot.net/results/bddd5405fb3506389b41217828639a461904922e/
        bfin |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/609ec63d36e235581fe0388c0e1102362743d5b2/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/e2a0c5ab12306bb4835286f74651d64a87722c0d/
      mipsel |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/9500bf3e7fad7cdfbe15237e02c06e70448e3eb8/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/bf4b3c679511af18229b6ed9087384e297143133/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c13c12b9c55c2236b64d95d819dbb15df3f96f80/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/3dbda2e81621824dd7bd4a94442e9f0b7e4fe7d1/
     sparc64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/deae46ee6761e413913923f8d9e2e6f7dba2f2c1/
     aarch64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b4116e8f31c5d06fb405143919bc3bea7b348e45/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/afe433271e6aaa3ff1712d3d3ed00a4678cdaafc/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/923811a5ed5489b42d02975ff8bebd234d1e7d86/


-- 
http://autobuild.buildroot.net
