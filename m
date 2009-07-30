From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 13:58:36 +0000 (UTC)
Subject: [Buildroot] [Bug 513] Add new squid package
In-Reply-To: <bug-513-163@https.bugs.busybox.net/>
References: <bug-513-163@https.bugs.busybox.net/>
Message-ID: <20090730135836.C031F7781B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=513





--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-07-30 13:58:36 UTC ---
The patch is a rip from gentoo, so yeah it could be updated to avoid the
kludge.

This package is a good example of the usefulness of the HOOK_POST_UNINSTALL
i've mentioned in irc.
The uninstall target from the Makefile fails to remove some stuff, most notably
from $(TARGET_DIR)/usr/share/errors and $(TARGET_DIR)/usr/share/icons IIRC.

I'll rework the patch, this package is low priority though - better get it
right than stick it for 2009.08.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
