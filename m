From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Aug 2009 22:39:26 +0000 (UTC)
Subject: [Buildroot] [Bug 523] pciutiles can't find libz
In-Reply-To: <bug-523-163@https.bugs.busybox.net/>
References: <bug-523-163@https.bugs.busybox.net/>
Message-ID: <20090801223927.1609A777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=523


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc.|thomas.petazzoni at free-
                   |org                         |electrons.com
             Status|NEW                         |ASSIGNED




--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-08-01 22:39:26 UTC ---
Created an attachment (id=541)
 --> (https://bugs.busybox.net/attachment.cgi?id=541)
Patch to fix the issue

The patch that fixes the issue. I've just sent a pull request for it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
