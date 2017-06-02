From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Jun 2017 09:04:25 +0000
Subject: [Buildroot] [Bug 9926] systemd-resolved.service: Failed at step
 NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <bug-9926-163-k9fBVi1phV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9926

--- Comment #3 from Michael Heinemann <posted@heine.so> ---
I just verified all these options are set.


Sidenote: The option TMPFS_POSIX_XATTR is not exisiting in my kernel (4.9)
tree. Googling for it only yields buildroot related result. I guess this should
be TMPFS_XATTR which is in fs/Kconfig right after TMPFS_POSIX_ACL.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
