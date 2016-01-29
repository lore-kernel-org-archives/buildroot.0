From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Fri, 29 Jan 2016 12:53:07 -0000
Subject: [Buildroot] Xenomai 3.0.1?
In-Reply-To: <20160129093635.3e265ab2@free-electrons.com>
References: <0eb901d159ee$a8a7e900$f9f7bb00$@chordia.co.uk>
 <20160129093635.3e265ab2@free-electrons.com>
Message-ID: <11c001d15a94$00a0e8a0$01e2b9e0$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> 
> You need to adapt the Xenomai package in package/xenomai/ and also
> probably the Xenomai Linux extension logic in linux/linux-ext-xenomai.mk.
> 
> Note however that there is a *big* difference between Xenomai 2 and
> Xenomai 3, and therefore this update is certainly not the easiest
Buildroot
> modification that you can imagine. Xenomai 3 can run on top of PREEMPT_RT
> kernels, without the Xenomai co-kernel and Adeos interrupt pipeline. This
> probably requires some fairly significant changes in the Xenomai
packaging.
> 
> In addition, since Xenomai 3 is rather new and so different from Xenomai
2,
> we probably want to keep support for Xenomai 2 for a while, which adds
> even more challenge to the task.

Somehow this is exactly what I expected :)
 
> In fact, I didn't notice that Xenomai 3 was officially released, last time
I looked
> they were at the 3.0-rc stage, so I didn't bother doing the Buildroot
> packaging. I might have a look some day, but that's pretty far away on my
> TODO list, so if someone else wants to look at it, it would definitely be
great!

I will be taking a look soonish I hope. Let us see how it progresses.

BR.
