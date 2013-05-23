From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 May 2013 16:19:28 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130523161928.ECBE89A4B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #16 from Shawn J. Goff <shawn7400@gmail.com> 2013-05-23 16:18:13 UTC ---
Created attachment 4922
  --> https://bugs.busybox.net/attachment.cgi?id=4922
config where uImage clobbers zImage

I was hoping to spend some time to get a minimal example, but I haven't gotten
to it yet, but I wanted to get something up in case anyone else is looking into
this at the same time. This config does have the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
