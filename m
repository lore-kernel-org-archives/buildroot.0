From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Jun 2009 14:10:44 +0000 (UTC)
Subject: [Buildroot] [Bug 373] Support for building gstreamer without libxml
In-Reply-To: <bug-373-163@https.bugs.busybox.net/>
References: <bug-373-163@https.bugs.busybox.net/>
Message-ID: <20090608141044.9FEE9777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373


Will Newton <will.newton@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #377 is|0                           |1
           obsolete|                            |




--- Comment #7 from Will Newton <will.newton@gmail.com>  2009-06-08 14:10:42 UTC ---
Created an attachment (id=381)
 --> (https://bugs.busybox.net/attachment.cgi?id=381)
Add support for building gstreamer without libxml2


I've tweaked it a bti further to take into account comments. I haven't added
the annodex change because I'm not sure it's worth it. It would only help a
user who disabled the libxml2 dependency explicitly and then selected the
annodex plugin that used libxml2.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
