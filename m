From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 21:54:18 +0000 (UTC)
Subject: [Buildroot] [Bug 6452] eglibc from Linaro 2013.07 not copied to
	target correctly
In-Reply-To: <bug-6452-163@https.bugs.busybox.net/>
References: <bug-6452-163@https.bugs.busybox.net/>
Message-ID: <20131030215419.0560B9BC3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6452

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 21:54:18 UTC ---
This has now been fixed in the latest master by adding a symlink in /lib.
Another fix was needed to create a symlink in /usr/lib, and this patch is
pending in the for-peter-2013.11 branch. Marking this bug as fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
