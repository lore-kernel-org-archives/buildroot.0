From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 10:26:20 +0000 (UTC)
Subject: [Buildroot] [Bug 1207] linux26-menuconfig does not apply all kernel
	patches
In-Reply-To: <bug-1207-163@https.bugs.busybox.net/>
References: <bug-1207-163@https.bugs.busybox.net/>
Message-ID: <20100624102620.0DB4981975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1207

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Due to the merge of the linux-cleanup work, the concept of "board patch" for
the Linux kernel no longer exists. Now we have a single "Kernel Patch" option,
which allows to apply either a single patch, or multiple patches stored in a
single directory.

So this problem should not exist anymore.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
