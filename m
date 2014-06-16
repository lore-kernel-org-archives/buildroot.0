From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jun 2014 09:43:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140616094341.20A149D00A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-06-16 09:43:40 UTC ---
(In reply to comment #9)
> IMHO a good solution would be to make patches conditional in some cases, e.g.
> only use 900-musl-support.patch if C library is selected to musl. I guess it
> would require quite amount of work thought...

That's certainly a solution, but I wouldn't qualify it as a good solution. We
try really hard to avoid having conditional patches.

Though, as a temporary solution it would certainly be acceptable. This problem
is a major bug in Buildroot 2014.05, and we have to solve it somehow.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
