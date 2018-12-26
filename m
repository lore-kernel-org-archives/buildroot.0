From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:43:49 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <CADvTj4pde8zNu86gOxeQ2zy6FRKVQHL=rnVcBkNub2WqXm6T6g@mail.gmail.com>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <20181226222329.18046c1c@windsurf>
 <CADvTj4pde8zNu86gOxeQ2zy6FRKVQHL=rnVcBkNub2WqXm6T6g@mail.gmail.com>
Message-ID: <20181226224349.7167ddcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 15:37:42 -0600, James Hilliard wrote:

> Well systemd-boot is a perfectly good bootloader even without systemd.
> It uses plain text config files so it's not hard to manage even
> without the systemd userspace tools.

OK, but there must be some compelling reason to use systemd-boot
instead of another x86-capable bootloader, such as grub or syslinux. I
believe even U-Boot works on x86 EFI systems. All of these also use
plain text configuration files that don't require userspace tools.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
