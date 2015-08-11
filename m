From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 11:18:33 +0000 (UTC)
Subject: [Buildroot] [Bug 8276] package/dropbear: symlink resolution
	incorrect
In-Reply-To: <bug-8276-163@https.bugs.busybox.net/>
References: <bug-8276-163@https.bugs.busybox.net/>
Message-ID: <20150811111833.9E00D80144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8276

--- Comment #2 from nospam+busybox at jtang.org 2015-08-11 11:18:33 UTC ---
Yes, FEATURE_READLINK_FOLLOW is set. If it makes a difference, this is using
the raspberrypi2_defconfig, with uClibc-ng.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
