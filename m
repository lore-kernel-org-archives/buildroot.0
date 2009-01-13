From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 13 Jan 2009 07:10:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090113000541.GA32708@cloud.net.au>
References: <20090109063009.8E640768C5@busybox.osuosl.org>
	<87hc48rg53.fsf@macbook.be.48ers.dk>
	<20090113000541.GA32708@cloud.net.au>
Message-ID: <20090113071025.72bb816e@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Jan 2009 11:05:41 +1100
Hamish Moffatt <hamish@cloud.net.au> wrote:

> On Fri, Jan 09, 2009 at 10:19:04AM +0100, Peter Korsgaard wrote:
> > >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

<snipp>

> > Silently selecting something as big and with so many configuration
> > options as U-Boot isn't that nice - I think it would be nicer to
> > depend on UBOOT instead.
> 
> Isn't it possible(likely?) that users would have their own U-Boot or
> have a pre-built one and don't need to compile it with buildroot, yet
> still want to generate uImages?
> 

Yes, but they still need mkimage. And, AFAIK, U-Boot does not support
building the tools without loading a configuration. U-Boot could
default to a known to compile default... Instead of like now where it
defaults to $(BOARD_NAME)_config or something similar.

-- 
Best regards,
Hans-Christian Egtvedt
