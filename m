From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Feb 2020 02:08:19 +0100
Subject: [Buildroot] multiple kernel build?
In-Reply-To: <CAG=Azd9yPUL0hrMnL9xf9J69uwwv4GUqCmMK5RciZDexzSDsiQ@mail.gmail.com>
References: <CAG=Azd9yPUL0hrMnL9xf9J69uwwv4GUqCmMK5RciZDexzSDsiQ@mail.gmail.com>
Message-ID: <20200216020819.1dd9ae09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Feb 2020 10:12:12 -0500
Wesley Chow <wes@cortico.ai> wrote:

> I'm having trouble figuring out if buildroot had a mechanism for building
> multiple Linux kernels within one image. For example, if I would like to
> provide one image for different Raspberry Pi versions or QEMU, I would need
> to distribute kernels for different CPU archs (setting aside the problem of
> detecting which hardware I'm on in the bootloader). Is this currently
> possible?

If you need to build multiple kernels, then you need one separate
Buildroot configuration for each. Buildroot is very simple: one
Buildroot configuration allows to build one system, i.e one toolchain,
one kernel, one root filesystem image.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
