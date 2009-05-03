From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  3 May 2009 20:20:53 +0000 (UTC)
Subject: [Buildroot] [Bug 311] util-linux-pre7 complains swapon has 1 args
In-Reply-To: <bug-311-163@https.bugs.busybox.net/>
References: <bug-311-163@https.bugs.busybox.net/>
Message-ID: <20090503202053.E63FB7757F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=311


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-05-03 20:20:53 UTC ---
Sorry, but that patch seems bogus. Doesn't your compiler complain about the
'define' line? I gather we should figure out why mount/swap.configure
misdetects the SWAPON_HAS_TWO_ARGS instead. Does config.log contain anything
interesting?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
