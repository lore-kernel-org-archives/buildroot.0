From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 19:02:31 +0000 (UTC)
Subject: [Buildroot] [Bug 699] Buildroot fails to copy libstdc++ to target
 when using external toolchain
In-Reply-To: <bug-699-163@https.bugs.busybox.net/>
References: <bug-699-163@https.bugs.busybox.net/>
Message-ID: <20100221190231.9FCDA77766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=699





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 19:02:31 UTC ---
This will be fixed by
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=codesourcery-toolchain-support&id=8f610d63122c205b921408bd3d28af9e64f5d8e6,
but I am not going to push this change before 2010.02. It should be part of the
next release, 2010.05, where other improvements to external toolchain supports
are scheduled.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
