From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 14:20:46 +0000 (UTC)
Subject: [Buildroot] [Bug 1735] [PATCH] mplayer: convert to autotools
	infrastructure
In-Reply-To: <bug-1735-163@https.bugs.busybox.net/>
References: <bug-1735-163@https.bugs.busybox.net/>
Message-ID: <20100607142046.4F3528D260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1735

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
If mplayer doesn't use the autotools, then please do not use AUTOTARGETS but
GENTARGETS instead (see the Buildroot documentation for details). A short
comment explaining why GENTARGETS is used instead of AUTOTARGETS would be fine
(so that in the future we don't ask ourselves why the hell this package is
doing ./configure and not using AUTOTARGETS).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
