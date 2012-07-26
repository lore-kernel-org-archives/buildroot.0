From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2012 04:55:43 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120726045543.60F1C96EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #8 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-26 04:55:42 UTC ---
(In reply to comment #6)
> Can you ask Buildroot to generate a tarball from your root filesystem, and put
> it online somewhere (if it doesn't contain anything confidential or
> proprietary)?

I think i figures out the cause of the problem.
What should the '/bin/login' be? In the versions that work it points to
'busybox'. In the version that does not work (this version) it's a standard
executable.

Could this be the reason that i can't login?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
