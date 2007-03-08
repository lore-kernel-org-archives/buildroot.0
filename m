From: zentrale at.work <zentrale.at.work@gmail.com>
Date: Thu, 8 Mar 2007 23:15:28 +0100
Subject: [Buildroot] math.h / frexp problem - please disregard
Message-ID: <82b0e9c80703081415l5c2b160bvf04bb5d3618b65a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please disregard, issue has been solved in the meantime.

2007/3/8, zentrale at.work <zentrale.at.work@gmail.com>:
>
> i'm using buildroot to build for a at91rm9200 (arm 920t core), and it
> works quite fine except for:
>
> it obviously fails to build a proper math.h and/or the lib behind it. if
> code uses frexp(), it will fail to build with "frexp() not found" any ideas?
>
> config is:
> kernel 2.6.12.with NWFPE, uclibc 0.28.3 set to kernel fpu. gcc 4.1.1,
> binutils 2.17 ... did i miss something?
>
> thanks, zap
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070308/8726b3b6/attachment.htm 
