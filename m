From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-24
Message-ID: <20170125073013.D171D20CD4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-24
================================

      successes : 101
       failures : 44 
       timeouts : 1  
          TOTAL : 146

Classification of failures by reason
====================================

          mediastreamer-2.12.1 | 12
                    ruby-2.4.0 | 6 
               sdl2_ttf-2.0.14 | 6 
                  samba4-4.5.4 | 4 
               openswan-2.6.46 | 2 
               bctoolbox-0.4.0 | 1 
                    cups-2.2.2 | 1 
glmark2-fa71af2dfab711fac87... | 1 
                ipmiutil-2.9.9 | 1 
                log4cxx-0.10.0 | 1 
            lttng-libust-2.9.0 | 1 
make: *** wait: No child pr... | 1 
            netsniff-ng-v0.6.2 | 1 
                openvpn-2.3.14 | 1 
python-libconfig-b271c3d9da... | 1 
               upmpdcli-1.2.10 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
                     xen-4.7.1 | 1 
                 xorriso-1.4.2 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c9364
        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/61cf6659357795f3de69bb00c4000f049e946424
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/8dc9400505b9087ce290981d95486598df0beb56
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/cd1569596ce610a3c8c7747e7b31807f8c6abbf8
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/d9825870993f47e3850d3e3a95ae4f494dceaf0e
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/57adda12f17593ac1e79e7e472a93162cc693463
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/ff5723f7ef4d5bb191d125b1881542f482f5b390
        m68k |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/9aa3cdad6e22ad1656eec59fc92fb7cb79afc4cd
    mips64el |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/09e8fabb72cafa284419f096da95299c51c03899
       nios2 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/29c8ddd25c76f4c5b74f31a576c7ace9f76677db
      xtensa |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/ccb6a981b5df303939dcd78b4517bfb44498bdd0
     powerpc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/96f6aab9b5b81e2e6654789704eb89abc36cacdf
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/a0c37fd7f3ae541c29dcd1a092383712ef3363e4
         arc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/f98685aee3dcfb21c1fd86654bed0f96784a6c6d
     powerpc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/20744d0b8b6833baabb53af93c471c427a1455f5
     aarch64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/a888482327a6cdb45ac929d07d67315b241a2d73
         arc |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/9aacaefd9cf995b692b34ff8f6cc19f4d918c9bf
      x86_64 |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/7be5c3adbc22a41a069b66f7a1870f8e519d05b8
      mipsel |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/15c6a841f37efb8dfd23e7e3db33e01375351ae2
        i586 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/6eb77ab3c31267b2d314b4eff12d1581e2441e85
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/ab6e68a03d2e3687e67a959b02afd613d468eaef
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/ace4906237590f0d6eb3bf051951f77c2f8acbfd
         arm |                 openvpn-2.3.14 | NOK | http://autobuild.buildroot.net/results/25be1c34b542a44e5c685e4d672ce52ba8c7f1b0
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/166ab6ed51daf6da3d4dfcb908704a68d9527a3b
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/4af4df1645d43afb161e404e437b4dd5dc323c42
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/443242707275dc72070e0772b9f148558b63fb3a
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f04ce59f277f33a399e7e88868dc05ac3df2a95c
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c8b5f368e8180baf10e002fdf096f363a67a350b
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/2dd63b904456bcfb8317559d9adb4bdde340aafb
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f28039fa9b370c77d6be9518ec8dd3055c50a14d
         sh4 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/27440387caa35b0225aeda5dec43a1bf914c68aa
      x86_64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/320725ccb206f2f2388c032f21e6b862756f0827
        sh4a |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/8c8e6b8cd2e15df97063673da9a58e66ad51ad74
     aarch64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/9306fd82a532c6a22092e4ec7fcd6bda873c2269
         sh4 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba70748271c16664bcf9a0b353c52e1a784426a2
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/0b355b8c08fdcedb0c7267d133dcadfe5093a7d9
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba5ec1e2a5821cd3d234df06d5486b0484629b26
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/175d9644516c71764247fad47a36b2acc42fa142
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6c0eb6cd9887c28859ecadc9404d67f58b8717b0
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cbeca644e9924eb44a9e914fc4e956a51ca8c1f9
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/4aa075b61ea012f41e808587c675fbff1ea641df
    mips64el | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/25b2e19ad82c1dfefaa00b541d23b265e07fe0c6
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/53421acb92eddba2c37b3ef6d44b05070a90bdfc
    mips64el |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/14581a3257eedc2c325fe454dda1e4532ab98002
    mips64el |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/fb56794b4b5c206d260d1aa221c929b142712990

-- 
http://autobuild.buildroot.net
