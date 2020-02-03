From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 00:09:22 +0100
Subject: [Buildroot] [PATCH v2 3/7] availability control for vpu in i.MX
 families
In-Reply-To: <20200203193155.12657-3-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-3-tuzakli.refik@gmail.com>
Message-ID: <20200204000922.73a63083@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 22:31:51 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
> ---
>  package/freescale-imx/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

This patch is not necessary: the imx-vpu, imx-vpu-hantro and
imx-vpuwrap packages already have in their Config.in files the
appropriate "depends on" to ensure their options are only visible under
the right conditions.

Also, we don't want to have two "source" statements including the same
file.

So since there is no additional explanation in your patch for this
change, I'll mark it as Rejected in our patch tracking system. If you
have more details, don't hesitate to provide them.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
