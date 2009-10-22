From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Oct 2009 18:24:41 +0000 (UTC)
Subject: [Buildroot] [Bug 679] Autoconf cannot find M4
In-Reply-To: <bug-679-163@https.bugs.busybox.net/>
References: <bug-679-163@https.bugs.busybox.net/>
Message-ID: <20091022182441.4DEE97776D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=679





--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-22 18:24:40 UTC ---
(In reply to comment #0)
> There is a m4 installed in my platform (Ubuntu) with the version, while there
> is one installed in the system:
> 
> checking for GNU M4 that supports accurate traces... configure: error: no
> acceptable m4 could be found in $PATH.
> GNU M4 1.4.6 or later is required; 1.4.13 is recommended
> 
> # m4 --version
> m4 (GNU M4) 1.4.11
> Copyright (C) 2008 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> 

Is this related to
http://lists.busybox.net/pipermail/buildroot/2009-October/029957.html or
http://lists.busybox.net/pipermail/buildroot/2009-October/029964.html?

In other words, is this autoconf for the target or for the host? In any case,
you'll need to provide more info - What is your .config, and what make target
is failing?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
