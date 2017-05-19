From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 09:13:39 +0200
Subject: [Buildroot] Rootfs and bzimage question?
In-Reply-To: <1495151500802-165253.post@n4.nabble.com>
References: <1495151500802-165253.post@n4.nabble.com>
Message-ID: <20170519091339.6ba67ec0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 16:51:40 -0700 (PDT), bianchi wrote:

> I learned using build root and finished compiling, how to use bzImage and
> rootfs.ext3 into mydisk.img to make it bootable in qemu. My host is Ubuntu
> 16.04. 
> So far I got kernel panic, can not find rootfs.
> Any clues or scripts doing it?

If you're trying to make a Buildroot system that boots under Qemu,
please use our Qemu defconfigs:

$ make list-defconfigs | grep qemu

And follow the instructions in the appropriate board/qemu/*/readme.txt
file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
