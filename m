From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 15:03:49 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-tn0nwQ5nfP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #3 from goldstar611 at hotmail.com ---
Removing the 3 options (SSP, RELO and FORTIFY) produce a working toolchain.

Enabling Fortify_Source_1 produces the error I originally posted.

Enabling Relo and SSP do not generate errors.

Let me know if I can do additional debugging.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
