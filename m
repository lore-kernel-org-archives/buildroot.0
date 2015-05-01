From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-30
Message-ID: <20150501063016.0A233100EC3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-30
===============================

        success : 149
       failures : 48 
       timeouts : 7  
          TOTAL : 204

Classification of failures by reason
====================================

  toolchain-external-undefined | 7 
freerdp-770c67d340d5f0a7b48... | 4 
         lua-periphery-1.0.4-1 | 3 
                libtirpc-0.2.4 | 3 
            python-pyqt-4.11.3 | 3 
libubox-5a0bbefc8fa44044625... | 3 
                     vlc-2.2.1 | 2 
               libecore-1.7.10 | 2 
       gst-plugins-bad-0.10.23 | 2 
                numactl-2.0.10 | 2 
                tinyxml2-2.2.0 | 2 
              postgresql-9.4.1 | 2 
                jasper-1.900.1 | 1 
                      qt-4.8.6 | 1 
           libmemcached-1.0.18 | 1 
              wireshark-1.12.4 | 1 
           aircrack-ng-1.2-rc1 | 1 
checking whether _sys_signa... | 1 
              host-libxcb-1.11 | 1 
         conntrack-tools-1.4.2 | 1 
                  boost-1.57.0 | 1 
can-utils-0eb1e3db2e20b0d89... | 1 
             python-lxml-3.4.2 | 1 
               arptables-0.0.4 | 1 
           linux-zigbee-v0.3.1 | 1 
                     mc-4.8.14 | 1 
                    wine-1.6.2 | 1 
             armadillo-4.000.4 | 1 
           libvncserver-0.9.10 | 1 
          openpgm-5.1.118~dfsg | 1 
             subversion-1.7.19 | 1 
                 leveldb-v1.18 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/6d8d31181df46482b717a4daadb6976d6e2c2d0c/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/761207e973d75584730511dd24e47cd5e47e5848/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/aee557e25b231df3665f06e6b195415bdb3d7b1d/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c998091274b04619ddec395b60f852948973120f/
         arm | can-utils-0eb1e3db2e20b0d89... | NOK | http://autobuild.buildroot.net/results/12d3c28934b6a5013dc8dbcc57c66e1060c1e9f2/
    mips64el | checking whether _sys_signa... | TIM | http://autobuild.buildroot.net/results/b381d873d898c83755945570094102178dde710d/
         arc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/e13873dae3a5c90de641a8ef0c541e2aec07e35a/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/2af5109b50bdae5aa3d82bbbff8ff17a3d97ac7d/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/3364cb07fb64ab40b1f39e1bb13ffb8a54cbaba1/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e0ff766ce4b762ca1554fcaaca2a05631991ad3f/
        mips | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/c1b1383d70d322bbcee287b30c147fb5925a58aa/
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/db8309c8cc6d4fb8a28d17c3b1ed71c49277d212/
     powerpc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/84e7a2df4a8de2ca1ce075a8f5f32a94b7f45ce8/
         arm |               host-libxcb-1.11 | TIM | http://autobuild.buildroot.net/results/44792ae7477cc8588fd9fd329ea4fd187c3730f0/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/6300510ee197ff823457aee9f3cb3f7bb9a45920/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/2bc829fb3bd5d4b88093ee918b052850cae1d00c/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/40454193c4f6211538c91587b99c6e652a4eb095/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/4d4be37d391dcca7a4c371b458a16be14cc0b5f7/
         arm |            libmemcached-1.0.18 | TIM | http://autobuild.buildroot.net/results/a824062600ca93116e6ce32d3d6f58465d9dadde/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b1d31727a60f1d5a435dd07dacf1e463f0f8ccde/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a10c9766151916ee9055ee72c44283ceb9401e88/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/51a7e99bbc5123eb716f2a3bf779a41700ce7ff6/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/bd7c738459a2c49ab7f130066029835bd4c15cae/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/2ba5ed92a4ad7ba41e91dfc695b3591915d6d8f5/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/96b31604cb3d90fe07eb7e78696761b2bc344d7d/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/a1f737c6aaf4e10f7bdea6835c074dffd436dc46/
         arm |            linux-zigbee-v0.3.1 | TIM | http://autobuild.buildroot.net/results/6f72cb5608e6c4236fdfe0c5dd554cc15060f635/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/298117ab67b250f3be790bf887e443abfd7363a1/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4cf44e0c115dcade363a4091dbd5aa808db0ec7b/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/253e62f5a9cb62f62e486b15a143b5a65821836a/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/e3fe69dfbec4c3b69193b37afdd61d28f451eb15/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/090882b922d9cf0d4d4b7763431d3e687d3c3452/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/1b3347f616e1c275dcedeb1a923771574795e488/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/d78bfac438034add85d3379b9c607a84ab27db3c/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c26f0414b98bca2eb5bb91453d66a5390c81d081/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/349f3cfffe73d4cf3cdee6e2f9b2a23c53370927/
         arm |              python-lxml-3.4.2 | TIM | http://autobuild.buildroot.net/results/9d1d4988135be215fe5394bd199812e39449634e/
        mips |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/4b87e8f0761a173b07f79d2d145cb5b71afabe97/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/7fc9dd84ecd22335cf175523f1b033f64d037015/
        sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/7aaded2d0b9f8ea08c85dee30a527524a34e574b/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e51f551a0bc959f4373af17d3f5474289d2014d4/
        sh4a |              subversion-1.7.19 | TIM | http://autobuild.buildroot.net/results/bb2adf08c05dc2017c4a153ed637fc40e50632bf/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/76b37aa90fcfad1d498b2779fef9f91939be0799/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/5fea44d7a805f29d4bd0d0dea336fffa5f47cc22/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/98dc6684056a94df158a120a4bb3ccb2ed10715c/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cfb606eefc582e1a9be052050c9ce1bd4d3b7cb1/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9fd359bb78779d21f5cca314cc1a86b65e72ae2c/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/182fd0dd0127eb6d3ae173334786c4cfee76e73a/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/2e1e7dfe5b365ba226cfd8a6102e02af13096d07/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/57f2c09a70c27c8f645d8ad4692c3bb86a32535d/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5a72b1eaf6fa71f1932dda28b34023d672e67cbf/
      xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/7a40f66b3be8cd71a27df04415c4851cd4426cc3/
      xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/da62d97ea060ce03db94f59a91d84a235d03e8f0/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/00fe73883ad1ada4193a3d0b6ba31dfe2464dc86/
         arc |               wireshark-1.12.4 | TIM | http://autobuild.buildroot.net/results/4e65fd5f1b628f3b69126af489d22a20abcfaa7a/


-- 
http://autobuild.buildroot.net
