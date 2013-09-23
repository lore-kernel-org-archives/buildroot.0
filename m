From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Sep 2013 13:17:51 +0000 (UTC)
Subject: [Buildroot] [Bug 1153] Buildroot fails to build packages if
 BR2_GCC_SHARED_LIBGCC=y
In-Reply-To: <bug-1153-163@https.bugs.busybox.net/>
References: <bug-1153-163@https.bugs.busybox.net/>
Message-ID: <20130923131751.276609B847@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1153

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-09-23 13:18:13 UTC ---
When you change some toolchain settings, do you always do a complete "make
clean && make" ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
