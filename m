From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 09:56:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-18
Message-ID: <20131119085606.5D65F100B2F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-18
===============================

        success : 85 
       failures : 35 
       timeouts : 2  
          TOTAL : 122

Classification of failures by reason
====================================

  toolchain-external-undefined | 4 
                 qt5base-5.1.1 | 4 
               alsa-lib-1.0.26 | 3 
                  iozone-3_414 | 2 
               libsigsegv-2.10 | 1 
               libcap-ng-0.7.3 | 1 
                     gmp-5.1.3 | 1 
               libglib2-2.36.3 | 1 
                  nettle-2.7.1 | 1 
libtool: compile:  /home/te... | 1 
                     apr-1.4.8 | 1 
              e2fsprogs-1.42.8 | 1 
                     nut-2.6.5 | 1 
         matchbox-keyboard-0.1 | 1 
                beecrypt-4.2.1 | 1 
              matchbox-lib-1.9 | 1 
      libnetfilter_queue-1.0.2 | 1 
checking if /usr/bin/gcc -s... | 1 
          host-libglib2-2.36.3 | 1 
                     lxc-0.9.0 | 1 
                busybox-1.21.1 | 1 
                     pv-1.4.12 | 1 
               qt5webkit-5.1.1 | 1 
              libmhash-0.9.9.9 | 1 
          host-protobuf-c-0.15 | 1 
                    zlib-1.2.8 | 1 
               uclibc-0.9.33.2 | 1 
                 libnspr-4.9.6 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d8cb11c2518954f180eb9dd2f7a307f9c94f5744/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7a05b020141fae7f5bed9d2b5e0748796a53d23e/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5949fb65363440be3a99d72ca4b8fcfaba16f0fa/
      mips |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/2a48fe7fa4c26203c2d67231ffe3673ec085a9d3/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9f1831d221ac952187171808a53eeaf440f4b1f8/
      mips |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/6e090ee690ded5f1d51645b9bbfb34f73671d267/
    x86_64 | checking if /usr/bin/gcc -s... | TIM | http://autobuild.buildroot.net/results/a3e9597e0188cb2f4ae9eb53b7fa0e19bfffca70/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/1ec88590006959a1ee71eed25a5f20e5458dccc5/
      mips |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/26c15abdb3e94ebc2e3d22014dd770e8b0acb8c8/
      i686 |           host-libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a323e822abadbe9ea2c3893b5f8060845adb3601/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cae448c38f65139b1aaac07809efd0893954398b/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/a23fcc6155a96842695cc689360aeccc1686dada/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/3cfa25edfc1998d1a9819eda8b1e1d973b7c2021/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/f55989e7127fd4f46bdc1ac044a52e860f8de159/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a851744896e35db473b70795ee13fe7a78f5d932/
microblaze |               libmhash-0.9.9.9 | NOK | http://autobuild.buildroot.net/results/ef87335dae9975116e1d2fbec1e5866a2ddabe5c/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/bdb3b2b347dd7492383ad84f6dabc1520234526d/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/5f4d9840999edb50a8fd7c5e2b0f52ed869313b5/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/7bfcd6a8ab944ba70a815914d12841345bc103f5/
      i686 | libtool: compile:  /home/te... | TIM | http://autobuild.buildroot.net/results/f6dad7074329de31d8408d800bc3ab7837d4eb26/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/ab912140006fd9b7b75c6bbda71d05fc62a3d470/
      i686 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/a4cb20a8ec9b22deeefc5fa6f85dcaead14a5551/
      i686 |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/f03e00b5fbecc00280ecbea8166946ac23c284f1/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c9f43717534c5c95858c074021ef7158295257d5/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/955a9b20bdea09bec711a7e22c374ea66f424030/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/c4f5ed916d85740ec00f5f34ded5de0195e5cd45/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/2090d36fffb71f353dc0f8d9399ca7322aeb3826/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/68d508f662a5f7a0d2bf57cbfd5d56ece0aab206/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/05ff0f5ea99df806589c9d2c0aa5d991ae299f5c/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/fa0f0579db57b58b4222cd1f9d565ac2917ed90a/
       arm |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/5fc9307dca980b4a259e22ec6b3ed2ff484f883c/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/bf18b4069d63e12f11973ff85bc041243230b56e/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0930838a12298b4374388a552e54e78bacf8a49d/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6d55dc2749da8a4d0fca4155082f554344ef71b6/
microblaze |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/76e0e160b91d6dcb17c4d29acf0be855fc2d7cd3/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/07a414f776f4b499e822c827896d0f97c03eff98/
      mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/a173f13357b789c4c80fb957603004ad1a7f277f/


-- 
http://autobuild.buildroot.net
