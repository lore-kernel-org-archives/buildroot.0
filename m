From: David Smoot <davidsmoot@gmail.com>
Date: Sun, 25 Feb 2007 19:20:11 -0600
Subject: [Buildroot] Mac OS X status
In-Reply-To: <45E1751E.2010406@cs.helsinki.fi>
References: <45E1751E.2010406@cs.helsinki.fi>
Message-ID: <b15982770702251720v71d2dd5fo87e5a6f56f34d6a5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Big thumbs up to you for doing this.  I'm sure it is a small group of people
that would use buildroot on a Mac but I appreciate it.  And I would imagine
Buildroot will benefit by the extra effort to make it POSIX compliant.
David

On 2/25/07, Heikki Lindholm <holindho@cs.helsinki.fi> wrote:
>
> Hello,
>
> In case there are some other parties interested in seeing buildroot
> working on a Mac OS X host, here's a short status report. Using the sed
> patch I posted and after fixing some incompatible "cp"'s, one "du -l", a
> few missing headers, and a missing "getline" function, I can build a
> simple uclibc+busybox installation up to where it would need fakeroot,
> which, unfortunately, doesn't seem to work on OS X.
>
> -- Heikki Lindholm
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070225/d93afe5c/attachment.htm 
