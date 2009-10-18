From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 10:01:42 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018100142.E43E2776FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #5 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-18 10:01:42 UTC ---
The build completed successfully here. But I found that the libsmbclient.h
header is not installed, even if BR2_PACKAGE_SAMBA_LIBSMBCLIENT is selected. I
am testing a patch now to fix this...


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
