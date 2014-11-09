From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 20:08:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141109200843.9EFC3B2290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

--- Comment #5 from Alexander Clouter <alex+buildroot@digriz.org.uk> 2014-11-09 20:08:43 UTC ---
Okay, found the problem.

Not a clean build environment, and I was using the following as a quick and
dirty 'clean':

http://lists.busybox.net/pipermail/buildroot/2012-September/058323.html

If I distclean then build, it all works fine.

Really sorry for wasting your time.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
