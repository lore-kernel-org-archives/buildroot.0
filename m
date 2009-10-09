From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Oct 2009 13:26:19 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <87vdiohl1r.fsf@macbook.be.48ers.dk>
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
	<87vdiohl1r.fsf@macbook.be.48ers.dk>
Message-ID: <20091009112619.GL2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 09, 2009 at 01:19:12PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> my bad, you're right that i did:
> Bernhard> $ git clone
> Bernhard> $ make defconfig
> Bernhard> $ rm -rf output
>
>defconfig doesn't create output.

ok, so it was menuconfig.
>
> Bernhard> somebody should fix the clean targets!!
> Bernhard> $ make linux26-menuconfig
>
> Bernhard> and that failed.

I'll stop arguing about this breakage now and keep the fix local.

thanks for your patience.
