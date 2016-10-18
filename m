From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 18 Oct 2016 14:10:39 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
	16.04
In-Reply-To: <3fc3c742-0be1-d297-49af-8d442fc2b567@mind.be>
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
 <20161018114615.4a6f95b7@free-electrons.com>
 <CA+TH9Vm+QmqEOxPmrypq6MqZGjOjQhB7rgKY_O0nCB7D69Y6Ag@mail.gmail.com>
 <3fc3c742-0be1-d297-49af-8d442fc2b567@mind.be>
Message-ID: <CA+TH9V=YO9o5MPJ5PiTs+Lm-bOtrpcPD-fYMs0hyYzF54p5Ymw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

2016-10-18 14:03 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 18-10-16 12:00, Angelo Compagnucci wrote:
> > Dear Thomas,
> >
> > 2016-10-18 11:46 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com
> > <mailto:thomas.petazzoni@free-electrons.com>>:
> >
> >     Hello,
> >
> >     On Mon, 17 Oct 2016 23:53:02 +0200, Angelo Compagnucci wrote:
> >
> >     > +             sudo apt-get purge -q -y snapd lxcfs lxd
> ubuntu-core-launcher snap-confine
> >
> >     Why are you doing this step?
> >
> >
> > Ubuntu 16.04 introduced a number of services releated to the ops world
> and they
> > are not strictly releated to our use case. So I'm removing them to free
> some
> > space on disk and gain a bit of cpu cycles.
>
>  I'm completely on board with doing that. Although it's really only snapd
> that
> takes space (25MB). There may even be more cruft that can be removed, but
> people
> can contribute if they want to :-).
>
>  BTW, how are you going to gain CPU cycles this way?
>

They runs several background services (like snapd, lxcfs) that potentially
could use cpu to do thier unnecessary (for us) duties.

Sincerely, Angelo


>
> >
> >
> >     Thanks,
> >
> >     Thomas
> >     --
> >     Thomas Petazzoni, CTO, Free Electrons
> >     Embedded Linux and Kernel engineering
> >     http://free-electrons.com
> >
> >
> >
> >
> > --
> > Profile: http://it.linkedin.com/in/compagnucciangelo
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161018/9743b1d1/attachment.html>
