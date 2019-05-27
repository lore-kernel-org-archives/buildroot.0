From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2019 22:23:42 +0000
Subject: [Buildroot] [Bug 11911] systemd v240 memory leak in
 systemd-journald (buildroot 2019.02 LTS affected)
In-Reply-To: <bug-11911-163@https.bugs.busybox.net/>
References: <bug-11911-163@https.bugs.busybox.net/>
Message-ID: <bug-11911-163-2hmd39i1Kd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11911

--- Comment #2 from Jonah <jonah@sense.com> ---
The upstream patch didn't apply cleanly to v240.  I'm happy to look into it
more, but it wasn't as trivial as "git cherry-pick" and I was not sure whether
anyone has a preference for v241 verses an unofficial patch on v240.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
