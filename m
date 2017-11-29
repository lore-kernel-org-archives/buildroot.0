From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:36:51 +0100
Subject: [Buildroot] [PATCH] support/scripts/size-stats: avoid
 divide-by-zero
In-Reply-To: <20171128033707.15072-1-yurovsky@gmail.com>
References: <20171127220849.5f62e6fc@windsurf.home>
 <20171128033707.15072-1-yurovsky@gmail.com>
Message-ID: <20171129213651.6811d377@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 19:37:07 -0800, Andrey Yurovsky wrote:
> Some packages (ex: skeleton-init-systemd) have a zero size so we cannot
> divide by the package size. In that case make their percent zero
> explicitly and avoid a ZeroDivisionError exception.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  support/scripts/size-stats | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
