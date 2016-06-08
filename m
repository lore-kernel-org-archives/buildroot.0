From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Jun 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-07
Message-ID: <20160608063023.EDF591026B6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-07
===============================

        success : 175
       failures : 49 
       timeouts : 0  
          TOTAL : 224

Classification of failures by reason
====================================

                flannel-v0.5.5 | 8 
               target-finalize | 5 
                    owfs-3.1p1 | 3 
wiringpi-78b5c323b74de782df... | 2 
                    libiio-0.6 | 2 
                     tftpd-5.2 | 2 
                wayland-1.11.0 | 2 
               libcap-ng-0.7.7 | 2 
tvheadend-8e637f9f903f6d820... | 2 
                    cups-2.1.2 | 2 
  toolchain-external-undefined | 1 
               libsigsegv-2.10 | 1 
                pinentry-0.9.4 | 1 
             bluez_utils-4.101 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                nodejs-0.10.45 | 1 
             netbsd-queue-1.70 | 1 
           linux-zigbee-v0.3.1 | 1 
                 weston-1.11.0 | 1 
               opencv-2.4.12.3 | 1 
        ltp-testsuite-20160126 | 1 
             ntfs-3g-2016.2.22 | 1 
                 omniorb-4.2.1 | 1 
                 jack2-v1.9.10 | 1 
                  squid-3.5.19 | 1 
       gadgetfs-test-undefined | 1 
                   ushare-1.1a | 1 
                 mesa3d-11.2.2 | 1 
                     php-7.0.7 | 1 

Detail of failures
===================

         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7d593c268be7e6be902bd3fe8ebf95c838a974b2/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/dac8a58726564301a0f78ef806c2b8f5080b7fc1/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bb3eb01fec08990b777cc808c647e2cc5eed334f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5fb37e5c35c4042ee8ae978a18aa412c01d6613c/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3d8889ead589bfa1af13348bf6c3bf56f37b9f76/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/88e780897e71031b43b7d67260a3dd42eda6adbe/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2931d3d5e7fc4456d9b2323fd70dd53a13ed5f42/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f465d3fe929c7986f9ce1d2119ef08484d187796/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/87b02c9786b1807e97646ed88ca9ad28b556686d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ad3edea90ee2a52118bbe2676780c0347818f14e/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e9e05f133dbbb7d076f1fc5e17293a6d48afcd20/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/9f8074981a256ec4ee452d1bc83028f3cb757f2b/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/9bbfaecaa7eb0b06f9631a901340a9df3de3d123/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f3ad0a2d62842a646069996cd4258024dfa504d7/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ffa5e0e3c3e7b0739abd198f541ba8cc93236b9c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/db8816fcaa37273199d3f54e2f18b5ae3b1bb39f/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/55bf849e1c4f8f17356f53f962ea8ec1b63d71c1/
      xtensa |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/8037a543f46ff181c0adf8a94d63fbd6d9f8cebc/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/fa71d0edd48c175a87b18af75fc208052cdcab00/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6a33765e4fe0720f8d3d8dd46560dbae11104345/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/c16c030cbac9d5e2bb09bfe36c907d72f9eb0b60/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/d69d457856a497e3f5c064d5f7886674b14f1114/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/ba5d03b6364ef52da518d9bfdd35be90b2c61d6f/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/c8e6e29cd7d5ab8f758cb68d582fc8f52cfb4fad/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/1e4e65b130bdde5ee153e44c1a3e4fb7673de372/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/d8e2a8480a4046eba8c169a9b2e0de75a408f19f/
microblazeel |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/e0bebe913d788599f50d183cb847d384b9105633/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/93b768a26658366f30ae87d47ab45fc3c7d9d884/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/7551b2870b652deb7912416e92116e96351193ac/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/0d941caa9317452d292b38b700906b4338a963a0/
         arm |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/2a07ed0157e12c220eb3d7c4da7332b28b77fc49/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/97a6c8292d615d5bd427eab6edb3e34320fb7d05/
         arm |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/87d70d82cfcab2dfba3f7596f341109ebb804d60/
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/37d8eb3d89f334e0fe4e5df05e46e1bee5f3f910/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/7009445dd116a1c02db82a351d38db44db8dad16/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/1e24fe99e3a63c6a84e29c3732f5d13c288551a1/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/cc6a9c9b949c955da865c5e7f2a824bfe496469a/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f92284957805142d047d8bcda6da8c4c3def0372/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/5366eab905d3db19613ac1473a12911ed60deb72/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/35f52be4f9928132ccd831d8b55f03056f5a9e00/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9d625811f00fb72d35f7909cfa6e58b3c85516f9/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/05e7744a848976d48b3963b57b9141b2402370c1/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/89ba98c922970e10917ecf4f062e1631c3d1d820/
      x86_64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/5abd47bdfc5ed97442d2ca520f99a2679aa5f4c8/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/83ec18789fec94dfd3c6a54e9c3a6b4ee633b308/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/766dc2e255590eb5731f620ce87ff97ac5df0f7a/
      mipsel |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/cf6fbafa49f9ca2fdf9248f7f8140f8567928431/
      x86_64 | wiringpi-78b5c323b74de782df... | NOK | http://autobuild.buildroot.net/results/e9d680af7eea6d6c68c8e48248b5cc5b29389baa/
         arm | wiringpi-78b5c323b74de782df... | NOK | http://autobuild.buildroot.net/results/c705175674e03326333e21b24a826dcf30153698/


-- 
http://autobuild.buildroot.net
