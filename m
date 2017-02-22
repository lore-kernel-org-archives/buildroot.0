From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 13:48:28 +0100
Subject: [Buildroot] [arc-buildroot] Analysis of build results for
 2017-02-13
In-Reply-To: <1487762759.25108.60.camel@synopsys.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <1487762759.25108.60.camel@synopsys.com>
Message-ID: <20170222134828.17a6bcb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 11:26:00 +0000, Vlad Zakharov wrote:
> We are looking at the issue. I hope it will be solved rather wool but unfortunately I am sure fix will be ready before
> BR release.

I guess you meant "not sure" ?

> So I can turn off this package now and then provide fix and turn the
> package on again. What do you think about it?

That's OK for me. Can you send a patch doing so?

We also recently disabled the "trousers" package on ARC, also for a
toolchain reason.

Will you remember all the packages that we disabled due to an ARC
toolchain issue? Should we mark them with a special comment, so that
you can grep for it, like:

	# ARC toolchain issue
	depends on !BR2_arc

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
