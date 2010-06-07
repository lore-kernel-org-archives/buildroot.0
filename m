From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 10:22:00 +0000 (UTC)
Subject: [Buildroot] [Bug 1735] [PATCH] mplayer: convert to autotools
	infrastructure
In-Reply-To: <bug-1735-163@https.bugs.busybox.net/>
References: <bug-1735-163@https.bugs.busybox.net/>
Message-ID: <20100607102200.E2B62836D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1735

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Don't set MPLAYER_CONFIGURE_CMDS but use MPLAYER_CONF_OPT instead. Remember
that most ./configure options (prefix, etc.) are already passed. You just need
to pass options that are specific to the package.

Here too I'd like to make sure that MPLAYER_INSTALL_TARGET_OPT is needed.

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
