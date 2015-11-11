From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-10
Message-ID: <20151111073018.E0DFD101BF6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-10
===============================

        success : 110
       failures : 65 
       timeouts : 0  
          TOTAL : 175

Classification of failures by reason
====================================

                  gauche-0.9.4 | 11
  toolchain-external-undefined | 6 
                   mplayer-1.2 | 6 
libbroadvoice-f65b0f50c8c76... | 3 
                  mono-4.0.2.5 | 3 
liquid-dsp-df5a459fa05dba41... | 2 
                  qemu-2.4.0.1 | 2 
              strongswan-5.3.3 | 2 
        python-protobuf-v2.6.1 | 2 
                    ruby-2.2.3 | 2 
                   glog-v0.3.4 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                directfb-1.7.7 | 2 
             util-linux-2.27.1 | 2 
           libfreeimage-3.17.0 | 1 
                   systemd-227 | 1 
                minidlna-1.1.5 | 1 
                  ffmpeg-2.8.1 | 1 
               libcap-ng-0.7.4 | 1 
                coreutils-8.24 | 1 
                openntpd-5.7p4 | 1 
                busybox-1.24.1 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                   czmq-v3.0.2 | 1 
               libecore-1.7.10 | 1 
                 glibmm-2.36.1 | 1 
             host-nodejs-4.1.2 | 1 
                pinentry-0.9.4 | 1 
                 dropwatch-1.4 | 1 
                  ltris-1.0.19 | 1 
                   bdwgc-7.4.2 | 1 
                elfutils-0.161 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/0f9d63da0b8c148e3e3da07680ea767c177eed0f/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/82baa8e5359096e46e1def3be54c4159990a0693/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/12eda93c6834d9e8fae596246cbdad690d839f86/
     powerpc |                    czmq-v3.0.2 | NOK | http://autobuild.buildroot.net/results/568ac92d2f6d0604b9bf354ea9dca0a7cb5341f6/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/cc0d2e83c8d425a1585d9627639774924000a062/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e8c8e81a1096d69732df49e8628e40d8b9d67e99/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0d58d1be627f07ef5b05465570c0907afd5eef81/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/823bb730d8ce1234ec92e0ebdc7b126755a39be0/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/f5b1e2af26e1a054ad1fedb0b41f2ba2a1d9a7ae/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/7770322e51e1d1f4fb9c752a0fa346cbef971fdc/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/c6b6461b9b82e3d06f8e6c46ea94528f3a846ff1/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/5105b84a3e35e75d63a23364af838256d17be07d/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/99462ce901fb7491489ccc51220442df82bfd96d/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4dce1433a391419a4707501cd9294fc78bb01c2e/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/b0271e753be52048b85068cd54c2fdb9b2783cbf/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/1a057c2493920da01243da19d2f31ca681ac60c8/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/2dd5c652b571a2afc292f037b748a505d36a1c3d/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/84205967c91620339e9339d7305ca3d4bc74a5d0/
         sh4 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/de737c0ed43becfdb97ffbac4d188e01994cf8f0/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/edd9c31a180dc625de625ae40116a5b27fde40c1/
     powerpc |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/8ee79c98f3ada6e4d855b686a4906fc9b9a66a92/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/70e55712cf8453792858503896015584cef43dbf/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/795a17f00115a6cc05894ee5f6d151b1f13698a3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/28cfa184d1951f408418e3042186fdfdf323b332/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/3f407b7fa2164d9d6dc7b54c06eda45d1598a8c8/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3f0a40fcc0a3729e79a51bc4f465ebdc8f4b5fc3/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/fef1d966a0644ce41d0b2a779db6199c155ac46e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f5efb4e60100b03bd132a40cd96974cb7e91f257/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ebc0502a520936ab67788145e180993d74bd4cd0/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8cbf1c6a1a163f98f14fa951e13dca3a709173d5/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/42506cde1a23072be8cb0c25106de8227d171d6b/
    mips64el |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/329f48c5b37573c38beaf26c287ecb493a7efc89/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1d592cc3f78ac2161745b0bc613a10578d8e7368/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/51c3d4e9cdcd9c36132e6d6e4a27f08753425877/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/e1b6cf76a7a4ae754a928d211e779e9381198f48/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/d5e832c3aa7ee7af128e2ba1835fe7d5d69d7ce8/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/d75f63f7ef9b5ee417a6270a38f9f1e4c265202b/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/95d2674f4a8ff03f439bd67fe14110974bed4b0c/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/38e88efbf86883dfe291a55e4cc1de4ca277653f/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/442c5a956ec665e613c9096908af6246c7c7f2db/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6b5d6d8442b81fe045a6d4b68959a0beb2414a9f/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/583a25a6ed9e6b457aaacfdb30ad3ab417dbb810/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a1a621acddf2a57b3486dda3fa4fd42d0150ec3b/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9e91de757c490c115711c40c497fc3ef959fe6ec/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a9e922d0f742a243b1b8d3f8906b1bbd73b966a0/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c9c8a9f706e47e02ff1ef06cc0a11abb40581a3e/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/bfea4840345da46f6dff9483fe2960bd00766fc7/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/dcdba37720917627ffb0b6e3ab31a8c49ad8de04/
     sparc64 |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/d57f4c690483034c5dedf35da2e3f8413823564e/
         arm |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/bc0e128d0ad3b1d59a61320c8c4c356fb29b72ae/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/8a0a9e49726efc16df1d67fa0ab6d2c976f988d2/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/24d0d47e8457bfef41d46374fb9f1b01d9a3da52/
        i686 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/5d35d08ddf63c20fe892859a6f34fd9bb45530fe/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/83fa83b443241bbba7eff745e9a282612f2bbe5c/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/a6bbb61c8bc4035a8cdeba928182a72398c476cf/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/ba6f9e7c9d1a7c1f0c6470298c92875e6241adf1/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/380943cba305b56ba5e3d12d3620d54d87e8fc5b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/afda959b6a463ea7abc062fb714968009c7b6985/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b47c269c30acca4dc33e6dfb0159c3cfe365ef76/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/bd28541fb4675289e0876e940a590ba81cb76e0a/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9b516219428d64c3c9a67a7f7a5e58543e0d0c3d/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d26e67a1ebe90f187c58ee9503a53cc5ff15c067/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7016e0413ddff5c60413154b4ac7511d2ade6feb/
      xtensa |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/eccf786444744c798bfeca4b4c3114e6599468ee/
      mipsel |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/112e8b85783f5aaba42a937a6eb064317615a21b/


-- 
http://autobuild.buildroot.net
