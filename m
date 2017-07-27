From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 27 Jul 2017 09:39:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-07-26
In-Reply-To: <20170727063206.38AA121F1C@mail.free-electrons.com>
References: <20170727063206.38AA121F1C@mail.free-electrons.com>
Message-ID: <CAGm1_ks=rgLmq2WydTvmwERfO6Wz5UiLAYUDHwb0Au1VSC-L2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 27, 2017 at 8:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-07-26
> ================================
>
>       successes : 144
>        failures : 23
>        timeouts : 0
>           TOTAL : 167
>
> Classification of failures by reason
> ====================================
>
>                      gpsd-3.16 | 3
>              lttng-tools-2.9.5 | 3
> python-libconfig-b271c3d9da... | 3
>                  libssh2-1.8.0 | 2
>                  qt5base-5.9.1 | 2
>                   cc-tool-0.26 | 1
>             mesa3d-demos-8.3.0 | 1
>                  mplayer-1.3.0 | 1
>              qt5location-5.6.2 | 1
>                qt5webkit-5.6.2 | 1
>               swupdate-2017.04 | 1
>              transmission-2.92 | 1
>                   whois-5.2.14 | 1
>                      xen-4.9.0 | 1
>             xlib_libXpm-3.5.12 | 1
>
>
> Detail of failures
> ===================
>
>        sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/75cc9c7962d72120333853001863d6b1eab65c30 |
> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/72caafadea873b6ae9baa4d55d63763a4e98f406 |
> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/b7910f42a4cf0f8ff2cd90322d92f88d831557c5 |
> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/8c6a0004acd2c636d3f0fb4b1a9e70bcdc00abca |
>      powerpc |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/ae4afec62ca297df1cd02350601f1d62fc3cd1b7 | ORPH
>          arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/49e96312f2034de84455151f6ccd65cdf928cc22 | ORPH
>          arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/20c405df50ca9cf0daea7d562b088c98fb9b6a58 |
>       x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/e2405f50fe5f0e27f2c7b1751e6c4cdd76497075 |
>         i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/a976af565d18b74b183e49376077de1a59e4a7c2 |
>          arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/f5f02845ac897215ee78375b260c27bf7eff5a2d |
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/60468416ebdaae3b56b3f4f90df0c9207ee5b408 |
>         mips | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/97533965180436c2f7a99de07fdc360ef57f84b0 |
>      powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b49de32704f0f7ce5a610cf4363c6dcc2d8bafa1 |
>          arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e26b4b9b486c582fb55826817a3428569968320f |

I'll take care of this issue. Python3 names library boost_python3, so
I'll make a patch, that would evaluate Python version and select
proper library name.

Yegor

>      sparc64 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/69e2251beb9c8ecca0aa56ed13eae95684544cac |
>       mipsel |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/5eb873c279507e7654d408c0b5611f1b2aeaa022 |
>          arm |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/0966115af386a34d04da242bd6c643f69c24f2c6 |
>          arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c28777c4b066648628384671e5ce8cd86e3ea4d0 |
> microblazeel |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/ca5683cc4d6266b1742a78262c17413df51085e1 |
>         i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0218ca2cf62d97a941c0206f9819299e3188da55 |
> microblazeel |                   whois-5.2.14 | NOK | http://autobuild.buildroot.net/results/be28d06ae004a46c87133d6f07709c6f909288d8 |
>          arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/bb1310eb1464d880a357ae5e491fd168361d25a0 |
>          arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/a824ab820237bfe3f1771c84c9ae5e556d995d44 |
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
