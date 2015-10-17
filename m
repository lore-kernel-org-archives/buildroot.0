From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:17:41 +0200
Subject: [Buildroot] [PATCH] binutils: fix building perf
In-Reply-To: <1445087745-17488-1-git-send-email-abrodkin@synopsys.com>
References: <1445087745-17488-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151017161741.54d8f69a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sat, 17 Oct 2015 16:15:45 +0300, Alexey Brodkin wrote:
> It turned out one of the previous fixes (required to build Linux
> kernel)
> ------------------>8-------------------
> ARC Binutils: https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/a65b844aed9153789356e098984452df2f5d9058
> Buildroot: http://git.buildroot.net/buildroot/commit/?id=2d4e2e238a0ea9395152ae71d882d79b1f35094c
> ------------------>8-------------------
> broke building of some other software packages.

I've changed the commit title to "binutils: fix building perf on ARC",
otherwise we could believe that the problem applied to all
architectures. And then applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
