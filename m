From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 14:38:13 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] logrotate default gzip path is usually wrong
In-Reply-To: <bug-7766-163@https.bugs.busybox.net/>
References: <bug-7766-163@https.bugs.busybox.net/>
Message-ID: <20150106143813.7DF1A807C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

--- Comment #3 from Henrik Juul Pedersen <hjp@liab.dk> 2015-01-06 14:38:13 UTC ---
Great!, thanks, I've just concluded that as well - that busybox installs it
correctly into /bin, and that gzip is the culprit (actually our system has both
/bin/gunzip from busybox, and /usr/bin/gunzip from the gzip package - so some
cleaning up is needed).
I seems like it can be fixed in the gzip.mk file quite easily?

Best regards, Henrik

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
