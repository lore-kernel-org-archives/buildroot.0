From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Jul 2009 10:40:01 +0000 (UTC)
Subject: [Buildroot] [Bug 331] Update MPlayer to version 1.0rc2
In-Reply-To: <bug-331-163@https.bugs.busybox.net/>
References: <bug-331-163@https.bugs.busybox.net/>
Message-ID: <20090727104001.CE6EA777F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=331





--- Comment #2 from Will Newton <will.newton@gmail.com>  2009-07-27 10:40:01 UTC ---

I tried applying th patches and the results were:

Failed:

mplayer-1.0rc1-atmel.3.patch

Applied upstream:

mplayer-1.0rc1-fix-alsa-output.patch
mplayer-1.0rc1-index.patch
mplayer-1.0rc1-ppc-configure.patch

OK:

mplayer-1.0rc1-largefile.patch
mplayer-1.0rc1-remove-sys-timeb.patch


It looks like the avr32 support needs reworking for rc2.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
