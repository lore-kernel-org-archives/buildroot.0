From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 5 May 2019 12:51:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2019.04
In-Reply-To: <87sgttcj3h.fsf@dell.be.48ers.dk>
References: <1556978156-1626-1-git-send-email-pjtexier@koncepto.io>
 <87sgttcj3h.fsf@dell.be.48ers.dk>
Message-ID: <06f88f57-95e8-2bac-b62f-b273167f5df4@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 05/05/2019 ? 12:05, Peter Korsgaard a ?crit?:
>>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:
>   > New features in this release:
>   > - Improved documentation
>   > - delta updates based on rdiff library
>
> Looking at https://sbabic.github.io/swupdate/swupdate.html, this seems
> to rely on librsync, but I don't see any change to _DEPENDENCIES?

Indeed, I will do in v2.

>
>   > - support for libubootenv
>
> Is that something that would be worthwhile to package?

Sure, I am working on it [1] :).
I'll try to send this package as soon as possible.
And I'll send the v2 after.

>
>   > - dry-run option
>   > - CA certificates for signed images
>   > - Fix security leak in parser
>
> What does this mean exactly? Does this mean that this should be applied
> to 2019.02.x as well?
Yes, I think so.


[1] 
https://github.com/texierp/buildroot/commit/6f1ea3cb62560996ba3669cf760dc527ed1a9ec9


Thanks

Pierre-Jean
