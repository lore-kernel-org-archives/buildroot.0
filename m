From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 19:49:14 +0000
Subject: [Buildroot] [Bug 9871] fbgrab 1.3 won't build with BR2_REPRODUCIBLE
	set
In-Reply-To: <bug-9871-163@https.bugs.busybox.net/>
References: <bug-9871-163@https.bugs.busybox.net/>
Message-ID: <bug-9871-163-LQ6Itub3zV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9871

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=be8d1efd1e5b8c4ceed34e8144d2cac075ab364e.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
