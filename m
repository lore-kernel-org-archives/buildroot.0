From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-02
Message-ID: <20140403063009.526E4101924@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-02
===============================

        success : 52 
       failures : 45 
       timeouts : 1  
          TOTAL : 98 

Classification of failures by reason
====================================

libuci-262fede3e8c8c08c1eb0... | 7 
                     wget-1.15 | 6 
             lttng-tools-2.4.0 | 4 
              host-scons-2.3.0 | 4 
            lttng-libust-2.4.0 | 2 
    xserver_xorg-server-1.15.0 | 2 
                  zeromq-3.2.4 | 2 
               audiofile-0.3.6 | 2 
                    crda-1.1.3 | 2 
       network-manager-0.9.8.8 | 1 
                   slang-2.2.4 | 1 
                     nut-2.6.5 | 1 
      libnetfilter_queue-1.0.2 | 1 
                  mysql-5.1.73 | 1 
                           CXX | 1 
                 qt5base-5.2.1 | 1 
                   ptpd2-2.3.0 | 1 
                directfb-1.6.3 | 1 
                      qt-4.8.5 | 1 
                 cairo-1.12.10 | 1 
                minidlna-1.1.2 | 1 
               libsigsegv-2.10 | 1 
                  python-2.7.6 | 1 
                   systemd-212 | 1 

Detail of failures
===================

       arm |                            CXX | TIM | http://autobuild.buildroot.net/results/5f4dd1ed378904e0e2871ac84d4352be682a7a7c/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/896812e89d438cefcf528dbe1613fcef8c5421f4/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/51776365624d3bb0ed435560a92c6d5b88c76370/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/bf571be530e1efecb3678f412f88b3d15470953b/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/d2fa4cbfb0a6214e5e122729c99bffb1f14abdb0/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f843e7a085049de93932f92c6ac10b8a6629aaec/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ca297c1056c4a597d4ef1b7f7a65bc2e4311077c/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/b16d826cdec7135a671d686d530db23e15d60a2f/
  mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d83e5737523a356d1461fd617959b3b221c7d4e9/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/234dbed0b454e682b98906c3850e0afc7e09049e/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/c61a377a09ab15295caa488921c6ee86a79a98de/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/341de568c0e377f315b0576dcbce6ea1eb32544d/
microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/abacbcad82cc5dd225a8bef063285d9444d66f01/
      i686 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/ed4debaa74bd32bb3390ea3cc3b52182e78ef2f2/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/abf904ae8e42bd737a04f4aec55626eb94405059/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/6fedf3ddc7e41f2c67a1283b7a64dfe5c41f6bcd/
    mipsel | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/ec59c6427063aad4bab9211766a00d4fca019f90/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/0b6ef184ce186bcb57d84295b2cb3e29bc0ff6e8/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/9804aa4cba5c43a1e9611197dd90a145182ed950/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/d4d77ce67eb452812a00131c022b9eede6f1e163/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/c7934c8aa484176007cb348a54476897ee614768/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/ad535b9d2ff3f052f913c1ced52470403fbc59d9/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/bceaa498935b1bcd05293f3f7ea47e4090c2c705/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/e80051fe41fbd241d2e88fcba2d9e830114ebca7/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/f82a94459d7c2ed983009b15e58399fd166e51ad/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/1ac128ef16e77e3daa5570aff3efa396ef6bb3b1/
     nios2 |                 minidlna-1.1.2 | NOK | http://autobuild.buildroot.net/results/cf5c8932ad9b040f006d5e2bdea0b0e08ca6efa5/
   powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/20f89742a1363a024232411b9e1ae7be951a22fb/
  mips64el |        network-manager-0.9.8.8 | NOK | http://autobuild.buildroot.net/results/3b6a40c1683d0859a934e4d79e2048e97b193e94/
      bfin |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/96193e18782697c2af8813a7714b66b4ba1f3d1c/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/827024ae1ec8c80bb475d0b9fcbf8301b6348904/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/6f08a9e6cea3572d9ae2d875313f628d35bcf655/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/2b27bead0dcc07399c443ef0af06fa56198b404c/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/ed36606c5cca26d8d88c3b87a138cb759f014afb/
      bfin |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/6f1eca1296fc7422dec8322fe5ba36673a759c40/
       arm |                    systemd-212 | NOK | http://autobuild.buildroot.net/results/9b3cb272afc922c1e6dc4069e921ed74a0e75391/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/8bff48d0a6c5a53dff4251e91fc9bcfd7a8619c1/
      sh4a |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/81b604c4abde940d355c1c72fd1e328c4398144f/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/500bd9a77f3803ba84ef7820fa3aee1e2f484a9b/
    x86_64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/278e600e198b879fe2960bcc2c6bda398eb4748f/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/bc70efd4b29b44adcc6c05fa4d4cfce35549897c/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/7acbb6b70d7b8fe1db6379c7b48c536ba037695c/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/b19eb6f08b4841a3a74c53a6139478f4b7a6922d/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/34db6b6072c7c94c32ffab1e8a0c8b2f6ed56ad3/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5b6deca8440934b6e233278b546e29b1212301f0/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7d35cfeff899dd171867c303bd5fe4240afa64b5/


-- 
http://autobuild.buildroot.net
