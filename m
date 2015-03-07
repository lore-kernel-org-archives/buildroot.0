From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:43:40 +0100
Subject: [Buildroot] [PATCH] disable linuxthreads for NPTL only
 architectures for uClibc-ng
In-Reply-To: <20150304144816.GA14815@waldemar-brodkorb.de>
References: <20150304144816.GA14815@waldemar-brodkorb.de>
Message-ID: <20150307144340.4a07e177@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 4 Mar 2015 15:48:17 +0100, Waldemar Brodkorb wrote:
> uClibc-ng does not support multiple thread implementations for
> an architecture and MMU configuration.
> BFIN, ARM noMMU and m68k/Coldfire noMMU still uses linuxthreads in uClibc-ng.
> The other buildroot supported architectures support NPTL.
> Reflect this in Buildroot configuration.
> ARC would work with uClibc-ng 1.0.0 and TLS/NPTL, but the correct
> toolchain must be used.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've posted a different proposal at
http://patchwork.ozlabs.org/patch/447577/. Can you review it?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
