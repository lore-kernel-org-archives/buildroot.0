From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Aug 2015 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-10
Message-ID: <20150811063012.4DDBD1012EE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-10
===============================

        success : 201
       failures : 45 
       timeouts : 1  
          TOTAL : 247

Classification of failures by reason
====================================

               libpthsem-2.0.8 | 5 
                  boost-1.58.0 | 4 
             libselinux-2.1.13 | 3 
    xserver_xorg-server-1.17.2 | 2 
               lightning-2.0.5 | 2 
                 clapack-3.2.1 | 2 
               protobuf-v2.5.0 | 2 
             webkitgtk24-2.4.9 | 2 
make[6]: *** [libavfilter/a... | 1 
       directfb-examples-1.6.0 | 1 
                busybox-1.23.2 | 1 
                  opencv-3.0.0 | 1 
                 qt5base-5.5.0 | 1 
                    bwm-ng-0.6 | 1 
                  ffmpeg-2.7.2 | 1 
                 cdrkit-1.1.11 | 1 
                   tinc-1.0.24 | 1 
             dosfstools-3.0.28 | 1 
tvheadend-d9cf931f9f7242f07... | 1 
                 mplayer-1.1.1 | 1 
             lttng-tools-2.6.0 | 1 
                gnuradio-3.7.5 | 1 
znc-b396cafdb249544164ed029... | 1 
                ipmiutil-2.9.5 | 1 
                 setools-3.3.8 | 1 
                minidlna-1.1.4 | 1 
               linux-pam-1.1.8 | 1 
                 openssh-6.9p1 | 1 
           libfreeimage-3.17.0 | 1 
               bootutils-1.0.0 | 1 
                   audit-2.4.3 | 1 
                 mesa3d-10.6.3 | 1 

Detail of failures
===================

      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/2333c9b3d8f81b15602263b918d422e440f09d60/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/168ef6eee7fa441d130baf00c022acc6c1d11a83/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b04b298d2e12323a394faae61ec0fd07570ed165/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/cf91bef4ba12f891cdba74cf962e719d443c9330/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b670c5acc28108dd8c79f986e7ad46d605229fd8/
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/c0d09f5dd0e26c0d2454ebb2ea5317db1135db89/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/57716a716bd954c275e1d45faa1b3efe8c7adbbe/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/278465865fed7c37042d6ea5d1c8baf524ccf8e4/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e36ee334c30f60511bc25172f680c144c6e671de/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/b91be797fa45d86d08f1176eb8f3e4603d482a85/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/1e8b1d3986c43d603fd4a97be9ff2a7cc2d8c1df/
       sparc |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/ecf961e67209563cd7459756231648ee76d31c84/
      x86_64 |              dosfstools-3.0.28 | NOK | http://autobuild.buildroot.net/results/62b1a71c4fedb6f9209663e7544d7a36fb42c580/
     aarch64 |                   ffmpeg-2.7.2 | NOK | http://autobuild.buildroot.net/results/90ae4b2fa8a6cff0f18abea2b1c45282afe99e4b/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/0020d5a7a4598635bbff4c8d1556b237795f039f/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/bf015c9047e9c13a6cd7d438a9727b086b250afe/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6ab94d24e488d07857b1a88b6cab54c65b530e37/
        mips |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/d3a1ba07a4f659f6c38ae772abe708f2986e0aa5/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/cfd3133d381a59089e9ea72bf385b61a737af4fb/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/467c3ead7092edd611af10719d0757c88792e851/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/0e97f7b9358581cf26c87037b42911bf008225e2/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e060f47846b93ce9e9e2d98f5cb35462fa413d24/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/eeecf6bfc2c20afa5aaf48f7c2f7071429996ee0/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3d00474112763aaa4a3834896cfb462e3bf53053/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/60de783db88ee22ae18c7710f6668340f49d19fc/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/6c37a1cd353b7cac854cc85d29a8232233414c68/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/459ab12bc3eeb493f39efa2450bc829a351ee3a3/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/da2c022be56b861be73bf40fac0cac0c6cda21bf/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/8e2d02863d5a79013f38555733825f93ceb2fde9/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/a96d3cb7b4d93bb3bf39503bc4f9216b47d9590a/
       sparc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/c0625c20edc9354275fe9ba45613dc5f6b721e91/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/f538ad6673b711492acd727d623d0cc2de626f16/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f373f0b20cf127b3e54970ed50d45fc5c38991a7/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/6498a631f20d9550676da3a257c87237be080fdc/
        i686 |                  openssh-6.9p1 | NOK | http://autobuild.buildroot.net/results/64b297c6a21a63db44063d4577d1191dc9b90785/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/a91ea29454a6f8eefc0bf4f0eb137dd8e061f028/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/ecb67c1d1b04a79ad9fbe4a09121ec492fe1501c/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/a06a6a9cd70769d8d257df27e9434779eb63fd6e/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a4b2a6f1920430af43c23239de17200e70951b3b/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/918e179ed9faf2251d9be57a0afdb79b47292fb7/
       sparc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/480b403788073a5d842b5723bcb6c51765e493f1/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/46980bd97825658c41d0381a9123115d4e7b0a14/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/e06cc2f1d65973774a8588bd4bd475dfca536629/
      x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/1209c947d9d80b4e09b5fd6c2582b48b5c1975a7/
     aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/7be5fc0a62870fa5e88a1c75afcb1f4cf9182eaf/
         arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/cb4870822b7d8e608f2ac492747fbec02fed17c3/


-- 
http://autobuild.buildroot.net
