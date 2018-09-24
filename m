From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2018 15:21:34 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-Xx7QptBacz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #7 from J.F. <jfdoyon@gmail.com> ---
Created attachment 7796
  --> https://bugs.busybox.net/attachment.cgi?id=7796&action=edit
New fakeroot makefile

The new fakeroot makefile, which handles running autoreconf to re-generate the
configure script after patch 0003 has been applied.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
