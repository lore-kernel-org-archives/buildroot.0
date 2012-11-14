From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 14 Nov 2012 16:25:51 +0100 (CET)
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <CAAsE_ueNA-H3u2EHg0vMpEURR+u4+z8COmY-cY4ATyo_xpr1DA@mail.gmail.com>
Message-ID: <9486d87f-5efa-41e0-852a-7bcc77c538f6@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 > 
> > Nooooo. If you're starting a project now, start with a recent
> > kernel.
> > 3.6 is the current one. Of course, check beforehand that there is
> > support for one platform in the mainline Linux kernel.
> 
> Yes, 3.6 has the ARM support. The one reason I feel hestitate to use
> 3.6 is that I am not sure 3.6 will results in a zImage too large
> thant that I could got with 2.6. Do you have an experience in this?
> Thanks.
> 

in that case my advice would be to try 3.6 FIRST, 

if it doesn't fit, optimize out what can be

if it still doesn't fit (and only then) should you try downgrading the kernel... 

but do it in that order, do not jump to ancient kernel if you can avoid it, maintaining aging kernel is hard and costly, you will be much better if you start your project with the newest kernel
