From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 5 Oct 2010 14:58:30 -0700
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <874od0s5q7.fsf@macbook.be.48ers.dk>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
	<20101005112147.2bc80d0e@surf>
	<AANLkTim76qFFMTStNN-D_ompE2Bcw+ZeT0aWgBE3bd=e@mail.gmail.com>
	<878w2cs9oo.fsf@macbook.be.48ers.dk>
	<AANLkTinZJqbMMdmTRu-EY42FWFjTGkjf8szXqPn3=83c@mail.gmail.com>
	<874od0s5q7.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimLWeUnhK7TuTE=7QtG34=PNqvxeZJFOxcg6co4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
     Only because, I didn't realize that busybox had it. I'll have to use
that one from now on. Much better from my way of thinking.

Martin

On Tue, Oct 5, 2010 at 2:13 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Martin" == Martin Banky <Martin.Banky@gmail.com> writes:
>
>  Martin> Peter,
>
>  Martin>      Yes, I'd be the one to complain ;-) I use it to
>  Martin> troubleshoot serial port communication issues on my embedded
>  Martin> system. It's a fast and dirty way to see if I have
>  Martin> communication with the microprocessor. Basically it lets me
>  Martin> know if it's a hardware issue or if it's in my code. But other
>  Martin> than that, I don't have any other use for it. Also, buildroot
>  Martin> is one of the few remaining places to host it. Just my 2c's.
>
> Ok, any specific reasons why you don't just use the version in busybox
> instead? (besides the fact that it isn't enabled in the defconfig, which
> I've just fixed now)
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101005/4e562904/attachment.html>
