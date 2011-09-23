From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 15:36:22 +0000 (UTC)
Subject: [Buildroot] [Bug 4249] uClibc and libpthread
In-Reply-To: <bug-4249-163@https.bugs.busybox.net/>
References: <bug-4249-163@https.bugs.busybox.net/>
Message-ID: <20110923153622.863928D517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4249

--- Comment #1 from Rico Bachmann <bachmann@tofwerk.com>  ---
i think i found at least a workaround.
there are 2 libraries created, a libpthread.so and a libpthread-0.9.32.so
if you link to libpthread-0.9.32.so the compiling works fine

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
