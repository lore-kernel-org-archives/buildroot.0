From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 23:25:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105232538.6187D8F5DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

Daniel Mentz <daniel@exxm.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #9 from Daniel Mentz <daniel@exxm.de> 2014-01-05 23:25:38 UTC ---
It works for me with the fix in the repository. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
