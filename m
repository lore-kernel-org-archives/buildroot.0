From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-07
Message-ID: <20141008063015.505A6100CAA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-07
===============================

        success : 183
       failures : 34 
       timeouts : 1  
          TOTAL : 218

Classification of failures by reason
====================================

                ser2net-2.10.0 | 5 
                 webkit-1.11.5 | 4 
            btrfs-progs-3.16.2 | 3 
ympd-a98d760dddff4b0dd595d9... | 2 
                 opencv-2.4.10 | 2 
                    lftp-4.5.5 | 1 
      canfestival-7740ac6fdedc | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                 samba4-4.1.12 | 1 
               qt5webkit-5.3.2 | 1 
                    fltk-1.3.2 | 1 
                busybox-1.22.1 | 1 
                      qt-4.8.6 | 1 
               valgrind-3.10.0 | 1 
                    ofono-1.14 | 1 
             bluez5_utils-5.21 | 1 
                   dejavu-2.34 | 1 
               alsa-lib-1.0.28 | 1 
                   atftp-0.7.1 | 1 
                  python-2.7.8 | 1 
            host-heimdal-1.5.3 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                 python3-3.4.1 | 1 
                   czmq-v2.2.0 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/7fb073407aad3781c7e46e9f310650624ff28f15/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/4633605ca6c304e300787ceb534da3b4203270c3/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/ffe2c314b2eaebb0a070a616b9bb192c5b3c55fb/
         arm |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/135cf0093170a5283073bf00da6953344b3c6910/
      mipsel |             btrfs-progs-3.16.2 | NOK | http://autobuild.buildroot.net/results/6e448d6473cf7d514df98b46b2454a3744d2a818/
      xtensa |             btrfs-progs-3.16.2 | NOK | http://autobuild.buildroot.net/results/0971fee5cf37bd379b8c3a1df65d2292e9333b82/
     powerpc |             btrfs-progs-3.16.2 | NOK | http://autobuild.buildroot.net/results/32523398a8c66a7ac6d3e789332d1b57e090aef1/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/8f6d9768c9cec713bb9db1d6569dc5475907495f/
         arm |       canfestival-7740ac6fdedc | NOK | http://autobuild.buildroot.net/results/98dce833dfa8255522af672d4f41c2504c00e64e/
         arc |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/a972eb2fb01c45103ec5d83b26bfec457b3c8c4c/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/302702b5b3c298856f75c9b327c4c57825c838db/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/d01736afed985b902f8deb9422556da8e63ebbb4/
         arm |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/58d5f0d93322155529c307a4f5ec2edb463b616f/
         arm |                     lftp-4.5.5 | NOK | http://autobuild.buildroot.net/results/f9162c9c3f365038ac091a3e881480908ff343ec/
      mipsel |                     ofono-1.14 | NOK | http://autobuild.buildroot.net/results/5662b995b70c6839bb2e44d83837bd75a93bb382/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/9bf689fcf9e70481bc0db51eefe9e9445bb10dba/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f0ce8b5c5599f3ba048eed595a1cf6fd5f902dac/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/093634c56923b41077676e18328ebcce231c93ea/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/6dd056a3b6d36108ff18b1799872d9b9883365cf/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/cfffa2b7d53a295042c9b8bb25fa895eac03a1c3/
        i686 |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/0a98f32e2ca364d7834bd3569ad7d4184fd3d410/
         sh4 |                  samba4-4.1.12 | TIM | http://autobuild.buildroot.net/results/6a1b1d0fd2c96a2dc1c1da612732bbb30ff1d3cd/
      xtensa |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/0332822742b415cb2f5056580a643af976ac8189/
        sh4a |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/f67d13b720883001b38440912bab88f5c5693266/
        mips |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/7eab31fcf1585af3d415ccec8755784aa2cd0a75/
         sh4 |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/8bee60574782a5791129cfa33cb5f07197c8f8ba/
      mipsel |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/fc6174a1fc1b00fbb96fffc6bc3ac6a4bec2fc88/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/132072d849a3ec572aa80e51833bf6906a54400a/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/2f148983a39c3e3f06def5ac7cf683b46a673de7/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/dc826130155fe83b71d9d3c51310744ee04a5845/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/986aa3da094542261d2bb36c3d2ce405745b960f/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b8aa84703ce107c215a67b8919736c66bf28c65d/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/62ba72f5af6334cb74a808ce8cbf536b9137321f/
        bfin | ympd-a98d760dddff4b0dd595d9... | NOK | http://autobuild.buildroot.net/results/e913b99457f6e7f0a38ba947f9acae7217006116/
        bfin | ympd-a98d760dddff4b0dd595d9... | NOK | http://autobuild.buildroot.net/results/8340e69763e263fcf20e73f75eafcb31989e9f51/


-- 
http://autobuild.buildroot.net
