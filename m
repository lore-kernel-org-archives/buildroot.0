From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Aug 2018 00:24:57 +0000
Subject: [Buildroot] [Bug 11236] util-linux fails to build on Travis CI when
 python also selected
In-Reply-To: <bug-11236-163@https.bugs.busybox.net/>
References: <bug-11236-163@https.bugs.busybox.net/>
Message-ID: <bug-11236-163-b4nmpHKdQc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11236

--- Comment #3 from Frank Vasquez <frankv@helium.com> ---
Thanks, Raphael.  Many Buildroot users like me rely on Travis CI.  It sucks
that Travis CI is still on Ubuntu 14.04 and I doubt that building inside a
Docker image will fix the issue.  Probably some form of PATH sanitization as
Yann points out is what's required.  Let me know if I can help in any way.

Cheers,
Frank

-- 
You are receiving this mail because:
You are on the CC list for the bug.
