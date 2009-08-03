From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Aug 2009 09:14:29 +0000 (UTC)
Subject: [Buildroot] [Bug 525] sed can't find libintl
In-Reply-To: <bug-525-163@https.bugs.busybox.net/>
References: <bug-525-163@https.bugs.busybox.net/>
Message-ID: <20090803091429.3DB8C777B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=525





--- Comment #7 from Ulf Samuelsson <ulf.samuelsson@atmel.com>  2009-08-03 09:14:28 UTC ---

"<STAGING_DIR>/usr/include/libintl.h" should come from gettext,
but "package/gettext/gettext.mk" deletes libintl.h
as part of postprocessing the install.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
