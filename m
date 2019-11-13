From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 13 Nov 2019 08:18:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-11-12
In-Reply-To: <20191113071640.7E98B2042D@silver.osuosl.org>
References: <20191113071640.7E98B2042D@silver.osuosl.org>
Message-ID: <CAGm1_kvARUQ2_7yGBy+Yxm75jbSOiCMiW8ODN02wRc6Uw8uDyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 13, 2019 at 8:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2019-11-12
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  | 10  |  0  |  0  | 10  |
>   2019.08.x  | 13  |  3  |  0  | 16  |
>     master   | 84  | 32  |  0  | 116 |
>      next    |  9  |  2  |  0  | 11  |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                  gerbera-1.3.2 | 7
> am33x-cm3-11107db2f1e9e58ee... | 3
>                  xvisor-0.2.11 | 3
>                        kmod-26 | 2
>                 libselinux-2.9 | 2
>         ltp-testsuite-20190930 | 2
>                   flashrom-1.1 | 1
>       gst1-plugins-base-1.16.1 | 1
>           gstreamer1-mm-1.10.0 | 1
>               host-grpc-1.23.0 | 1
>                 libdrm-2.4.100 | 1
> linux-serial-test-5d11b31d9... | 1
> mmc-utils-d40ec535b9d4e4c97... | 1
>                     mpv-0.29.1 | 1
>                 oprofile-1.3.0 | 1
>                qt5webkit-5.9.1 | 1
>               sigrok-cli-0.7.0 | 1
>                wireshark-3.0.5 | 1
>     xserver_xorg-server-1.20.5 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/df38bcd58b7cb1e6fe48a0edbe3c27b436f79853 | ORPH
>     arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/06c87deedfe129fc316f39ab6099382eb836198c | ORPH
>     arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/9f2985c76805ab398bbc65fb67eff31308a4657c | ORPH
>   powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c579e662b2d4d77d481f41fdba0bd079a1c8048e |
>    xtensa    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/21052c11267e59bd1a4840a58b9f0b66483d3fe0 |
>   mips64el   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6c0f7584138bdb92d9541b4f7793d2c63340ef1a |
>     arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/19d84eab8c9481d451bab15ea0ece479b90a82bb |
>     arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/8d8e482ca4abaebeaf56f8508ddd1b1f06cafff3 |
>   aarch64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/2f9ba6a2c04bf9a4b0bd12ef77cb2ca79dd456c5 |
>   aarch64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/d50f0add372851f41f3d8bc0fd68a78bff1191af |
>    xtensa    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/80503f6dc3ccb02084bb09243da04458ac6a3a73 |
>    xtensa    |    gst1-plugins-base-1.16.1    | NOK | http://autobuild.buildroot.net/results/d171059801adf8dea1a2116d7c729a2aa5767ac8 |
>     mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ddbe88830117e777c6dd9d0b067493a89e40fcc8 |
>     arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1412f96ae74f6c6f0915e4e674fe40e003a60700 |
>  aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/b0225cb61c129dadffe4c956bee5012fe899af5f |
>     mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/acd7d34652b775ccbb8228f5feb63ae198f5c853 |
>     arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/41403bae10b35616ec9545f82a9967c422ebac6b |
>     arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5eaec78dcd46877f510dce73ae0c6ac68301b760 |
>     arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2eb08b93fcd24620c32e011cdcccc2720f83eeba |
>   sparc64    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/6be00faffc0888c479f2ca2afbfd5e4519afd315 |

Fixed here https://patchwork.ozlabs.org/patch/1192820/

Yegor

>     arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/4b3be0d5ae970a6d8d94207c6b2b860b483b8dda |
>   riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/9388c05ab8b2af25dbbeaf30152ba8d386ef89c3 |
>     mips     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/5fe8e2441344541e532988c80ce2dbbc3978fd6e |
>     arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ad74c66ff28cac39f4d4ea93e20911c158c28bbc |
>     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/8b121cb8bb5b9d83d5455e31ae27c2779de7f5e1 |
>    mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/baaf13da8a700ad7ef51925d78db7a4d5789e813 |
>     or1k     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/4855d42545cbfeeec7529410acc84b61bc8790af |
>   powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/b929f6ea5582341c761126d69664987bd4c77240 | ORPH
>  powerpc64   |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/e7e610239e0af4e63b5c91f212cebe8222d9b53e |
>   aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/520bbdc0a91f5b5b7fc37f91b91ecade4642819d |
>    x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/7a955b7518106b8abf1b792d9139993d50910f03 |
>   aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/540a6a9afc5f36b9d384161190826e1ce46a8751 |
>
>
>
>
> Results for branch '2019.08.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                     ffmpeg-4.2 | 1
>                 gnuchess-6.2.5 | 1
>                   qemu-3.1.1.1 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/d544cfb560bee2a35f3945da1ef03f5da0075ff5 |
>     arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/f2b352b1ef8d3911f2105dc3e5bcc9448c36bfff | ORPH
>     arm      |          qemu-3.1.1.1          | NOK | http://autobuild.buildroot.net/results/4debb6eb1ff127062f5ceaf4cb2adac224f2d917 | ORPH
>
>
> Results for branch 'next'
> =========================
>
> Classification of failures by reason
> ------------------------------------
>
>                  gerbera-1.3.2 | 2
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     i686     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/a91a26a6621f4cd98c48d078b694b643aa4bce33 |
> powerpc64le  |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/ed1ed202012429cc54ef3e386b6c50ec0f0200cc |
>
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
