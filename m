From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Mon, 10 Mar 2014 12:21:11 -0400
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
Message-ID: <531DE677.7040801@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 03/09/2014 03:01 PM, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
> v4: rebased v3
> v3: Config.in: move package to "Graphic libraries" (Arnout)
> v2: rebased v1
> v1: rebased Spenser Gilliland?s patch:
>     http://patchwork.ozlabs.org/patch/278302/
>
>  package/Config.in                                     |    1 +
>  package/{x11r7 => }/mesa3d/Config.in                  |    0
>  package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch |    0
>  package/{x11r7 => }/mesa3d/mesa3d.mk                  |    0
>  package/x11r7/Config.in                               |    1 -
>  5 files changed, 1 insertion(+), 1 deletion(-)
>  rename package/{x11r7 => }/mesa3d/Config.in (100%)
>  rename package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch (100%)
>  rename package/{x11r7 => }/mesa3d/mesa3d.mk (100%)
Reviewed-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Regards,
Sebastien.
