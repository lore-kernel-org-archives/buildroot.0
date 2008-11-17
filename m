From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 17 Nov 2008 23:38:22 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <871vxa9650.fsf@macbook.be.48ers.dk>
References: <20081116172209.0137E3C6D4@busybox.net>
	<20081116234622.GG16858@cloud.net.au>
	<871vxa9650.fsf@macbook.be.48ers.dk>
Message-ID: <20081117123822.GA11840@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 17, 2008 at 08:13:47AM +0100, Peter Korsgaard wrote:
> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
> Hi,
> 
>  >> ++#error "Sorry, you need at least uClibc version 0.9.30 for id applet to build"
>  >> ++#endif
>  >> ++#endif
>  >> ++
>  >> + enum {
>  >> + 	PRINT_REAL      = (1 << 0),
>  >> + 	NAME_NOT_NUMBER = (1 << 1),
> 
>  Hamish> This patch isn't right, id builds if CONFIG_USE_BB_PWD_GRP=y.
> 
> Ok, you better tell Denys / the busybox list.

I did, and Denys has updated the patch. Will you update buildroot?
(Or else I can do it tomorrow.)

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
