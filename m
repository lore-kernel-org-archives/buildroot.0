From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Apr 2020 06:33:58 +0000
Subject: [Buildroot] [Bug 11866] iniramfs file system fails to boot using
 Grub on EFI x86_64
In-Reply-To: <bug-11866-163@https.bugs.busybox.net/>
References: <bug-11866-163@https.bugs.busybox.net/>
Message-ID: <bug-11866-163-hbW8P2lc5C@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

--- Comment #5 from Timo Ketola <timo.ketola@exertus.fi> ---
There is no entry for fs/cpio in the DEVELOPERS file. This bug and the patch
feels like orphaned.

What should we do?

Pete, would you be able to evaluate and test the patch?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
