From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 23:35:15 +0200
Subject: [Buildroot] [PATCH] elf2flt: Allow enabling elf2flt support for
 blackfin
In-Reply-To: <1378259269.32360.1.camel@phoenix>
References: <1378259269.32360.1.camel@phoenix>
Message-ID: <20130905233515.702cf145@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 09:47:49 +0800, Axel Lin wrote:
> This allows using toolchain-buildroot to build BFLT executable for blackfin.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

This is already taken care of by Gustavo's patch
http://patchwork.ozlabs.org/patch/272715/ that also bumps elf2flt to a
newer version.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
