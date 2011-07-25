From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jul 2011 10:24:07 +0300
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
In-Reply-To: <87tyaau8xo.fsf@macbook.be.48ers.dk>
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 <87y5zmuauq.fsf@macbook.be.48ers.dk>
 <20110725071001.GA13998@sapphire.tkos.co.il>
 <87tyaau8xo.fsf@macbook.be.48ers.dk>
Message-ID: <20110725072406.GB13998@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jul 25, 2011 at 09:16:19AM +0200, Peter Korsgaard wrote:
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

I see. Any other issue with that patch?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
