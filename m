From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 20:50:15 +0000 (UTC)
Subject: [Buildroot] [Bug 79] No version-number for the Freetype-package
In-Reply-To: <bug-79-163@https.bugs.busybox.net/>
References: <bug-79-163@https.bugs.busybox.net/>
Message-ID: <20090128205016.278A0769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=79





--- Comment #4 from Jan Kretschmer <kretschi@online.de>  2009-01-28 20:50:14 UTC ---
No, it's not xpdf, but I think I've got it:

It's gamin!
Gamin depends on libgtk2, that needs cairo, that needs fontconfig, that finally
needs freetype. :D
Say, if I'm totally wrong, please.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
