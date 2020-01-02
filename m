From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 Jan 2020 19:28:53 +0000
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h: No
 such file or directory
In-Reply-To: <bug-12441-163@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
Message-ID: <bug-12441-163-UH4MpGkFgz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

--- Comment #6 from Bartosz Bilas <bartosz.bilas@hotmail.com> ---
(In reply to Aleksandr Makarov from comment #5)

Hello Aleksandr,
I've built your config successfully on my machine without any problems so I
don't think there is something wrong with buildroot itself. I was googling a
bit and it looks like a missing development stuff on your machine. Which OS do
you use to build that image? Please also check if you have installed userspace
headers from the Linux kernel.

Best
Bartek

-- 
You are receiving this mail because:
You are on the CC list for the bug.
