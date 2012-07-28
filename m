From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Jul 2012 07:42:04 +0000 (UTC)
Subject: [Buildroot] [Bug 5408] qt build failure with Sourcery CodeBench ARM
	2010.09
In-Reply-To: <bug-5408-163@https.bugs.busybox.net/>
References: <bug-5408-163@https.bugs.busybox.net/>
Message-ID: <20120728074204.DA1F896F59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5408

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-28 07:42:04 UTC ---
(In reply to comment #2)
> PS: Thomas, do you think it could be wise to add all supported toolchains
> (including this one) to your build server?

Yes. I actually already have a bunch of CodeSourcery toolchains, but not
2010.09. I.e, I have: ARM 2010q1, ARM 2011.03 default multilib, ARM 2011.03
ARMv4 multilib, ARM 2011.09 default multilib, ARM 2011.09 thumb2 multilib. I
also have x86, MIPS and PowerPC CodeSourcery toolchains. But yes, I could plan
on adding *all* toolchains that we support, just to give more build coverage.

Generally speaking, the automated test builds are really only in v1 at the
moment, I have a lot of ideas to improve the build coverage, and to provide a
more useful Web interface for them.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
