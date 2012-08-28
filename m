From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 22:55:17 +0200
Subject: [Buildroot] [PATCH 19/20] toolchain-external: add Sourcery
 CodeBench x86 2012.03
In-Reply-To: <503D0AC5.3070307@mind.be>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <58900acdf9856b611b4736be8ed37497f7069142.1344706801.git.thomas.petazzoni@free-electrons.com>
 <503D0AC5.3070307@mind.be>
Message-ID: <20120828225517.201e6741@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Aug 2012 20:15:33 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On 08/11/12 19:40, Thomas Petazzoni wrote:
> > +	  Note that due to the upgrade to glibc 2.15, this toolchain
> > +	  no longer provides RPC functions. The TI-RPC library should
> > +	  be used instead, but isn't available in Buildroot yet.
> 
>   Uh?

These toolchain patches were initially in a big update of the external
toolchain code, and this patch set wasn't adding the libtirpc support.
But now, clearly, I need to update this text. Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
