From: Seamus Connor <sconnor@lynx.com>
Date: Mon, 23 Oct 2017 12:59:18 -0700
Subject: [Buildroot] Multiple root filesystems for single kernel/toolchain
Message-ID: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a system with a few unique restrictions.? It has low memory, and 
its bulk storage device is not available until some bits have been 
flipped in the hardware.? What I would like to do is:

1) Create a bzImage with a baked in minimal initramfs.

2) Create a larger squashfs that is stored in MMC.

What is the best procedure to create multiple file systems w/ 
buildroot?? Would I just have two separate configs that specify 
different packages?

Thanks,

Seamus
