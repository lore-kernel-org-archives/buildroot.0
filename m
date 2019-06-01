From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 01 Jun 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-31
Message-ID: <20190601060050.8290B86BA3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   3 |   0 |  24 |
      master | 195 |  20 |   0 | 215 |
        next |  51 |  17 |   0 |  68 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             iputils-s20190515 | 5 
                      ell-0.20 | 4 
                    dhcp-4.4.1 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                   bullet-2.88 | 1 
                cracklib-2.9.7 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/6abe5b9af39cd34e522a41a066a5c4f2e2f7e8a6 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/f4ce4b27f22ca951810c96e8b72012c243575b5d |     
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0ad9be33ad6293e4f74d727cb3aaf1db8d839932 | ORPH
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f48569f0b7536dc115a437738e91f543e7585d90 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/de72b166910d353279cf48101655f1ea3e240605 | ORPH
      xtensa |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/08b8d20b43b18b749081b5d260740277668ef16a |     
      xtensa |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/8b7fbbfaebb231406ba55cd32179318a04aa581e |     
         sh4 |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/2d98e04e045f054a0df6f7ec8a15358fa952e0ea |     
        i686 |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/a84b0a7d2aeab464904720e231e4d976ea82b0e0 |     
        i586 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/29a4d1803f9ee4f583977ef2685361d686eef531 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/6c2719e13aaa0b5ec92ebada93c162178108fe01 |     
      xtensa |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e1f089f52b43f66c6eba8308a5903052c3959a00 |     
    mips64el |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/ef6391f83831b42e99986ec216ec24b838f3376c |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/32bb6af96967ebb0a7cc42fd2d260cd4028a65a5 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/28e6f24dc8a2a9cfd849ebfc6ecf79af12e86a17 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/fdb4a751314bfe2efa8089b769074732255f5fc5 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/af54d48c5fda884ac722d555835b82f18678121b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libopenssl-1.1.1c | 6 
                   netsurf-3.8 | 3 
                  libssh-0.8.7 | 2 
                   clang-8.0.0 | 1 
                  grpc-v1.18.0 | 1 
      intel-mediadriver-18.4.0 | 1 
                   mimic-1.1.0 | 1 
                 opencv3-3.4.3 | 1 
             openjdk-jdk-12+33 | 1 
                oprofile-1.2.0 | 1 
               pulseview-0.4.1 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

     aarch64 |                    clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/e3d3482be1eaaf33ba89b7725e9f61b3fffb2899 |     
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/c4bc3e524b1228c269b4c087d39a1f9d091cd988 |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/6dd572694ef92aab768adb94993c85d341e68d9f |     
         arm |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/5863062f3a5b92f0698da83bbd6be66363eef3e3 |     
        m68k |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/af5d039ebf437a2d884a19fc623ede7f1a70e747 |     
        m68k |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/3c479374a1025b2a9ac5754df4f0b4e2d81da36d |     
         arm |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/96d6b89d20980e8f7fa450b832474a81d492b315 |     
         arm |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/9bacaf576cd29195e664557543ab5cca110a2b76 |     
         arm |              libopenssl-1.1.1c | NOK | http://autobuild.buildroot.net/results/e2ded1e004079e11fe9e9d4c71295e11f3af54da |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/c69a89b92b1468019752e8670430f12796fc872a |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/91dc54d7f8f52becce3de06c35f8080ab18466c4 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc376b1b9a4d261fa5e86fb6012e572710607900 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/eafc3e4be571d5ecee549a11530ac4e508f31782 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/67ef520d82ea529a9fe593d83a3aeae5f8b0ee5d |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9078bd68262bf565f88423acff777fcaec1d9adc |     
microblazeel |                  opencv3-3.4.3 | NOK | http://autobuild.buildroot.net/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/85c3e5c5e29a2d00c6490a8cd0dc9bb8b22b0dfd |     
         arc |                 oprofile-1.2.0 | NOK | http://autobuild.buildroot.net/results/91e90fd983b90b85968c121a57c9921642b3f089 |     
         arm |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/06a944bc31b4bd29d5673193bcef1e6ce36698c2 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/675dfa7c9796b23d5affce3da3547e1e1e8a3efe |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-cryptopp-8.0.0 | 1 
                   netsurf-3.8 | 1 
                 openmpi-4.0.0 | 1 


Detail of failures
------------------

         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/4154c6ea697cde39da1b1f3a4b634ea82aea7970 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c2f5665d72ab66450342bcc4247d4159be10a919 |     
microblazeel |                  openmpi-4.0.0 | NOK | http://autobuild.buildroot.net/results/0a8fcb996456a53aaf4d624c7cb9033373113bb4 | ORPH


-- 
http://autobuild.buildroot.net
