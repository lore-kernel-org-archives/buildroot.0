From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Oct 2013 12:10:19 +0000 (UTC)
Subject: [Buildroot] [Bug 6650] Segmentation fault when trying to build
	latest buildroot
In-Reply-To: <bug-6650-163@https.bugs.busybox.net/>
References: <bug-6650-163@https.bugs.busybox.net/>
Message-ID: <20131031121020.27F929BC4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6650

--- Comment #4 from daniel.karlsson at scanreco.se 2013-10-31 12:10:19 UTC ---
(In reply to comment #3)
> Ok, if you use the mainline Buildroot, then it's fine. We should support
> whatever configuration you use. Can you share the defconfig you're using, and
> the exact Buildroot version you tested? Thanks!

There's no need. Apparently, the developer of the config had their own
buildroot branch where it all worked. I also had an outdated version of the
defconfig, when I tried the "new" one with the mainline buildroot, it
complained about "legacy configurations", which is correct behaviour, I guess.

Thank you for your help

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
