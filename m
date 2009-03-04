From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 11:17:48 +0000 (UTC)
Subject: [Buildroot] [Bug 75] arm buildroot "unrecognized option" error
In-Reply-To: <bug-75-163@https.bugs.busybox.net/>
References: <bug-75-163@https.bugs.busybox.net/>
Message-ID: <20090304111750.053497626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=75


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-04 11:17:48 UTC ---
Strange, I cannot reproduce it here. Could you please attach your .config and
the entire make.log (remember to do make 2>&1 >make.log to also get errors)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
