From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 08:47:02 +0100
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140301232520.4ee4b22b@skate>
 <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
Message-ID: <20140303084702.7790637d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Mon, 3 Mar 2014 07:51:45 +0100, Lionel Orry wrote:

> > I tried to apply this patch, but unfortunately, it apparently breaks
> > the build of mongrel2:
> >
> > src/superpoll.c: In function 'SuperPoll_poll':
> > src/superpoll.c:229:53: error: 'ZMQ_POLL_MSEC' undeclared (first use in this function)
> > src/superpoll.c:229:53: note: each undeclared identifier is reported only once for each function it appears in
> >
> > I've checked the other reverse dependencies of zeromq, and they seem to
> > build fine.
> >
> > Can you find a solution to the mongrel2 problem, and resubmit the
> > appropriate patch?
> 
> Such a patch would fix compilation, but the fact is this version of

What do you mean by "such a patch" ? Maybe you forgot to attach a patch
to your e-mail?

> Mongrel2 was not tested with ZeroMQ v4 and greater
> and I don't know if we can simply bump its version like that. Maybe we
> can but I am not 100% sure.
> 
> On another hand, mongrel2 development is becoming active again and
> they are trying to prepare a release, so I will try to check there if
> they ensure zeromq4 compliance and tested it. I will get back to you
> when I can on this subject.

Ok, thanks!

Does ZeroMQ v4 changes the API/behavior a lot compared to v3 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
