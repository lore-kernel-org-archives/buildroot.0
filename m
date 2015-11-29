From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 22:59:21 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] libglib2 2.46.1 not Building for armv5 on
	2015.11-rc3
In-Reply-To: <bug-8491-163@https.bugs.busybox.net/>
References: <bug-8491-163@https.bugs.busybox.net/>
Message-ID: <20151129225921.F095C81E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-29 22:59:21 UTC ---
(In reply to comment #2)

> I guess we'll need to force -marm for libglib2.

The assembly code in question comes from glib/valgrind.h, but unfortunately, I
don't see a way of disabling valgrind "support" from glib.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
