From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 00:07:39 +0200
Subject: [Buildroot] [PATCH] strace: Bumps version to 4.18.
In-Reply-To: <20170714134545.13494-1-didin@synopsys.com>
References: <20170714134545.13494-1-didin@synopsys.com>
Message-ID: <20170715000739.400c0f03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 16:45:45 +0300, Evgeniy Didin wrote:
> This patch bumps strace package to 4.18 upstream version.
> 
> Important notes:
> 	1)0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch has been removed 
> 	 because it is part of 4.18.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  
> ---
>  ...os2-arch_regs-fix-nios2_sp_ptr-definition.patch | 43 ----------------------
>  package/strace/strace.hash                         |  4 +-
>  package/strace/strace.mk                           |  2 +-
>  3 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 package/strace/0001-nios2-arch_regs-fix-nios2_sp_ptr-definition.patch

Applied to master, after slightly tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
