From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Mon, 1 Jul 2013 10:26:02 +0800
Subject: [Buildroot] [PATCH] ramspeed/smp: new package
In-Reply-To: <87r4fmz9da.fsf@dell.be.48ers.dk>
References: <1372416026-7582-1-git-send-email-keguang.zhang@gmail.com>
 <87r4fmz9da.fsf@dell.be.48ers.dk>
Message-ID: <CAJhJPsU-DJWKjTt-_h+u40Tkr+Q4gnMr3hZASOJEBkP_TdAGLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Yes, they are different.
RAMspeed is for uniprocessor machines.
RAMspeed/SMP is for multiprocessor machines.

2013/6/28 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Kelvin" == Kelvin Cheung <keguang.zhang@gmail.com> writes:
>
>  Kelvin> Add new package: ramspeed/smp
>  Kelvin> RAMspeed/SMP, a cache and memory benchmarking tool
>  Kelvin> (for multiprocessor machines running UNIX-like operating systems)
>
>  Kelvin> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
>
> This looks very similar to our existing ramspeed package. Is it the
> same/different? Do we need both?
>
> --
> Bye, Peter Korsgaard
>



-- 
Best Regards!
Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130701/7da50eba/attachment.html>
