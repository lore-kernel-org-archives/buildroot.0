From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Dec 2020 18:18:36 +0000
Subject: [Buildroot] [Bug 13356] libabseil-cpp: not building for raspberry pi
In-Reply-To: <bug-13356-163@https.bugs.busybox.net/>
References: <bug-13356-163@https.bugs.busybox.net/>
Message-ID: <bug-13356-163-iOOeq5dg9k@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13356

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Until a proper (upstream?) fix you can use the attached patch/hack to disable
hardware acceleration for random handling unconditionally in case compiled for
arm target...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
