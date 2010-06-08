From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jun 2010 06:51:00 +0000 (UTC)
Subject: [Buildroot] [Bug 835] Package Dataflashboot-1.05 does not compile
 with builroot toolchain
In-Reply-To: <bug-835-163@https.bugs.busybox.net/>
References: <bug-835-163@https.bugs.busybox.net/>
Message-ID: <20100608065100.6A049C13E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=835

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This is fixed by
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=bootloaders-cleanup&id=1d84e9a8bfbf4904dfc191c6873c235d2502af24
in my bootloaders-cleanup branch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
