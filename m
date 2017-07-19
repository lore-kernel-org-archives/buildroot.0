From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:35:46 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: change method for
 including linux-tool sub-makefiles
In-Reply-To: <20170718181137.23347-1-mmayer@broadcom.com>
References: <20170718181137.23347-1-mmayer@broadcom.com>
Message-ID: <20170719213546.5a6209bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 11:11:37 -0700, Markus Mayer wrote:
> Make inclusion ordering of all linux-tool-*.mk sub-makefiles explicit
> instead of relying on alphabetical sort order. This is done by
> renaming the Linux tools sub-makefiles to the format linux-tool-*.mk.in.
> This causes the top-level Makefile to ignore the Linux tools
> sub-makefiles.
> 
> Until now, the main Makefile included all linux-tool-*.mk files, as
> well as linux-tools.mk, and it relied on alphabetical sorting to
> include them in the proper order (linux-tool-*.mk before
> linux-tools.mk).
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---

I've taken into account the improvements suggested by Yann and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
