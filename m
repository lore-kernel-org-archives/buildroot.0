From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 20:23:05 +0000 (UTC)
Subject: [Buildroot] [Bug 2233] Atmel atstk target skeletons have /etc/mtab
 as a file, not a symlink
In-Reply-To: <bug-2233-163@https.bugs.busybox.net/>
References: <bug-2233-163@https.bugs.busybox.net/>
Message-ID: <20100718202305.944DD82B7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2233

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
