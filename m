From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 17:23:36 +0000
Subject: [Buildroot] [Bug 8786] gdb fails to build with xz and expat support
	at the same
In-Reply-To: <bug-8786-163@https.bugs.busybox.net/>
References: <bug-8786-163@https.bugs.busybox.net/>
Message-ID: <bug-8786-163-MjKvTJFC0F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8786

--- Comment #2 from Vicente Olivert Riera <vincent.riera@imgtec.com> ---
That fixes the problem. I've sent a patch:

http://patchwork.ozlabs.org/patch/595861/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
