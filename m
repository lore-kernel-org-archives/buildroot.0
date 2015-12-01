From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 22:16:45 +0000 (UTC)
Subject: [Buildroot] [Bug 8501] gunzip fails to uncompress files
In-Reply-To: <bug-8501-163@https.bugs.busybox.net/>
References: <bug-8501-163@https.bugs.busybox.net/>
Message-ID: <20151201221645.F134480576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8501

--- Comment #2 from Jason Rush <rush0033@hotmail.com> 2015-12-01 22:16:45 UTC ---
I added the patch for upstream commit 6bd3fff51aa74e2ee2d87887b12182a3b09792ef
to my local tree, and I can confirm that fixes the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
