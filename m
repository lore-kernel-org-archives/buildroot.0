From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Mar 2009 11:54:42 +0000 (UTC)
Subject: [Buildroot] [Bug 187] ntfs-3g: could not build cross
In-Reply-To: <bug-187-163@https.bugs.busybox.net/>
References: <bug-187-163@https.bugs.busybox.net/>
Message-ID: <20090330115442.D3309775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=187


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-30 11:54:42 UTC ---
Thanks. NTFS-3G needs WCHAR (and LARGEFILE) support in the toolchain. I've
fixed the Kconfig stuff up in r25895 to make this clear.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
