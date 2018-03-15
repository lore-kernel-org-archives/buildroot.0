From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 15 Mar 2018 20:43:07 +0100
Subject: [Buildroot] [PATCH] wine: Drop glibc requirement
In-Reply-To: <87vae25mq7.fsf@dell.be.48ers.dk>
References: <1520590842-3879-1-git-send-email-nerv@dawncrow.de>
 <87vae25mq7.fsf@dell.be.48ers.dk>
Message-ID: <e84e201a-45c3-0b48-2cbc-89338953291e@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.03.2018 um 22:25 schrieb Peter Korsgaard:
>>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:
> 
>  > I noticed it's not needed anymore, musl went upstream at some point and uClibc is now build with bessel functions:
>  > https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db
> 
>  > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
> Committed, thanks.
> 
> Have you verified that E.G. a static only uClibc configuration works?
> test-pkg is handy for such checks.
> 

Hi,

Thanks!
In fact Wine has multiple issues with static only, I'll send a patch
