From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:13:04 +0100
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <5639D8CB.2020104@wsystem.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
 <CAGduivwTD1Z6GNz5oUCZ8cDVU9kf_PF5iykrR0Z2-Ny9K4zrzA@mail.gmail.com>
 <5639D774.1030501@wsystem.com>
 <CAGduivzaWxVq=OYOH3WjGn_iKRn2qKcJ3h79yi6mekAcn7dMjg@mail.gmail.com>
 <5639D8CB.2020104@wsystem.com>
Message-ID: <CAGduivzqDvJn2H=JiwO69Nu2C=zM2tqnyP84Rk057fTm1FQs_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[-SNIP-]

> >     >     Maybe this should be:
> >     >     EnvironmentFile-=/etc/default/dhcpd
> >     >
> >     >     Notice the '-' before the '=', in case the file doesn't
> exists, it won't print a warning or error the whole service.
> >     >
> >     > My mistake, the '-' should be *AFTER* the '='.
> >
> >     See 06/13.
> >
> > Ah yes, should they be squashed ?
>
> No: these patches have different purposes.
>
Yes, on that bombshell

Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
[-SNIP-]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/07dd322d/attachment.html>
