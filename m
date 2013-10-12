From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 12 Oct 2013 14:26:13 +0000 (UTC)
Subject: [Buildroot] [Bug 5630] makefile error with toolchain helpers.mk
In-Reply-To: <bug-5630-163@https.bugs.busybox.net/>
References: <bug-5630-163@https.bugs.busybox.net/>
Message-ID: <20131012142614.158299B9DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5630

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-12 14:26:13 UTC ---
The SYSDROOT problem has been fixed in
666eb02be3cd4115a1ef8b78a63d64d12b24469e. I'm not sure to understand the other
problem, the check_glibc function seems to work fine here. If you think there
is still a problem, do not hesitate to reopen this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
