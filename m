From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 21:47:08 +0200
Subject: [Buildroot] Buildroot ts7680_defconfig no longer builds
In-Reply-To: <CAHxQtxP83n6A_YtHWqTPLCCcAwwY8Uj0rh4z-SD_C5gMU5bz9A@mail.gmail.com>
References: <20190810104751.647f64ed@windsurf.home>
 <20190818144423.003b5a80@windsurf.home>
 <CAHxQtxP83n6A_YtHWqTPLCCcAwwY8Uj0rh4z-SD_C5gMU5bz9A@mail.gmail.com>
Message-ID: <20190818214708.403dabf7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Sun, 18 Aug 2019 21:32:51 +0200
Julien Grossholtz <julien.grossholtz@gmail.com> wrote:

> I was able to reproduce the issue with gcc 8.x and 9.x. With gcc 7.x
> and Linux 3.14 the ts7680_defconfig is able to build.
> Has anything changed regarding Buildroot toolchain handling since
> previous release?

We have switched to using gcc 8.x as the default compiler version,
hence the change.

> The ts7680 is not supported in upstream Linux, but Technologic Systems
> recently added a 4.9 Linux repository [1] for their i.MX28 boards. I
> am able to compile this kernel and generate a full system.

OK.

> I will submit a patch to bump the kernel, but I no longer have access
> to the board to test the build. I will CC people from Savoir-Faire
> Linux who use this board so they can test and acknowledge the patch. I
> would also ask if they can maintain the board in the future.

Sure, I'll let you handle that with the SFL folks then.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
