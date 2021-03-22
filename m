From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Mar 2021 17:03:33 +0100
Subject: [Buildroot] [PATCH] package/zeromq: fix build failure due to
 binutils bug 21464
In-Reply-To: <712d75cc-4d52-1a2c-e89e-74d71c1f0a35@benettiengineering.com>
References: <20210314223616.5bfcc62f@windsurf.home>
 <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
 <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
 <3a252a05-54ac-24a7-a9d6-1c5a21679aee@benettiengineering.com>
 <20210322144220.5f9158c4@windsurf.home>
 <712d75cc-4d52-1a2c-e89e-74d71c1f0a35@benettiengineering.com>
Message-ID: <20210322170333.643d9605@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 16:57:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Has this fix been suggested by upstream? How do you know it's the
> > "right" fix ?  
> 
> Yes it's been suggested by Stafford here:
> https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Ah, OK!

> > Don't bother with the external Bootlin toolchains, I was working on a
> > new release of the toolchains based on 2021.02, so I'll include the
> > binutils fix.  
> 
> Ok, so it fixes this bug for Buildroot toolchain and you'll provide 
> Bootlin toolchain and we can consider this bug as not affecting
> Buildroot anymore. The chance one would use an external OpenRisc 
> toolchain would be very rare. Right?

Yes, that's the idea.

> So bug 21464 is still there and my binutils patches need do be re-worded.
> 
> And please drop my pending patch:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210322131437.392225-1-giulio.benetti at benettiengineering.com/
> 
> I've submitted a reworded one:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210322155655.547476-1-giulio.benetti at benettiengineering.com/

OK, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
