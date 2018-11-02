From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 17:50:44 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-FUtCxGtW8Z@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #5 from goldstar611 at hotmail.com ---
I have not had any problems thus far with gcc6, so I personally don't have a
problem with dropping gcc5 support but I would suggest making Fortify_Source
require gcc>=6 for ppc iff there are no plans for dropping gcc5 for other
arches.

If it would help I can volunteer to run a matrix of PPC big endian builds to
see which of them fail.

At some point us PowerPC guys won't have much left but unsupported tools
unfortunately.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
