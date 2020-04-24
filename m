From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Apr 2020 12:19:27 +0000
Subject: [Buildroot] [Bug 12801] Flag '-Wa,
 --noexecstack' is missing when building uclibc with newer binutils
In-Reply-To: <bug-12801-163@https.bugs.busybox.net/>
References: <bug-12801-163@https.bugs.busybox.net/>
Message-ID: <bug-12801-163-ioOgZIqSOF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12801

--- Comment #5 from Marcel Patzlaff <m.patzlaff@pilz.de> ---
Created attachment 8451
  --> https://bugs.busybox.net/attachment.cgi?id=8451&action=edit
Patch to fix the check_as Makefile macro.

Please find a possible patch attached to fix this. I will also push it to the
buildroot mailinglist, as the problem should be fixed really soon.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
