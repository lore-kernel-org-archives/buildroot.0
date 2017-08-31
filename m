From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Aug 2017 13:31:56 +0000
Subject: [Buildroot] [Bug 10281] lsblk does not compile for util-linux
In-Reply-To: <bug-10281-163@https.bugs.busybox.net/>
References: <bug-10281-163@https.bugs.busybox.net/>
Message-ID: <bug-10281-163-Rf6eaHUMgb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10281

Carlos Santos <casantos@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |casantos at datacom.ind.br
                   |.org                        |

--- Comment #1 from Carlos Santos <casantos@datacom.ind.br> ---
The "lsblk" utility is part of the "basic set", now. Ensure that you have
BR2_PACKAGE_UTIL_LINUX_BINARIES selected.

If this does not work then please run "make BR2_DEFCONFIG=/tmp/my-defconfig
savedefconfig" and attach the resulting /tmp/my-defconfig to this bug report,
so I can try to reproduce the problem here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
