From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Apr 2009 14:10:20 +0000 (UTC)
Subject: [Buildroot] [Bug 269] iptables fails to compile
In-Reply-To: <bug-269-163@https.bugs.busybox.net/>
References: <bug-269-163@https.bugs.busybox.net/>
Message-ID: <20090427141020.3E1747745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=269





--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  2009-04-27 14:10:19 UTC ---
hmm, I'm afraid my machines all run 64bit, so you'll have to debug that
yourself. try comparing libext4.a from the 32bit and 64bit builds.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
