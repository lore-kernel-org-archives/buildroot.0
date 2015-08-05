From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Aug 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-04
Message-ID: <20150805063019.23A4E10126A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-04
===============================

        success : 225
       failures : 40 
       timeouts : 3  
          TOTAL : 268

Classification of failures by reason
====================================

                   tinc-1.0.24 | 3 
                  mono-4.0.2.5 | 3 
 make[1]: *** [all] Terminated | 3 
                   bdwgc-7.4.2 | 3 
             libselinux-2.1.13 | 3 
                busybox-1.23.2 | 2 
                directfb-1.6.3 | 2 
           libcec-libcec-3.0.1 | 2 
              gst1-libav-1.4.5 | 1 
               libpthsem-2.0.8 | 1 
                  zeromq-4.1.2 | 1 
                 libepoxy-v1.2 | 1 
                   zyre-v1.0.0 | 1 
                 mesa3d-10.6.3 | 1 
                 cdrkit-1.1.11 | 1 
                    cramfs-1.1 | 1 
             util-linux-2.26.2 | 1 
                    neard-0.14 | 1 
                elfutils-0.161 | 1 
                 setools-3.3.8 | 1 
                 qt5base-5.5.0 | 1 
ltrace-c22d359433b333937ee3... | 1 
               linux-pam-1.1.8 | 1 
                  boost-1.58.0 | 1 
                   systemd-221 | 1 
xdriver_xf86-input-vmmouse-... | 1 
   qt5quickcontrols-legal-info | 1 
                 libssh2-1.5.0 | 1 
                  c-icap-0.3.5 | 1 
               linknx-0.0.1.32 | 1 

Detail of failures
===================

         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c516aa0b15e195e5da64083d170f9ac41b297b61/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a4b04d8169aae5db9a6deaff21a99ddb9919a44a/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/3c1bc9956493c9c4a037d684aa240ad273a47194/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/26cdce1c8a4798ef1be68385dc32f906f04ebff9/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6b00a13e7ad55ed7ba369c7f5332e0b473868d71/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a6adecda956db20179a1060005d1a823e730e1ae/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/eb6c20e1c5b2ad2431a38a3cc697c69b85d914ea/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/d447c740ad79127b34d4fef5cfb3e6f3e65b063a/
      x86_64 |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/e023014934bf291add9d9dfdfc005bfec34dc1ff/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d3eb5f53385ca08e96493668e500c598bce25799/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ad2e71dfa3515e43703b62235e0ac2e7f00b7fdc/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/cc90bd9312f30f91daa50af4253629f58b82c486/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/26400d4e98e5833055c47d178a0d70386f38b306/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/0d032cdd8dbf6d0ddef392c3e5a734881e00ee64/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/4a7b2af2fc3924255ac89e18f4f5c90bb8383265/
        i686 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/f0fedf440a7394b29637177db83a3c7622a05eac/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/440c2b6dd44124e70101fab43faf72cba27f60ae/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/02573c5f1367ec53d2f2f6277b768fb35e64a100/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/dff4460c602cce50fc8287630f2e94345ca3a5e3/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0bfa7da87c7adfacdca676997ca9369d7360fc03/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/761a61d843a772cbf784e0fb548edfa2ad27172a/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/de4cb5b9496f777bdf84566056c5724a6eb350e1/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/a10a10e9d865e77d2c0ca1b1e0842004f51577eb/
        mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/7a2c92c38dc41e8267c063db550d653677fdc267/
        i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/1d75cfb5db1104da61663993b0c3825d93aded07/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/52ca8dd7b2b30893f1f4da53ba0134fb6ff67919/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3e8d29b9d27969ad572b288e12cd8a923d328d54/
        i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/4d19e3ac61701f7ea077a6dfee3dd51cdbaa0e7d/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/3ab2b8667e5657bf07f55dd04dd857167ab4c62a/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e88e8605fb2676643aa9879d82029e90e497181a/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a4f537d1abb5919b1596ebc0b8afee2a7b130e89/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/8197278b0908f4afd8a4c518dc496c9a5e451fb7/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/420aed3df8d4a5b7a5215186fe7d7131459b1dec/
         arm |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/0dc96010cc81a34d2363eb4fe1a155db0e3769fd/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e29b5a82f47aa856724f172b612c2bd121db7986/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/be0d728dc2d751ae5ba77996985dd39247e40f1b/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/774fbc2ed5ec4f3a8cf45b7bfa3135bd991011f4/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/7bde4f85488b31bc5db84988a85433b7157e6b2c/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/49457616f71d90e4b5c2e3b073e40c09231815c1/
      x86_64 |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/da28101c75d6f6ffa36a08f88683bcd82151bcba/
        i686 | xdriver_xf86-input-vmmouse-... | NOK | http://autobuild.buildroot.net/results/7c9ab14b22bb14ce70905d3d1471d96241242827/
         arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/7d9355816851203ffe84b963b54fe2a0c975b9b7/
     powerpc |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/a4ed6889c63e546b66532ea4dd07a8f2f9720c7f/


-- 
http://autobuild.buildroot.net
