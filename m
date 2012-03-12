From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Mar 2012 09:07:28 +0000 (UTC)
Subject: [Buildroot] [Bug 4898] * make: [target-finalize] Error 1 (ignored)*
In-Reply-To: <bug-4898-163@https.bugs.busybox.net/>
References: <bug-4898-163@https.bugs.busybox.net/>
Message-ID: <20120312090728.DEFE490D6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4898

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2012-03-12 09:07:28 UTC ---
Are you just referring to the make output while building, or is something not
working for you? The 'make: [target-finalize] Error 1 (ignored)' is expected
(depending on what packages you have selected) and doesn't mean anything is
wrong.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
