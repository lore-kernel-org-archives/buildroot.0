From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Feb 2020 14:19:42 +0000
Subject: [Buildroot] [Bug 11906] the new version of mesa3d cannot support
 etnaviv when compiled with --enable-autotools
In-Reply-To: <bug-11906-163@https.bugs.busybox.net/>
References: <bug-11906-163@https.bugs.busybox.net/>
Message-ID: <bug-11906-163-YKkzBmDnra@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11906

Hichem <hfekih@cannon.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Hichem <hfekih@cannon.com> ---
I don't know when this is resolved. but I tested buildroot-2019.11.1 and the
Problem does not exist anymore.

the kmsro can be built, since mesa build system is switched to meson

-- 
You are receiving this mail because:
You are on the CC list for the bug.
