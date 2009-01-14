From: Jerry Zhang <jerry.scofield@gmail.com>
Date: Thu, 15 Jan 2009 07:27:09 +0800
Subject: [Buildroot] Make error
In-Reply-To: <8c09713c0901141517s19373a5an4a3950c87666bd7e@mail.gmail.com>
References: <8c09713c0901141517s19373a5an4a3950c87666bd7e@mail.gmail.com>
Message-ID: <8c09713c0901141527v69776b0n563f3ba75908e682@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I checked the Top directory and found there is no .config file.
I answered yes every time when i exit. It seems that it can not creat a
.config file for me.
What should i do?

2009/1/15 Jerry Zhang <jerry.scofield@gmail.com>

> Hello,buildroot world!
>
> I am using buildroot refer to
> http://buildroot.uclibc.org/buildroot.html#using.
>
> I issued "make menuconfig" and then "make", some error pops out:
>
> ..............................................................................................................................................................
> package/multimedia/gstreamer/gstreamer.mk:27: *** commands commence before
> first target.  Stop.
>
> ..................................................................................................................................................................
> I am not able to solve it. What is wrong?
>
> Thanks
>
> Jerry.Zhang
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090115/92576eb1/attachment.htm 
