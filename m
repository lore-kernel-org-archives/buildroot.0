From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 21:38:50 +0000 (UTC)
Subject: [Buildroot] [Bug 85] liblockfile fails to install due to missing
	directories
In-Reply-To: <bug-85-163@https.bugs.busybox.net/>
References: <bug-85-163@https.bugs.busybox.net/>
Message-ID: <20090202213850.B6E94764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=85


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-02 21:38:49 UTC ---
Again, it works here with the default internal toolchain:

install -m 644 lockfile.h maillock.h
/tmp/br/arm/build_arm/staging_dir/usr/include

Strange that it would use the usr/local prefix for you.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
