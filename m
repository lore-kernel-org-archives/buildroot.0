From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 20 Jun 2020 13:05:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-06-19
In-Reply-To: <20200620062637.31F5586456@fraxinus.osuosl.org>
References: <20200620062637.31F5586456@fraxinus.osuosl.org>
Message-ID: <469b66c4-52e8-218e-aa73-314a096efc04@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

On 20.06.2020 08:26, Thomas Petazzoni wrote:
> Hello,
>
> Autobuild statistics for 2020-06-19
> ===============================
>
>        branch |  OK | NOK | TIM | TOT |
>    2020.02.x  | 17  |  8  |  0  | 25  |
>    2020.05.x  | 18  |  8  |  0  | 26  |
>      master   | 103 | 75  |  1  | 179 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                  iproute2-5.7.0 | 20
>                    boost-1.73.0 | 11
>                gnuradio-3.8.1.0 | 9
>                         unknown | 4
>                       avahi-0.8 | 3
>                 domoticz-2020.1 | 2
>                     eigen-3.3.7 | 2
>                host-grpc-1.25.0 | 2
>                      mraa-2.1.0 | 2
>                  qt5base-5.15.0 | 2
>                    zeromq-4.3.2 | 2
>                 apcupsd-3.14.14 | 1
>                 belle-sip-4.3.1 | 1
>                bitcoin-0.19.0.1 | 1
>                     cegui-0-8-7 | 1
>               freeswitch-1.10.3 | 1
>    gobject-introspection-1.64.1 | 1
>                        icu-67-1 | 1
>                     mimic-1.1.0 | 1
>                         mongodb | 1
>                 qt5webkit-5.9.1 | 1
>                   rocksdb-6.6.4 | 1
>                    rygel-0.38.3 | 1
>                   samba4-4.11.9 | 1
>         shadowsocks-libev-3.3.3 | 1
>                  suricata-4.1.8 | 1
>                        tio-1.32 | 1
>               xscreensaver-5.43 | 1
>
>
> Detail of failures
> ------------------
>
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>      arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7d6ee94b636a076ee7084e6fba0d687a735a2309 |
>     mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7f3bd6786d7d687d124e54296f5a72aebc42a739 | ORPH
>      mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/12dbecdd546a34f5b4c1d7f24041048dc53427a1 | ORPH
>      arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b18f492ba008a9a13911640830884f688b127b58 | ORPH
>     xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/9d0f60c3362ea3cf86dc2b64579f5793140e8a06 |
>      arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/090878b9e2e0fd0fe9f6390bc6424c1a6dfd555e |
>      arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/91faf4a306860395c7d50b9ff27a1bb1f41a8646 |
>    riscv32    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c8275739e80bb730e4e99adbf4eb3f0ea8a31bdd |
>     x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/002188adaeb3ba18bae2c4c084991ea98306b9fc |
>    aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a132069560e53fa73b6f2a459cba2e76ad5012f7 |
>     x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/4fec835d5da74cffb20790334418e58edb169d85 |
>    aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/47270a1f987d05bff85c706e94d1284a488f8486 |
>     mipsel    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d6c79a94294f71b2b92f91331c1f2ef08b52a698 |
>    mips64el   |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b23bf8ea46950c2c115e042980ae63e9d478900f |
>    powerpc    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b13f0ff85c2115b034b4608f33bcba863b0a1396 |
>      arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/599de263a0d812b4b399477e9384b3062f06373d |
>      arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/90b879aa24a2313903c199228812f40ec6a4d095 |
>      arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/528b1248fa258b3f3822f6924b3650a221a67fd3 |
It seems to be related to the irrlicht itself but anyway I'll take a 
look at it.
> mipsel | domoticz-2020.1 | NOK | 
> http://autobuild.buildroot.net/results/0ff022c9a0958eeabc2fb3fa6fc2d2abc55a6d17 
> | aarch64 | domoticz-2020.1 | NOK | 
> http://autobuild.buildroot.net/results/b24041b98993e1a84c39a186a4b40676dff4799b 
> | arm | eigen-3.3.7 | NOK | 
> http://autobuild.buildroot.net/results/bddfbb03b20c5a25cd5dad4929cb25f2328ee128 
> | arm | eigen-3.3.7 | NOK | 
> http://autobuild.buildroot.net/results/e1da731ec42307481ecbe2481d6c1748eda0398c 
> | nios2 | freeswitch-1.10.3 | NOK | 
> http://autobuild.buildroot.net/results/2a5bd6d7d235d3f5f569c9b21d9898fae12fcbe4 
> | i586 | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/45843a144be80f0abcefbaae48fd4678eddf9071 
> | sparc64 | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/203952ab91d2dfbc2eca8c191376e8fcafcd86d3 
> | nios2 | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/91c189d7945660477059ab177c785a69715c7d13 
> | xtensa | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/09b5738594ca66b7276eacf6637641eb72469ab0 
> | powerpc | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/3a60d73fdb60f65326d97b8d63eb31d7dbee47c1 
> | xtensa | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/9977db50b153ad3ce73bf5d4959b35ee719bb0dd 
> | arc | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/ab43b1fba708a8b7b7aceceb1aeeeb4bb24bc7c2 
> | arm | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/db251011f4af433d5993c842a8ec7ef4c512908a 
> | mipsel | gnuradio-3.8.1.0 | NOK | 
> http://autobuild.buildroot.net/results/074cdde03a3a27fc4147fb76cc7b14dcc0ecc279 
> | riscv32 | gobject-introspection-1.64.1 | NOK | 
> http://autobuild.buildroot.net/results/1cf96f895a5ebffd553acf62eaed90ed260a3a55 
> | xtensa | host-grpc-1.25.0 | NOK | 
> http://autobuild.buildroot.net/results/3467ff0298509f1ba0e0bc9e2e4c5fb29f575454 
> | riscv64 | host-grpc-1.25.0 | NOK | 
> http://autobuild.buildroot.net/results/66e511572eb3b3fb99895b535b3500534e907d60 
> | x86_64 | icu-67-1 | NOK | 
> http://autobuild.buildroot.net/results/d19cdd318ca54f3088649e368d1199a5ca25bf48 
> | ORPH arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/a3d934209afb78b8ed5204af00b6b0eb9ed7af06 
> | arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/d7d509239cf042a23771dc1c86b47e970a3fc830 
> | powerpc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/071c8ff50cb501e7ddad66dfdd4f2e086b1bbda8 
> | or1k | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/7ca79ff55ebf0f7d06e2896d1abba43feab2670a 
> | arc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/1ce3dc61c3b199918f89f3b87d0dd5db20f6b50b 
> | mips64el | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/fd942ed92ad70b416eaa70803fc6d8bf4473be6f 
> | sparc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/79e7d8e1b947a264eb166b89ae1b3c83dcfff520 
> | mipsel | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/c35c416759a03a96726f1ea5e7fef9d9d6704817 
> | arc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/2616362c870392372eef1f9d9bceebbc1cfc9466 
> | powerpc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/34a30c739d247937d8773842430e64fd51cc7707 
> | sh4 | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/372743a0052df90e8f5186fe79ef1542153ccba4 
> | arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/f643d328846c0ab1b7be378bedefeeb91b449632 
> | sparc | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/2ec96ad2173ba1e9320700d452d789887c25325c 
> | arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/7b46325fadd377e87f1294c433cf109a332dccd9 
> | microblazeel | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/cf92e516461e4b6dc086dc4bb4d96f68e9f674a9 
> | arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/25d6d2f85a2d109ae4819a9a0748051da814cac9 
> | xtensa | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/0334cddbfc03ca9185f52f5102ac37a8f258e5ab 
> | arm | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/8d421899ce66002d9b9865412cd017caf0ba4d56 
> | m68k | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/c7ec1d5e56f9db4d38a6c03150ea1b7b79a3bd70 
> | xtensa | iproute2-5.7.0 | NOK | 
> http://autobuild.buildroot.net/results/eb476999dd15a1982006f4d54c31fd4593422997 
> | powerpc | mimic-1.1.0 | NOK | 
> http://autobuild.buildroot.net/results/e32e4a64a15db8efc5d85c35cf5b7ab03cdb7c82 
> | arm | mongodb | TIM | 
> http://autobuild.buildroot.net/results/8cdc71f77fecd7dd60c0d46d2bc5a9f170243c81 
> | arm | mraa-2.1.0 | NOK | 
> http://autobuild.buildroot.net/results/cfa9211b2f1545bd27606c06bdb5292e2953d0f0 
> | arm | mraa-2.1.0 | NOK | 
> http://autobuild.buildroot.net/results/d61a97a176b1083f3f5ef8c775132f2234faa931 
> | sparc | qt5base-5.15.0 | NOK | 
> http://autobuild.buildroot.net/results/6afbbd148af401338a96ca3a5aebd8a3a2dc7fe2 
> | mipsel | qt5base-5.15.0 | NOK | 
> http://autobuild.buildroot.net/results/e5aa6f4078cc33b1e84ed7802ffc50dd3334baf7 
> | mipsel | qt5webkit-5.9.1 | NOK | 
> http://autobuild.buildroot.net/results/4f9f939f3278eba136a2af18237ddc9587647b0e 
> | powerpc | rocksdb-6.6.4 | NOK | 
> http://autobuild.buildroot.net/results/f53344246f1bc6563ca1b990d8f03470b76c0814 
> | arm | rygel-0.38.3 | NOK | 
> http://autobuild.buildroot.net/results/5fcecf270d15e298f89dd33b3c89bb9f62f608c7 
> | mips64el | samba4-4.11.9 | NOK | 
> http://autobuild.buildroot.net/results/7478050ce306ec99b9efa57d58a4b0e69f9abcaf 
> | sh4 | shadowsocks-libev-3.3.3 | NOK | 
> http://autobuild.buildroot.net/results/357dad67767124c270f7a366a1e06f93f2e6fc41 
> | m68k | suricata-4.1.8 | NOK | 
> http://autobuild.buildroot.net/results/aad38b60ddaf66ccd14cd82ca27b14d6a1dd4734 
> | sparc64 | tio-1.32 | NOK | 
> http://autobuild.buildroot.net/results/9ff746862db431d50d31b210a1f40b2551aed256 
> | mips | unknown | NOK | 
> http://autobuild.buildroot.net/results/cd4d94d34c9716eefb09aded04c669a3e3213e45 
> | sh4 | unknown | NOK | 
> http://autobuild.buildroot.net/results/e7b89f3b212da27d2a1c83aa8e4a5c66a3344aa8 
> | arc | unknown | NOK | 
> http://autobuild.buildroot.net/results/1f3b59b7ab5f782ab6aaebc2f3153aa2e4d7a941 
> | arm | unknown | NOK | 
> http://autobuild.buildroot.net/results/208b5f8ff62ce8f9d507093d0b0e57788d015799 
> | arm | xscreensaver-5.43 | NOK | 
> http://autobuild.buildroot.net/results/12e0df97d799208ef90534c8d3297f75e67b7bd8 
> | or1k | zeromq-4.3.2 | NOK | 
> http://autobuild.buildroot.net/results/bb7a4848b4bed83043bb5c619ae0e9c515a33738 
> | or1k | zeromq-4.3.2 | NOK | 
> http://autobuild.buildroot.net/results/699dc0e152a2ea19b3278812d2ea452f47b3adf7 
> | Results for branch '2020.02.x' ============================== 
> Classification of failures by reason 
> ------------------------------------ gnutls-3.6.13 | 2 binutils-2.32 | 
> 1 host-acpica-20191018 | 1 host-pango-1.44.6 | 1 libopenssl-1.1.1g | 1 
> protobuf-3.11.0 | 1 xvisor-0.2.11 | 1 Detail of failures 
> ------------------ arch | reason | OK? | url | orph? 
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+------- 
> m68k | binutils-2.32 | NOK | 
> http://autobuild.buildroot.net/results/debe996be7dac391444b1cbe3bb63c13d0b1e659 
> | or1k | gnutls-3.6.13 | NOK | 
> http://autobuild.buildroot.net/results/1682a6731264c2e9c80e2dc1d044af7ea6ed6aa6 
> | or1k | gnutls-3.6.13 | NOK | 
> http://autobuild.buildroot.net/results/8aa4a0ddb6161044df40bf39c6037220fac2bb66 
> | arm | host-acpica-20191018 | NOK | 
> http://autobuild.buildroot.net/results/36b9766148e372d3080cced54415de8f1896c096 
> | riscv32 | host-pango-1.44.6 | NOK | 
> http://autobuild.buildroot.net/results/635cb631bc2ae4e982d6c83b4c0141d5e472badc 
> | ORPH m68k | libopenssl-1.1.1g | NOK | 
> http://autobuild.buildroot.net/results/30ddc17d111456cd770cba5ec1b9e9456c65fde7 
> | or1k | protobuf-3.11.0 | NOK | 
> http://autobuild.buildroot.net/results/47d40ed6f738dc7e1cc89c34bf72d4b509b54c79 
> | x86_64 | xvisor-0.2.11 | NOK | 
> http://autobuild.buildroot.net/results/d2cf3bc044d6ab3e5e6afb34bac270c6aa1430a6 
> | Results for branch '2020.05.x' ============================== 
> Classification of failures by reason 
> ------------------------------------ qt5base-5.14.2 | 2 
> belle-sip-4.3.1 | 1 host-acpica-20191018 | 1 libgtk2-2.24.32 | 1 
> minidlna-1.2.1 | 1 openal-1.19.1 | 1 tio-1.32 | 1 Detail of failures 
> ------------------ arch | reason | OK? | url | orph? 
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+------- 
> nios2 | belle-sip-4.3.1 | NOK | 
> http://autobuild.buildroot.net/results/a40db9c19a53b2fd2e418f73eca2d9808c72b5a3 
> | arm | host-acpica-20191018 | NOK | 
> http://autobuild.buildroot.net/results/f7737c0c314b240bd80e3315ab4f03821dbb05fb 
> | sparc64 | libgtk2-2.24.32 | NOK | 
> http://autobuild.buildroot.net/results/5b61f71fe4331f03a4c4978928e67dfc66fe5be2 
> | arm | minidlna-1.2.1 | NOK | 
> http://autobuild.buildroot.net/results/71218717b7bac741d567510e2dfa06b7c1924192 
> | or1k | openal-1.19.1 | NOK | 
> http://autobuild.buildroot.net/results/57cf15f2a125e80b4de7569f80b5ba91f2dd32ec 
> | arm | qt5base-5.14.2 | NOK | 
> http://autobuild.buildroot.net/results/3c7be16eeab010f5035a2b7165aa08e273fb88fc 
> | riscv32 | qt5base-5.14.2 | NOK | 
> http://autobuild.buildroot.net/results/6b70d27be63f49d8e732d34adb3fafb415d2a3c4 
> | sparc64 | tio-1.32 | NOK | 
> http://autobuild.buildroot.net/results/f33b11c82dde32259e511bea60eb8439ef489550 
> | 
Best
Bartek
