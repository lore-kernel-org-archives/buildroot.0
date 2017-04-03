From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 3 Apr 2017 10:46:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-04-02
In-Reply-To: <20170403062837.92499207F4@mail.free-electrons.com>
References: <20170403062837.92499207F4@mail.free-electrons.com>
Message-ID: <CAGm1_ks24Z_uk31KEKg5aKLUzDwGXKcepE3P2ycEs9fX+O6L8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 3, 2017 at 8:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-04-02
> ================================
>
>       successes : 196
>        failures : 108
>        timeouts : 0
>           TOTAL : 304
>
> Classification of failures by reason
> ====================================
>
>                  libdrm-2.4.76 | 33
>                  lvm2-2.02.169 | 26
>                  dc3dd-7.2.641 | 15
>                  xenomai-3.0.3 | 5
>                host-qemu-2.8.0 | 4
>                     libiio-0.9 | 3
>            uboot-tools-2017.03 | 3
> uhttpd-a8bf9c00842224edb394... | 3
>              bluez5_utils-5.44 | 1
>                    cmake-3.7.2 | 1
>                       icu-58.2 | 1
>                iptraf-ng-1.1.4 | 1
>                 libepoxy-1.4.1 | 1
>                 libmpeg2-0.5.1 | 1
>                   libsoc-0.8.2 | 1
>                  mplayer-1.3.0 | 1
>                   ntp-4.2.8p10 | 1
> openblas-f04af36ad0e85b64f1... | 1
>                 poppler-0.53.0 | 1
>                     qemu-2.8.0 | 1
>              rabbitmq-c-v0.8.0 | 1
>                     sdl2-2.0.5 | 1
>          synergy-v1.8.5-stable | 1
>          tesseract-ocr-3.05.00 | 1
>
>
> Detail of failures
> ===================
>
>         i586 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/b392f1f3bccddd1c39860e536a96afe28207b231 |
>       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/cce5761504832f61feb3164e9070c699beed2df7 |
>    powerpc64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/813e51529c2ebf78a777aa89a801c7d6b7da8767 |
>     mips64el |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a15b59f6089c79ff39ffbc7151a45b2806e17fc8 |
>          arc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/1dc94b63c318b1f7b3abdbd09a94b7822b53d07a |
>          arc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/56eda8289118782de7b8b33f956bfb33b159b86a |
>         mips |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/65145d4548983a7bd79662038fd8ffc2c8ea7b86 |
>  powerpc64le |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/4aaf97d507e3b44e208ef777f00d2d59903c4d07 |
>         i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/4d224c42964d6153c0a23647d223eea3f0126f12 |
>     mips64el |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/b8b59ab00790ff1b29fb72852e05ef8b402f41ec |
>          sh4 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/ef581cc3cae46a6ed08c321b575b71e6a384cced |
>          arc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/2dd5641e40e7084e9a70cb0a1cbf6090cf8f3417 |
>        nios2 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/02d64508eec89a6a799660cebaa3f5bb44c67410 |
>       xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/193f91c59607703a332b0144c046f09e3f5323ef |
>          arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a9a150bbc25da2757518cb79b657023421e73e8a |
>       x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/2c5672d24df8ddded17f0058d0e35b7caa8f69fa |
>       mipsel |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/0f50cced70c729b659d8ce2553f30be742c454f7 |
>         m68k |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/857e278ee84272e90ac866df168cfd2bde1049a4 |
>      aarch64 |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/4d0182da77cf386e57acf0565a18fc4628abbdc8 |
>     mips64el |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/6bcfabc020fede51adcfafc9a570df5884d95696 |
>     mips64el |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/f1755f26a3eacd84de9bd901b214a5bbb964988c |
>         bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/3a14327d2b61d2562472872e54a1f7501131873f | ORPH
>          arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/1a4a37c9473fc7ebaabdbf86784d544f5b3a31b0 |
>  powerpc64le |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/98c459cc7a22be5681a048f19495086557b97fb4 |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/2e887c25b22bd36eab36ff361645306c8ddb79aa |
>     mips64el |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/05114f719a4105ede9c0bb28b51e9f46ea3f5a9c |
>       x86_64 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/c0977d84cf58105cf5c683f82e8165ac07c7749c |
>        sparc |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/c105442fd66c832330071df23d852e02b13cb43d |
>         i586 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/6ab6d4285fe0b7008f1a0523e46283152c7f71fb |
>         i686 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/2ef3d6d74c56632c012b85e05af6eaf0259b72c9 |
>        nios2 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/7c0050d63a1d34eecb6d16e2654369cea561707a |
>         bfin |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/550382561d676a44408180bd47a0a9a589909d87 |
>          arc |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/418c775a44f2bc416449c160f217e953db9deb50 |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/33559fc0558d24115822bd6771cef3b3d265590d |
>       xtensa |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/169422872092a74d076dc59cae233ab38084c796 |
>     mips64el |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/d12c635989e97b28638d1e35eaf2d9c84571aca1 |
> microblazeel |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/e8c8a3e85e79ff1448a4b35c70bb80e17ece5a5c |
>       x86_64 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/e8e1e2a7cb5e2504429220600c7b86b1966501f7 |
>         mips |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/1af73494b8c5c2bd8777922a26d5ec011e3d37df |
>      powerpc |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/e42655c9bee28cfbbe2e752b50cb8399b17649f2 |
>         i686 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/6151027b89596d5c1f351f5537143b1c7af6d871 |
>       xtensa |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/a20d133a01a911fab8e7141a60c76c5832db8494 |
>       xtensa |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/6820f8cbaac00002ebdcc757676f9e6845f2a9b4 |
>       x86_64 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/ccefe5a7707530f6d318d6d8938bf268a6f22086 |
>         or1k |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/6b76e0bb4ac86f3ea731e0599759fec7434be56e |
>         i686 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/e31f69148dd572b9fbe45b3165a137421f24097e |
>         m68k |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/1ee41b4ec1e8b933f4d679e7873be240b35f992d |
>       mipsel |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/c9c2754797916f07658dc959537cc07ea387c010 |
>      powerpc |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/b8662f9983f8704a0fc3b3df7d817efa976139b7 |
>       x86_64 |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/f381d9fb46c886db1ac58b1f4d56347bb745ac61 |
>     mips64el |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/5aeb90ef0d0d5009a12bcff36cc5d8f42e9f45a3 |
>          arc |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/469f92cb929d9bce504c3c5f10004e186325bda7 |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/c3330ef9a8cadb46bbd31c5b14ece34f192133e3 |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/d181bd044246646732a14815aae08337b0b5eecf |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/68af62f4ab6944d326468818562c05fd5cc55b03 |
>          arm |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/4f5872211812c7e191cffcf41cab998fc20c0d20 |
>      powerpc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6eacf423a97ab3647e2678c526f89a94eec678a0 |
>     mips64el |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/69390ba1f7b1460c3217ef88125faeeeda445f20 |
>    powerpc64 |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/71ecc80e891a36305b3dacbd12bf8130fe4fd31f |
>      powerpc |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/4d1d798ac740403e814b843083b14c9a890dfd54 |
>        sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4f7510e39926ab956ebff569ff29b18e04b08ab9 | ORPH
>      powerpc |                   libsoc-0.8.2 | NOK | http://autobuild.buildroot.net/results/86e04bd2b10527130306451e56a7693ed4b4befd |

Fixed in http://patchwork.ozlabs.org/patch/746313/

Yegor

>       xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/de6297fa2b4c0df95c92da28f88c7d9acf6b5afc | ORPH
> microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/73a234d2b298ec24d601af3824afb22c1478b6e3 | ORPH
>          arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/e6dd63af6f32ff62db2a48c5fd971259c8b2aa6a | ORPH
>          arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/05ca8d40f25411980f087179edda9f4d406b0cf9 | ORPH
>     mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/69259f2483c52e4974e68016a25bd67b7cdb74b2 | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/3492312b1eea90e8c12cd0cb6f50145655cb7034 | ORPH
>       xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/691434bce669c09f22ceb40b0205573349d5aef3 | ORPH
>          arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/40c54620fce61ba1bb6b96027ca5483367b5c56b | ORPH
>          arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/e24751f1dc22fbce82bda1c5d0b5c4ecbbb28a8d | ORPH
>        sparc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/13301920ae6612cf13fe2bee7fcb76e5e00641de | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/89c75e5a9e3e67b0eb1ba3a072f8f96f66c257f1 | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/5f2a4eda3ef939eb2bd93dfcdb93218fff6f4e45 | ORPH
>          arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/61fafb3ef600de32408853e396671fcbfb712c29 | ORPH
>       xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/ee0baeda0524196da4f0b7f6dc321d9c89f1c9f2 | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/0f327650cd6e2baa14d495a830de67da2284d1da | ORPH
>       xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/01c0cacb1e160f6cb198d274c42028f40f02cebd | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/246d4dbd0525e47a97ba3d68cc0c32ebcd98670d | ORPH
>       xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/5d6feeb685e298e0c03b045f5180bbc3e8441ae9 | ORPH
>          arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/7ca75dd36c046d2db7f95ea195dbe37454409c86 | ORPH
>        sparc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/a78759c03e5041aa173c818a2f9c2d23c24718aa | ORPH
> microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/bff1e9d00e8a480b20f5239116f2f49df6252fe1 | ORPH
>          arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/d81b3589c08b82f613ff9466c3b436b8c31d1c28 | ORPH
>       mipsel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/bd343a951e3ae9ff220d0f571b2699f0f387f291 | ORPH
>          arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/cca1de62b331be31b47e60cf77986cf2bf6f3700 | ORPH
>          sh4 |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/3fffce5365ab894b20a8faa5eac2ed5dc79e0637 | ORPH
>         or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/0d396982ae5654c2461839add0b20eed8169045a | ORPH
>         i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cb1968aea75eb7af5967521637996c52e138a693 |
>      aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/3a18dc50bda2db22e9b25c6260ee75e0e6c89d8a | ORPH
>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f96c30c5c398db1ba561740ae64e922cd4f8a524 |
>        nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/a12f962b7a7e3e0bc15a6ac8161ae4ce947a5031 |
>         i686 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/04d23488769d930fe0b18628fc0681375134fd03 |
>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/502fc5006a5f7dbc8904ac76affc9a8401dcf44f |
>          arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/33e8f7f8cd29dc0424a2967ee8228a40d4e463b9 |
>        nios2 |          synergy-v1.8.5-stable | NOK | http://autobuild.buildroot.net/results/bd6e4122b660c36d850d36d2928da3f9b774b578 |
>        sparc |          tesseract-ocr-3.05.00 | NOK | http://autobuild.buildroot.net/results/a6b18d8ac754f998e6ddaeebb9a1a5bb0ed65b14 |
>         i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/86fa31a2dc70b5780660e4630448c1fc9f44c5c0 | ORPH
>          arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3b0e68a3adc1b464bea618a032e5afa9c4f32248 | ORPH
>          arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/fc52b7f664399eea81bd04d8dc8c0ca1f4efa62c | ORPH
>         i686 | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/154aeaff62d2aa794cc92061690492361dbab828 |
>         i686 | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/08b23dbce6cb5a4779f75175ac9c61dde4ae2960 |
>         sh4a | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/9dafdc5027343aa40e1ea0c64631dcfd25318aef |
>      powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/13654199c1e0c47987eb016134b47a7ee54d4b2d |
>         bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ce9cb85dce70ab24bd48deebde88499955001828 |
>          arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/1666dcd2ec809224d77f3088df7c4d2906446a37 |
>         bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4ce524141599562db1c359f8465f5106c2045c02 |
>      powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/d8cbf086a7da9b3aca74e78236affe8cd6870eea |
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
