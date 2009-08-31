From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 08:03:56 +0000 (UTC)
Subject: [Buildroot] [Bug 457] e2fsprogs link problem
In-Reply-To: <bug-457-163@https.bugs.busybox.net/>
References: <bug-457-163@https.bugs.busybox.net/>
Message-ID: <20090831080356.56DE47773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=457


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-31 08:03:55 UTC ---
(In reply to comment #0)
> Hi,
> 
> when link e2fsck from the e2fsprogs package, you might experience a problem at
> the link. e2fsck is looking for -lintl.
> 
> Please find a fix as attachment.

What problem is your patch fixing exactly? It doesn't look like e2fsprogs uses
libintl.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
