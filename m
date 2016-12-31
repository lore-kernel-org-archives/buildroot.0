From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 14:23:03 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-ZtPTxPNK8C@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #11 from bilge at scriptfusion.com ---
It has nothing to do with Docker; you can think of Docker like any other
virtual machine. I build as root (a) because I do not care about users or
permissions in a VM and (b) because I had no reason to believe Buildroot would
not work when running as root.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
