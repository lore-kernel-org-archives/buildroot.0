From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 May 2009 09:57:10 +0000 (UTC)
Subject: [Buildroot] [Bug 303] add gvfs package
In-Reply-To: <bug-303-163@https.bugs.busybox.net/>
References: <bug-303-163@https.bugs.busybox.net/>
Message-ID: <20090525095710.A62F977864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=303


Sven Neumann <s.neumann@raumfeld.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #325 is|0                           |1
           obsolete|                            |




--- Comment #5 from Sven Neumann <s.neumann@raumfeld.com>  2009-05-25 09:57:09 UTC ---
Created an attachment (id=349)
 --> (https://bugs.busybox.net/attachment.cgi?id=349)
simplified patch, depends on libsoup 2.26

Bug #349 updates the libsoup package. This allows us to compile gvfs with a
much simpler patch.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
