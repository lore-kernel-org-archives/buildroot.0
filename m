From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Apr 2020 16:29:53 -0300
Subject: [Buildroot] [PATCHv2 04/12] configs: fix typo
 BR2_TARGET_ROOTFS_EXT2_4
In-Reply-To: <20200421172646.3340666-4-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-4-romain.naour@gmail.com>
Message-ID: <CAOMZO5BJN45Boj+3f595Q8QTZj8SL8hDKsW-d3XP_idt1FPutA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2020 at 2:27 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> The ext4 option is BR2_TARGET_ROOTFS_EXT2_4 not
> BR2_TARGET_ROOTFS_EXT_4.
>
> This fixes the new defconfig check.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
