From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-03
Message-ID: <20150804063017.1618610249D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-03
===============================

        success : 216
       failures : 45 
       timeouts : 2  
          TOTAL : 263

Classification of failures by reason
====================================

libsigrok-fe473123ba836445d... | 4 
                   tinc-1.0.24 | 3 
                 libepoxy-v1.2 | 3 
           libcec-libcec-3.0.1 | 3 
                 empty-0.6.19b | 3 
                 qt5base-5.5.0 | 3 
                 mesa3d-10.6.3 | 2 
               linux-pam-1.1.8 | 2 
                  boost-1.58.0 | 2 
                 clapack-3.2.1 | 2 
             webkitgtk24-2.4.9 | 2 
                   audit-2.4.3 | 2 
                   dhrystone-2 | 1 
                   bdwgc-7.4.2 | 1 
 make[1]: *** [all] Terminated | 1 
              wireshark-1.12.6 | 1 
                  opencv-3.0.0 | 1 
            c-periphery-v1.0.3 | 1 
            libnfnetlink-1.0.1 | 1 
                sysstat-11.0.5 | 1 
                  guile-2.0.11 | 1 
                  prboom-2.5.0 | 1 
                  poco-1.4.6p1 | 1 
make[7]: *** [libavfilter/a... | 1 
    xserver_xorg-server-1.17.2 | 1 
                 libraw-0.13.4 | 1 
                   vnstat-1.12 | 1 
             libselinux-2.1.13 | 1 

Detail of failures
===================

         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/9b0cd0da4b2d42e79c6d43c3cea6f6cbc074edd8/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/6047307036fe9173429e783138e2164243265ffb/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/382da2eeb6d40353d3b607cc82eba0acabf7701a/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0be6383332adec10821093fe39d978817b01d0d0/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/fdef2c1ffa137bf96d17b0e45a58276b1c1f4fd0/
      x86_64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/94a764738bca82b723bed32a8047ce8b15d216b7/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/4b0c479300b660920cb22f17188f01f937b73c13/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/95f52cf0f3b6aed07b31055ccdf51cde4e0fb8ca/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/674e89a40bf9e7a99aac6c78aec8adfcdff55a52/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/e07aec9a839e89b7452b13bf5445164530e27414/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/562f506693ea7cdb94a1f926f3f642704cd8c2d6/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/b324cff4a59eb8a417ccefc02b214d566751d551/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d30c63485a29282baae84fa3c7761cd4df8ef928/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/9fc91ccd7ac0a302a5209ef13799b402649749f1/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/dd61c186e6d85a9b30cd32edb74a52f7a4f73cc8/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/ba347604b150c1833cfa5d7c5c6af8e5f8ea639f/
        i686 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/9d498dcbb4bbbff7cc24bdded6c25b7a40fa1eee/
     aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/49c831917efa29dfaedc1f112243f4e93aa4ed23/
      x86_64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/334c0aa9424119685b79197e96a4bf90188d888e/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/668c637f2afb8d77e3c572acf66343c4833ea51f/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/808d5592df62edcd87b9b0369533f1bb75733680/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4f275725d772160752c600603280c9170ee223a4/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/ffc0a73012ca63f26b05bd04162a8cd5cbe0b1cf/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1f348d86f6c591bed66320878b0fb8bae3d213cd/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/563378e3f6320980153c8c972ceba5e913fe933f/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1d75497009f1e3b06236b3409fd768dcf7956b87/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/bc949f2bc75b15a50620ef15686f398086294894/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/c8310b00579a9d183c2bb35a7f3861361ef20d76/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/a51604e5f0b3192e01794a143aeee2f38e8c8f62/
microblazeel | make[7]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/4f6f4e42f9d6b2d40afe9bf62a5b1515507c0b9a/
      xtensa |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/45a48adade10e704d572e221cff8dcff9748e485/
      x86_64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/25696febc32934ff0e6b795a13a7943ff421d931/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/10ea2ceb61d63ac340fdd6a2b6d5f444ca599ed8/
         arm |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/952f05efd245ba59991f3c5be02a0572e8b9e544/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/db0b4badae741a765d9c5430ea43a8e280f4c75d/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/5d47432dae49562c3907280e7189183cf97509ee/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/75e68c829ea7f328a31d913bedee4545e1fc5d63/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/84695e4a9ae409aa250173b7895db43e17361a76/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/360f7b8252dc9f6bb47841b1d7207a121f90048c/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/85a6560c33d05d0393fc3294ab5bee073844f9d4/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/a7accabc100fa462314eeb7f33cc32e7060cb3e7/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/1703776aaee1ceeb8bb211d80c9715c0761c11b5/
     powerpc |                    vnstat-1.12 | NOK | http://autobuild.buildroot.net/results/9089006fd9e6a097af0eefa189429cd2a487ff2a/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/414ddad7f22b681d37a558c8826248ff95ce6e49/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/321f01c5ad34fa8edae84d04addf16143589c124/
      xtensa |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/2eeebbcd02a0dfa339935cb8ea2c6d81dfad5167/
      x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/eb45d4886b57e4849e85e7d40f23f26371178130/


-- 
http://autobuild.buildroot.net
