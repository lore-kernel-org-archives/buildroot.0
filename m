From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jan 2014 07:40:09 +0000 (UTC)
Subject: [Buildroot] [Bug 2629] Segmentation faults and division by zero in
	Grub on ext2
In-Reply-To: <bug-2629-163@https.bugs.busybox.net/>
References: <bug-2629-163@https.bugs.busybox.net/>
Message-ID: <20140107074009.48F5C9C3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2629

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-01-07 07:40:09 UTC ---
Since this report, we've updated the Debian revision of the Grub we're using in
Buildroot. It contains the fix for the problem (2) you mention. I haven't
checked for problem (1), but Grub runs fine here, tested under Qemu with an
ext2 filesystem.

Marking the bug as fixed. Don't hesitate to reopen if you're still having
problems with Grub on 2013.11.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
