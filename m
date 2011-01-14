From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jan 2011 16:53:34 +0000 (UTC)
Subject: [Buildroot] [Bug 3085] Init scripts are not compatible with
 sysVinit (when busybox is not chosen)
In-Reply-To: <bug-3085-163@https.bugs.busybox.net/>
References: <bug-3085-163@https.bugs.busybox.net/>
Message-ID: <20110114165334.8F2968B520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3085

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This has been fixed by
http://git.buildroot.net/buildroot/commit/?id=7e2bf63080cc0011c84ee46ee2aba161569154c5

This commit was not part of Buildroot 2010.11, but will be part of Buildroot
2011.02, scheduled to be released end of next month.

The sysvinit inittab proposed is probably not perfect (for example it doesn't
work well for halt/reboot), but at least it allows the system to boot properly.
Feel free to suggest further improvements.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
