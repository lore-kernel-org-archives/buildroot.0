From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Jul 2016 18:33:47 +0000
Subject: [Buildroot] [Bug 9091] U-Boot fails to boot with large ramdisk
In-Reply-To: <bug-9091-163@https.bugs.busybox.net/>
References: <bug-9091-163@https.bugs.busybox.net/>
Message-ID: <bug-9091-163-BpSQ62Bgkq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9091

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report. I've attached a patch that should fix the issue.
Since I don't have the HW to test, can you test the patch and report back if it
works for you? Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
