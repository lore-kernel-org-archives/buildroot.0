From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 May 2009 08:09:23 +0000 (UTC)
Subject: [Buildroot] [Bug 303] add gvfs package
In-Reply-To: <bug-303-163@https.bugs.busybox.net/>
References: <bug-303-163@https.bugs.busybox.net/>
Message-ID: <20090514080923.3D8947781C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=303


Sven Neumann <s.neumann@raumfeld.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #269 is|0                           |1
           obsolete|                            |




--- Comment #3 from Sven Neumann <s.neumann@raumfeld.com>  2009-05-14 08:09:22 UTC ---
Created an attachment (id=323)
 --> (https://bugs.busybox.net/attachment.cgi?id=323)
gvfs.mk with some fixes

This version of gvfs.mk fixes some issues with the last version and adds
support for the http backend if libsoup is available.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
