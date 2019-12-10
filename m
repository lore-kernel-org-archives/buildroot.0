From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 10 Dec 2019 12:08:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx: update SITE to
 use NXP url
In-Reply-To: <20191202200500.418195-1-juju@cotds.org>
References: <20191202200500.418195-1-juju@cotds.org>
Message-ID: <CADCpmyPKy+3_4fkkN8DSH4_2PO6Oxvbxg2pTJVzp0gx7Mt9wFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Thanks for this contribution.

Le lun. 2 d?c. 2019 ? 21:05, Julien Olivain <juju@cotds.org> a ?crit :
>
> NXP BSPs has been using the nxp.com URL for a while:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/commit/conf/layer.conf?id=d6abbbc1ce0882bdc82e03b1868eeba1a50a7bd3
>
> It's  unclear for how long the freescale.com redirect will be
> maintained. This patch update the FREESCALE_IMX_SITE variable
> to point directly to the NXP site.
>
> Signed-off-by: Julien Olivain <juju@cotds.org>

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>

Regards,
Gary
