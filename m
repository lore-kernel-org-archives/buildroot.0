From: Will Newton <will.newton@gmail.com>
Date: Thu, 28 Nov 2013 08:26:04 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-27
In-Reply-To: <20131128073003.1BC191014F4@stock.ovh.net>
References: <20131128073003.1BC191014F4@stock.ovh.net>
Message-ID: <CAFbHwiTteMEBdZ5LtjGVhy4v5WsEBn7fAOXopuheOxAmiO9XkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 28, 2013 at 7:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-11-27
> ===============================
>
>         success : 88
>        failures : 22
>        timeouts : 0
>           TOTAL : 110
>
> Classification of failures by reason
> ====================================
>
>                       icu-51.2 | 2
>                  dropwatch-1.4 | 2
>                qt5script-5.1.1 | 1
>                   libv4l-0.8.9 | 1
>                 openssl-1.0.1e | 1
>   toolchain-external-undefined | 1
>                 valgrind-3.8.1 | 1
>                   imlib2-1.4.5 | 1
>                  rt-tests-0.83 | 1
>               fontconfig-2.6.0 | 1
>                  libnspr-4.9.6 | 1
>                  binutils-2.22 | 1
>                   samba-3.6.20 | 1
>                iptables-1.4.20 | 1
> ne10-88c18f02199947b2c8b577... | 1
>           enlightenment-0.17.3 | 1
> tvheadend-2b649954346aa2e9c... | 1
>                       qt-4.8.5 | 1
>              alsa-utils-1.0.26 | 1
>                       gpsd-3.9 | 1
>
> Detail of failures
> ===================
>
>       bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/25cc92251e00ecc1d85837a39f3304a66403699d/
>     xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/f7c98efb98f0c13a7998d0fa87ad5f5b5e6aadff/
>       bfin |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/9214a6ae3c7873452d92d4004ce8a65a3b3f34fe/
>       bfin |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/6b1f4f2167d8aca0d73dc0e66fd2e1704c821c61/
>    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/5c2dbacb0e2963c655e5afde4d143a41cad27628/
>       bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/0ff3ec81c80929278baf26cda3d8fbdf8184c0fd/
>    aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/724f8646e1c2c28cf187f2313244d1e3e61b4c25/

Function profiling should be enabled for aarch64 in the Linaro gcc 4.8
2013.10 release.
