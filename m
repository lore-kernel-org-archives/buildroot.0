From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Apr 2012 21:20:31 +0000 (UTC)
Subject: [Buildroot] [Bug 2557] [PATCH] mkfs.xfs complains about missing
	libxfs.so.0
In-Reply-To: <bug-2557-163@https.bugs.busybox.net/>
References: <bug-2557-163@https.bugs.busybox.net/>
Message-ID: <20120429212031.4CF4596BF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2557

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-04-29 21:20:31 UTC ---
As of e1fbd63f3c9700ef9d590ea7b4659ca592db5e3c, xfsprogs uses libuuid from
util-linux, and as of a41cdcf78f0300909dc5e6acc68abd7d64418bba it has been
converted to autotargets, and the version is now 3.1.8. So most likely this bug
is fixed now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
