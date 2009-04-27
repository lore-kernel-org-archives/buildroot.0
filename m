From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Apr 2009 12:45:08 +0000 (UTC)
Subject: [Buildroot] [Bug 269] iptables fails to compile
In-Reply-To: <bug-269-163@https.bugs.busybox.net/>
References: <bug-269-163@https.bugs.busybox.net/>
Message-ID: <20090427124508.B808B7745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=269





--- Comment #3 from Floris Bos <info@je-eigen-domein.nl>  2009-04-27 12:45:08 UTC ---
Problem only seems to occur when cross compiling on a 32-bit host for a 64-bit
target.

Does work in the x86_64 edition of Archlinux


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
