From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jan 2010 22:59:16 +0000 (UTC)
Subject: [Buildroot] [Bug 821] cp: illegal operation
In-Reply-To: <bug-821-163@https.bugs.busybox.net/>
References: <bug-821-163@https.bugs.busybox.net/>
Message-ID: <20100128225916.E22FD77752@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=821





--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-01-28 22:59:15 UTC ---
Sorry, I think you'll run into a lot more problems than that to use BR on
!Linux.
E.G.:

git grep 'cp -d'|wc -l
185

On top of that comes the build systems of the individual packages. I think
you'll have a lot easier time dual booting / running Linux in a VM.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
