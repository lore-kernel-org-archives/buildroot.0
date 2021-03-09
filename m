From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Mar 2021 20:15:29 +0000
Subject: [Buildroot] [Bug 13601] Gen image :Iappropriate ioctl error
In-Reply-To: <bug-13601-163@https.bugs.busybox.net/>
References: <bug-13601-163@https.bugs.busybox.net/>
Message-ID: <bug-13601-163-RcnkI3cdNH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13601

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
WSL2 could be the decisive information, similar/same failure was already
reported, see [1], the fix/workaround is accepted/committed upstream, see [2],
and should be in buildroot after latest genimage version bump (see [3]), not
yet in 2021.02, only on git master...

[1] https://bugs.busybox.net/show_bug.cgi?id=13146
[2]
https://git.pengutronix.de/cgit/genimage/commit/?id=4c2b02df0861e06ca9320d80ad60994d4a239ad6
[3]
https://git.buildroot.net/buildroot/commit/?id=50cfedc86d205f2ac7145deadb1c94474374acff

-- 
You are receiving this mail because:
You are on the CC list for the bug.
