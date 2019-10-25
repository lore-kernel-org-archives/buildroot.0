From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 21:41:07 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/llvm: add llvm RTTI option
In-Reply-To: <20191005094818.1956334-1-romain.naour@gmail.com>
References: <20191005094818.1956334-1-romain.naour@gmail.com>
Message-ID: <20191025214107.0e13e070@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 11:48:15 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Allow to build LLVM with run-time type information
> when this feature is needed (for example) by mesa3d's
> Gallium Nouveau driver or the Clover OpenCL state
> tracker when llvm support is enabled in mesa3d.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: rebase the patch on master

Series applied, thanks! On this particular patch, I extended a bit the
commit log to explain why we're doing it on both the host and target
LLVM variants.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
