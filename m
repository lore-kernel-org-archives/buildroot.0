From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 11:32:43 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018113243.A514077762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #6 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-18 11:32:43 UTC ---
The header is installed correctly in staging_dir, but for whatever reason, it
is not being picked up later by the gvfs configure script:

checking libsmbclient.h usability... no
checking libsmbclient.h presence... no
checking for libsmbclient.h... no
checking for Samba 3.0 libraries... no

Unfortunately I only have access to the build log right now, which makes it
somewhat difficult to investigate this in more detail.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
