From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-16
Message-ID: <20180417060015.58DE620861@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   1 |   0 |  38 |
      master |  96 | 157 |   1 | 254 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/0b53b206db15a34ccd7e823833dffc5301606378 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 26
host-squashfs-e38956b92f738... | 20
           alsa-lib-legal-info | 18
x264-7d0ff22e8c96de126be9d3... | 16
                  zeromq-4.2.5 | 15
package/alsa-lib/alsa-lib.m... | 11
                     lxc-3.0.0 | 10
squashfs-e38956b92f738518c2... | 6 
          usb_modeswitch-2.5.2 | 4 
             expect-2014-05-02 | 3 
             bluez5_utils-5.49 | 2 
                  cc-tool-0.26 | 2 
                   flann-1.9.1 | 2 
gst1-interpipe-10dba89eecc2... | 2 
           libfreeimage-3.17.0 | 2 
               libglib2-2.56.1 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                   wmctrl-1.07 | 2 
                  boost-1.66.0 | 1 
                clamav-0.100.0 | 1 
                  flare-engine | 1 
          host-acpica-20170531 | 1 
                  host-go-1.10 | 1 
                  libkrb5-1.16 | 1 
                    liblo-0.29 | 1 
                 libv4l-1.14.1 | 1 
linux-firmware-65b1c68c63f9... | 1 
                 mplayer-1.3.0 | 1 
              openblas-v0.2.20 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

    mips64el |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/825135a7127a6dc177b1e974beb2164c13b5b187 |     
     aarch64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/309442a3395da27e6f9440c802716a7b4f0e4680 |     
         arc |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/be21d49c0d66598af69d1dd18f50a2f4b16ca4f1 |     
     aarch64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/f91f1d019a71c6995c479e2f2e8bbe267a66bca2 |     
         arm |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/14065908e0f0a6dda616a480c58ff99ab034b538 |     
         arc |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/ed88b014f505fe920ae757bf26e73176408b1e35 |     
        i686 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/a7a7d4d4cfe53b45b8965932f678eb48d2f474e5 |     
      xtensa |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/2010f8a8656f2d0720523ac52c51e7138fdd2d3d |     
        i686 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/d9b8e918fa4a1f7a9470473f82bb21b3dce1acc4 |     
         arc |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/d32ae8b67c1aade7225c42a4685dc62fdaa0b0e3 |     
         arm |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/1b9ec9cc0f22a58ad37f21be1b6eb4cc064b6dbc |     
         arm |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/ed9890c3a0a6fa649acf93dbffbd2d700ae5279e |     
     powerpc |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/4a2d98b3e54ca4c9deaf7cf56fb5658c23223208 |     
       nios2 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/56da334db40bd5428e2821ff6e6e1c89364afdaa |     
        i686 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/a141e970dc43a6358115a250428e8fa10be9f7ba |     
      x86_64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/a4e14d7c7c6a58bf5b6a8b434cbabdb462928f2a |     
        mips |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/fe29eaaf3df8bd0c4e0f874381727b1c60c61017 |     
     aarch64 |            alsa-lib-legal-info | NOK | http://autobuild.buildroot.net/results/1d14e4fe4b402ec3cb11eeee3d24b715a2838248 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/f2ad7753f90f20e6b88c229d6937525fc2d48aa1 |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/fe8aa0fa28cae20c57ee0a0e4cab54e64a68c172 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/39b910134847224fe5891d087bdbfb36b31188ca |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c864895e72e3d239ea7043bc7465ec9b4d337627 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a0ec5baa364f1fd6fb1984a3670b0c3bba01b2d5 |     
microblazeel |                 clamav-0.100.0 | NOK | http://autobuild.buildroot.net/results/9a9eac08793249f4a48890591f1338b7d060d781 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/21edcbadb7d79c489da4c9afdac361a265d430d0 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/69fff25de250e207d87e44d15744d40b4c31d99e |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/93a7e724ff786a351d73044a2ab083d4e19025d1 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f601c3cd3c191b83d77fa68d0fccbb8a7e8c7103 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d4292b58f0b7633cf90deecea8dbdf0056c90041 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4d3feda19fc5ff3a4c1d6aa60e0fd5da3813f772 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3af11706c9a4c22cdd7580823cc18c79a7c6f98a |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/463703bab12f5c98b5874f029ae85a5df1ebdfb6 |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/806a3091ac6f6db8c1a825ec70a04fd8323d816f |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/24e17a9fdb2a0e7cc29a6638e43289937547b950 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c71672de327a776596be98019a282eba04ecd42e |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/909ad7f124e11fa286d217e5e1dd258721f53dc0 |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/810fcb8713cb8f1ca58192657aab8fa902ea0599 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e7ec52268e62b2d18dd51f98825371313d8fa000 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/101b8fb0b91019b2ab7721e3aaa4bbe1245968d5 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/565193940592121e026f8b8aad5a4efc9af73fbf |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/98cb1bd97750b9217cfbe0c8282829750d8015bf |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2dd207c3b87155f5072a525fc4f5ef60f487f307 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a40a79a6bf13619c913250eb58921b8db0490e2d |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/66ec5ed3daa46582bea7a87989c80b88c8b09f18 |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/eab25e47fb677717510feb81db1982ee19210559 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/bd93e8e213910a04f59516d34e6e87a45ed2b72a |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b8037c5dd0e8ecb397187b18e8744c2115750139 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f823f20f9d4e0276e40d07cefc0470ccf25e679c |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/27ef0cf0b120eddda98578cb79791c0031953a54 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/443511d6a438bc81a77111696db37f67ea192faa |     
microblazeel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/7730367f1aab4c39fa77b916b4d0185a6079d09a | ORPH
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/72772dc29d2d5b4a9d0f4c91dee72996d9a5e8a7 | ORPH
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/211ba528be28bc2a76ccecf914448f1369b2c4ea | ORPH
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0531233c289954375438632df15da85bd3bf51c0 |     
     sparc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/81ab26cb3fa90258f1d2e42f5298d4309ff00c34 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/efc0b8d7ef203252176d1d83febd0dff991d1f74 |     
    mips64el | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/a1d50ff077c727a5953945d53a0847e3622a3eba |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/12eb126256b54865749a25baa02779d1b617ac7d |     
         arm |           host-acpica-20170531 | NOK | http://autobuild.buildroot.net/results/188b64d89851a4602b815ab3cce4fa83352333cf |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/67ee877bd369019d626caf4e4e1e0cd68014031e | ORPH
      xtensa | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/fc0d0d5053245b970c72601fd7ec0a65e9b5cd52 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/6021994d0347f0bb2aaf0a223c06c8859ab45fb6 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/adce07816706ccbdbf3cdfff614c3ceead5a9b9a |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/929c0acc5eed07e537049f169d78cb6b445ad042 |     
        i586 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/733fab331359dd93d79b8f6341495ae4155d57b7 |     
   powerpc64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/f3ce84b7974079b4cd3d7a2b75fb50d812f6b2aa |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/78b6dbe6d1bfce094ae5fff3e03b78c119177e2b |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/57298c8d64c3c159e98b9e25348c2789866f4eb8 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7ebc76c6c3cb1e18004249b7b4730aeefd9c9aea |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/adff27f54e1a8597dcc24668f1d3798b16070863 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3ef5cac3366b96d8d5c8340376342dcf01aaf545 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/5f78cd1ccd66b1ddd677e0acbffa4b318c39592a |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/b9c9bd896d09b80f232f4a1ef5964bd31a99dcee |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ca105895dbe95b7e9637c3fde0c80513054224db |     
      xtensa | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/5b2b4b965c927339c145785e5f0be078a951afb8 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/6dc60d752df9d35ac575330f45bb914fddbc87b0 |     
         sh4 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/55b10b13e1fba88132011da44b8c6677b7aa32be |     
     aarch64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e17244667293011e3f5245c22dff00c8f7cc7e51 |     
     aarch64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/01f973e0057c97ff4d3ed9aec690466047f0d63f |     
      xtensa | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/69f7a88fd5e86aefdc8c927a8cabcaa382bdc3aa |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/781746f8aa098fdd93bf1d46d0b19c2df124171c |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/7adbf8f8d6794f5ba7694ab489da3aa2cedec90a |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/2529e43bd2a48e951e6cc34cd87e7b2a54756e2c |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/1b0dc9a86a33320ea45d94f5e15f900e258d9ded |     
      x86_64 |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/963dd02e83bb1d9f0e3fac9cf67bc27f3def30f4 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1ca8bc999a2cbccace0443124d8f67b00b09e090 | ORPH
      xtensa |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/6427af1be8f729aa609b287c3db1251bc324d578 | ORPH
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/d9e31c9e60752947a478e0e0e05be7ba7fd29362 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b3859013e116e42c11aed93c0bab602ed13a4a91 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3d4b6fe49b1693ce8d853fde1c6228af6262d9cc |     
   powerpc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d4978df832ca4c2f459fe42d2a45ccfc32b64f6e |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9827752c2a1e436d848ec7cf2db38a2c1744f6ff |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/128b2cf5e90ccc0dcb432adf51c1947d73d1691b |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fad2ddad51a83d4b8c80ecf9d41b9f0a2cd33101 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/06c22ff278802b9224d5420f3f629aadf1352fd3 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/71c521df32a0fa13528326dd4f7b8c62d7b8089f |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4b512945a425835865a1332472bd2ca42a8cce3a |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a8fbacb5a7614ec7f3bad42a302f0b75145d0d5b |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/86bdbbb2eea41fc322473d01345caf879291b53f |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/e1cdcdfe15b4af523c7db71952ac25163733ffb1 |     
    mips64el | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/7a8baa5680e3ef2b2c6e079e7dc56e920af0a33b |     
         arm | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/5e8045dd510e7a7011d77a06fdced374e5e44a2a |     
      mipsel | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/516e0a713e734f3e073a16c6caaa862f21ea7a85 |     
     aarch64 | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/fc40d73617506f5ae28e47fee8418f003b64f6c5 |     
    mips64el | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/bed9383e052b42029bc6a01e8449e60a4ced232d |     
microblazeel | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/403b0b53f59efa4a45a8fa54dd40f79555199208 |     
        mips | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/d666dd6a5b22f05fcdbcf8284a2695374d659fdf |     
         arc | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/031501a30ff5ad2f20350c1e838c45ce42d0a12e |     
     aarch64 | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/464f9a72637708cf3c9cfe70f1d7a01ab46d373b |     
      x86_64 | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/ef3ede465e899ba01c12d7bbf61f25cbe3dafdfb |     
    mips64el | package/alsa-lib/alsa-lib.m... | NOK | http://autobuild.buildroot.net/results/2afd10304311025e477da7e2856cb711a8bdfe37 |     
      xtensa | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/9385240e053827e36e04123426562d9bb3e616bd |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c1531db10c9209b4390bb879ed3ee79a212cfcda | ORPH
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/519b4347f496c043ddecdf15f57efb0b3addee42 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/c3daad76473a704e379634e3b87d51468a353f41 |     
microblazeel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/d1388165e56ccc04847540e1f6a06a23b000a9a9 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/2487566be5fc048dde3511ef6a6ef94ab7cb31a3 |     
      mipsel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/ef62d93b3ea5cbe0a8199b4a78de482b2db7daf3 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/0c602333c9840118bd7c141c98a165d4bc23de9c |     
      mipsel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/90998c40b22f5270bcfc2f67069e0800af032330 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/a8bcf58b40f2bfa6700ad07edf635ff59a8c3cbd |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/d33a2ceaab40a6bc6c6ed4b5fa3319b32b4625f2 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/4dd12b7854c0c44a4b96b811d29772558c6575db | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/468a7e6b049f159fbb4e79d3a12b53ca890f6933 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/61b9dc2148df2e8fd0b30e62aedbfd30bb755e19 | ORPH
         arc |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/30bfd02849fef68ef006953f69cd642c6c1b7934 |     
     aarch64 |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/b7d8f22071b693f8c55d3853b9f7b080531a4587 |     
 powerpc64le | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/303917b0fa397da866b2a36746c385f36258ca38 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/baecd6823eb721446bcac802be4ba8a25c239bd9 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/d64caceb64764f09a01ddd46dac6d69688a8122c |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f21fa1fad7f6d5902cce6cf4277907adf26975d8 |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f6a0576779f60ef9707ddd07c891f94f44055f51 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f42dc937b483efc08008f6d5dfc25ddd823a692a |     
     powerpc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/79c56ca3eafca244ddb26a30531d6be9c35a8cf1 |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/3b7f1d0fc5580ad97988baab56b387554911925c |     
       nios2 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/e9b1cdff21347a4dcf6b05f31aa9f065a4a9b675 |     
     aarch64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/bbba6f713b75effbe272179bad15a28215dff972 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/55758522ca61fefee94179385b134f5862ecd82a |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/e4a2f5b90c7c04550b93024fbaac33c3f38d43cd |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/1665d307314072a0003da7fdbed955a3cc1b27b6 |     
        m68k | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/62e4bb8d18c0c9d5e6b636fa1d8e218fb3fbaf1c |     
 powerpc64le | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/a2beaa98d58b26f15306be98ba186c6f52d2862a |     
        mips | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/aa7a28580447bd51f584f98b42de0b2588ce1ca1 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0b1b59c17811bfcedcff098d2bbe375db097f70f |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/278ad1eba7a241d48edda5abde84a278c7bb4e2e |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2b208918e4e19ac3b363961439eaeecc8cce7114 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/011614665930c4b37b4f788d1d33bbf417f12ebd |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6483fafcc484cb3488f1f852932783a433d0fbc2 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/165a0f7dc6179c4f3b226e5947db3773c78fdb5a |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b1aff969fc7a929e709e34bbe6790ef52052f708 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a592f50d3955bb75759b3e0bbff383e773002b1e |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e22caa6133b134ed0913ea584a621f624aaa46ab |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a87ec56dfda4f3f4317367b5c98dd259c11e2e8e |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/bcac4c4efa7b1c3d08905b0ddd3492f8cb05572f |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/384bca185f4e9fcde284071145af1f1766c081bb |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3ad0a87f498e9a6d7da42ffb313201d756cf6c2e |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/69a6c71fb1197950fec9de2642947e7f3a1a68f9 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3ea5029eb685fd64b9ff84f4c68664a3a73c7fab |     


-- 
http://autobuild.buildroot.net
