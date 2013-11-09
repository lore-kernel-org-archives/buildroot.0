From: Will Newton <will.newton@gmail.com>
Date: Sat, 9 Nov 2013 14:53:00 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-08
In-Reply-To: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
Message-ID: <CAFbHwiQn4A9bBVNqJZwJyfNZsurx618CtUpENAZ3ATis62qNyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 9, 2013 at 7:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-11-08
> ===============================
>
>         success : 77
>        failures : 48
>        timeouts : 0
>           TOTAL : 125
>
> Classification of failures by reason
> ====================================
>
> zmqpp-31220ca4a0fb43a0848d7... | 4
>                  qt5base-5.1.1 | 3
>                  libnspr-4.9.6 | 2
>                libglib2-2.36.3 | 2
>              alsa-utils-1.0.26 | 2
>                  binutils-2.22 | 2
>                   nettle-2.7.1 | 2
>           host-protobuf-c-0.15 | 2
>                       icu-51.2 | 2
>         gst1-plugins-bad-1.2.0 | 2
>                 libiscsi-1.6.0 | 2
>                 pulseaudio-4.0 | 1
>              util-linux-2.23.2 | 1
>                 openssl-1.0.1e | 1
> ti-utils-06dbdb2727354b5f3a... | 1
>                   boost-1.54.0 | 1
>                       qt-4.8.5 | 1
>                   aespipe-2.4c | 1
> ne10-88c18f02199947b2c8b577... | 1
>                 busybox-1.21.1 | 1
>                audiofile-0.3.6 | 1
>                libcap-ng-0.7.3 | 1
>                     php-5.3.27 | 1
>           openpgm-5.1.118~dfsg | 1
>                  fdk-aac-0.1.2 | 1
>                      gmp-5.1.3 | 1
>                  mplayer-1.1.1 | 1
>                alsa-lib-1.0.26 | 1
>                   tstools-1_11 | 1
>                   libv4l-0.8.9 | 1
>                   zeromq-3.2.4 | 1
>                  cdrkit-1.1.11 | 1
>               fontconfig-2.6.0 | 1
>                 valgrind-3.8.1 | 1
>
> Detail of failures
> ===================
>
>       mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/da0268df99b9bf920d88121e7c3d33d41a57d951/
>        arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/983828bd27a521020e42e58cce9393e6b8d23502/

Hi Thomas,

Do you know what is going on with the binary arm toolchain above? It
looks like the toolchain is configured wrongly, it also has "linaro"
and "uclibc" in the tarball name which is a strange combination. ;-)
