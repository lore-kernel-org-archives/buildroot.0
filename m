From: Ron Eggler <reggler@semios.com>
Date: Fri, 27 Dec 2013 16:04:12 +0000
Subject: [Buildroot] no machine record defined
Message-ID: <CAO8ZbKvYFkrq4AgpHoaLO-WwEw=g516Uu8KQOrUJd9qhdcXf2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get an error compiling the kernel for my Atmel at91sam9g20 (Synapse e10)

/etc/E10-buildroot/br2013.11/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld:
no machine record defined
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory
`/etc/E10-buildroot/br2013.11/output/build/linux-3.2.52'
make: ***
[/etc/E10-buildroot/br2013.11/output/build/linux-3.2.52/.stamp_built] Error
2
root at regDesktopHome:/etc/E10-buildroot/br2013.11#

The below is set in "output/build/linux-3.2.52/.config"
CONFIG_ARCH_AT91SAM9G20=y

Any idea how I can resolve this issue by any chance?

Thanks in advance!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131227/043f2182/attachment.html>
