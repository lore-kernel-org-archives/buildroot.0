From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 28 Feb 2021 16:12:54 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-zrqqUG0u72@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
So the issue is simply about the locale used. The default (C) locale doesn't
handle unicode, but using an unicode locale fixes it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
