From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 13 Dec 2017 08:48:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-12
In-Reply-To: <20171213070039.D656620758@mail.free-electrons.com>
References: <20171213070039.D656620758@mail.free-electrons.com>
Message-ID: <CAGm1_kuGhPJQRCte16rbR7vRE0r6cWhLJxJ2-z1Fjy_1DmCCKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 13, 2017 at 8:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-12-12
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>       master | 196 |  23 |   1 | 220 |
>    2017.08.x |  21 |   0 |   0 |  21 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>              host-cmake-3.10.0 | 11
>                    mpd-0.20.12 | 3
>                     php-7.1.12 | 2
>                 poppler-0.59.0 | 2
> kvm-unit-tests-kvm-unit-tes... | 1
>                  libdrm-2.4.88 | 1
>                    libiio-0.10 | 1
> make[6]: *** [profile-do--b... | 1
>  netcat-openbsd-debian_1.178-3 | 1
>           python-keyring-3.0.5 | 1
>
>
> Detail of failures
> ------------------
>
>    powerpc64 |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/d00989dd5d55ebc10b336fe726aea6a8e9759143 |
>          arm |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/b0bcfcec5d2c28a4b2304e4ae8e024a5cd54c1fd |
>          arm |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/f8d517a9d84b0c0c3a0c0a9c86420819c666e02e |
>        nios2 |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/fe0531ea0f5b149c0491942fd2cd20d5f81a6204 |
>         i686 |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/93a202f691615a3bb2a46a3273171e83d52bd0a3 |
>      aarch64 |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/ecf16f24a88b5a68772c61243fd8fd2f254dbf2b |
>         m68k |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/5a2c14c6a3320774ccdf5ff6831ea287605d9222 |
>          arm |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/aaef453d838f74db691968d42f094b6f62617ad5 |
>       x86_64 |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/90d38169b50c29842ecc1752c2abf66d4c2d9e63 |
>          arm |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/7747a3f1c529bf9b53f339377344933bc3538414 |
>          arm |              host-cmake-3.10.0 | NOK | http://autobuild.buildroot.net/results/ae88e2addefab8c7ccefa853c87313034ea241bc |
>       x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/92fd3f7813c3b17b849d161743e7a7939c7ca423 |
>        sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/2a9853c7ec9557ea3174e47b9db1679a373e7519 |
>          arm |                    libiio-0.10 | NOK | http://autobuild.buildroot.net/results/7351911b1dea5a4d2a8e0310350e72746b5df113 |
>          arm | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/fd7441e13741f5f951fea99a48112cb9ca9bb3f6 |
>         i586 |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/ce241a53a30b26e7e5f223e2651a912d65d88a38 |
>          arc |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/b64970c3ef79256111230c134c9fd7ddce72baab |
>       xtensa |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/6e3cfcaa951d30abb3f09672c347131c0f564a60 |
>         i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/bf30f5a6cb4beba35a9973aa147078f29d40b8cd |
>          arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/c4369981b56ea17e4d4b19fb84a04a5171ccb3f5 | ORPH
>          arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/a9840b84f5ca9e188405a1589d2ab98420a60711 | ORPH
>          arc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/4dcb305b3f7aac59e911de54ff7b2cbe96965f5d |
>          arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/67f310745e801559821b1c03758b60db3c9f5c13 |
>     mips64el |           python-keyring-3.0.5 | NOK | http://autobuild.buildroot.net/results/f7322f19303daa3d403f2c0f13379d947431300d |

I'll take care of python-keyring. It needs a bump and a total overhaul.

Yegor

>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
