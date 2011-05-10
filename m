From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 09:48:05 +0200
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
 gnuconfig targets
In-Reply-To: <OF668F5E2A.89729554-ONC125788C.00277D08-8025788C.002987DD@eu.necel.com>
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
	<20110510084704.7cd44147@surf>
	<OF668F5E2A.89729554-ONC125788C.00277D08-8025788C.002987DD@eu.necel.com>
Message-ID: <20110510094805.5d044298@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2011 08:34:19 +0100
PHIL.EDWORTHY at renesas.com wrote:

> > Not your fault, but we should probably try to use BR2_ENDIAN here, in
> > order to have the big/little endian list of architectures in a common
> > location and not duplicated here in JFFS2. But that's a separate
> > matter, and should be fixed in a separate patch.
> 
> Yes, I thought that as well. I took the view that a simple update for the
> moment was best.

Sure.

> When I created this patch I tried to build some SH toolchains using BR.
> This failed for both SH2A and SH4A and I probably can't find the time to
> fix these at the moment. I only use the pre-built CodeSourcery toolchains.
> 
> So to answer your question about elf2flt, I don't know. However, I noticed
> the targets were wrong so I thought it would make sense to correct it as its
> related. Unfortunately, I know nothing about elf2flt...

Ok :-)

Thanks again,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
