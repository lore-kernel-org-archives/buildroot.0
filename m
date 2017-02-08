From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 08 Feb 2017 15:10:37 +0100
Subject: [Buildroot] [PATCH v5 02/19] fakedate: new package
In-Reply-To: <87fujprajp.fsf@dell.be.48ers.dk>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-3-git-send-email-jezz@sysmic.org>
 <87fujprajp.fsf@dell.be.48ers.dk>
Message-ID: <4829509.5X0V2zccCj@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tuesday 07 February 2017 21:49:30 Peter Korsgaard wrote:
> >>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:
> 
>  > `date' is widely used by packages to include build information in 
their
>  > binaries. Unfortunately, this is incompatible with  
BR2_REPRODUCIBLE.
> 
>  > Instead of having to identify all `date' invocations in the 
different
>  > packages, this commit adds a small tool that allows to always 
return
>  > the same date.
[...]

> Would using something like libfaketime not be a more generic solution?
> 
> https://github.com/wolfcw/libfaketime

You mean enabling something like libfaketime for whole compile process?

I think it would break compilation process. In add, I prefer to have a 
very tight control over necessary conditions to override 'date' output.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
