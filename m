From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Mar 2015 01:29:35 +0000 (UTC)
Subject: [Buildroot] [Bug 7961] Qt5 fails to build for
	xtensa-buildroot-linux-uclibc
In-Reply-To: <bug-7961-163@https.bugs.busybox.net/>
References: <bug-7961-163@https.bugs.busybox.net/>
Message-ID: <20150320012935.9EEC58186A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7961

Max Filippov <jcmvbkbc@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Max Filippov <jcmvbkbc@gmail.com> 2015-03-20 01:29:35 UTC ---
GCC bugzilla entry: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61207
Attached patch fixes the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
