From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 May 2019 07:39:45 +0000
Subject: [Buildroot] [Bug 11841] grub-efi.cfg not used when building EFI
 disk image
In-Reply-To: <bug-11841-163@https.bugs.busybox.net/>
References: <bug-11841-163@https.bugs.busybox.net/>
Message-ID: <bug-11841-163-7GSjIDifIl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11841

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the report, you're totally right. I have submitted
http://patchwork.ozlabs.org/patch/1097871/ to fix this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
