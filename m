From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Aug 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-31
Message-ID: <20140801063013.6BF72101443@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-31
===============================

        success : 53 
       failures : 96 
       timeouts : 0  
          TOTAL : 149

Classification of failures by reason
====================================

                     faad2-2.7 | 14
          libcdaudio-0.99.12p2 | 11
                  libsvg-0.1.4 | 10
                libungif-4.1.4 | 10
       liblog4c-localtime-v1.0 | 8 
                libsysfs-2.1.0 | 7 
                 ipkg-0.99.163 | 5 
                libinput-0.3.0 | 3 
                librsync-0.9.7 | 3 
                    ngrep-1.45 | 3 
                  speex-1.2rc1 | 3 
              jpeg-turbo-1.3.1 | 2 
              libarchive-3.0.4 | 2 
              gutenprint-5.2.9 | 2 
                     vlc-2.1.4 | 2 
                gptfdisk-0.8.6 | 1 
                 gnuplot-4.6.2 | 1 
              libmhash-0.9.9.9 | 1 
                busybox-1.22.1 | 1 
               ruby-1.9.3-p545 | 1 
             util-linux-2.24.2 | 1 
             lttng-tools-2.4.1 | 1 
            libvncserver-0.9.9 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                  cppcms-1.0.4 | 1 
                jasper-1.900.1 | 1 

Detail of failures
===================

       arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/fbcd7a46fba4b8963aa0740a66d3cbd87eda25fd/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/49a466daeb31d4adc2a850e896af28c6f48163ba/
    xtensa |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/d16d22f9ef3cb9299f0849aa7cf5c6bfc242539c/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/9fb23101a17b70c74876325b8e084fdf79075c10/
       arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/222cf278c43b67fab71adb9b342a41626c0b926e/
       arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/599514820c3650f4152e0cab0c837db4276e7036/
    mipsel |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/2258621c9ea34f9f99dbcd66df0948cf558a9b14/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/8a70736f0610b99ab782e2eebba4cf88f5829a01/
       arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/de5c81d2f7e9a006e8cad0058c35132414694426/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/e6c0f08856192ea2b30ad63beec2de57f472fb0d/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/ea90c5f7d2fcc582c4b80d88bc8f3ab70f69554f/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/c71259490471bd1da9732a240f3f657376149dd8/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/94ffecd6c58918043e421a2108d8e68da52f88e0/
   powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/71503c439a3ee6da7b72a0aa01bdd6882d4a94bd/
      mips |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/2c661112e4f2d353f51a90a328466d37f55f5ccd/
      i486 |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/5d9a05fb70e8a65f2399c4f38375aeafb9686ea4/
      bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/f62f29619d4dbf3264a4243ef6cd89f9a8d73140/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/0c458d7dabe08675becfeb10ff71beac3424cd58/
       arm |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/78bb5a12e66b61368d1edb11df9e82cc7e92877e/
      i686 |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/1be79a027d6d1252e3e3277a97409f2267b34a0f/
      mips |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/ef9798f777533d7df3792259f3b8cc685f582539/
      mips |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/7dd7e32d1d31ebab1d39781682c91995c26b9e95/
   powerpc |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/3e8066b9ab9fe34b6dfc7c4dc38f329dad77ee31/
       arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/add50a7f42d90d6501b44a4b90af3cb23a723c5a/
       sh4 |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/b65e097e8f2d8f237ff9504b54bb0aab036bf1c4/
   powerpc |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/8a4d19d03669c4c3a37168150913b00e93bf1e58/
       arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/34e4898e2bdc08e5d34e16e556384b3086b76467/
    x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/40f5fc45b4de072395611fb5bb3f160eba83a027/
      i686 |               libarchive-3.0.4 | NOK | http://autobuild.buildroot.net/results/7747a043123e958952a16e0c0db823296c4e0594/
       arm |               libarchive-3.0.4 | NOK | http://autobuild.buildroot.net/results/d7bf7cf415c3529c4fbe9b63caa404a4cef6eeb5/
  mips64el |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/86bca63fcafa2a87261ca27908e9bec414e7f302/
      bfin |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/07fc4fcf93ac33ac7d7f74bb84b299f1e58498fb/
       arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/414e9c85716b1edadcb1e4138086211b6400a2f3/
       arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/05a8d4f864d7789b44e9abeb0ca98ac9c9d8a27c/
   powerpc |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/c337882071e55638d7dc645294215e9eed3b0098/
   powerpc |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/47c8733fb15d42a23b334328a3d9a40715e8ce1c/
   powerpc |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/8332d6226afff71f48c37806eadd9f1e516c1119/
    mipsel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/7e50ee64c8bb3a2b2212ab2597ebd8c0cf2e9505/
       arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/99aff3a8ccce083a53bc895774309ded6d44bba1/
   powerpc |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/03c2fbc1b1cae9cf7b4a8487b5ab10fec102768e/
       arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/3e96929a6f3c5fc1e4cf634293e6bc27292528a6/
       arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/4b4e99dc1ef4279fbfea10ea19be1bdbf0647abd/
   powerpc |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/10bbb6d334d041539fa0969591bc8097b153ce27/
       arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/43e5139b6b41a76ed54df4b71f87c87dfe67236f/
   powerpc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/5897c52e30c3b0c89a592344f272e359edd5d6fe/
  mips64el |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/4033051db5fe7fe52cc34637466da12a85c685cd/
       arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/304950ba87f2e1a482fba66842ae93c9119a7ede/
       arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/a4bd4b5dd874026d1ecda4e2515ab39d0db3dcac/
   powerpc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/830dcdba377f29d4dbd0e61ba7363d3f27188287/
       arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/8b75053c3ce0eaafb993a45de8cf0345b894ae7d/
       arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/96261d823db75220f4f5e59da762cf085f8df965/
   powerpc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/66a3079c9a6c3594591636ab30a5544c744e5474/
       arm |               libmhash-0.9.9.9 | NOK | http://autobuild.buildroot.net/results/fbb9f9a38312574a08a6062cf0908c7a6412ab80/
       arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/ff36714a60928c220439e14628c59e109cbf02ab/
    x86_64 |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/2859902b5706bec7dff585380ccec999b80f636b/
       arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/ca0390998e0b6bfc7e7c8400ce9170d5d070ddf9/
    x86_64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/6619ebc919da9aab8114813642c30f477ef51c2a/
       arm |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/ffd21cec8f50f4d860fc6edcb979df8869ba7853/
   powerpc |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/63ef0cc9878b6c45a6f7fc4d5000174f9a3ade53/
   powerpc |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f58ff895022bb511b1d2746133c3275daa0c8283/
       arm |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/ee52ee70a3efaa8270f96df3dab6b299a97299fd/
microblazeel |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/496dfdf9078faa07d5de7f3d30f950e93e278918/
       arm |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/bf872f9459063c01c63eb2facd9e90170345b739/
    x86_64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/828be58c08be938dcfa1bfbfa6d92f687b04415d/
   powerpc |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/1c54154b07a838f8279164c7706c880b763ba38c/
   powerpc |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/32c50b74e1c2caa5f8cb0917765c2b4f48166c4e/
  mips64el |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/b7849f42c234af95b6bd6c36101b928c91a863ce/
   powerpc |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/ecf4e7d6812f972d05c95203fb665235856c0817/
   powerpc |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/ea855de71ce47ba4afd8cd388cbbdfd0c86de9a3/
   powerpc |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/f094a29698fcb3f3fe03ad1d5ec4298a67959438/
   powerpc |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/87602330fc8ffee947c9617bd62323ac4a38dd63/
       arm |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/2727a3bc03dcd669082d82f6710261e1ccbb2d27/
    mipsel |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/69b059784957869ff4c9ce337f74fe75bc9e227f/
   powerpc |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/e1983fa27d188dba8d20c8fe5413bcdbd557b532/
  mips64el |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/63240df174dee6d204ab8df26ba3742f08512e2e/
   powerpc |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/e6dc3c67d6a7bd22b0233ea23464ed55ba194026/
       arm |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/5d6aa355a1d3547d0eaeee3bd0c88421d5a3eab7/
       arm |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/f81e8d5daa382fd1d7008819dfeed5b2a551c22b/
       arm |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/424171bef84131914f163dbaa960f5b16546baf3/
       arm |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/34bad7ade31ae8df7979352c796179c2f6f10271/
    mipsel |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/e3700d6e356169b9c0470d01f013098f3c7b14c5/
    xtensa |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/900f05ab50dcc06e671615bd463c893348d1c972/
   powerpc |                 libungif-4.1.4 | NOK | http://autobuild.buildroot.net/results/f38d8915b9fa96303272476ab6b2cf2427438161/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3bf952fe2e3ebd8308e8ac5001896474790249d9/
      mips | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/081b58cae5ce05c32811a1d1d442e66828d9e73e/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/2a6729ba5f6af85fe4518ece4bd4d5235d61ff6d/
    xtensa |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/c5a06d56a4d1cb10ba5d6554a7833e507f9a00a7/
   powerpc |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/2753e48d20cc831a89bebde55ae83307c22ef504/
      bfin |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/3306e746286a35e1cbc2ab8defe7a7781a001c8b/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/92e37d6328ae14bb30656c39b2cfe866d055e31a/
   powerpc |                   speex-1.2rc1 | NOK | http://autobuild.buildroot.net/results/2c1de565d78f414a16e7338d9ac82f986f72d5d5/
       arm |                   speex-1.2rc1 | NOK | http://autobuild.buildroot.net/results/b5e771abf2d37b3a2b9575bdf7aa654a23c43705/
   powerpc |                   speex-1.2rc1 | NOK | http://autobuild.buildroot.net/results/a366500ec2acd8a3da1dfb0231db44ebba24a145/
       arm |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/3bb8d4662995a11e8e6cc5fdaaba9e25d4c0e0ec/
   powerpc |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/080fab04cd252f765dd197c9941470bfdf6ba629/
       arm |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/3c53f6e0f3c0367b760bbf2140acdb06b2b50223/


-- 
http://autobuild.buildroot.net
