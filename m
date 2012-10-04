From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Oct 2012 20:47:37 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121004204737.CE1CC997A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #6 from Maxime Ripard <maxime.ripard@free-electrons.com> 2012-10-04 20:47:36 UTC ---
Created attachment 4574
  --> https://bugs.busybox.net/attachment.cgi?id=4574
Patch to use mkimage directly instead of make uImage

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
