From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 3 May 2014 21:52:37 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test_fork when fork() is no
	available
In-Reply-To: <87iopmofas.fsf@dell.be.48ers.dk>
References: <1399134782-18013-1-git-send-email-yann.morin.1998@free.fr>
 <87iopmofas.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMKojJ=EtvG3kbZhramPu6owqD9z3kTf50ngaWgouGyq7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, all,

On Sat, May 3, 2014 at 9:03 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > From: Samuel Martin <s.martin49@gmail.com>
>  > zeromp's configure script correctly detects the fork availability, but
>  > unconditionally build test_fork program whatever the fork() availability.
>
>  > This patch fixes the build-system by disabling test_fork when fork is
>  > not available (e.g. when !BR2_USEMMU).
>
> The symbol is called BR2_USE_MMU.
>
> Committed, thanks. Please don't forget to send the patch upstream.
Already on it! :)

>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
