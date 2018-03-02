From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Mar 2018 22:31:09 +0000
Subject: [Buildroot] [Bug 10781] cryptsetup luksOpen container_file
 container causes libdevmapper segfault
In-Reply-To: <bug-10781-163@https.bugs.busybox.net/>
References: <bug-10781-163@https.bugs.busybox.net/>
Message-ID: <bug-10781-163-qmAEXPRF6m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10781

--- Comment #3 from Nobodyman <nobodyman@gmx.de> ---
This patch found on this site
https://gitlab.labs.nic.cz/turris/turris-os-packages/commit/8f08ed5f59b51b222aef72fb2902472b0fa068ad
was commited from Michal Hrusecky <michal.hrusecky@nic.cz>.
Original path: utils/lvm2/patches/004-dm_task_get_info.patch

lvm2: Fix crash and update to 2.02.145

Fixed really tricky issue with I suspect uClibc and devicemapper. For details
see the patch. While at it updating it to the latest version as it didn't
worked
anyway.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
