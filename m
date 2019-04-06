From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 6 Apr 2019 12:32:36 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-05
In-Reply-To: <20190406060048.485C886054@fraxinus.osuosl.org>
References: <20190406060048.485C886054@fraxinus.osuosl.org>
Message-ID: <20190406093236.l5ui2zt7adnd6h4z@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Sat, Apr 06, 2019 at 06:00:40AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-04-05
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  48 |   5 |   1 |  54 |
>       master | 210 | 402 |   1 | 613 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>           host-libglib2-2.56.4 | 337

This patch fixes the issue, but I am not sure if it is right place for
fix:
https://patchwork.ozlabs.org/patch/1077800/

> host-gcc-final-arc-2018.09-... | 34
>              dbus-python-1.2.8 | 5 
>                    netsurf-3.8 | 5 
>                       gzip-1.9 | 3 
>                   ffmpeg-4.1.3 | 2 
>                 host-go-1.12.1 | 2 
>              openjdk-jdk-12+33 | 2 
>                   rygel-0.36.2 | 2 
>                   brotli-1.0.7 | 1 
>                    dvblast-3.4 | 1 
>               ghostscript-9.26 | 1 
>                   libssh-0.8.7 | 1 
>                    mimic-1.1.0 | 1 
>                    netsnmp-5.8 | 1 
>                        netsurf | 1 
>                 qt5base-5.12.2 | 1 
>              qt5wayland-5.12.2 | 1 
>       qt5webkit-examples-5.9.1 | 1 
>   vdr-plugin-vnsiserver-v1.5.2 | 1 
> 
> 
> Detail of failures
> ------------------
> 
> microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/b0f86679edadc522033584c052d5b84916e6d552 |     
>         mips |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/562068c26b0888b8c31a94521be2cf01442a88af | ORPH
>      riscv64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b9baf3a45ae0f1df5caff60715fd86d8d2463d4d | ORPH
>        nios2 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/a4e0b5bbdfe2194a178a44499528f3b0a0607dba | ORPH
>    powerpc64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/414ebe19a2f586263177f2c433516e7427e85cb8 | ORPH
>     mips64el |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/ca2471e46dc705a9f072c4be700cfbfa0fcc22cc | ORPH
>          arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/10d9ffc59ddb8749af2f7380f7f05a02b8ad740a |     
>       mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/3508aedeab6725658e798709fb5b3bd5f10c2c20 |     
>     mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/705c199e91d52325780dae9d08d70ab6a93ea7ce |     
> microblazeel |               ghostscript-9.26 | NOK | http://autobuild.buildroot.net/results/7909a68d93a969f3930cc79b8cd7e06428a4716f |     
>          arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/51f47419272557998c9b49f08fe7af356a172f7f | ORPH
>          arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/e71680d1649add5d60cf4d925f16efe8dde7ac22 | ORPH
>          arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c37b7c559a99608742c6293e5723b88324fb0540 | ORPH
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/16d8548d2f8a5c2b4b44bff37ab6c1603e771772 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/f6a703afb8e6d3631c7edc1138f9c18c0b70d9ad |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/45ba4d1e4c41e0ba2bb306db5653eeb1ace017c2 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/b5988c9b1102709d7d34b4b3c2df2adcc9865f1e |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/96947705c4f71ac8977bd1dea41714f381fa4d3f |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5dfaf7b94ded20b82a3ce2f2e45ffa55f220ad44 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5495033d7f21bc531ade1647592095e9b47285a9 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/d26713cfa5d35816be11e006ede97ce8b2182f31 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/f14085698ccab2cfa02e1df9802f0611d74d5abf |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/eceb2cfc14135ba5dc0ae181314c3a4ca280f7db |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5ff19b0401bc21d1c0f37cf9537b3509d0c1da5b |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/e9b50c4ddeb5a373cf881d64195b3cdc9ce46cc2 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/816eae7be80b7534eaf3e5973376b5738b79d115 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/79ee8298b8c6ee141b6d5d1d368bc2ee3cfd6666 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/aa47f6dcf3425356f8dd3c6aa1e32e0b89e64750 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/00fae6f81e066d27948d9aa9f1664ffc5a92e922 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/25b0a38fbb5fa7a6e45ced3545f3eb1a93f3a249 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/f5186ee549aa610939023637c972a7dbbb773fec |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/4d9c9a1a8e7fe453be70ae521b11747e17687236 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/6c343c0f2c233ea47f84dfd9bbf3fa50469df020 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/55a7e2a813ffe42bc678f81f106adb0059f28c2a |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/cfd19236c3277612e4c41cea876f9e08144f5d67 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/ffbf31de436a5ce4a0a374c2c1974a7883276037 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/fb465d1b6b496f9be2b02cb3c4ac66aed8edd72b |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/700b81ea00060b17ba43566449f8ff2f9ce870ad |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/69d02d1383b5ce3b2c900b7034a0c7f69225dea4 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/855f10eb77365250d468ac7e3d531e6be27dc974 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/11155f06c84173af29676f19133b339a97f83ac3 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/f67e7ebc6e31f5c9141e7959f0a3a1111218c638 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/2beb4a2955deb0b22ec898b614492c87acf067f5 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/4f05394a5650d36d80e2428df762130b467e0885 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/31ff8e09473689b3cfc5e6202fdab2437ef32264 |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/8486aafa5e324d55610080be1055f3090ef1190e |     
>          arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/748ea809229c238e4d665626cf393f02634533e7 |     
>          arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/3b3ea148165b96513ea511ee0d4adb334a6afac8 |     
>          arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/bed228995ce3778720f991df9b41345a7c724a46 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/435d77e1ba51839c9a5aae9a98bda876f768b849 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/25d7460e11ac5c007d89ad80590f3c343b1aacbc |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f6c9aa2461350e2f84f44cb79ecf7c1d8608c816 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5ada581cce70e1672909c57285ca24dd41a46a63 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/46e29455d40fd69c6384ef846dd8a3c89b7a0f2c |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5adcaee0b594c3bf61bdb4614c351d68440dfd3b |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/abc5b42c965b71fadd82afc827275834fe81a4fb |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8cc6fb1ad6a037c544333e9ecc6ed06244f27f95 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4f2998841b02c610412047b16b9543d5541afb09 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/198b17110a34189ae3c16f3b848072d335ed8fd2 |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d0598029320d56e6ff1557929e30e1551e69800c |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ef434619404cc0c744f6c2b5c1fe1771e4c2dbae |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/601f5d34fe778a8e6c8b8cc78ae82cbce75ca1b8 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b40e5e359c459c26212aa0ce8dc07af678e68ae6 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4a9a1b1f02dd27a987ef770976cd569fb5097fc3 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/32502ba9e20c1009439d9afd9c1c79063e884773 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3c809caaeb1f0f174d92d3c66690310b72c278db |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c84d3cca60adf13b1b9175da9776646b6223e611 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/916ff152dc41f181eedda9c869ef7c42055a2356 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/97c27e48d495ef6e1ff212698ff4eaf9779e60ca |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5a018ab56e7cecef8be57eaf14b76414e802ca0e |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8b9be050f08bca0bc469573d4547f76a518c5601 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/de5bb07ad7a9a911071983827bcb010c9df8e1f8 |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/da10881299f23166cda1ad754433f7d20d51c766 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e03b36e30bc5574ebcf263317262c860d78a088b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f819dc604b7ed9e7f435cffdf5dc38a5d1ec72e4 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/abb59c131f71f3312bd48530418ae41030e7e994 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/255497eecc5499013de3a59f655c5d884d004898 |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a3c89ca2114eaabc2828d2805b3f3fe56a746e7f |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e5519175f1d4d3496a3d68b0f3f2ad056180be40 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/01c6c77f552b313dd1b023f50c0ddc6697006a99 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/343021e5ab009578e049fe77874e4853abce49b4 |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/76ed1de59c9b408a445979f75fb3412e7334d77c |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/783f7d0deb47864d5a61aa24f2c706e3c70fc4af |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5a08396f22cb61c821e699d9553910de49d6fbfb |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/80f9576e8272b6925d4dcf8f04165a363c247e52 |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c4934577bea56cc8d02716c0c288ca8ffb6b0509 |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3924eca7501fc4133c84cdeb3a15a81058e9daa0 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7e0ed2cdbaf585eb42b751c025f2ae2924467336 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/499efa49c5193dd6d477944b3ae2aeb66fb27214 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/58c9f5f88948cc1b72d78e96c903ac72663877e1 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a293128f6b07261d24f1897ab2bfd1a0ed1b672d |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e535bfd0b4f7b7b7c2112d43448e5bdd6e41fb2 |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1bc42dccd2ea8ef7694fe873535fa5b84d1636cf |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b2ef9060f442edc079ec466e2219dd42ed583451 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/91524879de088b1d56d75281c645041202aa9b86 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7f6e73ec0ce7592ec2cdb156f5fcb2f671e68a23 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8d9c1c6280de1f930f27f8fdea08d6f3f15f8f26 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/457e258425d4bd09a6c9068456a421713fd63174 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2dc4d59b7a67a51e6f94eaa4ca956a73841f1368 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6a9b1ae51f1f4072832587e84a5e59237058cdb0 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c63bae1a4d5f02ca69f3b7866a0673d106eeb32 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5c68e39895cade958c9c19ba245e7f0eef69a749 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b8ead8c0ea796b953db61e99c534112268c32d92 |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/93a284f675c867906df1a057888f98deaa098d12 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/23b8ff6b6488c244c4d0fc15ea418a57d02fe85b |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/686ea1a80ed1514f8808ff9a63c67e0f5423ddf3 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/29d98c48faec202888fc0b97fd8476fb64069403 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/29b10f9c2886e7ba67889bc51f722ec41f4efc39 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/55168b2749ce9a5d860fdd7c06c62c4928056204 |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0710092b8307dda6942d33bd9494102ed8e45f90 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/02ffe704583c2afa81c29b0f4a83ec41d9805d31 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8ed5d87d8c68afc9dbbcdb996c90acde84e504f8 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/459947c53534830e0b656bea4b1d08d382d7fe09 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f9bc9809c9a1bcfc9c3e2d6345331944e6aa18d2 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f5a8792727d6810d4039a39918f0a0db2a8f4f4a |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/987c71359e83c236541546c160408bec1dc6d9c1 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/44a801c6ff981bbf9514213add22621af43c56ef |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/47ca81a6384351c9d96f5ca4c91814a21cee4d15 |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/060b8fca2130fc27d87b021e3828463a4f22d96b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ae9f920dfdf772c59955ba3950e3a49554f16f00 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b524c8d0d7e22a05f4fbc5d7547fc51b330954d4 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6f8350f715dbc76fc0cd5d0f522f79ce4fc7f7b4 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/104186a83ab76276cdac8c6827f6b6e6e85811bc |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1f992f10bdf69849775c19b1d64f74afba7c1837 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/61c31415119fcee561b6a3b538bc7909ab5ddf55 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/750860b52976b47fce6ab6f009af1f0b9e3b8e70 |     
>         i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f5bf1ff05bff49530535adc533974f5208fc3d95 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6a29375481de46ed5ea0b33d1deb4d8b47423957 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/18e0ca4c94b92b634ca314239ee2f0434825f49b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ef49866dd44795ef0f46651d44998dbe21b353f7 |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/23f99cfd265bd5cb98554a77d2b95d6827dcaf3e |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/670e366dec908f9dbe817c1f6b80ee6e9f67454d |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bff6ba2b45075e1b5698d9cf4c98f22ebbff86c9 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e47c1f3d08cc37dbae4a2e82fe27354f9df22ff |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ee6eec55e13017462574e627fae34d3820d29477 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/41017689992ae2f0b60ec54fa0a438876b9c0415 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7cc05f028af194516c6a0184593d656947688cac |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ae72c8ff4cbebfe1a9b7f5aa3e381ed6cd101946 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cb0c59d73e11b68787c290a20bd3e9a7d2649ab7 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/337c11d2800742230814646de947660c4d448983 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/30d66ad7229acfaad6c90d3a7998f13135229802 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/54ba41ade84157321290ed337272cb1fbbcfa9c1 |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d37fabce2bbe501285da6a463f234222ce3a9224 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/201dc1bc9a349299cf9d44831263a9c7f76d285b |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bf0e2fb46fff06bc6a87be946165d57adde616e9 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/37b10f2963059b25215cab0f98c4452819d5f1ed |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0fbddcc339998b8326de9cdd2f93189a3b7d758c |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/90f58bbde1b62273b710fbdc4f8833e55b6d3ff3 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3c3741029f51b519b4b23d561e82d0f0cc5fe69d |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ce25def4f896998cc1cc4be91c0e27a408da7aaa |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5c7eab012e661cf3ee9400c929661e9f700a2545 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5a563a16618a3401dcd451fe7c0ebed589f489f2 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/dd0ca1bb9fce343d25fd20376db3d3d32083e8e8 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8d0712e74b7f70be76d6203ae07e65149901b130 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/31bfaa01483620b80b68b8ddd43df9334c7a2aa4 |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/61bededf041beb3aec493b8645620cf264e53915 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2e40b99fb4344e5eade1503657b3e7631910c95c |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/76ecc7e8e4cbb4541e6cbfb35402f36ecf0dc9a7 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6db2ee791edfa37cc843c53dae7d4021558261f0 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9ea53ac81f565a35b6290728db08d8c45d7f9190 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/adfa607828b9089c3e53a227e9a95dfaf64ce08c |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1c55cfa26da199cb41ef573f570f8c04a5a1b43f |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1fcfc0245fcdfc26225bb230bb63e39d7cc9d8a0 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2e95df45256144890e8980a7de1824147cf37118 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ecc9e6c5fa17a4031cb877573202106071ba4e69 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/238ac68e38bdd5c8248a69b910f1c14c7844a48e |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3cf36ea88dcd8e12295c2021bdaf278a12013452 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/49513bbbe3a0102077e3551c21843e22ce81ba00 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fed03e56a1857851b8464dad7fbfd665dfed8d70 |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1b5f7e3b5c1169be3e56efbf92559e3fc297b5ed |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9625a446fa7720d8bed1cf9f12835a676f3a8a68 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/03fcbaf5dec065ecfe119c01b20bdf6c790035af |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b85dbc6dee1127b366e7a0b1f9afc88ca107b638 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cf13b2ed372b9a640a7c1db672ce5c1f0cbcc670 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/050badfb4308fccace93512f5c70b6d906cf0723 |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/75d2aa2d17f04c909c7201f2f3f66eb9c4714a6f |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/799bbd4a32820b91ce9c18e58ceca4617ce243a5 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/818b895e73d424e7abed7085279244b3c5b0be42 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/76a7c1f6ee1bf167b6de6497b8293dbecda28b12 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b4d13255889991f2dc293061e33309f224fdea5a |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8feb7690db6f07eb7523ec6a95ccd375311e554b |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/160c8c53e0e0e5cbcd84ca7b704859bf008024a5 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1f8052765fdda8a6c70ce53089be19ed397bbaa |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8cd19d55cd9308cc281bce80ff932df0807c4a6a |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/51cf5a4d86df896ea969a3f4d6cfe3d4109cc85a |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ce2b669c6d9f3685ea5cd82b9d589a0732ccde0e |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1b3c33a4c46489bfa19b25655efc73732d50cb62 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9af37feb0e3f91d3ff9b4fb543ebeb4e3eee63e4 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9563d690b9ea873ed46cdb819bd57695be2a3275 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/78c9dfcbe0ed667f063a21e3f62e3da6bba972e4 |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/14f91976efb1c6822a1da72638c4f3ba15056d3c |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df99fdc4c4544258618f0384c017da3135b01191 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/51c711cddfd64d1db976eb20e8ef8d9f948b23cd |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4c4af9911f562c06101801ac395e2531ff5362fc |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2c0a480a1b2e96a939fab1a8048b7d3d576881c6 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/95e928b35a9f31868d003fae0588f7f96f59ce0b |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a66c60cad02205ada5a3d172c21d1ad99c56ac16 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ce311a81c0c1f03c60cba985723c74181259cbac |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/91f29200cd49063ff387f84925d3480e73a59342 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d368d103a93d10779bb39705c5e0db5331f85429 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/738ee6a7ef0f0c782884e9185fd19b122e074daa |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b802d2832cb206257361d75e947647156cb6360e |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/788a5bc177a8b5fd25d67c88b94489c3c57988e5 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2d4af2a52f182cbe824c8e07b6c1793c7308e522 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/35aadf67e883f7c1fa1215473918c80d4855fc7b |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/446f94d01f091f853d441554e812bd5ff20562c6 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e330d1865ddac0544eae4dfb7c3b85c28a005fbe |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3fbed75efe86cf58a8d14e24c3d7bab2a5e87801 |     
>         i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a424bb8b4cbd370c841a20878cd3f2af8f673e6d |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/61c7dfd3ff4f2d4b05e2fc920aa507775e78ddce |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3dc19321b673638a01d52494b95da21370bea89c |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1eb7f15f55280c16d236d7685da3d59f307fe9d5 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/009ba857d509215e5523d9421deb0ab32a08767e |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a4b460f1267296dd62e55598c4efb4d482b632bb |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/26b7eb9ccd5d99288e47b3373a7ffeb812a6b8b1 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/167482dcd604c42fa8b3f26d80d390518447f063 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/106ce9adf18ba6271f25f78090adc7d10f2f389e |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c87bb7ed7a230a2f4b4180b70515165106044ba |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/716751c7bef315ea98b6ca1308c771ef6223a949 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/25e2fed43ee9a5c6d19688b5525a1c9cee370e60 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d62755078d3e52cd506b4ea01d81dd639ec084f1 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ba5aaf07915ca3d144f61cc61370018f6333aa27 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/763a5e89bad8f5509fe229d7d2083173179dad38 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/80d1218efaabeced258e6de84ab4e99c96d33cb1 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c3ffc8f3c5078db1eb57a0686fd24d32e2ccb6bb |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/64ecf8e2dc092ce8eac98bdd2fac93abce0886b8 |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/668c08b8e5e3777ff24b244a397ffff9d25b0244 |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/757c38b16999c200a52ecbfa035aedadb3e69c59 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2eed8c61ee0b8165a0e1f5a419334b27604b52ab |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c5dbb2ba101115d661f9de7eb5d8103376f5f595 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/50f0fcb26d477c9107ac738cfaf9afcbca64e7c9 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1a7d024c69dd3f72451a96be840b77d8f3588634 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/812d640cf617dce52f7d08c892ec762c2b77480c |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e0876d1a68d90553c0c2481d61bd19ffa4e28d4a |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/74303fbf090640293c701d5ecbe2e96ec58eb0e8 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68b15bd6ae39819c6e9ce8c9c981aac765ddf219 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/660650129d1a2ab6ba7ce629ad836dd229c46671 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9fd83568fbb2897249815b005698ea7252b98d01 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e296ca4d61288cf099bdb5605f648356888f1432 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/dfceed7bfc7a8d18a76758e4f1a34cef8ee82ded |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/459913bd4cc53a5177c61b50bba0d56155187263 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/259f98545aa77f8765a402e77fabbf5c0b9df40b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f328968b47adc738892b6d9c54dcd61687dd3773 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/949e778c402822414cfaf8dd534835a2f73503f3 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ee8c194bba6dc407f4a346f62fb749554f9d528a |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f336220507478f0d39549760e34b61d3bd720858 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/310ae0558196199de09393f54c775debc0bcf7c6 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d7d3ec56b721c80676afc9dd8c06441e5bd34bc0 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5558b89b716ad43ca4487d1a52759b7df0690ecb |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a4cbe6117f41aa280ab61191a088de8590bc94e9 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f5e3529161e390532139caeebb774c6b8af2062b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bec23853d9824e2c3f9bf603e447ccf6e38abed6 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/192da87472896508b73ebefd4ba7d0d186831753 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a5dbf204b9b2afdae6dbd54eb4e1d4439c725850 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/da60551627d00dda3f5500d0141bccb68750c808 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a24b6e5a91c9bb7c1f46d9050bc9a001edc01faf |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7e0246a55ad521a78fbe7e9e66cb969dd5280bda |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d762e39c0175759cc2c0deca2679a96d99e2cce2 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/961723b41aeb3a4aa9768e5ce808c780421f0b90 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2e1f3892d9e9bb364c634121874cd86015512bf1 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/33f6a4958b4ace7d70b0450bf1a6aee97464328e |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a7804da99fcf1e2e18ef6d274782623d0a064fa9 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0ab53ef6c447e302caad992cc4d57e6a17b0b7f5 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1361e72cad40c79cd273c1a7f8fe24663e36d3ac |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c38477d9db18bd1a18b9d7de89a11898e045cf9 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/55407b48960a592dfab4a0f9b20cfeaa9f9dabfa |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1a1416d8af440eb50b418a21406f3e26ea7ffc1 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e45ca48cab8fdcc9ea1d46effa4f423161dc7a1 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/75ea52d5e946767a7316007e967e20046d99b656 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c70fb77f7a71ccf1ef4628119169f025dc4c8a78 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e4c51d9f4512cbf49c310cd1b94dbf07f75872f6 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/938800c6478722319960d9f682099bf1464dbccd |     
>         i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/83c0a93b34c1af0b1325dbf18a2f904ae7af21df |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cbddea96ac8fec4d64db483bceed9847f057d112 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fd6752cdab2aee3452ee30a9befc966547e4c8d6 |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e4f55edfc167a99e6b14959000acf51645355de3 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8444ff31801e254970dfe94d5cb86e92e5bd19fe |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/784d7def23d6c0491d5271373833ad14db12b3a2 |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/dcfd65d6de2001910cf00a5f1374cb2f58853bb3 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6d5531e0f445df1a10b97982edaf3037abb4b1e9 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8b1fecec3fb4a99b2a9ff8cdeec9f5c1f16a644a |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3eb0e0db3ea1c0c025778d69e38d58eb5a9efdda |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d5e3f02a3c63f3e8f8bd23afdfe2179724a30420 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6033c089552d5ef5cf167b5b93f2ca2171fb94cb |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f5e05b810f1d26c49d0fd92b2ed9839e2d5806e |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6478eb0ffb08012fa2815d84a66a294d0fd7cda7 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c92dba34bb27a3cfff7f39187624e1cef3c30c5b |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d3ef4d0dc329a64342d322331598ef23be8f9f71 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d48e892c7bd4cf0dd9e3ef80627a518d5a142e25 |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/712f5ce66eccf99a65c0db5570f0ac78989fbcdb |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c024be6cbfde85ee70076a9ae50d17fa8b577b8c |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b6ae60b098cbfbec39e97149c9b324c462ec34a8 |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e0a58238b9400403fde7218497238d3852a2bff |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ef3560e124935d91a900a7aa3eee421ad78c6f2c |     
>         i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9e8ea259ce79da0008fa04e01639ddfa19130d6f |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/655b8a6f4ac2c330e28ab9cc727369d192e5dd0a |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/44b9eb27e64df499a9c3fa853abdf5ac4848d08c |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/869d30d1911923db347b1d19a80d47ad1feeef4d |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/46e06daa1d16041742cce82df99ae46e0e84ef69 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/239950d82d63191e382841f7e8cc803848d821e7 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d4eed33e1340b7d355eca4dee00489b472444db2 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ab8513f4c484be7d4255e5cd7974e1961869704e |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/779ec3fff5e20d59a7308b195cd41441ae8f7b5f |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9b2364df952d7bc110d7ecbf892831901164f5bf |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d3fcba972784bcf4a65e23f88c90a7490e579301 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/926bc1091e5048e2632da67742a4b692dbf75077 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3e635abf6020e66802e4c837f821a5e897207e48 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7b584be95fdc82534f7a0f441db6e19ad3f09de3 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ad9586fdf7f89987f826ab53db4474ef7dab0dae |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3fd044ee43baccc10430ef73aae676215c31b75b |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3770ba4d57772db29de3674ac9b8472d14e59620 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/55fcfeecbe5cdde4a1dbaaece313c684024e95b3 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c489b50bad035b7756b5f25385cd132844c412f4 |     
>         i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4d921a2a81a07f2a8417d10e9c7e71b9e6d21ad1 |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/975c8d717c7d45d3c8df1eafd33cd32fa94e854a |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a58cdc50eddf89e80345f58ae0b2638a97a3cd09 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2c96cbf4df6851e9a92752998f4767de0eb897a8 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/305d57b042b767b8dbae1e3e8a6bb0b6fec4d4b7 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f8c4ed73ce6a568aee58a0c64ca3639921e54a72 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5497ce0f661b0b3545b3b33e82af4a8ba5bfc375 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a379a13819193066e297526ce14b59e054d6118d |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2ddf5912ccbcb6702458e5f40f7ea200e61a1108 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8ae5e2fc4cb3ea86303724908e00b84be07b9180 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0c42603c183f8e23a9a4876e187bf7db70fc78cd |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ac0f070a8be8fd7c1d85a8b4ce6c6840e352762f |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/93ed12fb140b476338b89719fd9470aae422c573 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f6978b73f0098d6fcde86d0c2c106a477a7aa858 |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ec561ae5bc2ee6573cbc59aaa4bcd3e4136c3c60 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fd5225d0f54b2312b55f1bff6316bbf65985e195 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a96d54c13e32bbd243518a535343a3dba797ecef |     
>        sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5b93b3cf4a88cb5d350f3acb9e1ce5f3410b0fc1 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/37960341b3584ba482c7c80de20c972542608035 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2812d5038ed7cda5be0190dc0309d45986548b11 |     
>       xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d8a9ac6c80ac132552d79a33e2782a0ccaef715c |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/411d30e3fb07be039f9c9c81134d2da01e7ca6af |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/162bc8afaf415e4dd436bc2f51a1d7f3d269304e |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bbaeb7f56ce6f57fb351c968a3cf6d2ab6dfb068 |     
>       mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b2bf7e6ed0b19236e0543333c75f51dfd4485482 |     
>   aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e2c17c21b837c48ec45149b18adfc56b8095f77d |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1c1651f01c467de5d7658997d59c23774e7acd4e |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/01e2b292ba7eb1c7d66be5df22c0b275ed47cc5a |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/261d37d05d43f041e27169ce1de58c01718d76b9 |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c876d035f1e330c4716f2ce5c515570d5df49146 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f12d9077795579927ed689308832e04fa4d2054b |     
>          arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8f8dd9eed859551bed840effedb477378af56a66 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6f09d4ac88e230ce7caa6a67abfe8ba60a413122 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/23d3f4d837cf40dd26c6c9cc7c32197cd8a37173 |     
>      sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/634b311326b610ec14f2d487a053f88054b5516e |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/abf6fe08d26f55734e6f55be99b92de6cc0812f7 |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b030c7bf4c49f55c22c0cb6168f051d56f28a627 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cdb2b5e781fa30b987d916d42f6c2cc0ded04736 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/246b6546da99418ab9e8e645eacf06dfdf471c13 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/910a65464b0e0df9e6170838bfe044cf00b89882 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bf41bad254e2556cc223de614a53e4177c98af6f |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/932d6bbc858fcd82207442c40c7593e2c8257cfd |     
>       x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6ed06cc58f448e7a5ba9e8a60313ecbc25b8a62b |     
>          sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6afb05cc9d8e586468d4b9ac28a9bc6946d28960 |     
>      riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e2876deecff4290065f9c06306521f23fdd904f2 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8428e365dac2e13aaea2cabaea7e8e42c3450378 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7ea3440aa2f9d04777c84442580179cc32ffc7df |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c08eaf6b298572c95cdd45bb499a50c3ba68249a |     
>      powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d6512b96ce9635abc0634bc6102f5c9e79eeb543 |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7ecce1f112821cdb23300e85b290a71e36d856e0 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2b810df7d4e2013aeace675ef28fe245cde78e30 |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1a678b1bbff02b52e05ae10831eb8c9c3c10950 |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c658fb6491cb52f8311a33a329f19ac6f0c47017 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f79e417b365db317d7b82068f41914555db38a5a |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a0d91ab6d31508cb0b8bbb5caf9ae04a16b09669 |     
>     mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f8d6764010fd0e999d8d4a5855f3f6cb49f6033 |     
>      aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6bd1b700012ff07821c3a6163eeccefcca109fca |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/556195c6826d3bba2d7537109624a4cc547a0e80 |     
>         or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2be9776dabbe26997e78322ca5e059aed2828d43 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a5fa5d10b00c650a6e8eefcd4220b96b96b543c1 |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/80c4ab58ff07c7ec5bbf262077526609036cf3c1 |     
>  powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c8add35d96f2a85a5e17dd1e416d69ffaa33464 |     
>         i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1297b731d330e6073d087d7c09bc76079499d48a |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f080720e39d9dab3db2f41c969a3501dac715b1a |     
>         m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c00a6bf65b91a683221d699b061fe19047b6d5b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/73bcb8df6d7ab277e265577f2d63206b47be0dba |     
>      riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3a710e5ff8cc3bd065808dc2bdf36f78438b4bba |     
>        nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2cd7e77c610274eaf3cbde09be9b2311dc13e42f |     
>    powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/632208b3baa1936c18337e7a8741c27ab77b26ff |     
> microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1768a6f16961c0854ca8aca4e2e9e1a896d4cd0 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1e64fb1d7ad5f88f44d0e1100a0598403667b76b |     
>          arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b045de3a9ff08701011969651171602e48ccfc81 |     
>         mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5338a2f43719a8e612487fbfaa6bdb2f4d938fcc |     
>       xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/2829a6051bdf117d6e66603c1cdae9b728a22d95 |     
>      powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/3f881b81ca28a81f349edc6a89da4fa8af0c8b9f |     
>          arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/56695732ab4cd8b4f383d5d5cb66656df6b9ab48 | ORPH
>          arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/c4afc6c66e06991253093b5ec858300bfc7ddb15 |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4e144e3459820660bf1177cd699ee7cc3df92d8d |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fe95a25efa46bcc39e92e5907ea2f1373a7f2658 |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9f3106075678b215cbfc8a52953aacca87e2b1b7 |     
>      powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/03f5c8aea6b70255d8ddb6799b1e3da084fef035 |     
>          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/991ba480344ebf6124b7ccd1cd0c193edc71eee0 |     
>     mips64el |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/0ac5efb2742e3e6378ec8b6fc4b3e87b736e2961 |     
>      aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/a11d86e020694e3db7450bcbc1515ddd02abc0bb |     
>       x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/6384968ba88d3780b7236094a34d0af8523c1ac8 |     
>      aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/005706e5174751124eb2b897cd1fde279b7cf921 |     
>          arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/859f84c01f0952b0db831a23bb497c97efd88777 |     
>      sparc64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/12c84bafb511d8bc2784e1f40549447a2e7b570d |     
>      riscv32 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/4d5f87b0648c852889b0597bad7e379ab3fdbd43 |     
>     mips64el |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/f8933ef1aceed87ea9462b8e1d489f561998b5e6 |     
> 
> Results for branch '2019.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                    netsurf-3.8 | 2 
>                   brotli-1.0.7 | 1 
>                         glibmm | 1 
>                   linuxptp-2.0 | 1 
>               qt5enginio-1.6.3 | 1 
> 
> 
> Detail of failures
> ------------------
> 
> microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/e164f004308445b3262ba8623b9ea8ba04a52f56 |     
> microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/7c73575074ed3a9c983af5a94e7a457299869afd |     
>      aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/4aa1e4724ec9e245ee0178cafde97f3beed2f107 |     
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bf764a34436e8afbf9f4b180f89f80856984b6c2 |     
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7628a5af74a1abe43c16faef5ab7be572e4abc11 |     
>       xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/bbd57f01c3b3890774d21668669ecc296c12f094 |     
> 
> 
> -- 
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
