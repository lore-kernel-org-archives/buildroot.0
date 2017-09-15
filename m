From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Sep 2017 05:45:17 +0000
Subject: [Buildroot] [Bug 10316] Building grub fails on debian stretch
In-Reply-To: <bug-10316-163@https.bugs.busybox.net/>
References: <bug-10316-163@https.bugs.busybox.net/>
Message-ID: <bug-10316-163-Dg0UXI1HgH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10316

--- Comment #2 from dde at innovaphone.com ---
I never played with grub2.
We build a buildroot ova image with qemu from a binary image where I use an
automated process which builds the partition table along with stage1/1.5 of
grub.

In the end, if you're going to remove grub, I can still either use already
built grub files and copy them manually or I need to figure out how to move to
grub2.

Greetings,
Daniel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
