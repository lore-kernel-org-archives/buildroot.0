From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Aug 2018 08:54:29 +0000
Subject: [Buildroot] [Bug 11241] ACPID shouldn't depend on BR2_x86_64 ||
 BR2_i386
In-Reply-To: <bug-11241-163@https.bugs.busybox.net/>
References: <bug-11241-163@https.bugs.busybox.net/>
Message-ID: <bug-11241-163-en71psYvKL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11241

--- Comment #2 from happycorsair at yandex.ru ---
Hi, Peter!

I'm not a specialist in ACPI or power management, so please don't blame me a
lot :)

It seems to me, that you are right. All ACPI-related options in Cubieboard 6
kernel config are disabled (it's ARM, not ARM64). But at the same time, acpid
handles power button pushes and powers off the board. If no acpid is running, I
can only reboot the board by long push.

So, it's useful. I found no building issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
