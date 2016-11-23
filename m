From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 11:35:17 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
Message-ID: <20161123113517.04f6ec47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 10:49:10 +0100, Alvaro Gamez wrote:

> Is buildroot able to build a baremetal toolchain?

No, but this is generally not needed. A Linux-capable toolchain is
capable of building userspace applications, but also the Linux kernel
and bootloaders like Barebox, U-Boot, etc (which you could build with
bare metal toolchains).

> Specifically, I'm trying to build a small bootloader for the microblaze
> architecture. Xilinx provides an SDK, and I wonder if I can build one like
> this using buildroot, so I can keep all my code and workflow centralized
> under buildroot.

Have you tried building this small bootloader with the Buildroot
toolchain?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
