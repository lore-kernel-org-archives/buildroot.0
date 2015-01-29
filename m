From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jan 2015 11:05:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150129110528.0B1E580E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #4 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-01-29 11:05:27 UTC ---
Vicente: yes, it's expected, see http://www.lua.org/pil/4.2.html (search for
interactive, it's not considered the same block in that case).
Try to run it from a file.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
