From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Sep 2009 09:08:18 +0000 (UTC)
Subject: [Buildroot] [Bug 303] add gvfs package
In-Reply-To: <bug-303-163@https.bugs.busybox.net/>
References: <bug-303-163@https.bugs.busybox.net/>
Message-ID: <20090922090818.9294C77784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=303





--- Comment #6 from Sven Neumann <s.neumann@raumfeld.com>  2009-09-22 09:08:16 UTC ---
Now that the patch from bug #301 is committed, the patches from this bug could
also go into buildroot.

As soon as that has happened, I would try to also enable the gvfs archive
backend that uses libarchive which was recently added to buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
