From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Mar 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-09
Message-ID: <20180310070008.C4E38207A5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   3 |   0 |  34 |
      master | 135 | 197 |   0 | 332 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 1 
                 mesa3d-17.3.6 | 1 
                  stella-5.0.2 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f8b38679d7b61e03add666c66308762ba879d7a0 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/91d62ccf7679c5fb77abe0bcc0f9a078992c2dd8 |     
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/ae90a447248a33af5dcb12d3fda8db926a5ef658 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libmpdclient-2.14 | 107
                   libxcb-1.13 | 37
              host-libxcb-1.13 | 17
                    htop-2.1.0 | 10
                  host-go-1.10 | 5 
                    liblo-0.29 | 4 
           cups-filters-1.17.9 | 3 
           host-cryptopp-6.1.0 | 3 
                     php-7.2.3 | 2 
             bluez5_utils-5.48 | 1 
                  cppcms-1.0.5 | 1 
                   dante-1.4.1 | 1 
              keepalived-1.4.1 | 1 
           libfreeimage-3.17.0 | 1 
                 mplayer-1.3.0 | 1 
                pinentry-1.0.0 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/370868d98917cb9abc186a2055cca782daea718f |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/57b7457b9443257e41220ede4077cf5148930dc0 | ORPH
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/483665662f1512135502f8828bb0c4985f72edc7 |     
        i686 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/d411ef7e34406e29603a5c149e92c9c7f76a6475 |     
         arc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/aec2903362a2f15367c8e55265696b9995af3884 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/98fee045ad05dfd5db8ca3d4b97e99b7afcc0cd2 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/9ab386124e4a09b50598c6f95ad40b25a83d227e |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/d97434b9f15b04a64b7e6496313f6b270e1d3d28 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/fa32101b3871e409155a92b675c4884f29d190fe |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d4fedd5349e71087ef41868f1743783ca86cfcad | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d4032e7c95df4e16055804c0d128380dbf8ba67a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/18adb126fd59503ce0180f04255273263d6f2eab | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/64281aeea6d3b567d1621f5a0a1911155ee29867 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/a0178897043ab853a7481d477804bd7ba96b84aa | ORPH
       sparc |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1fda368bf3fed25f8c5733cc87361d78a7cac024 |     
        m68k |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0aceaf22568044357c12abd33bb65db46f6fc2a1 |     
       nios2 |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6927903ddcd58ee76f136193d0691cfbd63b54c6 |     
        bfin |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4f659e15a7c42374c14cc804ec9cb894d7a68a44 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c62f9950afb84878e2cff508646b510b94e69fa4 |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b0af88aaad84ea44f3e6b01627f6b49672a822ca |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/811ce13577c418a2271460f81da9b152d2062ec4 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/ddcac70b98dbbcb59aba6472aea9404824b8faf3 |     
      mipsel |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/96b98ce61c1f6230e5ad8635ecbeca2622faa33a |     
 powerpc64le |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/af4518dee53fd7dfcabb902dfef8d0dac3aabb43 |     
        bfin |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6505a6f06167a8c8d2e5f684cff310c5125513f4 |     
        mips |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/76cb7d291aad8e8bbded324c1b4646db0420fbb7 |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4b065025f271e17e4f058666c22046ac6ec62427 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a7c79413ae5dd2ac4130276ec5bb77fa32755163 |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c70ccfd3f525c14315f0eb10b826c93c83a43a24 |     
        bfin |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/77837247da42688103d5aa6bbb2c990d0f261536 |     
     sparc64 |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/295a12a0983e78280ce2ba12707be7ff60985461 |     
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7355fa2f76b2729190dce585241e9d2037f6abe1 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/bf9e99a13d0fdb5d2d498bc9993060244ae63853 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/fa9d432db5896a6c0a5153bf18b8d7dc8f9566c2 | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/564fec7f9cf5c566015334c1ec83190d5fe64ed9 | ORPH
       sparc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/0031a64a076dda03ada786dcb8b7d7bb9ae47a62 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b3d5553904ffacc3ff7a9ff4715b9835d3929d91 | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5e4732564d5cbb08583147393ecbf0f149e8f412 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/43a1cdf5b5949e23d7f10bf0593262cfb307e53a | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a5fbd6f2223153f83b9a65da8a87e3891e902ce1 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/502c2e14aa2f20f22279a3330eceb03f5b63650e | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/bad24b8c94a4338e1f53075b279239d9f3c9c5bc |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fa06c824a10b078274d9f194e2950058b917d6eb |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/57c4edb9966f35c3d2ce43b934a4674da4ef3cad | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/db32f11b109a8a5f5a8171316bfe4d25db0029d7 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6cd3d4feefc91318b25e0a1cb1437bf7c306c4d2 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b82bc543df780d731138b2424032b14697d7fc4a | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/47c799107b2a1a66274e7beec68c6a505c13b61f |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d59b4d8f5d2782125dd2dd4832d5715f2d6df133 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ab5afd5c067e3b58ce96ce1250cc97e211bd09eb |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/0abb93c9030af0feda9fc22b018b09835813b797 |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/eadea9256a1766db7fe8addd555839003dc0eed8 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d1a4b3c0a5969bd4c006cc89a9741ed3e3ac0235 |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/08644fe6cab2d664737819804a441b1d45039bd4 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/882af20e567a0c7fb0d3f0976995d75f09518e1e |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c1e4b83ef0794eee472947a5cf16b13a6393a3d8 |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/7d1915fda5e08ba3bd390ec81bd24933f2670629 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c5bc5f14f8e90b28cd50145647898244059c19c2 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/f9f65367f028e8c7bd0bc32076aa2f059c0e49cd |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/fc83b9e5977b74a6a30ad8520901293559a56fba |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1f984cebbb2c1bbad136417e984fddffb0914c37 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/cb98ed325472009f5283dada5e68647a1cdc4091 |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/eab5a7d9b6fc5448792eae7c6732ffeefd256964 |     
     sparc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/f6bc208e158c25e1ff9166623985771604aa6b8b |     
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/f573270f57ce10ac3346f79748b7740e10495817 |     
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/864e30f78369a0632c51604db15e963824657f7b |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e8beeb020fe7ac318968dff640c7f2b835a2ea3a |     
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4ec729ad854031ec928e53145a6c975a3750bf13 |     
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/58fe6ec896ecb6cda6c8af2ffe2b23198d8da282 |     
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/7915a4c6d03a7361a462deaffed0fc98cd96c872 |     
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a59da2aba9ab814b98df0049993635a18c26583c |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b13c093ac1d70a45702d337f6f8baa7b53c9bb4a |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/eec10dca9906966e57b020f683b7b43a3047f47c |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/abf7fddaf07438c46200f64ed1de0521b59c7e45 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5acb3283d1fedb78a9b2472ee565c308b52490da |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/12064144efdbcb7b8067fc4987f176b610be8a2f |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/00abbdc50ebd108c641651f49228600c16058e72 |     
         sh4 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/bae2539b8cc673a67e78c24c18582f2349799ae3 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3f362c6c6f7243c7ac3c31c9f049bb2fa729ccb4 |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ad4ef73b6c9e1d03dbffbf668fb7ebcd3e22c5a7 |     
        mips |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/db6efb5ca49b21fb994378f4c77e52e1be998a54 |     
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/48e0a6e35514b5f0efa9a1a8308d9d6bb8a5107c |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/feb5e30d81b6f28fe2cac9c1aeb0826000f20601 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e9992a6aa7de6bbdf2d48ce495e058fa7f7510a4 |     
         sh4 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b11fd865d974358e70cca7ef6ad5ff7bb79a89ba |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4b2a850eb212af3329fd32db641dcc1f6f1a28cc |     
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/03bcbd0ea4f983ad1cfc651b30c0ad4d462493af |     
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4e43268a7c2394ddb7ae15eb63f1d8cf59a5c1e4 |     
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5383b77c95add343c86528b2c5258449e03507a0 |     
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1c2f5399589640d0cbb7c1c09104e3b599702e4d |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3117b4e6bb60b48613f9c3a64b93a9caadd63271 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/779649041bf19b59f17c136c42f56c4e63b76e51 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/74d1c681b74b0ac6fa7b7c137fc787b0aab99f52 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/db25b2106e4dad89986e4255e701cb89750bae24 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/15f7714689db33d905ddf401791479172812d65b |     
     aarch64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c861c191ab263c31f9ff35fd28bdfa35d3b55295 |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ba885e9b9eebfae235a89ac173c00531879d527a |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1854137c6c1abd69a1ccbee681e8642a08894a9a |     
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e440f2ea225ec432d65c908641c2945e68d393ad |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a571d9d147e599dde0e878dcd621c403bbd258de |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/209157a7b6eb59c904b624c6cc8ed481d2e716f8 |     
        i586 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4825154c907ff57002b38fa7e27dec58a1d6ba80 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5fc00c5f7cd4746680a9179053860904cd449582 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/80d0f05fd1587cdc15788643e63aac5299d33088 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1771f3b255e90b75308d3b18870dd022152aac4a |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a2bfdc53dbccef48b2e98dffd0026aff97a95add |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/70196704bc3889fcc02cb5d3d4c3b2ab44abb376 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/9392bbb6dad0f2e6637c6fefa99906e4c36aae02 |     
       sparc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/dc3e095a004fbbefb2229cdc1ef6517edc907adb |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a25a15d112c4d6f01aac5a2b5de462e06ecfd15b |     
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/437c263d5cd7d049aab1f0dd74310a02035cbc35 |     
        or1k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a3d3f8d0bbb2e77a243c054694c5fbf28fba3069 |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3034d0288d6cdb7f8004c445f1e403b761bed9cf |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3dec68a4ef4f09e2447f301eab9607025792dd3e |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c9303779804117f9d8e34b30e712bd82d908f17c |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b7de9e99b0f3a55b9e5a8430f3c85d3c98d8c299 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/01ab2bfbcc3d394aabb370623c113fe1aff2a298 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/fc81dbab21a4253fad685e34590571c50da4fcc6 |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2dd21988b1d3036ac234d888f42316b26b07df52 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/879adf7f206b46795819f551921a314c4786fa91 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/087f571c0eaa8fe099a8eaee652f211bc8c634a1 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2765d9ec90b8b3f346a27954bca4f4b0f531ad0d |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/6bd9ef78c2696b6bfcb9431c35daeef9e011950c |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4f0a2be41f575bd8a0847b4e3a25ce53a18594fe |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/83fc711b66de2f926ead5bba950de350a17aa8bf |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/cc74c51821aaff6c227900440d2f5e50ef9a8e73 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/9963b12f4056f3e73749a13ef16d7d7cf557faea |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2bf93f53e5431eacdf816f0889e9170574279d2c |     
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b4d2fafe323feb320963d9b23424bedfdf6fdbe4 |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/0f96cb81f6e8214b41a8e69d55710e6d54eac879 |     
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4f0658cd6c3bafe05a320389fdc8b79df197b850 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/dbcab5685076207761df5bf3f4615d4baa63c006 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e05e6897658e21765d1b387fbcda364ef57fdeaf |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/027302dbee2b83eb14ea5617903ddc49aaa80898 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ea0d51f1a9efabf9114208eaece45f9b92746bdd |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1a951dfcf39c62740897526bcaa8af2be9637770 |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e120ac5119ae67437b74905fdfb99be49f928b10 |     
        bfin |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c0698af4d791a4ee4882ec53f43c0fdc8aafc82d |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/848905a6eeff1876ae9c06c6ae83fbb68acaac0a |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/53e9f6f8cb97b38a81567f6a03f53e133e2d1aeb |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/f515f26a827239a8d8c454080e51c3161295c2fa |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/9557b84301957eb095a1305d01a37978ab177ae2 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4fdbefc643339baffd0dd4c5113d57a8dce1ba4f |     
        mips |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/fb1031475d31bb4786f34f25971ab49cfd57e5f5 |     
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/720b0a2bf26050a4131bb8e49a6d61aeb055f7fc |     
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d0cd9d0bb862eea0fe4be71b76fd5c394898c72d |     
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/cf47bd92b5d587d17f4c0f2974cc3fe1e5c53e6d |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/844841a8d0ea584a6e6f06515035783ae60e53f3 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/50d4594b840feb712a59cb8d93372e102420189c |     
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/26951ddff2dc2b7983402dee18cdde3a58bd148d |     
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a64ed5ae47cac59d78a9c67c47eeca0562ca9b17 |     
     aarch64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/6c23ff1dbc4705e656fbf739d7ca4429608a0895 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/0f8c6c413d4f0f9325c3aada48d5499d8b0481a6 |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1376d04c2df482afbefcbdf9a540aa906cfd7c18 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/19a2f6a7f672e0f43f5091b95f62985765fea972 |     
microblazeel |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4b6f3b1c05a85205a2905a2952caa9a23010d889 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a009c77477f974a25ffb41e200983bda831824bd |     
      mipsel |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/19fd132f5fd78b1674f933c472f827a92794ed1c |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/8c01a13a713eee74780d07f5440a3b278f471217 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6fd81f7d72d72f317c7a2f3c0634f9e00c178d75 |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d9805eddfd5e2097ddb6e3b860b431c044e6f966 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/576f43bf2971a579444ea4220e65c5201ef3ee30 |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6c394e83a2d903d729f6868c8992b8aa9daabb45 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/2beab183046db1d81a7a5b44031f6ae0691f25c3 |     
   powerpc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/31ed592435fd6c8a4972cc66806dc22af3f24d0d |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a4247acc431718b2b8601cacffa6dbffa9423c65 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/905001671ee96ede8209bce83fb8f7e86c80f0bc |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0db91248d2cd91053006cb741b46e4fba53d8594 |     
      x86_64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/14cc240dfe562a67feb0beb4498290a8af7708c8 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/db7aa191226548d216ec9d570fdafab939d50bea |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9b7f786cddcd3e63c899ba5f55f1aa638ace48c0 |     
        i586 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b8a3557165f810537de74284efb2c1af88d27b1e |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/634a44766e01f5b8bfa279a1331c676a14c109d2 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/5d245345ccacdc98107f1ac54443dd33c54770bb |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b16d1286784b15967e8053b59f3b778084551bd1 |     
        i586 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9a28a001098f241d98dbe33aa1d129e1b280e62a |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/15e35b4ceeff3f6790757a80e2f65cab80a37ca7 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/2595af6db11899e6a07b4cfa182ebfaed024eabb |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4b8ad10698f6fee6fe9063fb31e9e738cc793264 |     
        mips |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6dc37559d53c0818601cd563416ab47f91b4fdea |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/e6adca9f56e9318a583c42307390464f196b757f |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/541e3ddb2dc61afc558ca0dc22f3e5f59f2d96ce |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/385b12664575966426421875a792fc052aaf6af2 |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/13dd1b5e2b132561cd3c776982260eeabe470e0d |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/5a609cb9b2c0147f0c4786eee52fa89eeeccfc94 |     
       sparc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4473ba4a667ad75aa22c4ec9e9426f2677bca774 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6eb10d835698fed1e61cbb59e7a4c4e8f7308384 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/2726965b8896c76b2cd0db43f5a7f85eae5c943d |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/001d966fddeef635e22554b119efee671001a220 |     
     aarch64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/559a2dfe5bcebe28c48f84949cb2785be7b09d5f |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/848462f35e9763197c1e3285be808d7d4550c174 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3d6780dae59848e5f2f6c4a2eb9fece234af333e |     
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/8ab968d5d7cd4b76c87b9a4626402ab7ac99b5f3 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/717248254fe40e7513daa798512f80a5aea3b8cc | ORPH
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/e116b958826042ea161f1d255e6dfd811dba4949 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/5827a724c7f24218010f4cdd24924dca457b0361 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/3e0b7035e27ac830ab1a0b7effbf5ee6ac9dd481 |     


-- 
http://autobuild.buildroot.net
