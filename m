From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:02:45 +0000 (UTC)
Subject: [Buildroot] [Bug 5408] qt build failure with Sourcery CodeBench ARM
	2010.09
In-Reply-To: <bug-5408-163@https.bugs.busybox.net/>
References: <bug-5408-163@https.bugs.busybox.net/>
Message-ID: <20131030220245.BA92A9BC3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5408

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 22:02:45 UTC ---
We've removed the support for ARM CS 2010.09 since a long time, so this bug
cannot occur anymore with the existing toolchain profiles.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
