From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jul 2014 15:01:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140724150157.585899D2E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #17 from David Bachelart <david.bachelart@bbright.com> 2014-07-24 15:01:57 UTC ---
Created attachment 5534
  --> https://bugs.busybox.net/attachment.cgi?id=5534
C code using pthread_exit

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
