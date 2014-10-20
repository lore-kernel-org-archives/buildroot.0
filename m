From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-19
Message-ID: <20141020063015.87BD21017EC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-19
===============================

        success : 183
       failures : 185
       timeouts : 1  
          TOTAL : 369

Classification of failures by reason
====================================

                  avahi-0.6.31 | 25
    host-shared-mime-info-0.90 | 20
        glib-networking-2.36.2 | 19
            ecryptfs-utils-104 | 18
                beecrypt-4.2.1 | 16
                pulseaudio-5.0 | 13
              host-perl-5.20.1 | 12
                libsoup-2.43.1 | 9 
                libsecret-0.15 | 8 
                  polkit-0.103 | 8 
       xkeyboard-config-2.10.1 | 6 
   sound-theme-freedesktop-0.7 | 4 
               mpdecimal-2.4.0 | 3 
              uemacs-4.0.15-lt | 2 
                 webkit-1.11.5 | 2 
freerdp-440916eae2e07463912... | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                   lame-3.99.5 | 1 
           modem-manager-1.4.0 | 1 
               alsa-lib-1.0.28 | 1 
                 pixman-0.32.6 | 1 
               uclibc-0.9.33.2 | 1 
make: *** [target-finalize]... | 1 
                      gd-2.1.0 | 1 
                 libhid-0.2.16 | 1 
     x264-20140930-2245-stable | 1 
                     rpm-5.2.0 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                busybox-1.22.1 | 1 
libshairplay-64d59e3087f829... | 1 
                  tstools-1_11 | 1 
                  thrift-0.9.1 | 1 
flann-d0c04f4d290ebc3aa9411... | 1 
           gtk2-engines-2.20.2 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/66b2307efc5e3204aeb581e9272aaf48a7b791ec/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/64d603d57f739bf0ca49e081ef19b1c00a4c5083/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ac348c2cbfa08ccebfa8bd48e901e834c8e72fbf/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f298864cdafb2b3832d88fc7ff465934c8ca5984/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ce925dd86e98d730d7de733785f44dd6d59293cd/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/76e0df12140429c0650455f760631f50ed0da785/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0d260c02a2b990c9fb5cfd12d7e66e470b0f7ab4/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/bb2421c3c85fdd17fbab9d70f11b72fe09c98204/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/713f378f788684360ebd2afd0cad6a1d1a10292c/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ed5e5dcf2620250a52418262de96d90472ac0e38/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/60a2f2bddc8112cfd3380f0af449bbeef4605447/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/56783c30a3e8e252f410fbacbff93821837f3ddc/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8ea99488d904353d1775c639fec2106ec61b4e5b/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/61b3bec30034dcd920265b7be8e56ac21fb7f677/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8ce9ec20330b38a5fc41bf5e91416631f193e2cd/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c3c8ad1d485579275b523d645951ad12df37d702/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ec07999e2ce8c879827036e7cd84ee83bc095aaf/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/1b702f80cde43e49f13d852f31eccc7ff715d508/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/15974fd5f97a99c1bea8c5d052b576fd41a96aa5/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c45a994e04ce5e218f6c73d1f337d0b1fa1b3ba3/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/473b8ebb0513f819aa9310ce208be72841b00a75/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c66f778af70abc1fbb241218a9c65f263e7fc62a/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ef15bcda495b2e8cf08a8dd8d4367ae58f033f42/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/67cfa04e11f1ef4c68c24e96920108b6988c50fc/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d908848accd4da48c3b4326219a79ec84d5f7295/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/761578b7a7adea21387521d9d5d065195e118895/
       nios2 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c658e628a1201681e8a215ca5e0b5336110dff17/
        sh4a |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d326799e9b1a959778be66e36ee78e6891a7b068/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f9796f26349cf8d6b878e094aa41de4032750eba/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3a2b20fd2469dd03e8f2566cc701e4776f55cb8e/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a56fff01993319ec2ab43bca21f6a323def686fd/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/983baccd65832e9b28b7bfc1735776d0e91ce272/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/197fe0beaa7c7d1b53db25a59825b920f5ca00b9/
         sh4 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b353696a01ae85ad0b0c379364aaa9224e0bde42/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/870316b139c39ecf3b7225ae26e1fb9cfbf92a31/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8a5703646294ff6bef084db47f613b3908c1a4f3/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/01e1289873cc4e1f8cb72721e1dd8f33cb08e7bb/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/be54abd3c9abef3f2899742a86e108887a64f588/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f2c60543ada7ed2d4047edd272910c542271fea8/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3570e04293e783bb699b0bc2831258ebb23d50bb/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2138a80753f6f97d034076f5191f4512d8454914/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/96795d40aae3f18d5aced027f09a7fd80735ec59/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/766f8948b81d793e0d43835ca1f34ed3f6fab7ba/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/eff21b13f94c0b6a9e78d6af268adb7aa46f8067/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/efdba1ed2a8638dc9028d63f2ee5d404196895da/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/08b0268e1885b03a4cf9a37acfbac0a3453f621b/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/171d39b3b2e1fc1b7d5adafb0b67ad1422e34974/
         sh4 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/dded8e0a6d87655517545d3c6328cb14693aaa5e/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/23abccb1a5bab881780990268899538e4be4b66a/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e56cb2f2d9f93bbd185ed2257fadee52c474c8b7/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3a4b1581e9933e0d5ee6f66c14cab4c4fb1e0088/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/953f0a0885989d10f08c75856aeae254ec1eab68/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/86c4efd01f571588ea478bd5b3e03be087f1417b/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e2aca904ab2ebabbd8b7ec7f3813fbb91720691d/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7bf2a1f03817a9907a1a6ea39df33606736baa62/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/278def1ca973589c6591999d3a283788baaa8f66/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e79dfe87709e9c4103461e6ceee88ae07e2cf28b/
     aarch64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/de9b19b1b8393b9a977e5fd8b731f10905090491/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e2ee3fd6ad960a541d4b8f944a3a1f562ad3dd06/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/dd13d65e487a58059f29c13395ec4b348e14d4aa/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/04a21b4e956d3d662ec4018c22f75c9675c50874/
         arm | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/828bfacfe129872b32631244a688fe0fc1c7e20d/
         sh4 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/7e19324f0376b83dd799be7463557c89e5c6a045/
      x86_64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/ec8a13b78a2482f8e52f76bce5dc9923328e8a22/
         arm |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/726f4731f9792dbc86109d275e5d326d8fb4fa9b/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/8337f2a82757fa7f211aac546c9d9e99f6943d4c/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/f6accaa156ab57f8669529741d1da374a4bd5c3e/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/6048b524dcdb5d068dcfef79cc7d24a04272e312/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/45b2e9f3c2b3b42eb0b1f854445da50dcb429a6d/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/f6f1824770ccec1dbb4777c769e2c62a1a936085/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e17f7f81a2bebe1f1257567c53991383455645f7/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3a654a2dfcc2522831d890603d758c7e9149f57f/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/9447d9813d3b3eaf6736e6b9b7ab9a7b67816591/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/a2dfd678827196f716448c5b12a88b5d98539515/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/cbf4c9d363270413391e11e820ddff2ee2fc869e/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/32884241115fe69f947fc6f7cf33680415b40070/
microblazeel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/230b86b9e67900aceb2a1251e828a0a270044512/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/78ddc53a8514e666753a2abb1eee03af6d52d88f/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/fcd684210cbe1bfbdfadedbdaf972e1be1e6f6b0/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/c0e954f01b6a5fddd342091513e3b32f4873bdb8/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/2e6235085405b982e10f8725bca31ab614e096b4/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0de297e040515b94267ec8c2e0fcabab3128ff97/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/498ac1491914c1f0bb72ce20c8f9c43c0b0d2d8f/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/74bf48ac360bf6e975b6f29b5dc7bb4c4e7963aa/
         arm |            gtk2-engines-2.20.2 | NOK | http://autobuild.buildroot.net/results/d257acbb85db279ee04c2fd0e7a1573766d2483e/
        i686 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/5557b262bfc344700ed04563a40f10bc2a23eb31/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/8b22b950ba9d1635991a97e477ad5268f08b4004/
        i686 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/260514350f1136f2dd376af4520ce88106408213/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/b3ea5097c15116bc604d24677f26697723876404/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/6e648d52ceb1aa7c377e62180e3e804e6ea6acc0/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/0e82c05644d3f293ad399554320d17ba72de654f/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/a62debbf2acf1e56908cd2c2e56171e5e61d3e5a/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/6d7e19cabb9bb6e6f1c88230f67b94657fbd8d6c/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/fdd443e3d2b8ed8e5b3e0397916f3514322b98f7/
      xtensa |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/4ea4d38bdf22139909e067ecd06e813dc6eb7a41/
      mipsel |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/b2ed5cb277a195e4c5b2eb2b3f454533b1bb09e8/
        i686 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/8154af8793d8a189c295ac406fc3ed876cbee16e/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/21ec0c194a66c92ec9e0a8b67914e098650da456/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/3cac5b9ab582c78fff04aeb2638da7d54bc7b9be/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/e7ce9c1c507321194de52d4f6aca9662306e3923/
      mipsel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/e76e12186e07dcc71e6dcadda69ebe6f21785333/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a4e9d7cfcf645bea65fd5b479446a0407f23c5d2/
         sh4 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b931fc3959a9434f49a8ca9aa5cff02647909bde/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/39109cf31f3055774c73402a7e39d756a73b2bf5/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/eac21e000b78de15514d65eb3a39ec195aecfea5/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/98037a7b3b059752da1524ea51411f2d7feaabfd/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/4c91d23c4ce95ccf511d1bba6b613c451a791f36/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/d0dbe9e384c0769e1fcff86cfd9b19ec97434971/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/60475c017723d1996d00e387aba64904a4aea471/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/f6b27e02b3bfcd6552e07ddfa755caf58e54ecc7/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/f22aa56700cc58de6c4c463736e262f807931322/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6d727a1660b0a3b7a45a28064797096797e38f4d/
microblazeel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/209a1657623f938c57e98a4a355cf70d3ed43ec1/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/247c2f5985b9a8699eabd85269f33ad2deb1a87e/
     aarch64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/05a2440a87ccf4093ef63c8e8569353eaf9a5d4e/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/84c464dffdae3910d1bb523b190933b8a98d8da5/
         sh4 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/22391b7e54bcc490b279bec2691b19eb9da4a894/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/80b1dd2e103c3bc486cdb9925fc7a1770ae5ffbf/
      x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/0a0d83cd80472d36ea4abada6bc759d1e4f47871/
    mips64el |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/cfdc2d3052f11214d49810f60b3ca9d61d93522b/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/95c0ec6bfcbd5720ce7f7b39a9d7e08a42a4590b/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/bc8e10ceb59f8173abaf41d1a569e6165e6026cc/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/7ea52ca13937b62c9cb0f35fa411c06ece90d9c1/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/a13b62aa55a1b5da9d26fa2a9cf752b1e43e0c57/
      x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/970b625c74c87ab807a7f99e65e8d5523fd5c5e1/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/73d7aad23741e97bb98c285b2b5d8056c98de484/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/15bb1552c15b0138303b9d4154ba0140a4fdb8a8/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/ac4e6f4de4e77561c69c71e157860a8ddb5d7be7/
        i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/02debc851a94848ba1804fddf9932fa523859725/
microblazeel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/d6f07a9e539b616350256d8ec731d7035494bc63/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/2f1fc3995fdf653793c33662fb2793621316c232/
    mips64el |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/33504af883fd4c139b9cb514839989dbd21ded79/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/adb6d66127699a2c7e4926957798b6192eb26632/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/ddde51822540b78a9b092d5575faf0976d82cde0/
        sh4a |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/019c62b1fec305b447bafb97bd7662f9e6123c1c/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/2ce3fe53e161cfeda2c0f1032f3664d8681cb9a0/
        i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/c4386302470725ba800bc926296948dd1c2f7294/
         arm | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/c5ef9e973b31400bf8dc9681a09ad35708b8f91c/
        mips |            modem-manager-1.4.0 | NOK | http://autobuild.buildroot.net/results/39e437786cdeec0c3d41c1ff6201cc4f907d0f73/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/c869bbe7cb069746e4ceeb9eb1e5408552297c2f/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/455373dd9cd9d528207f06c99f8b0b52f14d75eb/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/21399b57f4353b72487e22d3c6ec37404dfaef48/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/538ee513755a512954f7f6af01cfe6ef869d281a/
        sh4a |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/6ea023b7ca052e3699542f2068ee870808b17d92/
      mipsel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/c2105aedadce7bfc7bb0d074353ee1270fc91593/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/b43707e18f2b01b1827fbe5c9cf56cbd22522d48/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/d55e00e47d3b5cfb162140f4cdedf7de8b442f65/
        mips |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/ec256aea0fa905c98cddff64c79b9d4c4f5ede9c/
        i686 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/a52ebdc8498281bfd7b7e8a26b7f7edd2f5beb94/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/7b8d0ae07b574c9f3be8ba2f55624ee7b979e8f6/
      mipsel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/e60f8ba6259c22f6e384bb1d5114dd39cfef486e/
        mips |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/2c19c6a1286683d52b970e2f38f966f1a9f983f8/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f2f75e90cc8b79b1244ec09765cfcd50681035e0/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5e489468eb35d002724f865204eb75c09df22251/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/41ea15714c2f335259c82d8e855e6570b5cad210/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/18fb6091f9fff57875de00c302f0a515a911dcbb/
      xtensa |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c12ca4331239dbad6ebc35daae69021841b0ed20/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/de59ba792ddfc88dea3bb13d3c4efc42ec06ae47/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/d0f474081ebe0b0b864f57927bcc66eb61a08990/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/db3486976cd5266ed889fe49fad3a298c628e6cf/
        sh4a |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/3f1ec7ebd43c6625a066af1b01a454bbb407b0c7/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c228483247786f949900f059a65ebdf7552b9999/
        sh4a |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5193ab2c89f487fb59afeaf8b0e63ea8d6423f13/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/625223fabaa2895913b2842b6e5ceacecab935c8/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0f06fc9e3c2385ae6b1830793c1c9e5154ba0759/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/3613912a20ae4e1b9a447be598f185f0bd5e4dd7/
      mipsel |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/26f12681bacf6814f1e33df0e0c736eaaf589f88/
     powerpc |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/7b7d4fcc1506ddd6c9d6050545d7cdbd4dce1b13/
        i486 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/763b60f8a512a23c4d9341fcd64f165ac6e2281b/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/52fe452d95868f26358c929d27b2a47b10f81b49/
        i486 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/6250e28a87997b3284476e38d86af3d36ddf81eb/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/4ab042b1b00bcc30058074fa9704c0659750c577/
     powerpc |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/6e0fb4a74f62e23cbc56482ae25f9979fa6f14f8/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/cd0407f5121b5e553031d4f522fe28adc2ad6289/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d99227c4cb2cd8598476da001e0c40e075d005e6/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b7049e6d491c22668474ac4740b97848691a2004/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/97a3d28ad37301acff36a87ab551dd75222777b3/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/27f33462775a242f49ecaced774e52beaef05620/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/380952f6f56610872883bcc4a25bb78f3f7613ab/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/139f365d468d97fe2df53221afe02cabffab7b92/
        i686 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/18c63bbe45879409b56f1a060c0acc31ac290b6f/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/2c2a03e6c0292629172c05dc18a564275e793c4f/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/6bab56fdb2a733d71a07fd91077bd38eb5a7a56a/
        i686 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/0e4a239d56acc7fa269dfde2d8b2e271cfdcf9f2/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/507c16192c7631252510e3f29fa8a9992699857a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/5a16253b673e38a228ca90356527dacb035342cf/


-- 
http://autobuild.buildroot.net
