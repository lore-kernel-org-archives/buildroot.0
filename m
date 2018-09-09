From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 09 Sep 2018 08:08:52 +0000
Subject: [Buildroot] [Bug 11266] qt5base-5.11.1 does not compile with musl,
 complains about redefinitions
In-Reply-To: <bug-11266-163@https.bugs.busybox.net/>
References: <bug-11266-163@https.bugs.busybox.net/>
Message-ID: <bug-11266-163-biyIZDUDXE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11266

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Hello Philipp,

I believe this issue is fixed by commit
ec935bd635cd8b66011fd7561fc3dbbbc40c64e2
[1], could you re-test with latest buildroot git branch?

Regards,
Peter

[1]
https://git.buildroot.net/buildroot/commit/?id=ec935bd635cd8b66011fd7561fc3dbbbc40c64e2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
