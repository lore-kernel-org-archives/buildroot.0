From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:18:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/upx: fix build with host gcc 6.x
In-Reply-To: <20160616160554.21393-1-martin@barkynet.com>
References: <20160616160554.21393-1-martin@barkynet.com>
Message-ID: <20160701161810.613b80c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 17:05:54 +0100, Martin Bark wrote:
> Disable the -Werror gcc option because is causes the following error
> when using gcc 6.x on the host.
> 
>  p_vmlinx.cpp:100:5: error: this ?if? clause does not guard...
>   [-Werror=misleading-indentation] if (a->p_paddr > b->p_paddr) return  1;
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/upx/upx.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
