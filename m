From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 May 2013 23:17:47 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130521231747.D7EC79A1D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #10 from Shawn J. Goff <shawn7400@gmail.com> 2013-05-21 23:16:40 UTC ---
This patch was never committed. The issue is affecting me now on 2013.05_rc2
with a 3.9 kernel. The linux.mk file has changed enough that this won't apply.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
