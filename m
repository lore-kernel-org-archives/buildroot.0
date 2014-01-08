From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Jan 2014 05:02:00 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20140108050200.AEFDB9C38C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #10 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-01-08 05:01:59 UTC ---
I've tested ISO support with Grub recently on the master Buildroot branch, and
it just worked. I did a few improvements to make things slightly better, but
I'm not experiencing the problems described in this bug report.

Therefore, I believe the bug has been fixed. If not, feel free to reopen, after
testing the latest Buildroot version. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
