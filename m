From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Jul 2010 07:02:46 +0000 (UTC)
Subject: [Buildroot] [Bug 321] alsa-lib uses host include files for python
 which breaks builds on 64 bit Linux
In-Reply-To: <bug-321-163@https.bugs.busybox.net/>
References: <bug-321-163@https.bugs.busybox.net/>
Message-ID: <20100719070246.4FC2F82B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=321

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=538773a66f2e71ac29cf799e3249737dd6903c8e.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
