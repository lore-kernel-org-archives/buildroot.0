From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 13:45:51 +0000 (UTC)
Subject: [Buildroot] [Bug 1735] [PATCH] mplayer: convert to autotools
	infrastructure
In-Reply-To: <bug-1735-163@https.bugs.busybox.net/>
References: <bug-1735-163@https.bugs.busybox.net/>
Message-ID: <20100607134551.7DEA7C185D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1735

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
We should really use a newer version, 1.0rc2 is very old, has security bugs and
lacks newer optimizations (neon for example).
That said they haven't released tarballs in a while now so it would be
snapshot-based (svn).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
