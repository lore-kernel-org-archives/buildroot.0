From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 May 2018 07:55:33 +0000
Subject: [Buildroot] [Bug 11051] runtime issue on STM32 with usage of
 binutils 2.29.x
In-Reply-To: <bug-11051-163@https.bugs.busybox.net/>
References: <bug-11051-163@https.bugs.busybox.net/>
Message-ID: <bug-11051-163-8YEJr72MRL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11051

--- Comment #1 from romain.naour at gmail.com ---
Hello,

Thanks for the report!

This issue seems related to a change to the behaviour of the assembler's "adr"
pseudo-instruction [1]

This issue has already be reported by some Buildroot user [2] but it's an
upstream issue. For now, you should use a toolchain generated with Binutils
2.28.

I don't have such board to do a runtime test.

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-November/543467.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-March/215706.html
    http://lists.busybox.net/pipermail/buildroot/2018-April/219223.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
