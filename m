From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Mar 2017 16:38:45 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-DkDv1IxKo4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #16 from Paul Stewart <paulstewartis@gmail.com> ---
(In reply to Arnout Vandecappelle from comment #14)

Looking at the Hexdump, it looks like 0x20 for the spaces:

00000000  64 75 6d 6d 79 20 2d 31  20 75 73 65 72 73 20 2d  |dummy -1 users -|
00000010  31 20 2a 20 2d 20 2d 20  2d 20 44 75 6d 6d 79 20  |1 * - - - Dummy |
<snip>
00000110  72 2f 62 69 6e 2f 67 69  74 2d 73 68 65 6c 6c 20  |r/bin/git-shell |
00000120  73 73 68 2d 75 73 65 72  0a                       |ssh-user.|
00000129

-- 
You are receiving this mail because:
You are on the CC list for the bug.
