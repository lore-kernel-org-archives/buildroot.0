From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Jul 2012 08:22:54 +0000 (UTC)
Subject: [Buildroot] [Bug 1315] Allow use of older external toolchains
 without sysroot support
In-Reply-To: <bug-1315-163@https.bugs.busybox.net/>
References: <bug-1315-163@https.bugs.busybox.net/>
Message-ID: <20120720082254.A400696BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1315

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-20 08:22:54 UTC ---
Two years later, sysroot capable toolchains are much more common, and we
definitely don't want to add the complexity to add non-sysrooted toolchains
into Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
