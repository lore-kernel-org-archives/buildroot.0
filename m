From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 08:31:54 +0000 (UTC)
Subject: [Buildroot] [Bug 543] ATK requires X11 on DirectFB target
In-Reply-To: <bug-543-163@https.bugs.busybox.net/>
References: <bug-543-163@https.bugs.busybox.net/>
Message-ID: <20090807083155.466B5774E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=543





--- Comment #1 from Sven Neumann <s.neumann@raumfeld.com>  2009-08-07 08:31:53 UTC ---
As far as I can see atk only uses X11 if BR2_PACKAGE_XORG7 is selected. Do you
have X11 selected in the buildroot configuration?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
