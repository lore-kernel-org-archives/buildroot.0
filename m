From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Apr 2010 09:21:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1591] portmap fails to compile
In-Reply-To: <bug-1591-163@https.bugs.busybox.net/>
References: <bug-1591-163@https.bugs.busybox.net/>
Message-ID: <20100419092148.EB3CE9994E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1591





--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2010-04-19 09:21:48 UTC ---
(In reply to comment #4)
> (In reply to comment #3)
> > Thanks, but this is already done in git since yesterday (see bug #1555)
> > 
> 
> I updated to the newest version just now.
> But the libutil is still disabled in the default configuration.

Sorry, I mixed up the libresolv / libutil patches - Committed now.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
