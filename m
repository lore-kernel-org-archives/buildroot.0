From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2015 13:36:14 +0000 (UTC)
Subject: [Buildroot] [Bug 8381] make manuconfig problem in opensuse 13.2
In-Reply-To: <bug-8381-163@https.bugs.busybox.net/>
References: <bug-8381-163@https.bugs.busybox.net/>
Message-ID: <20150930133614.3F87581DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8381

--- Comment #4 from Zurab Tutberidze <ztutberidze@gmail.com> 2015-09-30 13:36:14 UTC ---
(In reply to comment #3)
> (In reply to comment #2)
> > > That sounds like a bug in the ncursesw.pc file your distribution in using. 
> > > Does menuconfig work for other packages (Linux kernel, busybox, barebox, ..)?
> > 
> > I think you are right.
> > 
> > Sorry for my mistake.
> > 
> > But I think this information will helpful for others who will use buildroot on
> > same system
> 
> I agree. What distribution are you using? Do you have similar problems with
> menuconfig in the Linux kernel or busybox?

I am using opensuse 13.2.

yes the problem is in kernel and busybox.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
