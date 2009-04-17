From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 17 Apr 2009 10:42:09 +1000
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <87ocuwa390.fsf@macbook.be.48ers.dk>
References: <20090414103327.2fd69516@danhplaptop>
	<87eivtx0c4.fsf@macbook.be.48ers.dk> <20090416091027.6c6153fe@surf>
	<87ocuwa390.fsf@macbook.be.48ers.dk>
Message-ID: <20090417004209.GA12990@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 16, 2009 at 07:59:39PM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  >> make distclean.
> 
>  Thomas> Which is quite confusing since :
> 
>  Thomas> $ make help | grep distclean
>  Thomas>   distclean              - delete all non-source files (including .config)
> 
>  Thomas>  :-)
> 
> I agree. The clean targets are quite a mess (especially when
> considering the project stuff).
> 
> I think we should probably just have clean and distclean (and the
> individual <target>-clean / -dirclean stuff), where distclean is
> clean + rm .config

Are the individual package -clean targets of any value? I never use
them, you are just rebuilding from the same source so what's changed?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
