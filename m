From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  7 Jun 2015 18:21:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7931] Default configuration for Cubieboard v1 is
	outdated
In-Reply-To: <bug-7931-163@https.bugs.busybox.net/>
References: <bug-7931-163@https.bugs.busybox.net/>
Message-ID: <20150607182151.49490807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7931

--- Comment #5 from mfld.fr at gmail.com 2015-06-07 18:21:50 UTC ---
Created attachment 6061
  --> https://bugs.busybox.net/attachment.cgi?id=6061
Change kernel GIT version

This patch just changes the version sourced by BuildRoot to get the right
Linux-Sunxi 3.4 (latest commit), not the 3.0.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
