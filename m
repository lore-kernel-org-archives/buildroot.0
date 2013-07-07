From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Jul 2013 22:14:39 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <87zjtygn1e.fsf@dell.be.48ers.dk>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <87zjtygn1e.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMJgYLSE8cR4+syucs=8oMhPY9Bg2q2iDnASn=cxSB2awg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2013/7/7 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  Samuel> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
>  Samuel> To avoid this, unset the MAKEFLAGS environment variable.
>
> Unfortunately this also drops '-s' from child make invocations, making
> silent builds significantly more noisy.
>
> We have .NOTPARALLEL: in the top level Makefile, isn't that enough to
> ensure funky MAKEFLAGS settings? Anything else you encountered?
Seems not since, some days ago, some people complained about it on the
irc channel.
I will update the doc, instead.


-- 
Samuel
