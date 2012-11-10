From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 11:57:29 +0100
Subject: [Buildroot] [PATCH 0/2] add support for xtensa back to buildroot
In-Reply-To: <20121109091435.0603a98c@skate>
References: <509b2928.67dc440a.70c6.6325@mx.google.com>
 <20121108082247.55eac2b2@skate> <509C8B4F.6000308@zankel.net>
 <20121109091435.0603a98c@skate>
Message-ID: <20121110115729.357ebfdd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Fri, 9 Nov 2012 09:14:35 +0100, Thomas Petazzoni wrote:

> I've also seen that Qemu has an Xtensa support. It would be nice if you
> could create a qemu_xtensa_<somemachine>_defconfig with the necessary
> kernel configuration and al (see other qemu_<foo>_defconfig that we
> have in configs/) so that other people could build a Xtensa userspace
> and run it inside qemu. At the moment, the qemu-system-xtensa supports
> the following machines:
> 
> $ qemu-system-xtensa -M ?
> Supported machines are:
> none                 empty machine
> lx60                 lx60 EVB (dc232b)
> lx200                lx200 EVB (dc232b)
> sim                  sim machine (dc232b) (default)

Do you have any plans for proposing the support of a Qemu board using
the Xtensa architecture? Qemu already supports 2-3 platforms, so it
would be nice if Buildroot had a defconfig to generate a working system
for one of them.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
