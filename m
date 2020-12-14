From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 14 Dec 2020 21:48:25 +0100
Subject: [Buildroot] [PATCH v1] package/bind: fix compile/linking failure
In-Reply-To: <X9fOqhygcYoZlh1D@pevik>
References: <20201214202026.29519-1-ps.report@gmx.net> <X9fOqhygcYoZlh1D@pevik>
Message-ID: <X9fPmTg1tcXw8rZR@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Peter,

> > Fixes:

> >   - http://autobuild.buildroot.net/results/966a3de94aa97fa8e9895eede29c9cbfb4bd7301

> >   .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
> >   .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'

> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Thanks for your fix, LGTM.
> Have you tried to send your patch upstream (I haven't seen it in
> https://gitlab.isc.org/isc-projects/bind9/-/merge_requests).

> BTW I'll probably update bind to 9.16.8 soon (following suggestion from Peter Korsgaard).
I mean 9.16.9

Kind regards,
Petr

> https://kb.isc.org/docs/aa-01540
> BIND 9.11 is our Extended Support Version, supported until December, 2021.
> BIND 9.16 will be our next ESV, followed by BIND 9.20; every second stable version after that will be ESV

> But your patch will be needed for both.

> Kind regards,
> Petr
