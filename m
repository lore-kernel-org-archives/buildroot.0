From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Jun 2010 21:08:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100621210848.AAD1B817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #13 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks. There were a few small issues regarding make
<blah>_defconfig, but I fixed that.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
