From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Sep 2017 19:03:16 +0000
Subject: [Buildroot] [Bug 10216] package/x11r7/mcookie/mcookie.c:207: bad
	size ?
In-Reply-To: <bug-10216-163@https.bugs.busybox.net/>
References: <bug-10216-163@https.bugs.busybox.net/>
Message-ID: <bug-10216-163-Rd5F4jzvVS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10216

Bernd Kuhls <bernd.kuhls@t-online.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |bernd.kuhls at t-online.de
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #1 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
Thanks to your bug report I noticed that mcookie is part of util-linux:
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/misc-utils

Therefore I plan to submit a patch to buildroot that removes the mcookie
package in favour of util-linux which actively maintains mcookie:
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/log/misc-utils/mcookie.c

If your bug report is still valid with upstream then please send your bug
report to https://github.com/karelzak/util-linux

-- 
You are receiving this mail because:
You are on the CC list for the bug.
