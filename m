From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Oct 2017 08:30:53 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-04
Message-ID: <20171005063053.C178D2095B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-04
================================

      successes : 197
       failures : 53 
       timeouts : 1  
          TOTAL : 251

Classification of failures by reason
====================================

      host-uboot-tools-2017.07 | 7 
host-vboot-utils-bbdd62f9b0... | 5 
                 mesa3d-17.2.2 | 5 
        wireguard-0.0.20171001 | 5 
                   cmake-3.8.2 | 4 
                    flex-2.6.4 | 3 
                host-mtd-2.0.1 | 3 
                openjpeg-2.2.0 | 3 
             dbus-python-1.2.4 | 2 
                   evemu-2.7.0 | 2 
host-squashfs-3de1687d7432e... | 2 
                   perl-5.26.1 | 2 
                  boost-1.64.0 | 1 
              ghostscript-9.21 | 1 
                   luvi-v2.7.6 | 1 
         mesa3d-headers-17.2.2 | 1 
                   mp4v2-2.0.0 | 1 
                     nmap-7.60 | 1 
                pinentry-1.0.0 | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.6.2 | 1 
                    sdl2-2.0.6 | 1 
     toolchain-external-custom | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/c89265361ffb11bb4250aee9f4326a5955b419d5 |     
     powerpc |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/6d4ca1c83ca01395c6691344268ad610ef44a6ae |     
     aarch64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/c2d3ee65f4caa9c15940785ea5f6ad545c69163f |     
         arm |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/c064266e567457fb9427719a697849799d1007c2 |     
   powerpc64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/5c6965036fff7e2b2b066b7a27cac105547d1e2a |     
        i686 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/669471450b7532949d25c181e3db12eea5445405 | ORPH
         arc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/4cf7ff3f58162892062b8a568e3121352d5ea222 | ORPH
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/953f9f3e5b2b2268f7711f30f72c22b27b97e6f2 |     
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/e2ed46ca0200381f4c044c4f13b7ac70896da5e4 |     
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/2e00627b8742dcbdfde94d44eedae28d0b0c9847 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/128e7602bb50a80e5c127621b47f82b295c6e2a2 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/31080fba6ca85c6f5bbc3785e180a51b4ce96d28 | ORPH
         arm |               ghostscript-9.21 | TIM | http://autobuild.buildroot.net/results/35c0841eda7f96ad572c28ae7ab8b09ccddf6705 |     
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/746c5fc47e67e6a1fa1745504a7f992966835972 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/730c6a7570755455de8013fdcf8a2aee4b3aadbc | ORPH
     aarch64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/632367285846a612db5cf59e92da87f05ff99c34 | ORPH
       nios2 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/7157fa83b02f07341a60aabef4e7ef3169b7260b |     
    mips64el | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/ecaf395b9179f85422fbd6ad583650a495384983 |     
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7ba560352e38bc52dfeb183c3725f59ed219e2ff | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/5a011478e7a55fa67c6eb2e2062a5dbf2a3315b2 | ORPH
         arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/2abea409951cb2706cadd6ea6ed24b0e0070f921 | ORPH
       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/64cec783c651bdb8b35245d84bdbd1891a2d10b0 | ORPH
     aarch64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/082e4692552790dc6d2f5f0a3b778b491321e28c | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3da4f68a592c7274f174642c5cfd4091122ca20f | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/5ded66285270d4f027268b1206a398812dce5c52 | ORPH
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/07a39cf8a5d01fe0b7c80bdfbd8a08e101bded55 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b00231ecb72224a35cb1d3f5659e38857dd0217e |     
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5b4d663d2f22dd51cd3bd78e03c2695da97c7f9b |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c45fbcc9054454471adb1c371ff0233f905e00e6 |     
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9c551dbcab381d2b1ceff345cfcfb40d7a7293f8 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/75d11fffbf0237e709617c95d325f02bb7d4036a |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/97c1e2ff3170d5a88812eb146750ad0b66e7e95e |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/4acb79d4abcd1394769541954af62ce8e8962b4d |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/8bbbd95e880b803ed986ce7dff78a8b3c6ae8b71 |     
 powerpc64le |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/7d8fef3b0dfa5fb04831162003f54d476de21a69 |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/19ba2378a8683e7c680d99ebf611c4a67c58b7c3 |     
         arm |          mesa3d-headers-17.2.2 | NOK | http://autobuild.buildroot.net/results/d905e4b70c650e2cd2df8ac2e172d73400c960b0 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/995623de06c10e210801f6ac8922212b2479896e |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/eb2739bf5e3c77fcbe317ca64809fbb4da56fbca |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/59850ee746d9a835f864ba800c01d7bb43c83fec |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/72137c87599e4cd49711b24b25d7129f4f212cd1 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4a4fb5f742b34ab0efbb5ad517c6a0b434bd44c0 |     
      mipsel |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/1a53853f169be20882688fce362a71ce09bf5c81 |     
      xtensa |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/38b187165ea21f194d8a7179ef71f47657446d0b |     
     powerpc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/3b1c0b3d1098449db4834b04e3b25446a925e4a4 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3b9c8bb9dc4594c9793b0e29c0b75d0d360e27cd | ORPH
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/1efe81938a578a231511ad4ce6a4db4804f21b0a |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/c5fb446ec1a16a57a144a837579a61caae08413b |     
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/4412d0c729b6ef8aa4f0221fe99d9bbc61d5ef48 |     
         sh4 |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/c162020b27fd3642e98c2e18c8782319c46782db | ORPH
       sparc |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/dc41694b952ed9aada4af2f55e8e489f0d651e55 | ORPH
        bfin |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/96c58b90de382b7fa0cf66df21948dc4ccdb76e0 | ORPH
        or1k |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/4023629a3415f3621644fb6f46355ebd67b9507a | ORPH
         arc |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/c4af8d954fce53625fff308a6823123727f8529e | ORPH

-- 
http://autobuild.buildroot.net
