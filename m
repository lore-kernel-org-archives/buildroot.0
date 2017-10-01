From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Oct 2017 08:31:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-30
Message-ID: <20171001063107.3A51420966@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-30
================================

      successes : 203
       failures : 55 
       timeouts : 0  
          TOTAL : 258

Classification of failures by reason
====================================

                host-mtd-2.0.1 | 9 
      host-uboot-tools-2017.07 | 7 
                    flex-2.6.4 | 5 
host-squashfs-3de1687d7432e... | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                     nmap-7.60 | 4 
                   evemu-2.7.0 | 3 
                openjpeg-2.2.0 | 3 
                openntpd-6.2p2 | 2 
                  boost-1.64.0 | 1 
                  cc-tool-0.26 | 1 
                   cmake-3.8.2 | 1 
                  ffmpeg-3.3.4 | 1 
                libesmtp-1.0.6 | 1 
                 mplayer-1.3.0 | 1 
                   perl-5.26.1 | 1 
         python-gobject-2.28.6 | 1 
                   tor-0.3.1.7 | 1 
              webkitgtk-2.18.0 | 1 
                  weston-3.0.0 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/ed1feb640fbf2f1ba9ee95d5cf57db2076f72fa6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9d4052bb341f768f38d732df9496e7177c98ba41 |     
      x86_64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/87ac3337ec77377be2cccfd6987651fefafba1ec |     
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/607bb29231f80a138e1b5423bc01c89e36efe78c |     
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f3bb70ff03ff7fd597354b2f6ade17ce5fa5a05d |     
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/62709e4fd1dec3991e0a9dd978238e208723e848 |     
       nios2 |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/f190c382dd8f0c50bbd212dfe0c44c3c01e268a2 |     
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/06c584ed50fad6dd3df3efcb04a025e21aabfad7 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/7efea32d5e131f348b2e742ad6146d690ad96b6f | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/173d1c0dafef2ab174fde01e285de43610db0e21 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/93807a8d79325cd983dab5b9aa7509708ce2ad55 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/f0b5a800e8edcf11145f7f4b50e32373784fa8c1 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/512c5d378d2592056483b00a3688cbdf9aef3b45 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/6f449060f7a3ab65641462c736d1592e16464c15 | ORPH
 powerpc64le |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1ead55059bdf45ff78c31e9d6b7f0a72a19817eb | ORPH
 powerpc64le |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/178a2752d1ebe319e012f05c9c7128fd51cac7d8 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/3c609506f9fcd7ad4cb73a3fc19adaf9794b352d | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/236e5472248eab7f46cc3868225ae6f955687b5e | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b94cc84eca3584850b78d895099b289061131483 | ORPH
     aarch64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/4de7274c33628d646826ec461e5b0768fa084f2c | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b57bac1bc5d36cb575433dd0faeb623323ac243b | ORPH
        m68k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/1f9bb11396f30161ab13a30ec2aa010d97110c96 |     
    mips64el | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/45e6255af61c7333df1f31c49831901b169f3b04 |     
      mipsel | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/a4c58617dcd2f49a963b39e6100d60a28905555a |     
      x86_64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/696255fdcbb978fd4a71dd3ae69d73ac5f3a2a3f |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/f14d294828874790feb13de686001703a023a37f |     
         arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e2b7a1316a10b430b980b75b5c81e7d850b26728 | ORPH
     powerpc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8ae7a033cdfef42b6db63706f3569fda02a0e26f | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/421574adf3611f1865cc0227afcce036ccdb5c7c | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/6eba51a74522335896010efafcbf1e6aec213201 | ORPH
microblazeel |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e12c0ca5f347ee3a8f8daefa7cccecd7523e584a | ORPH
   powerpc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b51309919830632b2ddb41e18907a8de319c8cd6 | ORPH
        mips |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/a47ac51924b6e6b1e3a02cc53b51468f9df2526c | ORPH
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/65608fa2296bc7fa9eb0bff83cc649312a9e2b09 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/28546439932fd92cf502ee6de7b6aa62d889fe97 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ea59f2d7d89ac1f1e29fe030a8f0763676fe87ac |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/da8396695d8373b9bce8621801be32fa8b491844 |     
     sparc64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7e68faae93eb5ea718d286f7743ac5118838a9ee |     
     aarch64 |                 libesmtp-1.0.6 | NOK | http://autobuild.buildroot.net/results/701dc15ba842255174b5f77fbae787040d461caf | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6a89358bbcd26456d8602cd101c3b9abeba4481c |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8428fe1579cd4a74c102bddc137f894988b6c3f0 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c586450445441f380063768fc54954df03700594 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/b750436556d37564b0ffd49cff215003ddf99b53 |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/caea8d9ca16d7b8ebc243a1de111a25f7d09370f |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4f93a7b6ec56c0f1e7e89bc0d5167bddfdb557fd |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/64b791770db5258afb2381c89cddb7492668dcff |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e97efa9c4dbed67fd80e1c93d34b87ad6145404d |     
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/cd99e2c97dc72e000168544876b8b9a3309a9026 | ORPH
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/bdaaf63fd776c3f364ac98c181734aee30412cc8 | ORPH
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/89795ef590658d0ff8225d1e9982b0e50691315b |     
        or1k |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/67bb3e1d3777236e91f49f48771fc1c16183670a |     
    mips64el |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/7179fc3bb23b7cbc868ed82ee7677935ffa6f820 |     
    mips64el |               webkitgtk-2.18.0 | NOK | http://autobuild.buildroot.net/results/ce9b2062191a64a2d90787dc09e57bbf4febad4d |     
         arm |                   weston-3.0.0 | NOK | http://autobuild.buildroot.net/results/a7a6b17dff09a45a35185a0e02704523b815dd57 |     
     aarch64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/9e0f9e8f3d813bd66ced6e3bbe77ca370226d8ef |     

-- 
http://autobuild.buildroot.net
