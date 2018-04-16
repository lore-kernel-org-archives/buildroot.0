From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-15
Message-ID: <20180416060018.231752072F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   2 |   0 |  27 |
      master | 152 | 137 |   2 | 291 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/51f39dafb35e9083d56018b12d6000c71f308303 |     
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/a9186871890b8c717bf0b7d7830e558ee53ba348 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  zeromq-4.2.5 | 24
dtv-scan-tables-07b18ecef17... | 19
host-squashfs-e38956b92f738... | 18
squashfs-e38956b92f738518c2... | 11
                     lxc-3.0.0 | 9 
x264-7d0ff22e8c96de126be9d3... | 9 
               libglib2-2.56.1 | 8 
                  host-go-1.10 | 6 
                   flann-1.9.1 | 4 
gst1-interpipe-10dba89eecc2... | 4 
linux-firmware-65b1c68c63f9... | 4 
             bluez5_utils-5.49 | 3 
                 mplayer-1.3.0 | 3 
          usb_modeswitch-2.5.2 | 3 
           alsa-lib-legal-info | 2 
                  flare-engine | 2 
              openblas-v0.2.20 | 2 
              wireshark-2.2.14 | 2 
                  cc-tool-0.26 | 1 
                    liblo-0.29 | 1 
                 mesa3d-18.0.0 | 1 
reaver-9bae55bd30b6d46b42da... | 1 
                  udftools-2.0 | 1 
                   wmctrl-1.07 | 1 


Detail of failures
------------------

   powerpc64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/d01a7e4ac236ed1e34b2eb1c3c042a1faa4e1f1a |     
      x86_64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/ad6e537b7c2715efc596bd897f130c42886e7eb7 |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/f346be12f688b4b8f53850f5aa55ffcefc0088fd |     
    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/bfd7a01710258b8479622ec2d1dbf34bfa688afa |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/cdf16ee507e93b703313bb18307ee3a44c7d9068 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2128aa031214d3d0a9200d7dd0b1b3fe3da172ed |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2c609dada3760db562449a73983911160b0240d5 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/bfb31f6c940b7f403295b7ebbfdbd3a9c744a2f3 |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/491bda237c13577d47f2837aefe9a7102753f2a6 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f80606544509a02b4a1faa04f2fbbfbaa6b0011d |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/407e2638f3deecd86ceec75873df7498dd1dfee3 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/7e03cdc8605b540a1d23882a3c2869b77359f649 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2febc5a4d63296ce5b964ff6964ef1008df06ad2 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e8e49d1dea2e2d117ef45c59353d7a4365cb98b4 |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/08dfbaecffdc25c44b326a9d821b805375ad7960 |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/427863ddf3dad64d6810aca4e332ed2911f57985 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3b283383e55cf10144b03fbc1d5607849fb9b647 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1fdb8c3370e99b1cc2ca7f7cdc257f1363242cc8 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/dfc3f57dea71a1090a93e2b61d2deca62c4aee25 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/42aed932bb0a9adee45b8dc6f983d0232e98a0c9 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/65eff8bd8b6d235a735ef236fc9de6047ba57df6 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ab06d1731a51db4028c86ffaefb12b62f115437c |     
        i586 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6d32bfcfa0799f979f9c4f1fa87c89e4e2b0b035 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/00c49544487e977c00ce9554e883882f7c97999d |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/07399687a918b9116725824fe7c52f887ddfb1ee |     
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/a4e6b04699f42568fd2ced0d0d7d0b8af922a5f1 |     
      mipsel |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1bdbe908bbce582b6cfc34c34eca49af21a3b25e |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/fc706bae5de7d672bb1cbcf093ce5f8db7073db1 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/d9d2acc7c1594eeb95c7b2ac33bc959fdac3e407 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/aae32d9ba6883a5e760221712fd2db97a387f24a |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/39d2cc98a1f8d0e6cf272186d7b03bd9f80f7cbd |     
      xtensa | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/9c395458b01bd13c3d40925e6043169c765455a7 |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/422221cd4f701cd684e48f96ef548797764f797b |     
     sparc64 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/e2e057fae0cdfa9021fc29dbcbf95ee4a25c0e77 |     
         arc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/ae9a423f94bd2010c3e318aa3f34cadab198d00f |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/bde03464536d161b6deaa04e7285b48faabadcf4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d6cf91ba5a12826fbef7f40338e5c4dab8cdc859 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/858f163d37d67996c44e89a6dbf43431ac33f579 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/41be29c833dc68d361b16d6f9c136593e903fd42 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/a197370f16d5f39772541b1b7ad31ea3a9b871cf | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/242a25ca0bba2642bdadb673ff0a9453ebd2a73d | ORPH
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a879462c0478c1d05f9b20c4acd8bee9148ce10f |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e45c6e7fbfcd3a78383fadf16e047178d837e040 |     
       sparc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/eca8048b4a2c5e11f31cd38e6095d074fbd91795 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3f21d2d7a4c67e389a54606d1e4bfe2a04878996 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7d8ed579341cc127e39d64f184ee701cecada91e |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/4c794822b5b302cb43273d21f12d12aa5993a4f2 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/6d4d12dd1053adef2a0725b35e3c5944473c5dbb |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9d1f3680d9be968dee3d7d6a1db6160e62e2501a |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/367dc581b576fc0f10f89604a6b84c062f9ded2b |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e9e8af5ffe779324f3bfabb96371cdcbc0fe5efe |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1e578e12f87b1ea528d557f9f7ed205ca840f9d3 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/4d4bf2af3fd50e7940efcea593688b0074369abb |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ea0fc54870044690e3fed89f9ea38cb28ae54c73 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/52f60e7bcf6e461fbf250e81f181ffa41b0fa68d |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/fe147ec7d6f9cf99afbdf6a488263108ab771672 |     
      xtensa | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/eb8e2dcbbc6a6cd6bde1f47082eb4ca0369a51de |     
      x86_64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/93d06e18b94160e5e0806efdff05d715f5be8221 |     
   powerpc64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/efad67dc5088f7d0e7c4a54cf14c57cd9d99f802 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/660fcd346b920e80540d04d68388c5f237cafcc0 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/48c6618a4a103772b2d4ce73b2ea466d38f6f7e1 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9664cefb1b79187593d289ffb6b15540d280fd74 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a80e599cf57dc90e82adbfa65a3c543c3cdc193c |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/206a4fec0daaafa62fdcc1ec6824a1a873a770f7 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/533692b9d0d246a005cbb060a2f4a77ac28c8883 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/ad31815bdddddfe7d0149bbaf39d5b169c83ca10 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/457d2f3d1c8a7e662d0c247a66a8ee6be8ef7196 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4b4605431b9ee1e3c90ed85edcd0a1a022543ca2 | ORPH
   powerpc64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/5e4cdce5f50789874f04a36b0d4d0093e869ec5b |     
     powerpc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/54cbca90742faf486e59d95b95a0b0494e47b385 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/913535dde43de28b27c29fa5144ed9a2fe6ac9a5 |     
      xtensa | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/7878522b4fca19899c7f72684c9371a0473e47bf |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f0d0923474497e329a5ab309db0218b5c73b7358 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ae0b02dbd3dc6f2c4aeb05c0176fa6a022318558 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9c06c6c06c8dd6f6017c47885f831fe62237b678 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7c658368b712e5f3f7bf4da7d5fd6c6c1f91c618 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b2c07aa124a3930248e7c0c13043eeaa3065d979 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/77c3cc08bc0291daf653a00e575f5ced4f4d6e31 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/023fe641a99f5e0d1240860715b1dd5cd0241a6d |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/20c2ea23eb080c01330451a2b76fe7a406217184 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c15875f7cdcc90645cd93c4c6d5a0c89d6948ee9 |     
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/1580f25ef6797e5a51ff3b0f644d99c1b7fb6bc0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cab352fdf9ae7b0cdd4cdeff6d55547a64e2c85c |     
      mipsel |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/725016fcc52e5c6616adf23ffc8e7e8b678a89ed |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/10fdff81d5278c743f3679ea4800c7cea37c5eae |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/f24c778574e8e9851bd4b3b04dcec22f1732aaa4 |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/77821a4a37171080fc7ee917862e77babeb06b88 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/e84ba9a88d1b0928fada4fef0229a626f76ccf70 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/c76a142e95d59801ed87b617a63e5b1859070299 |     
microblazeel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/16e96340f366d785933c95d2d76319b86de6c0e8 |     
       sparc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/5fa81f578e474be4ed21efa9cd9be1cf71531f30 |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/93a88de98e859a874bd40d17bc63f54b73dea0cd |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/a4eb7342960e4bec6cdbc1e6f0c7de76a5b2844e |     
      x86_64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/d3b0e6b59d882b42a58d5adadcded3b34980117f |     
         sh4 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/b52e46ba1db64e6dd52bf4f6676890f74a0e3505 |     
microblazeel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/e8c2fe38ab6c4b59735ab4a7ea8c358f295c38c9 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/5bcdf0a830cdf01f2242a2db175e618717ec28ca |     
     sparc64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/defb872751670d45b8d518bf11119f22ccf23fd8 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/c6ba501c947fdab6393ee9184b9cee719defb945 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ba16eeb559ab2d43e719af6a49133275c13a435c |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/3ea21e9052fcf42e7293591342ba484eef20d662 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/b4fa8b107fc6f634e0415822b707fbdb55eeb0ed | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/f8ad4cd9f26fa503cf8b9ba8c3d4e448c4f57f56 | ORPH
         arc |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/27a7b043a5b30908b83a9820f809c87b86ea7861 | ORPH
        i686 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/1cfc88bc9adc1ea81d07a0b8c8691deb936801c7 | ORPH
    mips64el |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/d6a277a6312d1a921dcacae7c4add463a1ee456b |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/a38afa8b606a0c8930dfcfc1b8cfa871db77978d |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/945e40e83dd9ec46802c6c2eb9517f262fe3c061 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/7ae513aed531593db9926429c187a3e27353ca95 |     
        bfin | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/22053259d590239cffdd31000f8d19e4f3c5a4b1 |     
 powerpc64le | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/0b2a1b29d4f302cca829df335533d467f755feda |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/7dbf37c4bfc47fb6b0b25995a76127f3f60c2494 |     
      mipsel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f3b3fba5a2f0542c6eb74aa26ab87c4f65941354 |     
        m68k | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/9a8a52082d573feb5c425d7e07d89203eeeca980 |     
        i686 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/eea27cc3687fb4b42672184d4609b4fb04348627 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/747f75935a7dbe801220a5a17e3ef60cb1fdc60b |     
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8739937d7e7c418def29c225b1a0ae5ed91c42af |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c8866fe64e269bea9ca35f414218b56d1f682e31 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f814f0ac68b87e0d65e30a97f1239627bb2b4513 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6b540dbb589336a6c187e119c364acf7dabec12e |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/acce3a7a0c8c1f24371ea27fcea1f518ca3b28d6 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4dabafa6714aa856f0092e2257999046feab16ce |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2cf61936245f99aef88f20b0b4e2204ab7b04b42 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/774743569068e5f3a3749835084f2d4e5705c3ce |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f2c9f6f0d56bbfd74ed0e1706dc6b93103a041a8 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fbdb62e5cff2920ffe67c9883715cf72ab6c0862 |     
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/79fca63ec60abd50c6aea40f7f12b5bb3244765a |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/66c613d14763529e919acb616cf32629d754ad0b |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e93ec8f7dbcd326e2f7aa60550f1824a97c14b07 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3190c307195da135f2f2b51f800bf8af0580d6f2 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2bcd9dcf6cbf93b04dafa5828fdb804d43778f43 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e201634dd1e4463b4ff79ceeff0b5b70aa99b129 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a1e2979371a539f3512d386445e8af4b3243d386 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/618f105cd891494fccc25d7f74666e38b9bcbbed |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/92042afb0f204950c05e01829af54a46eabe0e2f |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ed1e6129f1faba532fa97ef0ff869606aa3fadc4 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c849d866045609e8a05a8280cfc7d89266aaef6d |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7ee63062acc03bd5a7fc60b9b5c1296d151458a0 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1c6459c89231a43278329410f66c37bc024c8574 |     


-- 
http://autobuild.buildroot.net
