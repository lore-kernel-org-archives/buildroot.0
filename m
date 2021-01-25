From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 08:50:34 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu_*: bump kernel version to
 5.10.7
In-Reply-To: <CADFgU5DFc0FZWqD+Y-S5WN6a4U2aBmY0c+SLjZ-2RihXhK2woA@mail.gmail.com>
References: <20210120195954.31797-1-geoffrey.legourrierec@gmail.com>
 <CACPK8XdWzEuu_4x5cWNx6EpatbSfn91FdQf42RzCyotGz9Hn6g@mail.gmail.com>
 <CADFgU5CWfAQ2bgJeQYXeAkwO8Q8E3K9PVGz_tWCa_YZmMD_SEg@mail.gmail.com>
 <CADFgU5DFc0FZWqD+Y-S5WN6a4U2aBmY0c+SLjZ-2RihXhK2woA@mail.gmail.com>
Message-ID: <20210125085034.3f5109a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2021 22:06:25 +0100
Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com> wrote:

> I had a short exchange with Arnd Bergmann (see the SuperH subsystem
> patchwork thread[1]) and looks like the real issue lies in uclibc. I
> have a patch idea (adding relevant types here [2]), so I'll go test it
> and bug the uclibc folks with it.
> 
> [1] https://patchwork.kernel.org/project/linux-sh/patch/20210123165652.10884-1-geoffrey.legourrierec at gmail.com/
> [2] https://repo.or.cz/uclibc-ng.git/blob/ab1dd83bec59c9e65c31efd6e887182948f627be:/libc/sysdeps/linux/sh/bits/kernel_types.h

Thanks for the follow-up, and the additional work you're doing on
fixing this!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
