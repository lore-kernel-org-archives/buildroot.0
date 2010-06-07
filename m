From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 13:43:24 +0000 (UTC)
Subject: [Buildroot] [Bug 1735] [PATCH] mplayer: convert to autotools
	infrastructure
In-Reply-To: <bug-1735-163@https.bugs.busybox.net/>
References: <bug-1735-163@https.bugs.busybox.net/>
Message-ID: <20100607134324.9FE328FDF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1735

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #1)
> Don't set MPLAYER_CONFIGURE_CMDS but use MPLAYER_CONF_OPT instead. Remember
> that most ./configure options (prefix, etc.) are already passed. You just need
> to pass options that are specific to the package.

Careful though, mplayer uses (or atleast used to use) a handwritten configure
script, E.G. no autotools - And in the past it would error out on unknown
configure args.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
