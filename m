From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2019 22:44:02 +0000
Subject: [Buildroot] [Bug 11701] recuuring of usr and in bin shortcuts are
 created
In-Reply-To: <bug-11701-163@https.bugs.busybox.net/>
References: <bug-11701-163@https.bugs.busybox.net/>
Message-ID: <bug-11701-163-rTh7ZjA1hT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11701

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Not much/enough information to reproduce your problem, see e.g. [1] what maybe
needed.

Please provide your .config (or defconfig) file of your build.

Try to make a clean re-build (see [2]): make clean; make

Try to show an example of what you see in the host directory, e.g.
the output of ls or find commands...

[1] http://nightly.buildroot.org/manual.html#reporting-bugs
[2] http://nightly.buildroot.org/manual.html#full-rebuild

-- 
You are receiving this mail because:
You are on the CC list for the bug.
