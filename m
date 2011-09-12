From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Sep 2011 22:02:47 +0000 (UTC)
Subject: [Buildroot] [Bug 4183] Codesourcery toolchain download site has
	changed
In-Reply-To: <bug-4183-163@https.bugs.busybox.net/>
References: <bug-4183-163@https.bugs.busybox.net/>
Message-ID: <20110912220247.9CB3A8D598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4183

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks for the heads up, committed the patch.
Normally buildroot should still work when upstream URLs change as we have a
backup mirror (http://sources.buildroot.net), but mentor.com unfortunately
redirects the old tarball URLs to their new front page instead of generating a
404.

I have mailed the mentor webmaster to get them to fix this, but chances are
that they won't do it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
