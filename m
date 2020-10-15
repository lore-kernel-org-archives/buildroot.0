From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:13:26 +0200
Subject: [Buildroot] [PATCH] odruidc2: remove rootfs size limit
In-Reply-To: <20200926140252.10714-1-daggs@gmx.com>
References: <20200926140252.10714-1-daggs@gmx.com>
Message-ID: <20201015231326.788ce34e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 17:02:52 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> as resizing the fs using paritions manager can result with a non booting
> image due to the firmware's location, removal of the size limit for the rootfs
> allows better match size-wise.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  board/hardkernel/odroidc2/genimage.cfg | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
