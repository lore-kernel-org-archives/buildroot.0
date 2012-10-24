From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Oct 2012 22:00:01 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20121024220001.85C6899913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-10-24 22:00:00 UTC ---
You mean globally (in package/Makefile.in) or specifically for this package?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
