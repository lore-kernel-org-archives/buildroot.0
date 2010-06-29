From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Jun 2010 19:05:55 +0000 (UTC)
Subject: [Buildroot] [Bug 2149] xterm build failure
In-Reply-To: <bug-2149-163@https.bugs.busybox.net/>
References: <bug-2149-163@https.bugs.busybox.net/>
Message-ID: <20100629190555.3194081F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2149

--- Comment #2 from Paulius Zaleckas <paulius.zaleckas@gmail.com>  ---
attached patch solves this issue... also it is possible to enable getpt() by
executing make uclibc-menuconfig

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
