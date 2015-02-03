From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  3 Feb 2015 12:21:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150203122128.9D79C80817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #10 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-02-03 12:21:27 UTC ---
(In reply to comment #9)
> >1. what target device are you using
> It's MIPS Little endian device. We're developing our own embedded system by
> collaborating other H/W company. 

Ok, so it's not a common device but a custom one you are developing. Could you
tell me at least which SoC are you using?

> >2. what kernel version are you using
> It's Linux kernel release 3.x. 

3.x? Please, tell me the exact version you are using so I can try to reproduce
your problem. If you tell me 3.x, what kernel should I try? 3.0, 3.0.1, 3.0.2,
... 3.18.3, 3.19?

> >3. what defconfig are you using to generate the buildroot rootfs
> Please check the attached file.
> (https://bugs.busybox.net/attachment.cgi?id=5834). We don't use buildroot to
> build kernel. We're using buildroot to build 3rd parties. 

I didn't say anything about the kernel here. I wanted to see the defconfig you
are using to build the Buildroot rootfs. You have attached a binary file. The
defconfig should be a text file.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
