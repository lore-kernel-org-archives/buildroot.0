From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Dec 2018 12:51:21 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-P8gj1UFdDp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Romain: what do you suggest for this bug? Should we exclude gcc < 6 from using
fortify source ? Should we backport a gcc fix ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
