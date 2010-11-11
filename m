From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Nov 2010 15:11:01 +0000 (UTC)
Subject: [Buildroot] [Bug 2785] mtd-utils build fails due to missing libmtd
In-Reply-To: <bug-2785-163@https.bugs.busybox.net/>
References: <bug-2785-163@https.bugs.busybox.net/>
Message-ID: <20101111151101.B52388DCE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2785

--- Comment #1 from Patrick Ziegler <patrick.ziegler@fh-kl.de>  ---
Created attachment 2659
  --> https://bugs.busybox.net/attachment.cgi?id=2659
Fix Build of ubi tools if no other mtd tool was built

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
