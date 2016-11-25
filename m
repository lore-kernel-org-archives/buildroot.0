From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Nov 2016 20:53:13 +0000
Subject: [Buildroot] [Bug 9411] MUSL build with RT Error relocating
 /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not found
In-Reply-To: <bug-9411-163@https.bugs.busybox.net/>
References: <bug-9411-163@https.bugs.busybox.net/>
Message-ID: <bug-9411-163-r0Oq865CGm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9411

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Can you give an example Buildroot package that exhibits the problem, so that
it's easier for us to reproduce and investigate the issue? Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
