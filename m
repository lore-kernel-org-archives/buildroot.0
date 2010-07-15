From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Jul 2010 09:23:50 +0000 (UTC)
Subject: [Buildroot] [Bug 475] uImage target for U-boot failed generating
In-Reply-To: <bug-475-163@https.bugs.busybox.net/>
References: <bug-475-163@https.bugs.busybox.net/>
Message-ID: <20100715092350.093CB8295F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=475

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The linux-cleanup work has been merged, and it properly handles the dependency
on uImage generation to U-Boot mkimage. So this bug is fixed now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
