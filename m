From: Matias Garcia <mgarcia@rossvideo.com>
Date: Mon, 25 Jul 2011 17:19:00 -0400
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
 options
In-Reply-To: <87tyaau8xo.fsf@macbook.be.48ers.dk>
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 <87y5zmuauq.fsf@macbook.be.48ers.dk>
 <20110725071001.GA13998@sapphire.tkos.co.il>
 <87tyaau8xo.fsf@macbook.be.48ers.dk>
Message-ID: <1311628740.1973.20.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-07-25 at 09:16 +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  >> What tree did you create this patch against? package/Makefile.in hasn't
>  >> looked like that since April, so I had to apply the patch manually.
> 
>  Baruch> I mistakenly based this patch on version 2010.11.
> 
>  Baruch> Actually, since I use an external toolchain, the patch of
>  Baruch> Matias Garcia
>  Baruch> (http://lists.busybox.net/pipermail/buildroot/2011-July/043944.html,
>  Baruch> not merged yet) solves the -te500v2 problem for me without this
>  Baruch> patch, so I've dropped it locally.
> 
> Ok. That patch still needs some work (E.G. it only works with a single
> argument).

Ah, that's something I hadn't considered. Thanks for the feedback. I was
assuming one could pass something like "-fee -fi -fo -fum" in the text
block, and this would be passed on to the wrapper.

I won't have time in the next while to work on it. Can you suggest a way
to do it if/when I do? I'm not a make expert by any means.

Cheers,
Matias
