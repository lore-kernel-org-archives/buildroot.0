From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 21:13:05 +0000 (UTC)
Subject: [Buildroot] [Bug 8161] default /bin/sh symlink to busybox is full
 path and not relative
In-Reply-To: <bug-8161-163@https.bugs.busybox.net/>
References: <bug-8161-163@https.bugs.busybox.net/>
Message-ID: <20150604211305.51A1581E29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8161

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-06-04 21:13:04 UTC ---
Alternatively, you could change your script to only calculate md5sums of files
(and not directories, symlinks, ..).

With that said, I don't have any problems with changing the symlink. Care to
send a git formatted patch doing that to the buildroot mailing list?

For details about how to do this, see the manual:
http://buildroot.uclibc.org/downloads/manual/manual.html#submitting-patches

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
