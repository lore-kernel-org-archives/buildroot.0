From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Aug 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-06
Message-ID: <20150807063016.A3C35101631@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-06
===============================

        success : 210
       failures : 48 
       timeouts : 2  
          TOTAL : 260

Classification of failures by reason
====================================

             libselinux-2.1.13 | 6 
                busybox-1.23.2 | 4 
canfestival-7740ac6fdedc23e... | 2 
           libcec-libcec-3.0.1 | 2 
               libsigsegv-2.10 | 2 
                libmbim-1.12.2 | 2 
                   bdwgc-7.4.2 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
 make[1]: *** [all] Terminated | 1 
                    ofono-1.16 | 1 
                 cdrkit-1.1.11 | 1 
                elfutils-0.161 | 1 
                 mesa3d-10.6.3 | 1 
              drbd-utils-8.9.1 | 1 
             bluez5_utils-5.27 | 1 
                 libepoxy-v1.2 | 1 
              lirc-tools-0.9.2 | 1 
                 empty-0.6.19b | 1 
              postgresql-9.4.4 | 1 
             expect-2014-05-02 | 1 
                   audit-2.4.3 | 1 
                   systemd-221 | 1 
                 clapack-3.2.1 | 1 
       host-erlang-rebar-2.5.1 | 1 
               protobuf-v2.5.0 | 1 
           libfreeimage-3.17.0 | 1 
    xserver_xorg-server-1.17.2 | 1 
                    vpnc-0.5.3 | 1 
                  boost-1.58.0 | 1 
                 gnupg2-2.0.28 | 1 
               libgtk3-3.14.13 | 1 
                  zeromq-4.1.2 | 1 
                 haveged-1.9.1 | 1 
             ebtables-2.0.10-4 | 1 
                 libpfm4-4.3.0 | 1 
                  guile-2.0.11 | 1 
                 lrzsz-0.12.20 | 1 
filemq-482797b8aa30fcc9ea13... | 1 

Detail of failures
===================

         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/4b9f9285137a91f9523a5a34f168b223ad39551b/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a1932b7e50bb4b69fe95a53e999e808c14e50488/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/5b78301f4825a6169cb03fd0d7a800562a63467a/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/dc6da3894ed29da827f62394a8ab270f95e06425/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/97bf2b607a52ba68257ab86ce822356b36d2a37f/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/96b979818d49dabd4901e5e14becde6556d685e3/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/001cd5c0d2a6000cf5f0fcc919e7c3f1e1857d5a/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/85db02fd54410c09ef1593dd4d0e61bb0af806de/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/065f02d78d0e2729a518b0d34f4c01b505787308/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/dab3f7ba27f8d2ea3c5bf9eeefe4052084136a12/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/d2781e70b04a207e2e9397d888032294c7285034/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f5880b6bc1f913ededc3a7b15d8020214be07ac9/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/6290a3a098fd466a172750ec4cad04fe32efd3e8/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/3b107a258c838809669b56d4e10c97eb9cd0489d/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7432ccd0d060a70bc35f0ac21ec92ae0071592ae/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/3660448bea4b1ca33ae2a559372efb5f35c39f70/
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b726941f881bbab96b7d22bb561d0e731291ebe3/
        i686 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/e0907c5453dfb1df546c07869faf00ec51b49181/
         arm |                  gnupg2-2.0.28 | NOK | http://autobuild.buildroot.net/results/58114510c73c9bfe1d40108c94e198c278ff6895/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1bf73dd4c28d6607e8c24d3abf259b8032712a02/
       sparc |                  haveged-1.9.1 | NOK | http://autobuild.buildroot.net/results/5b8bbc30f347140309ab2f81e1fe50f517356a3e/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/268563098bd1cb91734607a00657194f8c35cf55/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/747a42509cdba11f4a707b092f7f5d0ad231f044/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/e8e64841c15a5e81b01030192849673891203b50/
     aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/212333c85b320b6f4b88e14a3643992b6936dce7/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bcfbba81206de987c6a344f77e2088b9203e96e0/
     powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/8d8d5246e1d61deb8efd08fda16e6009c3bf4010/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/9eeb35943e61fc710e88b8c05bbd499b978cf137/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/6be054a7df117bd3ce2788cc6ba0b9eac0f0a63b/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/efae782912face7c36417dfb1023228d6b137654/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4155a17490e9edde97696a8ae6ed173ed4040148/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1cc61e4f80cc69bcbaebc2d73447cd81303c7887/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3728a5facc3f602f3f4affc14708f7a8ea729d05/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b9d56fd2d52256d6b2164737aaee0914590d3d29/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2575441fca57532d0fdfe704651b6dc9554b971d/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/16d37a155c6aec8d1c837ff164b12dc7c297b8a6/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2128a3507e57e707ee5c726f1ccfddadb7b19112/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b630e947f4d274b96e91455c2b8857e21af4627d/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/87cf6312bef189e4f3a49983bfc662d69afa05b4/
      x86_64 |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/8106ab057f538d1408d736736fdbe50b99ae709d/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/0bca48cd3dda1cd9bf00996510e59d403d52b607/
        i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/367fec01a99ae5df6e2d2599fdcbde9860d4d3f9/
       sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/1514b777a78ba51c9f60e0586edf96cce14829da/
       sparc |               postgresql-9.4.4 | NOK | http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/c2bf9c3b0e29ac7affc06b9f2ebb19efeb555d9d/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/cf868dd1895dad04a32b1d3d8c4aa33817b2b150/
      mipsel |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/b32846904431d4e56fb21f2b7645e8c6f90787ff/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/d8383d7e59394ac4f4c3880f818b668e3829d8b4/
      xtensa |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/d47b9715dcffddd64cce93d3944b93f33fe80e0d/
         arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/394d29dc19cec31f3b835d39cba7e981d0d1e7b9/


-- 
http://autobuild.buildroot.net
