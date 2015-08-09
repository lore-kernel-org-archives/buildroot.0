From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:40:07 +0200
Subject: [Buildroot] [PATCH] haveged: for sparc we need generic
 clockgettime
In-Reply-To: <20150809092910.GT8475@waldemar-brodkorb.de>
References: <20150809084740.GA19849@waldemar-brodkorb.de>
 <20150809111924.2f1314e0@free-electrons.com>
 <20150809092910.GT8475@waldemar-brodkorb.de>
Message-ID: <20150809114007.5e774877@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 9 Aug 2015 11:29:10 +0200, Waldemar Brodkorb wrote:

> > So this should be:
> > 
> > ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> > 
> > Right? We indeed don't support any SPARCv9 at the moment, but it's
> > probably better to be more specific. What do you think?
> 
> Right.

Ok, I'll apply with this change.

> Are you interested in sparc64 qemu defconfigs after release?

Yes, sure. No need to wait after the release if these are ready. The
next branch is opened, I can merge new stuff.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
