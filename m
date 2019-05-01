From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 May 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-30
Message-ID: <20190501060039.B872487B84@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  24 |   3 |   0 |  27 |
      master | 253 |  45 |   3 | 301 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 12
                    dhcp-4.4.1 | 12
                cracklib-2.9.7 | 6 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
                gerbera-v1.3.1 | 2 
           host-cryptopp-8.1.0 | 1 
                host-libsodium | 1 
     intel-mediasdk-legal-info | 1 
             keepalived-2.0.15 | 1 
    libtorrent-rasterbar-1.2.0 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
                          opus | 1 
              qt5enginio-1.6.3 | 1 
                    strace-5.0 | 1 
                suricata-4.1.3 | 1 
                   systemd-241 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         sh4 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/f93366075e7cfbd466c16774430961d5a0a0a14b | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/01a97c5a9bd2281d8e3a7c1889e5acd26daedbac | ORPH
        or1k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c75d31d05e66b91e60ef827ca500c191f1b003b7 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e82faafad5119b6495662b81d29c7a9e8ecf1640 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/b1396c752db345bfd380c7400d004e33f62bd718 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/a68251773f61c3463f4d18aa626c83df70126afc | ORPH
     sparc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c62598322c1ed42af8ff1ed7e1887cb6a29030a1 | ORPH
        or1k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/ee8a6264752ae5ab71ad35306db8d8f475087eae | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/bc0a58a025a8289ab4a9260bbfa21047d5beb8c8 | ORPH
     riscv64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/55b4abd729b73ddabc45ac9e717653d5edefc6c8 | ORPH
       sparc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/6c45e04875a11c01213b0ec42aaca2ed7f339d56 | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/03ab6bcf50eae4904585c6a76000dfc5175a15f5 | ORPH
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3c232a398faf976dc410d23970b99723ce6875fa |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/fa6e0256c746242da3f9fecacf92d26b770db119 |     
        i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/29b75bf76e5f6dbde874c00271f5848878e48c6e |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/494cee48304c9508459d213d1fee06dd1e41f6d1 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/30464b50e03f382afa21edaf756195b11cd41c0b |     
        i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/5cc7816687ee760323ac27cf71e77e2000876c63 |     
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/446fe18d4939cf6180bdc25b441bf4a428dd5994 | ORPH
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fd18ea9d1ca0e1b4bd9bf2003afbec948da616ec | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/23eecc8e9d8ebfae8f6f56ea32b71acbc480135c | ORPH
     sparc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e124614027e2a100b721bd1488554a97a42cc164 | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c639f610d9a703d1a63bb2101803a9dcd998a9a4 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/75c1d4d7b7ac88ccd3d673818408c5df15a851a6 | ORPH
        i686 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/644cd78e39e67e00be0eade92acd4cc8679e9cb7 | ORPH
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ce5c052385fedfc8f321612d82a9b501d91c15d9 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/aee70b8a02f246fae35b2bf47d69f9aef74abe52 | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/440334f444eb55bffa5ab2895af9cedcc7e918f6 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a3ef6d302f480bfcde226ef8faec2e2d69d4e95a | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f1b1ed8f260b6032eeb11aa81f74fa7bb17251a6 | ORPH
      xtensa |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/de0545462c6017fe54acc284b914b9fa8b0172d8 |     
     aarch64 |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3831acf7f4c5a9f1a404e0ced3d6bec7a2249601 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/4f7dff360e318b5ee4f7702346c0c2f46fca1e70 |     
     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/78e8f70e1819295eb3fcc18c245f098d9def53aa |     
      x86_64 |      intel-mediasdk-legal-info | NOK | http://autobuild.buildroot.net/results/1e83257e02762bd1204278b97515c0fedde436fc |     
     nds32le |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/60f763a82e9fa6804479c2f23b8225d0214be2b8 |     
         arm |     libtorrent-rasterbar-1.2.0 | NOK | http://autobuild.buildroot.net/results/73481ae2e5736c8042ec7911f1378623bd3de74d |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/54fa574b19d92fe81d80f6de18777cb636d387ac |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/be468b8db1046f7efddbc5b9c5e99228daf5959c |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/bcace84ae75b2ff6252edb7e013d2da23c45ab5f |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/bee248f5fcb74889a0f188ae0099e5cb112bc489 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/a317f86c1888366196605214373dddb6b0ac713d |     
      x86_64 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/11def28dc7eeadb2cdeaaa914e8be836e4615e9e |     
      x86_64 |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/01c63d6f5ff648950a9b5ee946136b8c35ba0008 |     
      mipsel |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/582d41ad057e4af94fcfcf3871edbd62e51d0e2d |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/50a6dce19d4a70f2d141b9ee2ffd9febb11ea8f6 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/312a651a5a01982b36020c496e268e683b412220 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/cc6b7e6dc9b42a8229f058db2fb38cab982f07b0 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 2 
                bind-9.11.6-P1 | 1 


Detail of failures
------------------

         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/2e7f62559e2d7efc8e69f68a3f0c505e463b9720 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/89b351f9883bfc0500c723cb96b196ca751bdccf |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3777a66ae96e57f14bec340126f46dce3c50d710 |     


-- 
http://autobuild.buildroot.net
