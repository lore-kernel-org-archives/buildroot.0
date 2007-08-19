From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 19 Aug 2007 14:47:35 +0200
Subject: [Buildroot] How to change kernel version
References: <d6cda7730708181940u51f1e3d6ya6e701104d6dc5c7@mail.gmail.com>
Message-ID: <001201c7e291$2b8f5ee0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
To: <buildroot@uclibc.org>
Sent: Sunday, August 19, 2007 4:40 AM
Subject: [Buildroot] How to change kernel version


> Hi,
> 
>   I searched over the archives but I couldn't find anything about how
> one could change the kernel version. The only available option for
> AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> drivers, so I would like to change it to 2.6.18 which actually works.
> 
> Kind Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

That is simple, you can't do it within buildroot!!!

I am working on a patch to allow users to use any kernel version
But that will require the kernel to be 2.6.19 minimum.

The best option is to build it outside buildroot and just
create a path to the tools in $(STAGING_DIR)


Best Regards
Ulf Samuelsson 
