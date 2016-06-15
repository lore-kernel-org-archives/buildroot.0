From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jun 2016 12:47:48 +0000
Subject: [Buildroot] [Bug 9006] gcc with c++ support v4 and v5 fail to
 compile on fedora 24 (gcc v6)
In-Reply-To: <bug-9006-163@https.bugs.busybox.net/>
References: <bug-9006-163@https.bugs.busybox.net/>
Message-ID: <bug-9006-163-MiX1255tXn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9006

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This has already been fixed as part of commit
45ce84f1fe3174fdada4b9bc947be2ddfb8c92eb. This commit was not in Buildroot
2016.05, so if you're using Buildroot 2016.05, you should either upgrade to the
latest Git master, or backport commit 45ce84f1fe3174fdada4b9bc947be2ddfb8c92eb
on top of Buildroot 2016.05.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
