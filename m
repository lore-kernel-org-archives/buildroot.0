From: Basavaraj Hiremath <hraj50@yahoo.com>
Date: Tue, 25 Feb 2014 15:08:27 -0800 (PST)
Subject: [Buildroot] compiling kernel
Message-ID: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Recently started using build root system, I have following questions, could you clarify?

1. how can I compile kernel and root file system separately, so that application user can use the kernel binary to create the root file system(no need to have kernel code)?

2. Even after using the pre-built target tool chain, build root compiles some of the host tools for the first time and later uses these host tools. Can I have pre-built host tools required for the build root similar to target tool chain? In multi user system on the Linux machine, only one user need to compile the target tool chain and host tools and rest of the user just create root file system using these target tool chain and host tools.


Thanks in advance,
Raj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140225/e9c81def/attachment.html>
