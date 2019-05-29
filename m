From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-28
Message-ID: <20190529060050.85A7487E23@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   1 |   1 |  20 |
      master | 173 |  29 |   0 | 202 |
        next |  43 |   9 |   0 |  52 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                      ell-0.20 | 2 
             iputils-s20190515 | 2 
                    dhcp-4.4.1 | 1 
              domoticz-4.10717 | 1 
                iproute2-5.1.0 | 1 
                      iwd-0.13 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

     sparc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/929f46594908594458ac0c4515e28f6b5f07861b | ORPH
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/e2fd39c30cdf62d24d92e6027414756106d49ff6 |     
      xtensa |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/a018c100a8c01a55cb3e6a91d996249e09e0fb97 |     
    mips64el |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/aebaf506db59c059286ef0a3fcd8694acb125ac7 |     
         arm |                 iproute2-5.1.0 | NOK | http://autobuild.buildroot.net/results/41bd8e53b51a96f1b29d7ba0d8661a6dfc958415 |     
    mips64el |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/d416bd871fcc8eaaf7550cc685e693d0eda4ab89 |     
      mipsel |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a34d29f37ab7f3687fa7660a9715b0f1aeaa3577 |     
      x86_64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/fbfda8693642b143e1a9930219a6c90c99dacc92 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/6edd62b2463b483b2b1162ea9637b73af4357574 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                suricata-4.1.3 | 18
                   netsurf-3.8 | 4 
               wireshark-3.0.1 | 2 
                    dhcp-4.4.1 | 1 
                      gzip-1.9 | 1 
           host-mfgtools-v0.02 | 1 
             qt5wayland-5.12.2 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

     nds32le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/942dfef8b68a194bda8d0aaa6b9a251f8aed8e2a | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/1c7e5923a6532eb9ae11474f7167800ca0140205 | ORPH
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/18933625d40e922f3f3e8ffacb6329e0a95deefe |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8d7f4671e14b3add3ccb1c09f4089baf30b5952b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/632e7f87ec0d0e8073c2a367096f53949e77314c |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c6ff3bc65c8b467ef8d3ff770bed83dfda0cd9a3 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/28144ff8689f42b9d395c9e227e1c9c9606e7b11 |     
     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/9b47d54f27a0ae9201d9679a984a28d106e82354 |     
     aarch64 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/6dd51f5dc314f53dd0d3e57a527807ce5d035e97 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/d912cca4756b87306019543d5ad79f39e4d395f3 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a858ffac708b202d3397f0fd7dac35b1db3fd75a |     
         sh4 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/93304a3b24140b4a4229373de82caeee8b88afdb |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/bd931ab7c0fa6228bb721b1ec8c0ae2b194e9267 |     
    mips64el |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/38e0ead567473f52155001c726be5e1404b48c62 |     
 powerpc64le |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/9d352bd92377d60b033d46ab65866d648b1ebce0 |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/ada8a07cc235b7be093a9cc6d8d55429ce34f35a |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/2856e2f5ac155b6152db8e49525f02c7b831c132 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/fd640d9da0004c17bf62a24ed7c64e7595cb326e |     
        or1k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a26d3493399c43faa37d2d67d772e0833971a9de |     
     riscv64 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a1dffac56868cc83bd8dccd6b4fbec5f58d3de0b |     
      mipsel |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/27024b150bbca301e493ba091b144c63f9c5dbb1 |     
       nios2 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/e840b85b64552eaff879ad18914d1f9a0e3ee5ec |     
 powerpc64le |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/9a34a28a133a3cff0ef4064849d58744de7ccee8 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/4af2d92e02a12d8fb483f897f8cce8f25a117cc2 |     
        mips |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/e644efd2dfce9c053e711134ce17cc29229882b6 |     
    mips64el |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/f19fecb2d77f4cc67ee848beca3ad5c9851f33ac |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/90aa9be3c3347a0bfb784fc9d27e2fdfebf1694b |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/7299a7661b492f58079b8f14191c7a91f8a2f932 | ORPH
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/6346aed6154fac4e9c3a5f85f9ee0b6725f6f8ec | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                          opus | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/b272fa613ada645c0b48bb03f655cb32cd4e3faa |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/3ee96fbc7ef0dc6597e257f066e578585fbf9576 |     


-- 
http://autobuild.buildroot.net
