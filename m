From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Aug 2016 17:14:59 +0000
Subject: [Buildroot] [Bug 9166] Missing overlays directory in VFAT image for
 raspberry pi 3
In-Reply-To: <bug-9166-163@https.bugs.busybox.net/>
References: <bug-9166-163@https.bugs.busybox.net/>
Message-ID: <bug-9166-163-0TPP5LCf9Y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9166

diez.roggisch at ableton.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from diez.roggisch at ableton.com ---
I found that BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS actually does the
job - but only after a clean rebuild. I will close.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
