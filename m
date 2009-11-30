From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2009 14:48:43 +0000 (UTC)
Subject: [Buildroot] [Bug 739] New/updated hostapd package
In-Reply-To: <bug-739-163@https.bugs.busybox.net/>
References: <bug-739-163@https.bugs.busybox.net/>
Message-ID: <20091130144843.7857177502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=739


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #759 is|0                           |1
           obsolete|                            |




--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-11-30 14:48:42 UTC ---
Created an attachment (id=777)
 --> (https://bugs.busybox.net/attachment.cgi?id=777)
Add new hostapd package


Pull libnl as a dependency if we detect the package since we use it.
Fixes broken build with libnl enabled if libnl isn't built before hostapd.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
