From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 08:07:04 +0000 (UTC)
Subject: [Buildroot] [Bug 531] let e2fsprogs package to export headers to
 staging dir if needed
In-Reply-To: <bug-531-163@https.bugs.busybox.net/>
References: <bug-531-163@https.bugs.busybox.net/>
Message-ID: <20090831080704.40B3877740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=531


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-31 08:06:59 UTC ---
(In reply to comment #0)
> as, specificed in bug #529, e2fsprogs package actually doesn't copy headers
> into staging dir so util-linux doesn't compile complaining about missing
> blkid/blkid/.h
> 
> The attached patch add support exporting only headers to staging dir

What about the corresponding libraries like libklkid? There also needs to be a
configuration setting to enable/disable this target.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
