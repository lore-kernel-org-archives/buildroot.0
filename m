From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Sep 2017 08:31:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-28
Message-ID: <20170929063115.BD70C2091A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-28
================================

      successes : 183
       failures : 88 
       timeouts : 0  
          TOTAL : 271

Classification of failures by reason
====================================

       opencore-amr-legal-info | 21
                    flex-2.6.4 | 8 
                host-mtd-2.0.1 | 8 
                     nmap-7.60 | 6 
                openjpeg-2.2.0 | 6 
             dbus-python-1.2.4 | 5 
host-squashfs-3de1687d7432e... | 5 
      host-uboot-tools-2017.07 | 5 
               iproute2-4.13.0 | 5 
              lbase64-20120820 | 4 
host-vboot-utils-bbdd62f9b0... | 2 
                  boost-1.64.0 | 1 
                  cc-tool-0.26 | 1 
                   cmake-3.8.2 | 1 
                  cppcms-1.0.5 | 1 
                    gdb-7.11.1 | 1 
            opencore-amr-0.1.5 | 1 
                openntpd-6.2p2 | 1 
                poppler-0.59.0 | 1 
qextserialport-ada321a9ee46... | 1 
                 qt5base-5.6.2 | 1 
             qt5location-5.9.1 | 1 
                 wsapi-1.6.1-1 | 1 
                     zsh-5.3.1 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/dd80fe81001098b8e50da9a1f9b0a6c7bba77d52 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/03447e373fb561b78f6b7950be91ed3fba0fee27 |     
        i686 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/b0c917d7bbfd717cf64f14787cb5c410fb1e1bb3 |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/492c653cb7b0f59825630e347a0d52b3fa0f85b0 | ORPH
        mips |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/abe82d82b754828cbf376b9091e4b27de35a1157 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/3edae1bc142f49c1c64bc873754b8983c365452d | ORPH
     sparc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/cda7f2468c8844729d415248eedd8a6e31be7b39 | ORPH
        m68k |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/ca985741a24f28c3bc225ec1fdaa41d8f5c1708b | ORPH
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/f4d4344cd0094bbb3a2f21e93c8b40f60ec959c3 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/ef0b182127580a2de5b24bea9c81b40e19793321 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/a802014df8264116c070352e366bbb5c4739dc48 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/52567afdfe7992b3518de0e01227ba14aa300f21 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/0cddca0023e9cadd2a335143be83c4dbc048ecbe | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/4127028df8d53016fe29e54e060bd74a5d389224 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/9c8970a807f281a15f3c02c409f82d7063fc942b | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/657cc020b6814f09eff2696e026e81baa4b99e78 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/f70b39632535bb9692d0a032166b2f4104532967 | ORPH
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/58b47622b6e077c7015bb3168504892127449c96 | ORPH
        i686 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/c61fab1a0082d917e799ca40d95c3e9823e11525 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/c2c9938ba208056c254c472454656f240ef398d6 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/0ad1e95e4174bcedc0314b33d060acb26b7cd8f7 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/2bed1e1a07cfbc57f5500b865b7371343b6e3546 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/aa096f80532bb6e05ede53cd50bdff081338f657 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/eb72da346551c931ef68d99a3c4108ab699037f6 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/956d9f3e20c7869ceea60f9f9abc209c5bdbfb24 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/8016d1a148932c4f6e2737e9a4a7399f13a26b6d | ORPH
       nios2 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/594e395fbc37d9a3c1defc40fdedcd1245a30288 |     
     powerpc | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/39c1f6c53ce59ddff938288a7405bf509c59a5d2 |     
    mips64el | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/43d5f814ca2346a609e3b801081f85f263a59872 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/ac4b2834fbb9d7541f2a1dc1839b78c87b39de2c |     
      xtensa | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/32e6fb246bbd82561a7a697bff8c87f2df6eb4ad |     
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3a9989731683c9ab071bf3e33b5f30f01d5755c0 | ORPH
     sparc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c5ef4fd871e202682956407507c033538f32f1ed | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/27833a923ed8ad5ef34a60a312f1aeced256453d | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/55490f47f499c495ea2bd02d565cc828b66adad8 | ORPH
     sparc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/1a4a7acb9680533fbe3d274903bb107dc630e843 | ORPH
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a249a3680e0ab0b5921bcdf1a3b96b7a984f1991 |     
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b8fb3ac72269885dd4145c86f43a7d917e8609a4 |     
microblazeel |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/82c4f068971578896b781f667cf2a8dd9bfa1502 | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/3900f597e57e6bca44ed54ab71dbb48d7132d5b4 | ORPH
      xtensa |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/0910a0778575617fb8befa0e35829a10f8c7915b | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/af765dad391008dd89ad0c02baec75e21f064609 | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/52ca4f1ebdd8d27fd97c0f014fd1c90a8633b05c | ORPH
      mipsel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/de860491ebab869606b99f96128aa8587756d6e2 |     
microblazeel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/b05c483cee9313fb8c44b84dcfb1596684cf8464 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/b567096cbfdb89b1895924051265c56204ffb512 |     
        or1k |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/128f4049970d7a96222bc9a35fc8c5f077f6a67b |     
      mipsel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/a4d1d7af24a730232bbdece00fadb2420d3acf6e |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/4b510d0c93fbeee595c2cf60fa54fdcc752cc979 |     
      mipsel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f74d0c189b525ed9e6fc35046e1ac09df24a5ff0 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c2cbf00c31823fd2aff34c81d861d5ea143f13a5 |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/b2f43c17481df44035291763416fbd673dcafe5d |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/ea4d9054acc520c5552e8b7cf2c2ce2431f5a8d3 |     
         arc |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/346372845360a7fb2b7bcc0b6a173652fa31e63a |     
         arm |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/dd52d6b3b7b334aea47ef31cec7afa7a745ffd87 |     
     powerpc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/75b56e66fef19522c82be72430a34dba57665c6c |     
        i686 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/8e77c6521f96d094a931129561056b2ad513dd18 |     
    mips64el |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/65667eb8fa1d447251b707e8a201d811cdaf7590 |     
         arm |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/8307a3b883d8b7d5643003a39d97aceb63ef636e |     
      x86_64 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/2ab7588dbb773faa996c0c2d6a22e80fc8254b1a |     
       sparc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/017c5a3e61c320d374983cbdf58b01d1013a6285 |     
        m68k |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/5dc39845fd0d24a6cbad7524c7fb82ddfa9a1458 |     
         arc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/f264f889da407c4117cb2e7cb79316400f89b6ef |     
         arm |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/f842150420c0dc5e7669f429a88e420e369d2f0e |     
         arc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/18bfadcede22895c209780feb78ef89d66fb4ed1 |     
 powerpc64le |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/f0908ec1206963f9e33c58b8054dbb58bc0a488c |     
       nios2 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/d27977c79d9f0abd4bd575b6ea53becd0812e285 |     
    mips64el |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/74bd1f612cf46af494b314b4c89b54a60ec2be75 |     
     powerpc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/bad0a7e335dacf1ab9d52a82d288943664487a2f |     
     aarch64 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/7aca0a19cd544872c60c86ae790ed7b5d7b2401c |     
microblazeel |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/96ef1391052b035ea98d3c7ca3bae6a5fdbc588c |     
      xtensa |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/abdd08b8aa023e4aeda61151b6b5148fb016fd79 |     
         arm |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/1e5c89dec9322039083faf05607f1503bd03311b |     
         sh4 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/6c8bc6beb0f56deed1539a1c697a466ef4557b79 |     
         sh4 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/a6ccd5cc5f695d02e9c55eaa0ef146ca332f1c06 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1d6161de781651aedd01cc577fe91edf7c2f30d0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/98fec5ce23dbfda72a9bc3673e81ae01f296d5f7 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0b26e949766db619a19f7e9e23c1fd0d56c007ee |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/88afa8c28205901bd69773ab9707e2bfd5d23a2a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1ea56b580f4824c9187676e00a00367461e26325 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a0ae2c253a6686defbf9b17a8a7a195de6207326 |     
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/648e7c91edcf893fa780de9bb44c05f5f842a2e8 | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/b6e70ec4c0c4d9c708f89fe4377ff9098bd29673 |     
    mips64el | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/977c972325f85414cc804e225f82d04a7dc86248 |     
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/31dc90d5072e4c80ee176f09f52de8dc3f994a76 |     
         arm |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/27758a0468b265f98a19d9e975a3fae6d6939837 |     
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/4e567b80fccd8fb6569c25ba24445bf012c75c93 | ORPH
        i686 |                      zsh-5.3.1 | NOK | http://autobuild.buildroot.net/results/54c9c5dff3df0a43573b03896cb0629fcae08478 |     

-- 
http://autobuild.buildroot.net
