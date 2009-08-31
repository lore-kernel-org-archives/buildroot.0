From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 07:51:26 +0000 (UTC)
Subject: [Buildroot] [Bug 499] make O=... busybox-menuconfig crashes
In-Reply-To: <bug-499-163@https.bugs.busybox.net/>
References: <bug-499-163@https.bugs.busybox.net/>
Message-ID: <20090831075126.58BA7776BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=499





--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-31 07:51:25 UTC ---
(In reply to comment #1)
> Strange - It works here (both with a clean tree and after a full build).
> The only issue I remember about O= was fixed long ago with 94b3420da9c94c3044f,
> where packages that also support O= (linux, busybox, ..) got confused as it got
> forwarded.

Thomas, are you still seeing this issue? 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
