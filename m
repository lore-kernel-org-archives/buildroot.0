From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Apr 2018 10:03:15 +0000
Subject: [Buildroot] [Bug 10896] /bin/sh not in /etc/shells
In-Reply-To: <bug-10896-163@https.bugs.busybox.net/>
References: <bug-10896-163@https.bugs.busybox.net/>
Message-ID: <bug-10896-163-h9ncnw9Zbh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10896

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Still present in 2018.02.1...

For 2018.02.x, I think it should be fixed by reverting the commit:
http://patchwork.ozlabs.org/patch/899178/

For master, the series should be applied:
http://patchwork.ozlabs.org/project/buildroot/list/?series=24357

-- 
You are receiving this mail because:
You are on the CC list for the bug.
