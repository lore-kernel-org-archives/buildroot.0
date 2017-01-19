From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 08:29:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-18
Message-ID: <20170119072930.41CBC20B91@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-18
================================

      successes : 178
       failures : 187
       timeouts : 0  
          TOTAL : 365

Classification of failures by reason
====================================

              host-libcap-2.25 | 145
                    ruby-2.4.0 | 9 
               sdl2_ttf-2.0.14 | 4 
                  fbterm-1.7.0 | 3 
                 libnss-3.27.2 | 3 
               openswan-2.6.46 | 2 
             rabbitmq-c-v0.8.0 | 2 
                     tslib-1.3 | 2 
             berkeleydb-5.3.28 | 1 
                    cups-2.1.4 | 1 
                   eudev-3.2.1 | 1 
            host-heimdal-7.1.0 | 1 
           host-nodejs-0.10.48 | 1 
                      icu-58.2 | 1 
                       kmod-23 | 1 
                  lcdapi-v0.10 | 1 
                  libsvg-0.1.4 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
            lttng-libust-2.9.0 | 1 
                 openocd-0.9.0 | 1 
       opentyrian-9c9f0ec3532b | 1 
                    sdl2-2.0.5 | 1 
          shairport-sync-2.8.6 | 1 
                 synergy-1.3.1 | 1 
               util-linux-2.29 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/70b3906a4ba66dce263a5752471fbab368a9c323
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4dbab5668f9e159a9c39f2fe0ab148bb15804a11
   powerpc64 |                    eudev-3.2.1 | NOK | http://autobuild.buildroot.net/results/1a0e76e2782a63e2b2fc2fc0d79471802afa4d35
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/abf6f4580df371733c5844d5ba8934708fe7cb2e
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/96f69059b607ec9ec95c3cabe6d79f9aa447a838
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d238c03cecac45f283f784917c1c5dcfff841ce5
         arm |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/f37977476355dc983310aa899334b611164c9be8
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8d15f63e9f74132036ae5d3155695223a60163e8
   powerpc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e9109d8cee8c5d02695fd16fbafaae8fa71e1218
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/363fb09aaeb1cecd31bdf71b1f48ec1e18026064
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/70b007a4d93c5d19d52093c3475039b850e2a821
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b478fb561d60f5e9c48869b425c97a2c97c8060f
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/59caadb19b448185879d34b1a94ca865d43caeb6
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b8c1b71b92451de7213b92f794668ca07d731182
     sparc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4b05dc8281ce5ee6c8788ff8e73afd9a4b8a0067
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/cc5d5ff9e3e46b5ca84bfc7fa82ba5e56f5e483e
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1cd6024abc5f7d634380c781da20c08bd8c922d6
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e78b89946a698e42671d1ebc5ef1903375990dc3
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d57adcf159544323419549100e3cb0106452eaae
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4570119fe85d742267521f7593d0f1cd9a51b3ed
        bfin |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/23260a1a9088a33e9d161d0541f67690628bae2d
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5375b8ff38e4844954dba277d1e2e571488737ef
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b708555dbebf01c732e8c2f9b7eee45a6a87feb7
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/581b170bcead03df13ce2e06fa6ae25b09b838a3
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4fa69e072379ebb71c0fff6234f3b246adec50c9
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e68f611f0f76871d53dbaaf5282c0c4251c78f5f
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7bb654e29c24b72d9d54f6b6baeba96f703aebf6
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/84b222084705c8ae5ad222691a15250b8f46c716
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/38a89a4128e3a7e7e1cff1510666588f3c5e0875
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0c3b4c696e66dcf86bee83f8515fc0d4149dfb1b
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/91f3a74bba203a41ef8724e90e6e504cd17d32e4
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4a89ce4357f8ce4618d255b44dc9977108a010ed
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e51565dceacdcadf15e0eec6a6943905d9d4052b
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4f5b1fee86c4a88378e4d3478e70cecfc07d7b28
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/cedd4b833c98afefaa7d696ffcef9e9cae13bc52
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d86e2bba0f97e0666a3a69964976b97ec18b28d2
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0fe075b4c0ea161b7aec1afd697e3047c5b2b5f7
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1813be02d18a3cc45d78963270c3fcf277288c6b
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/41a92aad41324c271f0e52df3cba5b0bb32bab17
         sh4 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8848e112420bfae5bfe8acc6abf6b0972c5ee709
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2e5ac295536cd3ca0390db7eb7753d2a20fa9223
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2156842155ce9dd74aed8481daea11ae85972a6c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/807cd54509ee9963f693b63f699094987277a01c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1237f5ba59f926fb848d84908c11d2a974241fe9
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1b2df8f3552a5902fb3adab7e482cc3c58ddb3a0
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/bacfcf96455cd99278e5d298b592e2196b1f81f5
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/987f1dd209515e12f5f0141384dbb1609b34f0b7
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/14bedf000e4e697fa861982abe08ef08f3dd0f22
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9112b82e24910fedba40ceb183cf106cfccc0937
 powerpc64le |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f3a2397ebc07ea825d2d45424fd6503c1fff75aa
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1d65f416414289eecedfc8f48d93596e57575d89
   powerpc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9f484b320579567a2e7c5e4dce5fab4c0698e455
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2e1e7fdd85323cfb8c278e655f3ba1faff4c45a3
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d21606e8a029c55b52f6a509c636c41d23a5ea22
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/62aeb15269d0756fc62828840667ab4d16e921f2
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/362aa30a53f5a0d71c13622a9d5a7fff5687f2ed
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f37da0bd0170ff1f66d6c3a141e6c3b55a010cc9
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a50c4ecc60a3f921083c98f5968644bd96d3efff
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/471760b0645890ce1ca0617ee7336f8105d79758
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b133f38d7a11ed3419179216f3f4174837647f14
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/10ce377481a416ce1bb295f2fe7dd486bd540a45
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/de7ae725dcd2f5f215dddb84fbc9236d12d21e19
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8b8cacf9a99d3982e659ae92a4150f5803e5b2b2
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7ef4c66739145013bccf653fbc2b769f113301c6
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ca02d2c6184fb8975101bfdad22346442ba6618b
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/869917ea0ceca32f60420887a9ed801aef9f41e8
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/08d6dfda51c0a727c23c559d7f6f2cc9a3bcdbbc
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/6a6ba52cecdeb8e45eb6604a338361faf8199af1
         sh4 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ac84ef7947af2ae449fba574e722313177ae8758
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e3e84bca6594ad50344d9fd5707bbf883cd99eb3
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dc03410d9803dbd17bcb47c1cf6d588991d3eb32
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/c8bf1289fe40a952f3db73797122609ed23cd9d4
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9ef93004d630f576c76470e3cd67fb98ff73a921
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ef9bbe5873d61ace94e85860e1285936f90bc8ec
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d4a79ddc3640d45dac45e84b7e4b34006c403872
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/35fe7595dd745a652f7a4652d1f3f8afbde11c43
     sparc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0d3991b319f71f560b88960dc22a80033831ff8b
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d4344ed1e32b1079a57ac21fd138ce72387a5f54
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d63e11efb50dca68d72e1925cd18bc17d9da1f4f
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/6d8bdb57868356cc0be59c2222967e3a5b9f3982
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5adbd323749ec1eef997263cc0d48b82d30bddc8
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/998af79c8dbe652ff59942331060e0ef38a135fe
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f61c408238a8eb97c0e5fc25a9f0b3d57dc98b15
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d3fd578d6843324f15e1cbf68e70cc65eaadf474
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a407fc4acc0fb0bc35edbc401cc311ba907bdcb2
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/59cbfc194184db2dd83d09ffe582ec568122b3c0
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/eedb30083c33f5c1e1e144e6032508ec365d7351
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/70f65d2c5d23a06c9ea6536687e04baa08a2ae66
   powerpc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/fb229fe3e0f87ee3277b6bd04189671536b920d9
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/44f4127de875cfcb5d742f940570fbd48feb28a4
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/58c98016d3094fdf7085d0fc82f524b9eb1d59de
 powerpc64le |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/289b27883dd71ca24c893ecc1432a5df0090c8ef
        i586 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a60d51edca2aa1fb40d1a4bc490f0738423b83f0
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/3bdc8677787a789b461faf3ff8a18dcb9b66ed2b
   powerpc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/40db479ed8dce371ed4fe2ffa383b986ed12eede
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1bc924148546c0ec041a96871e076c0db41cc43c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/aeea0dcf0b1966a7fe0e91c02753e051b8011882
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/cb5ce60db609617cf4b302ca63124d433cb1783f
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a2996c471d712221d4c9d8c7cb359e440eee471a
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e2e918796db99f33f943214384d9fb172a108dbe
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/3f19dba29ec6b4346922edbd114301259510c8ed
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/eea0809479dc58c99383ea0d65c0b246f51d2118
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ffaa0087a101c5bee65f8d597c6be1f74300589f
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0f6079d192e9c6aee3ed0fd44ff09bc33819c693
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2f565240ad3747b272e0a7cbfb53efb8b2c03592
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7b1bec2007e1e27245c534d54e9e9eba01731032
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1b588e2c74146913d5a27677ebfe8346644b7ce1
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/06b21266f5d455bb27429b01bf071face947d8a6
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/71cba0c19d0f2ce647249043e723a9934331933f
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/af712c49b2b56da0c1b6d3fb8addd31e81340a5b
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/00712e6a2acf40a4817db3be0f5f07a0877f1ce9
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dbb75d1d3df66e6c36a43ede3743e91e83fd036a
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0d0476f9dcdd4aed971158c70763d38ccbfde01c
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/6a677b5c0ad839761a66458a533f2d45eafb1171
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dd4363fd932be49e5d24b168c9ed20a602d81a6c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/04eb6f4df8b77fae968102e908f039a899e37cb0
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/35721e0f1fb4c9b7743c96d16c848fb71f014aaa
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e131a3f84de0d2572e65f0e7aca0fd4c7aefd90b
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dc81ea6e1b3c27990dd72b192c1cb5613b9e33e3
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8b59687135bebb4b8fbf44ee086bd48a1455d3e7
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f899ba84c9189747860adcc6d3a02aff50833ca2
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/617bfc9478661f929ad773c613a8f6129dbd1b5c
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a1c8ff73460336cb3eac56d40524eb70eca91ec6
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/aa7b0ac92a8ab7e90e48e7a85608d9e3eba9e3a7
       sparc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/411e90600a3440f6682381f0926ed1bf75026436
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/c90908131bd99b28e960510b33358726f51b39bf
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e7ae750762ff91ccc9cde3aa5bb18e6a49f0b0b2
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5ea173cef2cfb6f0eac913f4b5068fea565e2728
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1cd0d3b4c65029fab954477aebb3ef78432660aa
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/409e8da9e3e8265240c5bf919a8d262e4b4c1368
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/68ff38f7f93b9aed39eaa8d07c1c63fdfa595f80
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4b58c03bfa0549ad7b1a33fadad7cf627d840e09
 powerpc64le |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1621b2c8485c33db83936900f19663e95b6b9a9a
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d2c23e51219692603f6a21ef25b5259ca6e753a3
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8d01072d950186acb98d6f5e30f3b99b74d58383
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/993f0f0882aece6eccaf2063387f84c6bb85688b
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/816afffdd26dc5e256baa888ce0a45458e8ef2c2
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f72c4cf8ada9fc08eb000d7f5cb40ec9218666a4
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/51728d6f6d4b74f963bad894f91198644ec3f1c2
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/55378dfe69e2e51e56482ad51424580166c904ee
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/c221f171988b18a3fc28c5aef04412cb9ace327a
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7cbe1952ae18d87d6bfcde27b3052903cd1cd660
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/c453a6aa472465e3c6f3a15d7a2adf5cacebeaa7
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e28a0d4c12f4b9506a642f4c52684e00c6aa3496
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/21dae7d2e237cc87ab3358aadc7ec830330d3361
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/47fc31970775bf1a6d3e708d96727bc1f541778a
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7c23448d9d0f4cc8637a2bebc01cbbf062000898
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f5d01629323fa71b324ca6a26344223ca35bded8
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0daa44bd3ea916b36dd40edb85e05dbc8e07020b
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7260d23459210f653f92ccf4e577dd3688490141
     sparc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/35cee71f046979648332b20cb760545cad0c15ef
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/54ff751d45a85d57017981e65938acda9b2864d7
         arm |            host-nodejs-0.10.48 | NOK | http://autobuild.buildroot.net/results/b66c341646bd2e9d19cf077b129c4dcea4aa0854
        bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/db551d971821cdffcd8a12101f93a932c3693e82
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/a9a147fe4c071edd3434c846cc8299dae6723009
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/2a3b9335360acef74fcc71ab64a212bb815507d9
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/22dc356a0564627d9e300ba74bf8b430982cfdd4
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/444a3f504ac2d25f6a87e0fe7e1e5af14a4d87ed
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/1f52dc7934339ccdf93bb1e9d5004369b5f62868
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/a71ff04e028fb542b9f1302d1b3453ac08f0f4cc
    mips64el | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/8c4358780bd3f2ee75239d1605687e33ef2020c3
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a4eec562ec3ae254f94e94bee76e9118c4602cf0
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/0640114028b1e633cefc682e8d6a8283a3a39019
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/904a97eb82b1519491908f4c16017f610888c5c1
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e14f34721697203473a5b771f2b16626a3bafcf7
      xtensa |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/a48b599e3b7fd79f35e154b40f1732d4e833ec91
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8f45e8af8a58d78daf49d3bf6b6d0be9dd6e614e
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/750321d6362a8accc096c7f525749aaa610336fd
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/735c72dd9af474f3d8aace3bca9c82f5cabea95d
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/88e441e0dbd9d9c79c31b161b6b70d79b96bb617
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/23d59bf3255772513b6925ae8797f0172fdd0ed1
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1f4eea31e8b78c74b6e79574c2ee78762fd3846a
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/bc8bb9818da227de63c9795c8c0de0e345bd1088
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/1af49441b17ea5d02b6f6861d4a3f6994bd5673e
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d73ea2a4284347a8a897c54fa1cef8bc4d3e06a9
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ea4092e136e428ca99c663ccf3c377b2bcdad686
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3ac4019d335ada3964f62f44b1f1c6b33b149041
        bfin |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/66a279b735a58189acdff93cca077ea7b69c6a02
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ea66ad4b222873967bd8723a163bdda3226e43a0
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/984d31f88716e246a6d4ea3af653cb30f790e7aa
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/25af4ee8f778a542fa8725d8d2ec97c5353d8147
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/75e9180338a1e1c8a9ca052fafe6a1eed6091521
     powerpc |           shairport-sync-2.8.6 | NOK | http://autobuild.buildroot.net/results/945a9b15eaee6d413f5cf9f8e7dc50876984c0d3
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/b33b11e2b3acec8fe674ed28fc0fc08127c93013
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/d575f30cf046eecb988587c957d8d34cd341855d
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/6ddb2cd9f4f41ee03dc10a73422ad37070811732
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8a9e197ba7a292b18f8c0c36dca974685556a38a

-- 
http://autobuild.buildroot.net
