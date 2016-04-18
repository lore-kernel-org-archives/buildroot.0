From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-17
Message-ID: <20160418063020.DA0DD10185D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-17
===============================

        success : 150
       failures : 49 
       timeouts : 3  
          TOTAL : 202

Classification of failures by reason
====================================

                    yajl-2.1.0 | 4 
                 rsyslog-8.9.0 | 3 
                 jack2-v1.9.10 | 3 
                  connman-1.31 | 2 
              host-cmake-3.5.2 | 2 
tvheadend-cd9f07fb865e57001... | 2 
               ipmitool-1.8.16 | 2 
                   mplayer-1.2 | 2 
                  boost-1.60.0 | 2 
                  ffmpeg-2.8.6 | 2 
                moarvm-2016.01 | 2 
               polarssl-1.2.19 | 1 
                qt5tools-5.6.0 | 1 
           quagga-1.0.20160315 | 1 
make[2]: *** [Source/WebCor... | 1 
                 mesa3d-11.2.0 | 1 
                blktrace-1.1.0 | 1 
     input-event-daemon-v0.1.3 | 1 
                   assimp-v3.2 | 1 
                 igmpproxy-0.1 | 1 
                  stunnel-5.31 | 1 
             bluez5_utils-5.37 | 1 
                libgpgme-1.5.5 | 1 
                     lxc-1.1.5 | 1 
 toolchain-external-legal-info | 1 
                    ruby-2.3.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 mpg123-1.23.3 | 1 
       gadgetfs-test-undefined | 1 
                pinentry-0.9.4 | 1 
                 opencv3-3.1.0 | 1 
               linknx-0.0.1.32 | 1 
                 musepack-r475 | 1 
          shared-mime-info-1.6 | 1 
        ltp-testsuite-20160126 | 1 
          chocolate-doom-2.2.1 | 1 

Detail of failures
===================

     powerpc |                    assimp-v3.2 | TIM | http://autobuild.buildroot.net/results/e42d1a2d9bb98f68c8b34bf8883c9f498c907d4d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0ea186335fdba6e2397a8dc39bc51b95ad905f33/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/845dc3c6290b5e553003373b5e65e30dc87c7747/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/03c222578d331a6a128d8120fc58d4ee5b687384/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f845b39406e4c2eda2201104a1e0762d2bb0245b/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/6f4a7f7ab9346770551beaa3bd7f176d5ef3b284/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/12a8819f57beb3c307b39a36ec7a04902563f085/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d3be50330c62aea6d000dac146e00716f952adcc/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/ddf5aa6332333a7d22675c66569ba6ddc7f2287b/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b19d31cc9f7bfb606b37de9d2e67c177ebab8b49/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e11e7d8e0503a0d0ab3497a0145774b7b6f47b58/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/bc2d6c508e7604e248deb7fd9691d2197e09cba1/
    mips64el |               host-cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/90485435fb157ccc6560a31984cd2d3ddf44ed17/
    mips64el |               host-cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/0d610b6d8fa018ab19c77839e30247aa80693ca6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2ec2341bf4f71b7d9166e4e359bb7e95e53e1ead/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/dee1a93c8655bde6bb6090a64697673696fbc261/
     sparc64 |      input-event-daemon-v0.1.3 | TIM | http://autobuild.buildroot.net/results/e23293b94d82083c12b58e4a64d8e3087ca363aa/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/49637fcab9cd8e6278257158574fd7574f97bc30/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/6a37f69ac40d60a1735afe5974cabec3ca5de41f/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5d2f049ab9fa6a1a4e3fa9884983ab66b2fccb56/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5042be25ae0b82adf46bc5306ce9654ec86b1ec9/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b36d9af5d5edfe274296d89f735e323c313668c3/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/2df6fc33c83336a1792b8178325a74ca6e5a5b48/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e905c6371fdfd0710dd9344da30c6dd13e67dbc7/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/2bd31250b17a52270035218efd58779f4eb0ba28/
      x86_64 |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/95453a9e842a4f1ef11e8c04a190600c861f8b34/
    mips64el | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/98f80e94b9e723ce5090021c27762afdae2f2eae/
        mips |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/9862d86bdb9dceda7035b474d08f91c72c43f0b0/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/7c1e5d72caeb2497c1278894e1ef5612713a14ff/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/099941f8ee5e2f068441d2cf7fe84c8c950391dd/
         arm |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/610bec1b08d7e797badb1172f19e3c63eec585d7/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/56d2923ed95ba0bd5299ab44d4ac31a852035c4c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ae0866839e3f0af4d1746a03ee973c7ef58c2b8d/
      mipsel |                  musepack-r475 | NOK | http://autobuild.buildroot.net/results/6836a393b7a79ae31903aa4a7aa74fb95b0a44e3/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/8304008455be8f874589448560375a82def23911/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/82199113dc5d411c27629e43f8ff42eb69bb696b/
         arc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/a7e1c42dc1c6c73baa81003fca70014111868c7c/
        mips |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/bed06e2dfec7999ffa7c1669c5df283461ee5057/
     powerpc |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/386207588cf913a6d26f3849419f1cab6318e473/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e54bdeee70f87d4df3d0d83ab8c465f3b0e258bc/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/535e845af018abf5d321a35af3abde77eb64dd00/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/5cf6670b9723c99e02e31a26f93f5a5287857eae/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/447c0448957d6b86a147968710f6529370f5f146/
         sh4 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/29edf31dcf1f30934bac4e3456faec48ca739e99/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/59bc6b20f2839d3422a8928876e6e325e8778b34/
        sh4a |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/608630a806ac31b9588bcd00770117caaa930648/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/6e3c1fc7c0584dce8a14e719417ed6a6fc6526f2/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/30fe505445d4ed135fef1acdaf387e2c97b58bff/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b782ca57015f45ca6f8246ee4b9f96a660941004/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/1d4ed085e9b5d8b70d38b12f4f16c6a048bab2dc/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/bd806b6cb22d325ae894f05f74ae1524e7a0212b/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/73627fc7f50fec72e505e0f4811c602027704cf3/


-- 
http://autobuild.buildroot.net
