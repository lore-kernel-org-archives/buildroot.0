From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-22
Message-ID: <20150823063014.1B755101741@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-22
===============================

        success : 241
       failures : 30 
       timeouts : 0  
          TOTAL : 271

Classification of failures by reason
====================================

                mongrel2-1.9.2 | 3 
               linux-pam-1.1.8 | 2 
                   bdwgc-7.4.2 | 2 
                   mpd-0.19.10 | 1 
             bluez_utils-4.101 | 1 
janus-gateway-c632c1e9da5ff... | 1 
                busybox-1.23.2 | 1 
               iptables-1.4.21 | 1 
                gptfdisk-1.0.0 | 1 
         conntrack-tools-1.4.2 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
canfestival-7740ac6fdedc23e... | 1 
                  tstools-1_11 | 1 
                 ipkg-0.99.163 | 1 
                    qemu-2.3.0 | 1 
                  mono-4.0.2.5 | 1 
              drbd-utils-8.9.1 | 1 
                  opencv-3.0.0 | 1 
           qt5multimedia-5.5.0 | 1 
           libfreeimage-3.17.0 | 1 
               linknx-0.0.1.32 | 1 
                 gnupg2-2.0.28 | 1 
ltrace-c22d359433b333937ee3... | 1 
                 qt5base-5.5.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                libnspr-4.10.8 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/86cf12b8359e28576091d0c4fb005ca7e4530976/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/91242e20b7ce3a8426d77e86756b400b70207ab7/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/75d4834d3ba2ee77711bbda16533a0b2924cea20/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/721e168a123e5c8e704b72aef22944320b845a83/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8ebb38f4b1ab4d1eadf7139e3467ed59ccb10646/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/00654d45f763506ec56d728f3d1c9eab8006490e/
         arm |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/385e07e9097d877cd1babdd4133fbe14a8f217d9/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/1003f32cd2627ec4e9542b51b1c39a4ea408cd23/
         arm |                  gnupg2-2.0.28 | NOK | http://autobuild.buildroot.net/results/5e582095b9f92d2c5eb760b675e3c51a29af0434/
        bfin |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/f061d39ef1d057f5185d4fca68c0890f4aaa044b/
      x86_64 |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/5b2e88b73834e0ec1a3aeb6f2a17fbc0d62c38d5/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/dbb811172b119ed301b5ffad754e88338f0d0972/
         arm | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/c0243afc26202cbea98a1a75ddb9e37d8e2e08de/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cffc96f6b95778e91a18db7954ce0c2cfb634420/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/32895dbf31f28c82495018a85957a3ed11f70444/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/be4dca7ae77c180715c5cfb3b4ae0d3a974b2e9d/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/566d2de7e943ceedc6142cc2c8bee1603da4c751/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/9912a45933065d05292720b6283510b025324875/
        mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/85940f87809f3d61186dc532399d7b0565d1f39f/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/d38e305ddfe4a70db651d2bcb2aed97ec83ba661/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/814e44ecbec63d4d9f0693e0f4070d8a2d1b522d/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/47b0b0f8ba5d6936e2881f4dcc00e5b07f337758/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a2eb9fbbcb0b0c364e3dda88ab2bca0ec2d5f7ed/
       sparc |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/342ce2eda95c866b3159ffee1bc1d8a362f2291e/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/c822aee6b28672af0e0c9c75d21a48d3efec88e8/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/f3397cd7d9627e5d77c8e79f64a456d8e1e854a7/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d65d45938b4fd4f5de1742a4aff0a35f902e3b3c/
    mips64el |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/ac1d4b8d3a0c60dba28f6e6ee32bd9a46dfd7469/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/c017bdf906f7c119528bdcf60bb1031c5abc7fec/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/f968d02c730b716feef2da4ce16c663f140f9cc1/


-- 
http://autobuild.buildroot.net
