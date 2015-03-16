From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 16 Mar 2015 14:14:03 +0000
Subject: [Buildroot] [PATCH v4] toolchain-external: add Synopsys
 DesignWare tools for ARC cores
In-Reply-To: <20150316150151.2e6db3b6@free-electrons.com>
References: <1425988224-18780-1-git-send-email-abrodkin@synopsys.com>
 <20150316150151.2e6db3b6@free-electrons.com>
Message-ID: <1426515243.2662.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-03-16 at 15:01 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 10 Mar 2015 14:50:24 +0300, Alexey Brodkin wrote:
> > With this change we add pre-built external toolachins for DesignWare ARC
> > cores. All currently existed flavours are supported:
> >  * ARC 700 and ARC HS cores
> >  * Little- and big-endian configurations
> > 
> > These pre-built tools are built with build scripts available here
> > (https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/tree/arc-2014.12)
> > and correspond to arc-2014.12 release of sources.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Anton Kolesov <akolesov@synopsys.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Applied, thanks!

Thanks a lot for taking care!

Please apply http://patchwork.ozlabs.org/patch/442877/ (gdb: fix target
gdb building from git) as well so we escape gdb build failures with
prebuit tools for ARC.

-Alexey
