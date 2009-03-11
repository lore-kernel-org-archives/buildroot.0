From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 15:16:38 +0000 (UTC)
Subject: [Buildroot] [Bug 177] xdriver_xf86-input-keyboard does not build
In-Reply-To: <bug-177-163@https.bugs.busybox.net/>
References: <bug-177-163@https.bugs.busybox.net/>
Message-ID: <20090311151638.9E7B876A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=177





--- Comment #3 from Dan Lykowski <lykowdk@gmail.com>  2009-03-11 15:16:37 UTC ---
Created an attachment (id=143)
 --> (https://bugs.busybox.net/attachment.cgi?id=143)
Fix for the pkg config problem when building x drivers

This patch was derived from what XServer 1.5 does.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
