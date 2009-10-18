From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 11:56:53 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018115653.3CB3B77762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #7 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-18 11:56:52 UTC ---
Looking at build logs from before the samba update, it appears that this
problem has existed before, but got unnoticed so far. So the problem is more
likely in the gvfs package and not related to this patch.

So this change looks good from my point. For your convenience I will send a git
formatted patch to the list.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
