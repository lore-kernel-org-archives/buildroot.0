From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Dec 2018 10:40:37 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-VBdi78wFdw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

romain.naour at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
   Target Milestone|---                         |2018.11
         Resolution|---                         |FIXED

--- Comment #10 from romain.naour at gmail.com ---
Fixed by
https://git.buildroot.net/buildroot/commit/?id=a75ee0e8124023185f4a05e95b2fcd29fa9449d8.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
