From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Jan 2015 00:48:47 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150131004847.E8AEC800D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #9 from Jinho Yoo <brotherjinho@gmail.com> 2015-01-31 00:48:47 UTC ---
OK, I see. 

>1. what target device are you using
It's MIPS Little endian device. We're developing our own embedded system by
collaborating other H/W company. 

>2. what kernel version are you using
It's Linux kernel release 3.x. 

>3. what defconfig are you using to generate the build root rootfs
Please check the attached file.
(https://bugs.busybox.net/attachment.cgi?id=5834). We don't use buildroot to
build kernel. We're using buildroot to build 3rd parties. 

Jinho Yoo

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
