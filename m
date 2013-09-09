From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-08
Message-ID: <20130909063004.A9F9A52C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-08
===============================

        success : 39 
       failures : 54 
       timeouts : 0  
          TOTAL : 93 

Classification of failures by reason
====================================

             util-linux-2.23.2 | 19
              e2fsprogs-1.42.8 | 9 
               alsa-lib-1.0.26 | 3 
                 binutils-2.21 | 2 
               uclibc-0.9.33.2 | 2 
                 dropwatch-1.4 | 2 
               binutils-2.21.1 | 1 
                  cpuload-v0.3 | 1 
make: *** [/home/test/test/... | 1 
                  connman-1.12 | 1 
                  zeromq-3.2.3 | 1 
                  libeio-1.7.7 | 1 
          enlightenment-0.17.3 | 1 
                   attr-2.4.47 | 1 
                 libnspr-4.9.6 | 1 
               wireshark-1.8.8 | 1 
               nfs-utils-1.2.6 | 1 
               libglib2-2.36.3 | 1 
                busybox-1.21.1 | 1 
        liblog4c-localtime-1.0 | 1 
                     gd-2.0.35 | 1 
                  poco-1.4.6p1 | 1 
tslib-158ee49b32f83cb7b02d5... | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/182076064ac25e5f2c2064b8ba4e81f90dfcfcb5/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5c281beb1623fbdd4e7e79c90dd21f8af84a2189/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1ca867d4f090b80cbf952a876c6ca0fc05fc0364/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d760f90a2b48c300d034a6e9cb49e88df0233d94/
microblaze |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/6c6a7957978f98be24b6daf1c322da739fad3976/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d54576f5a628cfadfea4b1af18d41774d02bced5/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6e0bdf431d4d262464f68e8ac3bf0e7c7688cedd/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/05e2f9c6822a2bc5953dcfad92a15e730f0846e9/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/447ca29965c01496731eb28d0d4e3e9584ac902d/
   powerpc |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/49a46dc10e05535e114c8c2881ab200bf731169f/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a39c7f85a54204109ee8799a63ef1f0a706655a5/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/63dd128872d3387e8dfe26c179cfee02a4e4470c/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/bcb74ec97c9bcb8b937796f4a5514e1f0b9ab0c3/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/67c770906486c79678a60bf88f842ea60ba97bb5/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/9fe5a9091934c803dd9f2015bbe04bd4ff56b20b/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/69db745701a07e25874dfa26e28602cf9347d23e/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/21d2d754af31c34512e86679207496ec35e07175/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/033bad882e1866921f2d16ae3c972e4bf25cac9b/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/c67ff3dee23e15c9d010ea09cb966046147e2b7b/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/c17994d6c2ca906652d01d766ff7310e90afe7a2/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/997778bb2aebb9051535ba5fce58b44681d735b3/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/5dc361931f83a0763268c4b9a76eb582b38fd385/
      bfin |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/64250719a9d6297545e42c7638a7b0538caee1fa/
       arm |                   libeio-1.7.7 | NOK | http://autobuild.buildroot.net/results/54e3d4761b1072b0f48b0b91a32799d7cf525942/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/10c8c68fecfe40dbb2cab8f7488b51c5bf7b21ff/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/b3c0b76c8a28bd3b2adec416d60796da82487f71/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/629d20392b1af5866c20014de11f21ce93ae68ac/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b95393eddbf84588a8a7f154e14dc0b306ba1b5d/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/7f40c11e5fa468515af5eda4e059a2052d7ecbe0/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/c08a88832e553609f6d206fc51015ed664112758/
      bfin | tslib-158ee49b32f83cb7b02d5... | NOK | http://autobuild.buildroot.net/results/dd1b58a158e0e01e8b9d20516f57284b98262fdd/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/7e86822e6e71e60683b87939da6584fa8ad2785c/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/1d692192e4c00da4fdcab9970a9e6686b22c4f91/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3354d771a70ef20eb6ddd7f363140f64f9536944/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ef0fb34001c89e4345b14f73cf4745639f131176/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/11b33a273d558388ce1c5cba56d988be6ce65333/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/dd8246cefb04eeedd012f82082545b3117a212d1/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/280c247e6ec1298ca91c17bd9650ccb23876bc8c/
       sh4 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bb269ebb5834558cd0b4a5076fac904f443e04a9/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9de698880d9a523cdaf37c4361850dc49d8c4a60/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/fc7c44ae7b1360cf2eca5c2a9bd24fdcc9a8d606/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7e7c230425dd3ec84a08c44f548493d5ba9e28c5/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/51d704876010d8d45eb886c799177b58cbcc9fec/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2db8ee390da55b4296f11e7ffd7da66ad24f8140/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/60a88881fbe3fe00e28ca6966c11534bfe54e2cb/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8b1cc7f770cc6b0313f798ed73124c2dde520f03/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8b1979b2757566f97e84c525b6fea20e49f07e3b/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2d07f27d9f358b462a90a468e7601e985db7c49b/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4723d02b660a31b4b6c6ced4e39357377c20ac70/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/50fcdee44d37d13e8bb02dc1bae4957c97816013/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b4a1010421a7f94fe1c25af8f5b5af8759e0eb88/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a288f7d9d2a210cb6948a721ab3f7b8ddadbd5fb/
    xtensa |                wireshark-1.8.8 | NOK | http://autobuild.buildroot.net/results/1af0f3fca0cfe5d258dab40cb3ee2520820a49eb/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/93ef23feea3611b56f736e651f1e333d7b912cb9/


-- 
http://autobuild.buildroot.net
