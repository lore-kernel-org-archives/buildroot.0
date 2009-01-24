From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Jan 2009 14:47:07 +0000 (UTC)
Subject: [Buildroot] [Bug 51] GCC 4.3.2 complains about an incorrect Version
	of mpfr.h
In-Reply-To: <bug-51-163@https.bugs.busybox.net/>
References: <bug-51-163@https.bugs.busybox.net/>
Message-ID: <20090124144708.5A5D876A90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=51





--- Comment #6 from Jan Kretschmer <kretschi@online.de>  2009-01-24 14:47:06 UTC ---
Hm, today I tried again to compile the whole thing in a clean tree and it
worked.
I think, one of my changes in the config-file was, that I've chosen strip
instead of sstrip. Maybe sstrip is too aggressive, so that it has destroyed the
mpfr-library?
Or perhaps someone others change has repaired it? :D
Now I have problems with tar, see the next Bug-report ;)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
