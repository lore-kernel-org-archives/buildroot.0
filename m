From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Aug 2017 13:38:01 +0000
Subject: [Buildroot] [Bug 10281] lsblk does not compile for util-linux
In-Reply-To: <bug-10281-163@https.bugs.busybox.net/>
References: <bug-10281-163@https.bugs.busybox.net/>
Message-ID: <bug-10281-163-yC5vxoJRuo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10281

--- Comment #2 from Carlos Santos <casantos@datacom.ind.br> ---
I just noticed that commit 031659024b3cf27bb68dc58d07519b563ef472a1 did not add
the required entries in Config.in.legacy for BR2_PACKAGE_UTIL_LINUX_FINDFS and
BR2_PACKAGE_UTIL_LINUX_LSBLK selecting BR2_PACKAGE_UTIL_LINUX_BINARIES.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
