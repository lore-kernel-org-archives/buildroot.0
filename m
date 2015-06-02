From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Jun 2015 07:51:32 +0000 (UTC)
Subject: [Buildroot] [Bug 8151] x86-64 make fails with ncurses 5.9
In-Reply-To: <bug-8151-163@https.bugs.busybox.net/>
References: <bug-8151-163@https.bugs.busybox.net/>
Message-ID: <20150602075132.466B9819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8151

--- Comment #1 from Antoine Pierlot-Garcin <antoine.pierlot-garcin@scle.fr> 2015-06-02 07:51:31 UTC ---
I also encountered this bug, using host GCC 5. An upstream fix is available
here:

http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2

Additional information on this Gentoo bug report:

https://bugs.gentoo.org/show_bug.cgi?id=545114

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
