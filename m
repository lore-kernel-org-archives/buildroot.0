From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 10:12:40 +0000 (UTC)
Subject: [Buildroot] [Bug 2677] introducing util-linux-ng as replacement for
	util-linux
In-Reply-To: <bug-2677-163@https.bugs.busybox.net/>
References: <bug-2677-163@https.bugs.busybox.net/>
Message-ID: <20110918101240.125E28D540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2677

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
util-linux has been updated to 2.19.1 by commit
6378cac4e633600d1e2d6cdcd729049fda090fb3. It is still named util-linux, because
the project util-linux-NG has now replaced the util-linux and has therefore
been renamed back to util-linux.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
