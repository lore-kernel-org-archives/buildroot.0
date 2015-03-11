From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-10
Message-ID: <20150311073018.09C1510156D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-10
===============================

        success : 234
       failures : 53 
       timeouts : 5  
          TOTAL : 292

Classification of failures by reason
====================================

host-softether-16b713b98da8... | 17
                  uclibc-1.0.0 | 8 
freerdp-b21ff842ef3de583751... | 3 
      host-gdb-arc-2014.12-gdb | 2 
                  snmppp-3.3.4 | 2 
               batctl-2014.4.0 | 2 
                      qt-4.8.6 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
checking whether strcasestr... | 1 
                    php-5.5.22 | 1 
               wvstreams-4.6.1 | 1 
              xmlstarlet-1.5.0 | 1 
                espeak-1.48.04 | 1 
                 mplayer-1.1.1 | 1 
                host-gdb-7.7.1 | 1 
                xapp_xfs-1.1.4 | 1 
               qt5webkit-5.4.1 | 1 
                 python3-3.4.2 | 1 
                gptfdisk-0.8.6 | 1 
   libnetfilter_cthelper-1.0.0 | 1 
                collectd-5.4.2 | 1 
softether-16b713b98da8dba29... | 1 
           libmemcached-1.0.18 | 1 
         lua-periphery-1.0.4-1 | 1 
                 cdrkit-1.1.11 | 1 
                     vlc-2.1.6 | 1 
              host-perl-5.20.2 | 1 
         network-manager-1.0.0 | 1 
                     gdb-7.7.1 | 1 

Detail of failures
===================

        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/a1ed8074f4812ce0ad2507d4f051af26f6772e6b/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/afff54be87f310002179c9d07f56bb7729fe372b/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e5cd59d1a89b2708263f79b50ae4823e838330be/
        sh4a | checking whether strcasestr... | TIM | http://autobuild.buildroot.net/results/d8c3d0a5cb9e6aff935cc06be389285d48a33b01/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/7aa7f2a48bcc55a2bb5cf4eef30995f7a5034ca7/
         sh4 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/da3fcc919c9a116b2156a80d9f2fed7e4ac82675/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/e5dee5220cbda69e4085cbddc842c7512d500163/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/edf03933caa8dc35cc42bbdd14cd83c1fb952a4f/
      mipsel | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/2c6a1ac9ec5964bf3659a8b85bf98bcaac1bf106/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4cd06fbc520b145bbeff2bc5fb2719aae8167237/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/bdca9710ab94b992565b642b994ac1cd7102bff2/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/7e58886819b27dad78d571c9cf68e9f77e5f083e/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/8c372adcd2cc5f14d9cc4dfe30ffc4eba2fd24f7/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/30d33595b5d4f6b23027c74683d6d8fe2f376197/
         arc |               host-perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/952c918fdf5e198d5b26d33df4dbf15e84fdbc85/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/f1853ce0f5aafa7ef4b9e3d8ccda50be7ec2c6a7/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/928edf73612ce5a24d934130af5f73cd06679e84/
      mipsel | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/b5cc7841683edeceb55ebe5769c01b5ace57469e/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/6a983bc4ef24358c89474755dcf843a9f01dc1d4/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/20973429e872c1bc9d8eac7054ae560c20df7708/
        i686 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/34a9b82b13ea253e7e6ae3b28485830b7a9c2e54/
        i686 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/5dc547d53be9333cfe77ea8a83d8239c912462d6/
        i686 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/92a6ea6d5c0d1cee3b91e1bcd0ea17d13b8974ec/
      mipsel | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/5c1a1db7c97b5b1cc345daf316d2debde8f0f0b5/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/8c4f27588d34b823250e9056e1d0eeccc7fc0d1e/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/9f88ab08d07e423fc2f01e6a1bb5e5ae945f02bd/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/4ffbb4e3f854c530b3a0439cdbe63f3a87942e55/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/48f778a891e0bf6a60ed2e4bec057c338ec25ec9/
     aarch64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/2cb11b0365f8ca1c4a77864769e73c5d8b786ff4/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/04c6b33b72a8c4048965f6a1c44bfc36d36d70b7/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/ee1058cb0615202de0d14ee925ebf8332195f9c1/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/fc2152f3e6923f1cf3a58466a4b005eec6108f04/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5980f384f234acdcd1b198cf73254e31c68bd755/
     powerpc |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/c9f5dcc30d7cbbb7602b5c482f2d160d672d2354/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/dd6b7f16e877fc37c7597b2be7bec957faf1780d/
        i486 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/c6fee7cdf2377e99923dc426a00391a215768efe/
     powerpc |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/0400c283b310f7a02b4d9ef1069fb2a9039ca63c/
        i686 |                     php-5.5.22 | TIM | http://autobuild.buildroot.net/results/e7e0fe5e044017c871be9ac1945248284eca4310/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/d52e45f664bfde2f94bba896f83bc2e1ed64ec4b/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/1e949d4593836bc45a55e071cc54ff9c00fad8ae/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f615f0c22be7285d83ad9c4baca6955ac8f20c0f/
         arm |                qt5webkit-5.4.1 | TIM | http://autobuild.buildroot.net/results/a91b3be0c2f03f6f455cf5756e00d5aa291b10f2/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7022181cd57a9c7102f8eb29532e82895ba57a0e/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/933b033f255a059549505162a98822a887a64963/
         arm | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/72eab3a6f162e3c5eac380f88b54d4f314d52445/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/6be92942c5bcc13adc2b344217bdf4374903c4c1/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/8e7db910a473eab161ae4142ecab571d6d99b18d/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2530b73fcf6e3b597d460a8076791401d0a84cf9/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/51ed64b753453060685a5ffd71b53e6abf7c94f8/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/653b5eaf434e817ff858a7763f1d534651410568/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/6d0acb9584cc3d8216bb6d396db1ca3640a10176/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e1ea4d87c3dfa59353811c531c927ccf7a6c8078/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/89d3c2351ed831e49d94da6d5b937b1d9bf29d77/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/86baffcdb786f45d5ac5de10639c466ba8c1dbad/
    mips64el |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/170d2de779981581db92996fb9b3b94fc01c79da/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/016d912b29aa65a04b7ebd684da3b22a8a862ec1/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/e03a5c6c0ac4f92ff714deaa7076e3f7b0be7f66/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f6e30f8753a1372abbd842f29e47b5e0ba8c7ca4/


-- 
http://autobuild.buildroot.net
