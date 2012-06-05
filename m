From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 6 Jun 2012 01:37:08 +0200
Subject: [Buildroot] [PATCH 1/1] libnfc: make example build optional
In-Reply-To: <8762b5pi1p.fsf@macbook.be.48ers.dk>
References: <1338741337-12019-1-git-send-email-s.martin49@gmail.com>
 <8762b5pi1p.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMM+L6Y2p_LN8u1BdrZTD6qBB3fGBDxMEpNES9i8B5Egm0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2012/6/5 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
> ?Samuel> This patch converts libnfc to CMAKETARGET and makes example build
> ?Samuel> optional.
>
> What's the reason for using cmake instead of autotools? Is upstream
> moving away from autotools or is it just because you prefer cmake?
Upstream seems provide both build system and, IMHO, it is easier to
hack cmake than autotools.
So, I move to cmake.
BTW, I don't know how to do what i did in 4 lines of cmake using
autotools... I'll look at that then repost.

>
>
> ?Samuel> Fixes http://autobuild.buildroot.org/results/a963924b15e185d0144809a98feac52dec0d1cc3
> ?Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ?Samuel> diff --git a/package/libnfc/libnfc-make-examples-optional.patch b/package/libnfc/libnfc-make-examples-optional.patch
> ?Samuel> new file mode 100644
> ?Samuel> index 0000000..da8bc3f
> ?Samuel> --- /dev/null
> ?Samuel> +++ b/package/libnfc/libnfc-make-examples-optional.patch
>
> Please add a git-style header with description and your signed-off-by to
> this patch. Have you submitted it upstream? If not, please consider
> doing so.
Will do.

Cheers,

-- 
Sam
