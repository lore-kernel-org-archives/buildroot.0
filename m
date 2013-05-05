From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 May 2013 01:04:02 +0000 (UTC)
Subject: [Buildroot] [Bug 6236] binutils-2.23.2/bfd fails with undefined
 reference to __fini_array_end
In-Reply-To: <bug-6236-163@https.bugs.busybox.net/>
References: <bug-6236-163@https.bugs.busybox.net/>
Message-ID: <20130505010402.AC09599AD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6236

--- Comment #1 from Adam Nielsen <a.nielsen@shikadi.net> 2013-05-05 01:04:06 UTC ---
Created attachment 4892
  --> https://bugs.busybox.net/attachment.cgi?id=4892
uClibc config, generated through buildroot

Add uClibc config to generate error

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
