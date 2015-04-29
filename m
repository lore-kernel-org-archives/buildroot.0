From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-28
Message-ID: <20150429063016.36D4E1011A9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-28
===============================

        success : 144
       failures : 48 
       timeouts : 2  
          TOTAL : 194

Classification of failures by reason
====================================

  toolchain-external-undefined | 8 
libubox-5a0bbefc8fa44044625... | 5 
                  dhcpcd-6.8.1 | 4 
                      qt-4.8.6 | 3 
               libecore-1.7.10 | 2 
                  boost-1.57.0 | 2 
            python-pyqt-4.11.3 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                libtirpc-0.2.4 | 2 
                host-gdb-7.8.2 | 2 
              postgresql-9.4.1 | 1 
                  snmppp-3.3.4 | 1 
                ipmiutil-2.9.5 | 1 
                  iodine-0.7.0 | 1 
                    wine-1.6.2 | 1 
       gst-plugins-bad-0.10.23 | 1 
            xlib_libXaw-1.0.12 | 1 
              libarchive-3.1.2 | 1 
              cryptsetup-1.6.6 | 1 
                tinyxml2-2.2.0 | 1 
                host-ola-0.9.4 | 1 
                numactl-2.0.10 | 1 
                     php-5.6.8 | 1 
                 python3-3.4.3 | 1 
         lua-periphery-1.0.4-1 | 1 
                   bdwgc-7.4.2 | 1 
           libfreeimage-3.17.0 | 1 
                 rsyslog-8.9.0 | 1 

Detail of failures
===================

         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/0a365d24278883b248a1f7f42102f6392f34edff/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/0ce29909932cd1c4684f9ecee975df72c038303e/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a2f2919b68f373c7c5a29ea7aca690fed02be447/
         arm |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/4233a8619ec1a69ef60be0f05e46b5d96cef7d61/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/4a17ddaef7154bf81dbbcf08f593264a7f0d0dc8/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b7a39254dd8f2772f9b66dfebafcb0c8b1ee09b2/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/71e2c5d74084aaa17220abe6ae5628bdb2be1424/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/3221b9bbb13195254a99c2364ae119fa37f4994d/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/70af4705c5bf51c7869437e9f68d6ead3dd3082c/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/64edf3f3a44083d5ebac1ab0e090f2f9cba24a5a/
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/102e1d3de48b2925c64816bda962a6095bc31a4f/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/479b2449e390e986bed3c60451f5c85f0f509a48/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/caacda8a97e3a60df686cea8d1d444306851c11c/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/734d11e164136b038fe5dcb3fc0cfc93f999acc3/
         arm |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/899f8844291d384cde96475e7a9ee98b69f8c803/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/deca2662e738b1a54f82349eb2d57080ba52b203/
         arm |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/332cc2909c84dadf3491ae7db646c36d20dcd8b1/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/603a443ab72b53f7fd030d2d61e8df80760b9943/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/cc61871950a6098b447a76870cc8b3d8e42598c5/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/60d4110140c575076f937d3dc9f175cdabf43b5a/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/33eb091f02ac674bfb661656f92494f54391ad2b/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f47efb3fec89d101643006cee5aa8ea502fcf5ed/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/1ca29f3adc1b9b2a841df7d118548654b3235432/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/231e5966948dcef579190c48d2aaf24414159483/
         arc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/b55aecc18a9870c342e0be4ed58cd609527bff96/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/94dd7f38ae105e7cd2f342d718e27a65edcf3a3d/
         arc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/9473b109cf942296b0643e074839209134f6e3fc/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/43d790f3067e57d772dd0917e7fc4e7f63bff2a6/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/63b9ffe17d351afc3273b128c8c4efce074e436b/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/df4e2ea098b0126867455af1891837c6d7d99a92/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/bd78a59a725450df531f14750e55a637f6c3d7cb/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/e4773695278cd8656d36c364c91f5789bc5e4c3d/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/5071b21a9b959f64305c85c9bfc42aa5f047c981/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/c65c2b2c4c2ca328c4f26ba38798c40ab02c8772/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/9ff70f328e1e188347cb3b2856fb6f815bfb58f8/
        mips |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/9af524e39cb4f9d01350db8a90715ee5f7972284/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/bd2effa4f19b44f650bd98079e07a82b3d7589da/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/5c74c32098fbbd31d28a01130530fc41c3d5def6/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f040720a57557c4de5714812e031ab6579b07da0/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/5a4445027072cecd5707d277c94c810f7ba7bdcc/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d18c188f83f0c38d945be636e11dfe37076e5e01/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5a8c2a69fe9471e80fffd52498c3c3e6051091dc/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1f8a274627f83a53a5edbc01b6dd5b777358311a/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d39027ba6012eef77e3097b8431a596ead816f2a/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8e9c0bc215813e6ad776f0db43f1c2d2b90bdda9/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d2563d87e473f4b04b8f4b8b343c1adcad95b89a/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c76345cf41a9840fa7053c9a84d5da47634a9380/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/dcad76f6f517bca122ab7fe873e1e4a041e9d19a/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/e94bfe9fb5a4baf0e131f80d79c76a8d657f165f/
     powerpc |             xlib_libXaw-1.0.12 | TIM | http://autobuild.buildroot.net/results/bcea7dff889ca9b9613f678a7f7cbaac8b284c57/


-- 
http://autobuild.buildroot.net
