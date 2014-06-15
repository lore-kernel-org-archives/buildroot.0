From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jun 2014 10:39:13 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140615103914.553859CF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-06-15 10:39:13 UTC ---
Which gcc version was used for the test? It can be useful to be able to match
libgcc/unwind-dw2.c:1567 from the backtrace with the appropriate source code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
