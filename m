From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:21:17 +0100
Subject: [Buildroot] [PATCH] package/libiscsi: fix build due to warnings
In-Reply-To: <20181204093152.10692-1-yann.morin.1998@free.fr>
References: <20181204093152.10692-1-yann.morin.1998@free.fr>
Message-ID: <20181206212117.18fc93c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 10:31:52 +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/55b/55bf50fc7dcd465b71b5757434887dd3d0b25abc/
>     http://autobuild.buildroot.org/results/98d/98dcfe5c9fc3babd5c8d3116d5128d437715c44e/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libiscsi/libiscsi.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
