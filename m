From: John Voltz <john.voltz@gmail.com>
Date: Mon, 21 Jul 2008 13:37:09 -0400
Subject: [Buildroot] [PATCH 1/2] lsdldoom: new package lsdldoom
In-Reply-To: <87r69nb17i.fsf@macbook.be.48ers.dk>
References: <1216648539-19020-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<87r69nb17i.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670807211037n1c58ed5cm5d1eee555c9bcc9f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I remember right, for some reason I was not able to get prboom to build
for AVR32 (or it had some ridiculous dependencies). This was awhile ago when
I did it, so I could be mistaken, that's why I settled on lxdoom.

John


On Mon, Jul 21, 2008 at 1:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt <
> hans-christian.egtvedt at atmel.com> writes:
>
>  Hans-Christian> This patch adds a new package lsdldoom, this Doom
>  Hans-Christian> client is based on the SDL framework. An alternative
>  Hans-Christian> to the lxdoom package.
>
> Couldn't we just standardize on prboom instead of N doom variants?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080721/8acd44c9/attachment.htm 
