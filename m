From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:40:49 +0200
Subject: [Buildroot] [PATCH] package/ytree: uses fork(), needs MMU
In-Reply-To: <20190919195200.17397-1-ps.report@gmx.net>
References: <20190919195200.17397-1-ps.report@gmx.net>
Message-ID: <20190919224049.0b089240@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 21:52:00 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1]:
> 
>   login.c:(.text+0x546): undefined reference to `fork'
> 
> [1] http://autobuild.buildroot.net/results/bcbd0b826d5af1d429c23255d63dce6c7080085e
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ytree/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
