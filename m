From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Jun 2017 15:50:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-06-20
In-Reply-To: <20170621063055.D2EE6208DF@mail.free-electrons.com>
References: <20170621063055.D2EE6208DF@mail.free-electrons.com>
Message-ID: <CAMRc=Me_-5xaUkmsbj36VQwyohns+iRTc5Wny+bCDPmGSi_FCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-21 8:30 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Build statistics for 2017-06-20
> ================================
>
>       successes : 118
>        failures : 935
>        timeouts : 0
>           TOTAL : 1053
>
> Classification of failures by reason
> ====================================
>
>               host-expat-2.2.1 | 449
>                    expat-2.2.1 | 422
>      python-cryptography-1.7.2 | 11
>               alsa-lib-1.1.4.1 | 6
>                 kvazaar-v1.1.0 | 6
> knock-258a27e5a47809f97c2b9... | 5
>            argp-standalone-1.3 | 4
>                 busybox-1.26.2 | 4
>        linuxconsoletools-1.6.0 | 4
>                    attr-2.4.47 | 3
> dropwatch-7c33d8a8ed105b07a... | 2
>                      gpsd-3.16 | 2
>                 beecrypt-4.2.1 | 1
>                 bellagio-0.9.3 | 1
>                   cc-tool-0.26 | 1
>                   check-0.11.0 | 1
>                   cppcms-1.0.5 | 1
>                      efivar-30 | 1
>                gnuradio-3.7.11 | 1
>            host-doxygen-1.8.13 | 1

FYI I've submitted a pull request[1] fixing the host-doxygen build
failures that have been popping up recently. Let's wait and see if it
can be merged upstream and then include it in buildroot too.

Best regards,
Bartosz Golaszewski

[1] https://github.com/doxygen/doxygen/pull/574
