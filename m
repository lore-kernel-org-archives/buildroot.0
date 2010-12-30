From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Dec 2010 22:35:48 +0000 (UTC)
Subject: [Buildroot] [Bug 2929] genext2fs: couldn't allocate a block (no
	free space)
In-Reply-To: <bug-2929-163@https.bugs.busybox.net/>
References: <bug-2929-163@https.bugs.busybox.net/>
Message-ID: <20101230223548.6471D8E2B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2929

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Hi,

I've implemented better ext2 size estimation in git (eeea3ea6a88a8) - Could you
give it a try?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
