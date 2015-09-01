From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Sep 2015 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-31
Message-ID: <20150901063014.27B84101AB6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-31
===============================

        success : 273
       failures : 48 
       timeouts : 0  
          TOTAL : 321

Classification of failures by reason
====================================

                  apitrace-7.0 | 3 
x264-e86f3a1993234e8f26050c... | 3 
                   systemd-221 | 2 
                  ltris-1.0.19 | 2 
                busybox-1.23.2 | 2 
                   dhrystone-2 | 2 
               iptables-1.4.21 | 2 
                  mono-4.0.2.5 | 2 
             lttng-tools-2.6.0 | 1 
                 mesa3d-10.6.3 | 1 
                  tstools-1_11 | 1 
                  samba4-4.2.3 | 1 
rpi-userland-b834074d0c0d9d... | 1 
freerdp-770c67d340d5f0a7b48... | 1 
               libupnpp-0.11.0 | 1 
                   kexec-2.0.9 | 1 
                grantlee-0.5.1 | 1 
                  udisks-1.0.4 | 1 
                  guile-2.0.11 | 1 
               dvbsnoop-1.4.50 | 1 
xdriver_xf86-video-siliconm... | 1 
                   squid-3.5.6 | 1 
xdriver_xf86-video-openchro... | 1 
              lm-sensors-3.3.5 | 1 
                      gzip-1.6 | 1 
                  nftables-0.4 | 1 
                 qt5base-5.5.0 | 1 
         conntrack-tools-1.4.2 | 1 
         qt5imageformats-5.5.0 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
             bluez5_utils-5.27 | 1 
                  fbterm-1.7.0 | 1 
                mongrel2-1.9.2 | 1 
                    ustr-1.0.4 | 1 
             webkitgtk24-2.4.9 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     mtd-1.5.2 | 1 
               libgtk3-3.14.13 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/a94807f5ca52f7a41e53491bb5f1db5c97178e99/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/2c94970cd0f9f9ef30bc0716da5dee2b65520968/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7dda4fb6bf9a6c7547be1b8d1a81e9f65d43d296/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/44bc84d0e32282c1bf3739ad560b0c52c33c189e/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e2f72ecf2f05f44dfb6dc557453989e88d951402/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ad1185b994d3cd4cd8bd4202d7df7f0eb5a5aa8b/
      x86_64 |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/70d77b5a8e2b0c678482a50c53af288023777a74/
      x86_64 |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/1b6cb1b40431bf484db2d99bfdc8237cbae6a9d7/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/20e669d6e4bc3d872a355ef658ddad8f34676624/
         arm |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/feb731da1d865b82781366798ffa8aaf40cf2ec4/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/817158452cd4b464d9306d619136974ea5a6963c/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/c96a4290e629f2d72d36f5c03cde0decf1df38c5/
      x86_64 | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/59c77845a9cda7d556c42e0c7f02221400e22b9b/
         sh4 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b19fdab9c40c547b6455b4d93dd8deba17e8fe67/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/68023ec7fd5553c842c99fa13a431bea8789e63a/
         arm |                       gzip-1.6 | NOK | http://autobuild.buildroot.net/results/568c1c05800d6bdd6457845e998a598e354afdfd/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/d6780aeeac71d5db4939c73b6827da45625da443/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/e29effa2c1592e78a219caf283a056f072c28042/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/b9aae146aecf47423a68fe79d6fd81c6269c80e4/
     powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/ca0bd761f6e08764a3479a4c911eea358f8ccf28/
      xtensa |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/b342e5545e02db919c95dc3e185b6012663c9bdc/
      x86_64 |               lm-sensors-3.3.5 | NOK | http://autobuild.buildroot.net/results/9c8556f57b00657aaca71b72e3b9b2bb4e72f090/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/e172c5cfdb42d08c3536ff32ade296604b46a83b/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/49a7eac98fe8a5289883260d0277b672eea132e2/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/6b23269174f54844ab1406ac6fff5950a9a2cff6/
     aarch64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/dc94f6ecc3730aaf7cbac9ef3ccee9d27677ca58/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/fdd55885e613004ad20e85827a3c6eaca4cd1bf1/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/77f7619617bba582ce777a0284364e4566bc973a/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/4c1f8dc79205f56249e5ecf447c04832af01af1e/
         arm |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/648341fce974e8f016eee57c95d7511a886eef49/
         arm |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/e62108c80e592b55021dcbfdcb515e5f02a2947f/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/14ce236b2c9ad8b92989d934f8ea8a6d2a7ee72a/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/ac3f99c623ea5497d22dcaf4e5458b3fe93ce080/
         arm | rpi-userland-b834074d0c0d9d... | NOK | http://autobuild.buildroot.net/results/23fc816ee05eee914dc5105850d377c048382540/
       sparc |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/543fdac2ae4fee778a80d2381899603f0681fdc4/
        i686 |                    squid-3.5.6 | NOK | http://autobuild.buildroot.net/results/65cfc03c1def9ac9469c187b207ea4993d906fc9/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/b756df7015a5b8c8f4ad0b4b801a73ae97250e7a/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/19aaa19243093840ba45c6ae54a84bc7f307f714/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/d410a5750fa6b2fbec1f6c3ba3a1a1cda7ac44ac/
         arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/76a0cdbb41f2f968166eaa942437679aeec253f2/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2200fbcbb226481d97af522fb0f58423c3b68c57/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/7502a1e993917cbb03ddd2c490ab4d04af6971a3/
        i686 | x264-e86f3a1993234e8f26050c... | NOK | http://autobuild.buildroot.net/results/3ec54f722d6008fc422540d3a5462b306d16e84c/
        i686 | x264-e86f3a1993234e8f26050c... | NOK | http://autobuild.buildroot.net/results/8aee35caf2b889aa2c6af2fe9029580e8dcff8e4/
      x86_64 | x264-e86f3a1993234e8f26050c... | NOK | http://autobuild.buildroot.net/results/3f08b679e67451b5a325bc2b05d025a1f2953734/
         arc |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/de2e2fe4489be30d62fdcb554e537ec2f52efc1e/
         arc | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/b373ba3a00d3f4e3a714b8b86588053f1f927c3e/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/5b46fb21768a9ebd9ff23eb49fc9d4d280fdb923/


-- 
http://autobuild.buildroot.net
