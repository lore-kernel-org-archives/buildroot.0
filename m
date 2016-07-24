From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:26:40 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
 uClibc toolchains
In-Reply-To: <9f0b5f73-7c32-2a3d-7ed1-d15869b6f855@gmail.com>
References: <1469292622-32034-1-git-send-email-romain.naour@gmail.com>
 <20160724155515.73be1284@free-electrons.com>
 <d39c775a-c185-71bd-007d-6139ba54e9d4@gmail.com>
 <20160724161727.3dd16709@free-electrons.com>
 <9f0b5f73-7c32-2a3d-7ed1-d15869b6f855@gmail.com>
Message-ID: <20160724162640.20156247@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:24:37 +0200, Romain Naour wrote:

> The issue appear with gdb 7.11.1 only, that's due to bundled gnulib version has
> been updated.
> We didn't see this issue in the autobuilders since gdb 7.11.1 is not tested (not
> the default Kconfig choice)

Aah, ok! I indeed tested with gdb 7.10 and not 7.11. I think the fact
that it happens only starting with gdb 7.11 was missing in your commit
log :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
