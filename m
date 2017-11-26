From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 26 Nov 2017 09:34:47 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-25
In-Reply-To: <20171126070006.676FA209DE@mail.free-electrons.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
Message-ID: <CAGm1_ktg9yOT9B8ScspcU0bmANg9+wCsOgqJVnQvPKSabXWGyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 26, 2017 at 8:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-11-25
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2017.08.x |  13 |   0 |   0 |  13 |
>       master | 224 |  12 |   0 | 236 |
>         next |  54 |  10 |   1 |  65 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                        unknown | 4
>               host-erlang-19.3 | 2
>                asterisk-14.5.0 | 1
> host-google-breakpad-7515ab... | 1
> pdbg-527fe54e1c95e031efd3db... | 1
>                       qt-4.8.7 | 1
>                qt5webkit-5.9.1 | 1
>                    zmqpp-4.1.2 | 1
>
>
> Detail of failures
> ------------------
>
>          arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/7c9892b9425aff6e54b8c8942dbdcb0b26e58572 | ORPH
>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892 |
>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10 |
>          arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/88dcf7c898c21935b44f9216dfde86c4be8c990e |
>         bfin | pdbg-527fe54e1c95e031efd3db... | NOK | http://autobuild.buildroot.net/results/d367d9a6367e5da10d9f53f52c5e685c5c0cb8a7 |
>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4ee0bde32f4f1be7b9e3d060b84a7b0054a44f33 | ORPH
>       mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/cc064f4de95e34b397794c1486e1c09bb67916f5 |
>  powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/1d069b73dfaff53f5bd1a7c0677353ce8b06eec1 |
>          arc |                        unknown | NOK | http://autobuild.buildroot.net/results/5edd57619d2448bdb8c1e23463eecee4798d7000 |
>         i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/1a461a774e6bb01ffa7b4460085455a1e5858627 |
>       x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/6f389115b2195a5aa06ba1ceae7fdfe1b4522151 |
>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d7c6370dcd9c13c56189d55c920841db03d5ab6c |
>
> Results for branch 'next'
> =========================
>
> Classification of failures by reason
> ------------------------------------
>
>  netcat-openbsd-debian_1.178-3 | 2
>    python-jaraco-classes-1.4.3 | 2
>                      axel-2.16 | 1
>                       feh-2.21 | 1
> google-breakpad-7515ab13768... | 1
>                    libnl-3.4.0 | 1
>                 libxslt-1.1.29 | 1
>                 linphone-3.6.1 | 1
>                        unknown | 1
>
>
> Detail of failures
> ------------------
>
>          arm |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/0471bc87bddbff42d7016d78080613c4fae117bf | ORPH
>     mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/3852ceb48b26a94042a1610801c8edb0ea694072 |
>       mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f6dfc780f878003faccf3542ff5532b05c05d644 |
>          arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/68a701efaca4f7ffc02ed91fcd8118298f916e7d | ORPH
> microblazeel |                 libxslt-1.1.29 | TIM | http://autobuild.buildroot.net/results/2000c1282f66303a0e4ced19307b91ff931868a7 |
>       xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/473c686f9bc5335d25b720cf1b0c45389138a7b4 | ORPH
>       x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/3c42c1eadcbfc084a1e55bf1df0450aaf1f2139c |
>     mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/de0dd8983243ee5d1fb189add8ce445177fb87c2 |
>          arm |    python-jaraco-classes-1.4.3 | NOK | http://autobuild.buildroot.net/results/3a7000002b86663a56c0341d192f131a4a8f4936 |
>       xtensa |    python-jaraco-classes-1.4.3 | NOK | http://autobuild.buildroot.net/results/553d6fdeb6ea5359b1c7d4eeb844da7a588f02e7 |

My bad. I'll fix this on Mo.

Yegor

>       xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/2ea51b2c0781cf043b4ce6a568788da748ae5a3e |
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
