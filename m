From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 19:35:23 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141109193523.B409EAEB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

--- Comment #3 from Alexander Clouter <alex+buildroot@digriz.org.uk> 2014-11-09 19:35:23 UTC ---
Only tried with the 2014.08 release (fcd720dfcf702d796fbc625b9abc4c06cb848d84)
as nothing stood out libgcc wise since, which actually looking again is wrong,
as there was the whole move to a two stage gcc build which probably worked all
of this?

I'm going to do some rebuilding with newer versions and see also if it is
something in my .config.  I do though get the same problem with uClibc too,
probably have done something silly...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
