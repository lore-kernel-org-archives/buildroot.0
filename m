From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 22 Feb 2017 13:01:13 +0000
Subject: [Buildroot] [arc-buildroot] Analysis of build results for
 2017-02-13
In-Reply-To: <20170222134828.17a6bcb0@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <1487762759.25108.60.camel@synopsys.com>
 <20170222134828.17a6bcb0@free-electrons.com>
Message-ID: <1487768472.25108.68.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2017-02-22 at 13:48 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 22 Feb 2017 11:26:00 +0000, Vlad Zakharov wrote:
> > 
> > We are looking at the issue. I hope it will be solved rather wool but unfortunately I am sure fix will be ready
> > before
> > BR release.
> 
> I guess you meant "not sure" ?

You are right, it was a typo, I'm sorry.

> 
> > 
> > So I can turn off this package now and then provide fix and turn the
> > package on again. What do you think about it?
> 
> That's OK for me. Can you send a patch doing so?

Sure, I will send it soon.

> 
> We also recently disabled the "trousers" package on ARC, also for a
> toolchain reason.
> 
> Will you remember all the packages that we disabled due to an ARC
> toolchain issue? Should we mark them with a special comment, so that
> you can grep for it, like:
> 
> 	# ARC toolchain issue
> 	depends on !BR2_arc

We are trying to keep the list of packages disabled due to ARC toolchain failures.?
Nevertheless it sounds like a good idea - we won't miss anything.

> 
> Thomas
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
