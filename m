From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:16:05 +0200
Subject: [Buildroot] [PATCH] board/freescale/mxs: specify the
 volume-label for vfat
In-Reply-To: <20200417182415.13512-1-festevam@gmail.com>
References: <20200417182415.13512-1-festevam@gmail.com>
Message-ID: <20200417231605.4bff7c70@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 15:24:15 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently the volume-label for the vfat partition is a string with
> the following pattern: 5934-861D.
> 
> Specify the volume-label as "boot" to make it easier to identify it.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/mxs/genimage.cfg.template | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
