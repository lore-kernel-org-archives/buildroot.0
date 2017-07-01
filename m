From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:43:24 +0200
Subject: [Buildroot] [PATCH] package/xen: Upgrade Xen to version 4.9.0
In-Reply-To: <20170629233247.13091-1-alistair.francis@xilinx.com>
References: <20170629233247.13091-1-alistair.francis@xilinx.com>
Message-ID: <20170701124324.654b1eca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Jun 2017 16:32:47 -0700, Alistair Francis wrote:
> Upgrade the Xen package to Xen 4.9.0. This also means we can remove
> almost all of the patches we were prviously carrying.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> This patch applies ontop of my earlier package/xen: Fix builds with GCC 7
> patch. I want to fix the 4.8.1 build issue before upgrading to 4.9.0 incase
> anyone is ever interested in building 4.8.1. This way the commit before 4.9.0
> will work if anyone checks it out.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
