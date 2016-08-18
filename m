From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Aug 2016 17:31:24 +0000
Subject: [Buildroot] [Bug 9166] Missing overlays directory in VFAT image for
 raspberry pi 3
In-Reply-To: <bug-9166-163@https.bugs.busybox.net/>
References: <bug-9166-163@https.bugs.busybox.net/>
Message-ID: <bug-9166-163-c6cNPhjkmW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9166

--- Comment #3 from diez.roggisch at ableton.com ---
First, my apologies for violating the unknown protocol. Won't happen again.

I checked, and matter of factly the patch would break buildroot if
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS was not selected. So it's moot
anyway.

I still would like a solution that takes care of this semi-automatically, as
it's simply surprising for a developer IMHO. But I will argue for that once
(and if) I find one.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
