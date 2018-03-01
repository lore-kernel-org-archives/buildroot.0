From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 23:04:27 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <87a7vriudq.fsf@dell.be.48ers.dk>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
 <87lgfbiyk8.fsf@dell.be.48ers.dk>
 <20180301170807.2cd21163@windsurf.lan>
 <87a7vriudq.fsf@dell.be.48ers.dk>
Message-ID: <20180301230427.28e24d47@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 01 Mar 2018 18:21:53 +0100, Peter Korsgaard wrote:

>  >> dumb-init doesn't depend on any libraries, so the only issue is static
>  >> linking with glibc, right?  
> 
>  > No, you can also have musl or uclibc configured shared-only, which is
>  > the case by default since BR2_SHARED_LIBS=y.  
> 
> Yes, but static linking against libc still works in that case, right?

I'm not sure you have libc.a with uClibc or musl if you build
shared-only.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
