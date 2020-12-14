From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Dec 2020 22:19:02 +0100
Subject: [Buildroot] [PATCH v1] package/bind: fix compile/linking failure
In-Reply-To: <20201214215300.560d44c7@gmx.net>
References: <20201214202026.29519-1-ps.report@gmx.net> <X9fOqhygcYoZlh1D@pevik>
 <20201214215300.560d44c7@gmx.net>
Message-ID: <20201214221902.33f0988c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Dec 2020 21:53:00 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Petr,
>
> On Mon, 14 Dec 2020 21:44:26 +0100, Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > Hi Peter,
> >
> > > Fixes:
> >
> > >   - http://autobuild.buildroot.net/results/966a3de94aa97fa8e9895eede29c9cbfb4bd7301
> >
> > >   .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
> > >   .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'
> >
> > Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> > Thanks for your fix, LGTM.
> > Have you tried to send your patch upstream (I haven't seen it in
> > https://gitlab.isc.org/isc-projects/bind9/-/merge_requests).
>
> Not yet...., will do...


https://gitlab.isc.org/isc-projects/bind9/-/issues/2348


>
> Regards,
> Peter
>
>
> >
> > BTW I'll probably update bind to 9.16.8 soon (following suggestion from Peter Korsgaard).
> >
> > https://kb.isc.org/docs/aa-01540
> > BIND 9.11 is our Extended Support Version, supported until December, 2021.
> > BIND 9.16 will be our next ESV, followed by BIND 9.20; every second stable version after that will be ESV
> >
> > But your patch will be needed for both.
> >
> > Kind regards,
> > Petr
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
