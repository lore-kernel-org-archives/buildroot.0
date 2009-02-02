From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 22:21:48 +0000 (UTC)
Subject: [Buildroot] [Bug 83] liblockfile fails to compile due to eaccess
	redefinition
In-Reply-To: <bug-83-163@https.bugs.busybox.net/>
References: <bug-83-163@https.bugs.busybox.net/>
Message-ID: <20090202222148.790EA76A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=83





--- Comment #2 from Hunter Cobbs <hunter.cobbs@gmail.com>  2009-02-02 22:21:46 UTC ---
I use the current toolchain when compiling my kernel.  I was simply trying to
maintain the same toolchain across all builds, but it looks like that may not
be the best track to take.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
