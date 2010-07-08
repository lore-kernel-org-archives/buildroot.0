From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Jul 2010 08:04:28 +0000 (UTC)
Subject: [Buildroot] [Bug 2143] buildroot compiler generates segfaulting
 statically linked executables
In-Reply-To: <bug-2143-163@https.bugs.busybox.net/>
References: <bug-2143-163@https.bugs.busybox.net/>
Message-ID: <20100708080428.E592D826CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2143

Sander in 't Hout <sander.ashwin@live.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED

--- Comment #2 from Sander in 't Hout <sander.ashwin@live.nl>  ---
(In reply to comment #1)
> It's a GCC issues (BR32219) that gets triggered by uClibc 0.9.31. It has been
> worked around in uClibc since the release, and I have now integrated those
> fixes in git (e09aa6049323)

Thanks for the fix!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
