From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Sep 2017 10:36:41 +0000
Subject: [Buildroot] [Bug 10216] package/x11r7/mcookie/mcookie.c:207: bad
	size ?
In-Reply-To: <bug-10216-163@https.bugs.busybox.net/>
References: <bug-10216-163@https.bugs.busybox.net/>
Message-ID: <bug-10216-163-bmwKL5L6zv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10216

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
FYI, this specific issue was fixed upstream (util-linux) back in 2009:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/lib/md5.c?id=6596057175c6ed342dc20e85eae8a42eb29b629f

I'll fix up our embedded mcookie.c copy as well for 2017.02.7 and 2017.08.1.
Moving forward, it indeed makes more sense to use the util-linux version.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
