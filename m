From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 17:05:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] logrotate default gzip path is usually wrong
In-Reply-To: <bug-7766-163@https.bugs.busybox.net/>
References: <bug-7766-163@https.bugs.busybox.net/>
Message-ID: <20150106170507.B4FE57FC2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

--- Comment #5 from Henrik Juul Pedersen <hjp@liab.dk> 2015-01-06 17:05:07 UTC ---
Just testet it quickly (havent have time to boot my target with it yet), but it
looks good! :)

GZIP_CONF_OPTS = --exec-prefix=/

should be:
GZIP_CONF_OPT = --exec-prefix=/

though, and the slash can be entirely omitted.
Good work! thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
