From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 May 2014 15:50:38 +0000 (UTC)
Subject: [Buildroot] [Bug 7094] pciutils doesn't build on Blackfin
In-Reply-To: <bug-7094-163@https.bugs.busybox.net/>
References: <bug-7094-163@https.bugs.busybox.net/>
Message-ID: <20140520155038.0F81D9CCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7094

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-05-20 15:50:37 UTC ---
In fact, since PCI is not used on Blackfin (marked as broken since 2008 in the
kernel), there's probably little reason to worry about getting pciutils to
build.

Marking this bug as WONTFIX. I've submitted a patch at
http://patchwork.ozlabs.org/patch/350772/ to disable pciutils on Blackfin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
