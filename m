From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:13:48 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-o2hnUVNHV5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #15 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to bilge from comment #14)

Ehh, I'm getting confused here. Are you building on a system without
/usr/bin/env? (E.G. in some kind of minimal container?)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
