From: Daniel Smolik <marvin@mydatex.cz>
Date: Thu, 14 Jun 2007 22:22:01 +0200
Subject: [Buildroot] modutils and 2.4.x.
Message-ID: <4671A369.9060709@mydatex.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
I have use buildroot on ARM mostly with 2.6 kernels. Now I must switch 
to 2.4.x and found that modutils doesn't work with UClibc. When I use 
modprobe from busybox all works. With modutils after modprobe
are printed lot of unresolved symbols eg. printk and modprobe fail.
Have anybody the same expeirience ? A use yesterday snapshot. And tested 
month old with the same result.

			Regards
				Dan
