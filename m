From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-20
Message-ID: <20151221073018.880AF101B67@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-20
===============================

        success : 251
       failures : 102
       timeouts : 0  
          TOTAL : 353

Classification of failures by reason
====================================

                  boost-1.59.0 | 17
v4l2grab-6a52a234e227a30e16... | 12
                  libffi-3.2.1 | 11
                 mesa3d-11.1.0 | 6 
canfestival-7740ac6fdedc23e... | 3 
                   mplayer-1.2 | 2 
                   erlang-17.5 | 2 
v4l2grab-0abed72532bee02e54... | 2 
                  ffmpeg-2.8.3 | 2 
                 gtkmm3-3.14.0 | 2 
                   open2300-12 | 2 
                 opencv3-3.0.0 | 1 
                     rpm-5.2.0 | 1 
                     apr-1.5.1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
        ltp-testsuite-20150903 | 1 
              rabbitmq-c-0.7.1 | 1 
               linknx-0.0.1.32 | 1 
                  apitrace-7.0 | 1 
                    neard-0.14 | 1 
                  snmppp-3.3.5 | 1 
             host-nodejs-4.2.3 | 1 
         qt5connectivity-5.5.0 | 1 
                  prboom-2.5.0 | 1 
                    kbd-1.15.5 | 1 
                 opencv-2.4.10 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  connman-1.30 | 1 
              alsa-utils-1.1.0 | 1 
                libvips-7.42.2 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
               ipmitool-1.8.14 | 1 
                pinentry-0.9.4 | 1 
       openpgm-release-5-2-122 | 1 
                      qt-4.8.7 | 1 
                   glog-v0.3.4 | 1 
                  libtasn1-4.6 | 1 
            xlib_libXpm-3.5.11 | 1 
            netsniff-ng-v0.6.0 | 1 
                  c-icap-0.3.5 | 1 
  xdriver_xf86-video-ati-7.6.1 | 1 
                   tinc-1.0.24 | 1 
                coreutils-8.24 | 1 
             stress-ng-0.04.16 | 1 
                   slang-2.3.0 | 1 
                    vpnc-0.5.3 | 1 
                libtirpc-1.0.1 | 1 
              squeezelite-v1.8 | 1 
                 dropwatch-1.4 | 1 
                  ltris-1.0.19 | 1 
          binutils-arc-2015.06 | 1 
           argp-standalone-1.3 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/d7555d43bc76477b362f827f9ee0cdd7eed5b26d/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/caa5f9e8d72dca7f2cbec84f94af9f8e271ea436/
     powerpc |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/e7c0fe2e49aa044a514c3bc449b95667878ac2c4/
     powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/6c3424923bbc1dfdb0cb9226dbb1b60167cfdbc0/
         arc |           binutils-arc-2015.06 | NOK | http://autobuild.buildroot.net/results/8089caa83c40734511013c8ea998dc82221bffd7/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/52f30d87ab8e06328bff24bd2d0e940af4122351/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/116dc08017202ec5459750b29f3086050861c4b6/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/6bf6414543a83f3b14c7f6a12aff2a53757874a4/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/870c85af4923977bc2b6b8e7f09b24f965f82e48/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/83be56ec6f91b0b5a861c807b4d9403f8301da17/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fe215227fd89d93a6a5829ba20a0e4741a1b7eab/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d309743c0bc0031a6666358d1bbed4e5444e76f4/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/23d2527e50eb8f540a8369d74d82cc5ee65f2dc3/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f33b3f6b715f0262f4eb11b50b2f2a7de58713e1/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/6f4d9236d359f6338dc8a82eb2e34f9cebebd29d/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ae797588b60a752a43fac844859a320915ff6d21/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d47a24d04e0693b9394c483527dd16c5cbc85bea/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ac8fbe7d756aaca6d422c28e4e628c6bd8feeb2f/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/34f6c167d5ed494d141ad8f3943a672f6367b635/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/1f12308c8de504bd0d82cce9f48542119398f2b1/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8041cda4e8d100dd5cef456fb912aba197b90c4e/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/2d31918469f0e5e9adf731ee58a9ae5ad745dcc2/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/9d465a158be51c2a7a644c24da6c0196979043dc/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/860a50b765c572c7df687dfd4af132dbd6e76e96/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2ff17f09740ebfe617e27c0b9c5cb3c6f19c4fd6/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/bbe12e3b7783879e170a7191cbbfe7735191d204/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/6960d9d70ead60953c60cab134a7dcbc1540f08d/
     powerpc |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/c69917b3aa9f232fbeb7b6a2c3a01d8eecdf8cbf/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b3625683098cab9c0d81f405835b95ef3dcdbc8e/
     powerpc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d93755e5f91feb99988dd9a0654f151e73847509/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8566322d2fb861f90d97e9d84429f4a42c9d9f5c/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c319e5c261a709d97a0d6850370eaea28d855526/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/b86affa985771acc9dd29297da9507fb7eedbedb/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/cfaa0b7f2eab61fcc5b3cfb2d3187fea9f2295c5/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/bb53958bddd93289449ceafe63a2531e55c4636e/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/c4156914f8ae8216ed782db097a2e9423be6d2df/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4494065b62a661f0ab557c1d17de2a958d44dea1/
      x86_64 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/f32dca5b8635a00d8787e9b3d18cf75972daa292/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/c2460d60fe5ecc1da1261703571929f4330980a2/
      x86_64 |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/cd3eaa0aaeb0b4e58aea19976f76c610a1a54b50/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/227a5749260f6f5e4b28dc68078c837fad550420/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9ead0d3ed00f2b85bf14e7754bef367edade24e3/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a606d86cba99bac1106bd0ea88c86f6c7feeb6e5/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dc2084694e39bacd932e79885cc8aeb96bf5571a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6d05e4b1e69f5b21383a367e7de848f2211c47d8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/159432aff383368289689160ea814548d9ae1505/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9dd114308f6f3160c0e82b2aed6915491d9bb0dc/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f418251ca2a7e48e530b4e9743396ab1be1fb2e7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/18b9dc7a7b43e1cc3abac46ebfad0dc01a35cb20/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c0e7c548d86ca4ec633e9d60449275fbbb05a171/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7424b570a3015d0d3c34fbb0499245abdef4e181/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4fcc7e2716438b3d757cf341883cd2dd49e3db66/
     powerpc |                   libtasn1-4.6 | NOK | http://autobuild.buildroot.net/results/f87d3ad04966e592f1f067498d5da164aa246ab9/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/46f15f2ced250c5796f2da66830342a82034e5cb/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/ac79d554d4a4807ee0d16a4423aac9ba6828e9aa/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/74d8563cc79080ed886cac80ec148cbe98a2120f/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/31f5dc37431602a51b2465d49688ef5213e2ab4e/
      mipsel |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/231ec6e12dfb8fd2e263eeacc439ed1d72397d02/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/9a51768a51d7092c7ea4fa636977880f8b861c07/
      mipsel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/eaeb8ff448346f01ddbb78096df3dab50c29b727/
      xtensa |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/dcf4e31e6b6eeadc7a2d7c87697f57d699673b9e/
        i686 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/97154ea0e780623d23b20b6b9fcc5df6190875c9/
    mips64el |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/7b38131ebb6b20daec1a6d2c49b25c5300f319fe/
        i686 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/61b8b87f0460751257f480ef478e753635cab798/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c5a9286c3b6e4c11c0cb41cf9831fd8a33290f24/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/19225108e061eb229d15e69818eddd790ffb8a92/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/49afb1af4430f5231d98691cfb96edaa0d839165/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/0acc177b6412373e799a13cd8c558172df58b364/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/81e9d341970f293123d66216a3ca049225508e34/
         arc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/64df151df297c2ac77ea4e59bd066b035fd959d2/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f5552385236c95d4c398bfcd0938aeba99471438/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/d0d68b8cde766b6bd25864ce90b8b42150c884a9/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b130a356fa432d76f49ca68ed0992e3030835e13/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/6eaaae0537f5dd838c6d40177277804889a4ddb0/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7f6fab844b490517fb2ba32a18cc6c459984c5a2/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2465ffb0e1bd7bca24b05ae70145b59e7b7c4c33/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e746e4f10623729d1ef40a025a6d0f97a88b3795/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/62c95a87901f6baa4c360b6f13609150886e562c/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/9a2199ce8606e9087e67ecf0058326d9698e3948/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5340344054d511311a897c88fcd9f00b8be57b4c/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/0e2090eb677497c5322c4fc1739284042afc8f08/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/7b6e08b9ca365bc6e71c678f258c1a0aaec31929/
         arc |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/20fa9e8605aa6464088eca108773801198b125d2/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/663ab3f6c2f79c6fb6a007b0d1be96473e78da79/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/4a8807dbf0b21c7b28ec908918a72ca1eca2b8fd/
        i686 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/39d7ab81fbeb58d39260c814c8dd38484755d52e/
        sh4a | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/4484bda010442033d0536a95f45370701c071f92/
      x86_64 | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/37dee4ce618c511af8bdf7876e6038e907aba7a6/
        sh4a | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/3e6e55a9bfa96aad8370f2b24110890c14caaefa/
     powerpc | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/09a1931d9c117b678cc6ab9bd34f23aa84238d48/
    mips64el | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/f3b6a2bb10b6c621a1d5683a18bcd3caf532ba00/
      xtensa | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/3aa8ac30de88c50539afaf7cd5ef10eb375c96f5/
        i686 | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/0f42498087a7f494556dd38a4c587348e60cb80e/
    mips64el | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/48d1052240c6041db7ac7b82fafd8c02998becfc/
     powerpc | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/c2de7d636d53367ab09547a84113718e4600e314/
      xtensa | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/f31487133fc19142431b1b58ec3da0a4c74bbc64/
         sh4 | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/610cf4682485d6b4606091c98c1a1626295c429d/
        sh4a | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/172bcd01a4a003a665f48dd2c5f434fadb27100b/
        i686 | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/92792f6d7aa2f9b2b8d55315369164faa42c38af/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/4afdc85510b229663505c7d8a724e5f0c0a80a1f/
     powerpc |   xdriver_xf86-video-ati-7.6.1 | NOK | http://autobuild.buildroot.net/results/a857e974d0bd736adec056e3fb374c510e21e740/
         arm |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/cd65c773d107a2e7571607f5355cb6dcf4b044e0/


-- 
http://autobuild.buildroot.net
