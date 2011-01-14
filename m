From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jan 2011 21:51:19 +0000 (UTC)
Subject: [Buildroot] [Bug 2647] makedevs package lacks support for 16-bit
 major/minor numbers
In-Reply-To: <bug-2647-163@https.bugs.busybox.net/>
References: <bug-2647-163@https.bugs.busybox.net/>
Message-ID: <20110114215119.983E789009@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2647

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed thanks. Linux actually supports 12bit majors / 20bit minors, so I
slightly adjusted the patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
