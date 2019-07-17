From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 06:01:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-16
Message-ID: <20190717060207.A627886DD6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  24 |   1 |   0 |  25 |
   2019.05.x |  17 |   0 |   0 |  17 |
      master | 107 |  69 |   0 | 176 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         xkeyboard-config-2.27 | 14
             bluez_utils-4.101 | 9 
     glibc-arc-2019.03-release | 6 
                       unknown | 6 
      tesseract-ocr-legal-info | 3 
             bluez5_utils-5.50 | 2 
        glib-networking-2.61.1 | 2 
                harfbuzz-2.5.2 | 2 
              iputils-20190709 | 2 
                 python3-3.7.4 | 2 
          qt5multimedia-5.12.4 | 2 
                suricata-4.1.3 | 2 
           tesseract-ocr-4.1.0 | 2 
           can-utils-2018.02.0 | 1 
             connman-gtk-1.1.1 | 1 
       gst1-rtsp-server-1.16.0 | 1 
             gstreamer1-1.16.0 | 1 
                     gzip-1.10 | 1 
            host-mfgtools-0.02 | 1 
               libgtk2-2.24.32 | 1 
                 libv4l-1.16.5 | 1 
                    proj-5.0.1 | 1 
       python-matplotlib-3.0.3 | 1 
             qt5wayland-5.12.4 | 1 
tvheadend-8f1de1621d78c9143... | 1 
           udpxy-1.0.23-9-prod | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/8d503983fc3e7b4dfaf35b94ab0c34e403fe8ddf |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/453f266bf2e832f6c60187f5eb0680de7438b5e4 |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/19023ceeb995c574cfce254458819dbce575c7d8 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/73a715fe3f4913345780d803b7682f6bbb768c67 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/304937c8c1acc26be4893465cc9de419518b2f70 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a245c476700c65c423a1730e2b99c1835b371faf |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3b03ca06c9092708c07c9d1820382007198b2029 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b02696e5d12dc3f89ec6e721486b99f9dfcb2263 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/88478787c1085c54c20381d7efea17a77c9d3e88 |     
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c253cddbfcd22d084df634b5609f81cce1d06676 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/e15cda5dfe15bd9e51f682da231b303bc209cb71 |     
      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/5a3fdc4f72eb21329974f9c19abe25d1d890a0fd |     
      mipsel |              connman-gtk-1.1.1 | NOK | http://autobuild.buildroot.net/results/30b775323b4780b35a163100097952eff232339e | ORPH
         arc |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/991ae537ccf6b386238564c59854282646304ada |     
      mipsel |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/758e55fd1ccb806858c456a04dddb4239d72b6c3 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/c196e90069d79cb1ae2aea729ee453d5ac19eeed | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/a8a065bd06ea24e6f0a550fc6505b702f0297043 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/d0fcc4468cc6b361fe3e430884e9ae9f6b649b42 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/ce3874210d0125c37568880a52040826b34b251d | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/6a42d724cacabb66b5dc55073c969f4a7b46f4d6 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/6a90fe02e86fbacec33da625696570d7c4044bc3 | ORPH
         arm |        gst1-rtsp-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/fa7cf354506972e28d2a5ecdf7f91f888e920ab4 |     
         sh4 |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/8b4d7050b7fe3d0edbeffce4ca5ffbf4a6d0a2b9 |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/635c495a3d06631d54349b37be506326c3db2bb9 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/dcb173f7efffdb80e446334c4de32fdbde3bc8ec | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/2a710ae12b7f30f2d70846d492e5bd89f3f78247 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/22abc3bb5b40f5f8ebdbfa8c2504460cf5271eb0 |     
        m68k |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/132d148ac0ffbd48f07f7fe1cd99e55375374400 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/4c86af409ad8b77b71d81d1eeec4762a24880bda |     
    mips64el |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/3339af98df8031c852109feb2c04b1539fb12df6 |     
     sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/2e8cf5f4927d04a0ca68b14f4477a0fa80005180 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/cc1b36b80b58a253713c076cd1d11a9380e74d23 |     
      mipsel |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/0051ee1683207c2eb6d4de557505da053281d931 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/5f6bf14f39f5e2919a0d24373b0837b618e9b80c |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/9126cd8f85a07bc10c5762e6a3f645b014f3ebaa |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/c787298b186cb7df87ad4dde83cebb5468a5cc0a |     
     aarch64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/187534ccca837fd6ed2422b55d5ab5172ca585d9 |     
     aarch64 |              qt5wayland-5.12.4 | NOK | http://autobuild.buildroot.net/results/40db4873de0f118c627599bb421a3d7cad3890f4 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/422e1aa4e7d0bac31b55e7150a7ab031e23cef4a |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/56193db41e02fe33be6dd3d75f3f82500cc71a46 |     
        or1k |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/cdd2834d29f3843e691c358c147004987c028a52 |     
        i586 |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/9a5835a1c444145acdd1058b48f6d1772be209d2 |     
         arm |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/0b8f4566898b7dcd2e0f14736ed6f58f8a0b36fa |     
  aarch64_be |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/e55af271013792524c4a0bf06cfa64f8307f411c |     
    mips64el |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/aa3ff8e9007019694ce884221e08996c6c7e3717 |     
    mips64el | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/82a5417a77858794d71898a1ce6c975da8859b6d |     
         arm |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/a17dc3effcf6ea9926cf53b7b404970b106dbd27 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/74f05ee4714c416ab99b09c89e863333bccbd96f |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/87328b533f6786df9b845eba00d2c61e62e89236 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/83b01b504cbb2a4a8dfde4af298764c13b7a8fab |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/eec7bdd6532b83e0329732c373b11a2cf6fd0f23 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/998d9324f0d9d914b0d22128d3551b2fa2439796 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3ecfd6e66176ffee3d818a507c142c95989ce921 |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/33aaa97b0c78ef49eaef29c40b4b33243ea75194 |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/dec0cb6cba3bc2a766799eb1369720af7519c9a2 | ORPH
        or1k |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/c3fa6e957545f4ee828fd8220c81e8ed66fb7bb0 |     
  aarch64_be |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/57d7f18d9ccae56ea2dec79fe006f2dd147d9807 |     
     riscv64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/2161c87e1a6647361b163681a6cd926786e7eb04 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/49fb4a85a4e28264b671a93db3a464d543102916 |     
        i686 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/cb8fa0b2ad62098292a20c71e9f3b221e388a6f2 |     
     riscv64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/f7a962aa31fb51f9b3deac5740d3680d50470da9 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/ec3e9b74da6ca32937e3dd03ea216aab0b2998be |     
        m68k |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/17e403b149e7e6b3ea5563341a0e728d4a5070e0 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/77f300a1878b83455365163ae5a62b55f1e71d5f |     
microblazeel |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/234cb238a72cf6f98050802e321881615cac494f |     
    mips64el |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/aa79e4f31381755e5605907012355a683fae6f45 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/d83ebd9570a6662ca9b38938b0a6a53bdf3560ff |     
       nios2 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/411bbb87a9a9b0b8d892b0d81a5df28dd175553f |     
microblazeel |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/24bed2eeda4fdb1ff2f73b0dc727c22b8de09ce4 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               openldap-2.4.46 | 1 


Detail of failures
------------------

      x86_64 |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/ed55e4ef664dbc769b97344d589529d9395feba5 |     


-- 
http://autobuild.buildroot.net
