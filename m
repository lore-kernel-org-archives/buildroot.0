From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 13:56:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4928] internal compiler error in varasm.c
In-Reply-To: <bug-4928-163@https.bugs.busybox.net/>
References: <bug-4928-163@https.bugs.busybox.net/>
Message-ID: <20130526135627.A55979A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4928

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 13:55:18 UTC ---
There has been several reports of similar problems on OpenWRT
(https://dev.openwrt.org/ticket/11827, https://dev.openwrt.org/ticket/12267,
https://dev.openwrt.org/ticket/11775), and apparently, each time it was caused
by builds being restarted without a full clean.

Since the user has reported this more than one year ago, and hasn't answered to
questions also asked on year ago, I'm closing this bug.

Erland, if you still have this bug with the last Buildroot version, do not
hesitate to reopen it, and provide your Buildroot .config file so that we can
reproduce it. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
