From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 17:59:12 +0000 (UTC)
Subject: [Buildroot] [Bug 457] e2fsprogs link problem
In-Reply-To: <bug-457-163@https.bugs.busybox.net/>
References: <bug-457-163@https.bugs.busybox.net/>
Message-ID: <20100221175912.3A4407776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=457


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 17:59:11 UTC ---
The package has been switched to the autotools infrastructure since then, and
with the autotools infrastructure, $(TARGET_CONFIGURE_ENV) is passed to the
./configure script, and this variable contains LDFLAGS.

So this bug is fixed.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
