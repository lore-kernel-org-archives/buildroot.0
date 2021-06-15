From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 15:47:36 +0800
Subject: [Buildroot] [PATCH 3/4] configs/beaglev: update u-boot to
 enable OF_SEPARATE
In-Reply-To: <20210615001750.421889-4-drew@beagleboard.org>
References: <20210615001750.421889-1-drew@beagleboard.org>
 <20210615001750.421889-4-drew@beagleboard.org>
Message-ID: <CAEUhbmX_3=ib3gzdZ0Zwtun0B=ieOUQhtuy252Hm5q5c7MkQAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 15, 2021 at 8:18 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Update commit ID of u-boot to latest commit in starfive-tech repo [1]

nits: U-Boot (and in the commit title)

> which enables OF_SEPARATE [2].
>
> [1] https://github.com/starfive-tech/u-boot/tree/Fedora_VIC_7100_2021.04
> [2] https://github.com/starfive-tech/u-boot/commit/64ead5b83959da8eb87b6963843addf5942e6ed4
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  configs/beaglev_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
