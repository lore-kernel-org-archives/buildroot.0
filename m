From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2015 21:59:01 +0000 (UTC)
Subject: [Buildroot] [Bug 4099] cut utility from GNU coreutils works
	incorrect
In-Reply-To: <bug-4099-163@https.bugs.busybox.net/>
References: <bug-4099-163@https.bugs.busybox.net/>
Message-ID: <20150806215901.93F7C81DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4099

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-06 21:59:01 UTC ---
I confirm that I am able to reproduce the problem with uClibc, but not with
glibc.

I reported the bug to upstream uClibc, see
http://lists.uclibc.org/pipermail/uclibc/2015-August/049026.html. We'll see if
the uClibc developers have some clue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
