From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 May 2013 01:05:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6272] coreutils build fails
In-Reply-To: <bug-6272-163@https.bugs.busybox.net/>
References: <bug-6272-163@https.bugs.busybox.net/>
Message-ID: <20130529010533.BB6CE9A64C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6272

--- Comment #5 from Ryan <ryan.pruden@schange.com> 2013-05-29 01:04:08 UTC ---
Sorry for the delay... I was trying to find a simpler .config to provide, but
was encountering errors elsewhere. Upon inspecting the logs, though, I did find
that the error was related.

Some more info, I am using a vendor supplied toolchain(gcc-4.5.3-2.4) and
kernel(3.3.8-2.0).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
