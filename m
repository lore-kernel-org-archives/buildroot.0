From: Gary Bisson <bisson.gary@gmail.com>
Date: Sun, 29 Dec 2019 17:38:57 +0100
Subject: [Buildroot] [PATCH 1/1] configs/nitrogen8m: add
 u-boot-nodtb.bin custom target
In-Reply-To: <20191228173910.227339-1-juju@cotds.org>
References: <20191228173910.227339-1-juju@cotds.org>
Message-ID: <CADCpmyP-QANHvPDiRqrjosA8LFnYnSfmJ0UMPdVEiE-JN2sA1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le sam. 28 d?c. 2019 ? 18:39, Julien Olivain <juju@cotds.org> a ?crit :
>
> Recent change introduced in [1] use the "nodtb" variant of u-boot
> image. This broke the nitrogen8m_defconfig which was not including the
> generation of this U-Boot image. This patch add this target.
>
> [1] https://git.buildroot.org/buildroot/commit/?id=d130f0a83700b52ba51ebde22885f0f9e577ee29
>
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/389451762
>
> Signed-off-by: Julien Olivain <juju@cotds.org>

Tested-by: Gary Bisson <bisson.gary@gmail.com>

Thanks for your patch.

Regards,
Gary
