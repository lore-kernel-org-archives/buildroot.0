From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 2 Feb 2008 12:20:14 +0200 (EET)
Subject: [Buildroot] Adding a new architecture
In-Reply-To: <BMEBLILHDELOCLHMCPHNGEHAGKAA.marc@tensilica.com>
References: <BMEBLILHDELOCLHMCPHNGEHAGKAA.marc@tensilica.com>
Message-ID: <29344.127.0.0.1.1201947614.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marc,

It's great to hear about new port!

Think small logical isolated patches for submission are better because they are easier
for review and test.

> We'll omit unrelated fixes that we can post later.  However, some
> of the changes touch common code.  Do we post some of these first?

I think patches to common code can go independently of arch related patches.

Regards,
Ivan

> Hi,
>
> We've ported buildroot to the Xtensa architecture.
> (It currently lives on linux-xtensa.org .)
> At some point in the near future, we'll be getting ready to submit
> the port to the buildroot patch tracker.
>
> Shall we simply submit the whole thing in one big patch?
>
> We'll omit unrelated fixes that we can post later.  However, some
> of the changes touch common code.  Do we post some of these first?
>
> Thanks,
> -Marc
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
