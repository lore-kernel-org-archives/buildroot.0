From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Sep 2014 09:11:50 +0200
Subject: [Buildroot] [PATCH] bfin: disable newer binutils for internal
 toolchain
In-Reply-To: <20140901195817.GU30210@waldemar-brodkorb.de>
References: <20140831082454.GA3986@waldemar-brodkorb.de>
 <20140831144132.0b995b4e@free-electrons.com>
 <20140901195817.GU30210@waldemar-brodkorb.de>
Message-ID: <20140902091150.33c30efa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 1 Sep 2014 21:58:18 +0200, Waldemar Brodkorb wrote:

> > Could you report the bug to upstream binutils? I'd like to be able to
> > get rid of binutils 2.22 at some point.
> > 
> > Thanks a lot!
> 
> Done:
> https://sourceware.org/bugzilla/show_bug.cgi?id=17334

Great. Could you respin a new version of your patch that references
this bug report in the comment, such as:

	# bfin disabled due to
	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
	config ...
		depends on !BR2_bfin

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
