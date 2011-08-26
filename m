From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Aug 2011 05:18:28 +0000 (UTC)
Subject: [Buildroot] [Bug 4093] Grub fails to install bz2 patch after
 conversion to AUTOTARGETS
In-Reply-To: <bug-4093-163@https.bugs.busybox.net/>
References: <bug-4093-163@https.bugs.busybox.net/>
Message-ID: <20110826051828.225EA8CA41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4093

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, fixed in git by expanding the 400 patch and getting rid of the 500 like
you suggested as well. We're very close to the 2011.08 release, so I don't want
to add compressed patch support to ATOTARGETS atm.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
