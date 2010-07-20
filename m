From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 07:00:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2245] Netcat does not work due to incorrect
 assumptions about signed chars.
In-Reply-To: <bug-2245-163@https.bugs.busybox.net/>
References: <bug-2245-163@https.bugs.busybox.net/>
Message-ID: <20100720070058.D1CED82B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2245

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks.

Out of interest, why are you using the old "big" netcat version instead of the
busybox applet?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
