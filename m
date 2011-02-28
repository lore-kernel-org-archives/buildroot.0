From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Feb 2011 20:47:22 +0000 (UTC)
Subject: [Buildroot] [Bug 2911] Qt: Disable qt3support-option,
 if gui-module isn't selected
In-Reply-To: <bug-2911-163@https.bugs.busybox.net/>
References: <bug-2911-163@https.bugs.busybox.net/>
Message-ID: <20110228204722.1F1708CA41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2911

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, committed with some tweaks (network is selected by gui, and qt3 support
works with static builds as well).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
