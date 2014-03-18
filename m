From: raj <hraj50@yahoo.com>
Date: Mon, 17 Mar 2014 17:18:46 -0700 (PDT)
Subject: [Buildroot] compiling kernel
In-Reply-To: <530E2686.8040409@mind.be>
References: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
 <20140226014847.23839269@core2quad.morethan.org> <530E2686.8040409@mind.be>
Message-ID: <1395101926704-65501.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks much for your reply...
I want to compile kernel and root file system separately for couple of
reasons:

1. I want application developer to just use prebuilt kernel binary + rootfs
and run some script to create full Image so that, they don't need to have
kernel source files.

could you give some clarity on creating separately file system and passing
boot args to kernel to use the file system located in the dram.

2. I can compile kernel without the  "Initial RAM filesystem and RAM disk
(initramfs/initrd) support", so that it has only the kernel image. How do I
built the file system image?


Thanks & Regards,
Raj
 





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/compiling-kernel-tp63718p65501.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
