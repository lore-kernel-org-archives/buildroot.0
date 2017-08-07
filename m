From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Aug 2017 16:00:26 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
	systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-C2QUnS5SBo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #2 from Ciro Santilli <ciro.santilli@gmail.com> ---
Thanks! I didn't know busybox had devmem2. And that one use uintX_t types
already.

The devmem2 package should be deprecated if possible.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
