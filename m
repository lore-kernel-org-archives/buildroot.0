From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 May 2009 10:00:25 +0000 (UTC)
Subject: [Buildroot] [Bug 313] mconf segmentation fault when selecting X
 Window System Server and !BR2_USE_WCHAR
In-Reply-To: <bug-313-163@https.bugs.busybox.net/>
References: <bug-313-163@https.bugs.busybox.net/>
Message-ID: <20090504100026.03CA6775F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=313


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |DUPLICATE




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-05-04 10:00:25 UTC ---
Thanks, but this was already reported as #105 and fixed in svn (r25316). The
soon-to-be-released 2009.05 version will have the fix.


*** This bug has been marked as a duplicate of bug 105 ***


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
