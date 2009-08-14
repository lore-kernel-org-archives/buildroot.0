From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Aug 2009 19:54:39 +0000 (UTC)
Subject: [Buildroot] [Bug 513] Add new squid package
In-Reply-To: <bug-513-163@https.bugs.busybox.net/>
References: <bug-513-163@https.bugs.busybox.net/>
Message-ID: <20090814195439.69AD67719F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=513


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #527 is|0                           |1
           obsolete|                            |




--- Comment #6 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-08-14 19:54:37 UTC ---
Created an attachment (id=601)
 --> (https://bugs.busybox.net/attachment.cgi?id=601)
New package: squid-3.0.STABLE17

Bump squid to 3.0.STABLE17, fixes some stability issues.
Enable heap removal policies in the package build, keep squidclient (useful for
stats) and bump threads/FDs to handle some moderate load.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
