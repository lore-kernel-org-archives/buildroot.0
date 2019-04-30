From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Apr 2019 12:34:52 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-VNaXGvt1IP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #2 from Pete Morici <pmorici@dev295.com> ---
Yeah, I spoke too soon.  Doing a dirclean on util-linux and rebuilding after a
full build corrects the issue but that isn't a solution.  

Could libudev be broken out into a separate package that can be built before
the whole?  I'm not familiar enough with buildroot yet to know what a good way
to approach this is.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
