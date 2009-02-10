From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Feb 2009 13:07:40 +0000 (UTC)
Subject: [Buildroot] [Bug 95] XGI version mismatch
In-Reply-To: <bug-95-163@https.bugs.busybox.net/>
References: <bug-95-163@https.bugs.busybox.net/>
Message-ID: <20090210130740.AC22676275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=95


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-10 13:07:39 UTC ---
Thanks, good catch. Committed as r25289. Do you have access to XGI hw to test
it?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
