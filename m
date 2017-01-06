From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Jan 2017 21:43:21 +0000
Subject: [Buildroot] [Bug 9571] buildroot fails while building opencv for
	arm64 platform
In-Reply-To: <bug-9571-163@https.bugs.busybox.net/>
References: <bug-9571-163@https.bugs.busybox.net/>
Message-ID: <bug-9571-163-YfF5s8pHiz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9571

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> ---
To investigate this bug we need more details:
- Buildroot version
- Buildroot defconfig used leading to the situation
- opencv package built? (opencv or opencv3)
- is it a static only build?

Have you tried to run: 'make clean && make' ?

Have you tweak the opencv.mk (or opencv3.mk) file? if yes, how?

Have you build the toolchain, then change some critical configurations
requiring a full rebuild [1]?


[1] http://nightly.buildroot.org/manual.html#full-rebuild

-- 
You are receiving this mail because:
You are on the CC list for the bug.
