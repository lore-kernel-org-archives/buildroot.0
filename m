From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Feb 2011 10:58:02 +0000 (UTC)
Subject: [Buildroot] [Bug 3259] Unable to build webkit (on arm).
In-Reply-To: <bug-3259-163@https.bugs.busybox.net/>
References: <bug-3259-163@https.bugs.busybox.net/>
Message-ID: <20110224105802.B8BD98F6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3259

--- Comment #2 from Bart?omiej Palmowski <rotwang@crux.org.pl>  ---
Quick workaround is passing --with-unicode-backend=glib to webkits configure.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
