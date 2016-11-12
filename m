From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 12 Nov 2016 10:17:08 -0200
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: split
 defconfig in 2 variants
In-Reply-To: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
References: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAOMZO5DT0Fjw6tzoW0WJMg-YiH2Ns+3dgrcz0tGxH5YDk+__Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 12, 2016 at 7:04 AM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

It would be nice to explain the reason for splitting the defconfigs in
the commit log.


> ---
>  DEVELOPERS                                         |  2 ++
>  board/olimex/imx233_olinuxino/readme.txt           | 38 +++++++++++++++++++---
>  ...nfig => olimex_imx233_olinuxino_maxi_defconfig} | 16 +--------
>  ...=> olimex_imx233_olinuxino_mini_wifi_defconfig} |  3 +-
>  4 files changed, 37 insertions(+), 22 deletions(-)
>  copy configs/{olimex_imx233_olinuxino_defconfig => olimex_imx233_olinuxino_maxi_defconfig} (66%)
>  rename configs/{olimex_imx233_olinuxino_defconfig => olimex_imx233_olinuxino_mini_wifi_defconfig} (97%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3a9c00d..60dd82c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -496,7 +496,9 @@ F:  package/ser2net/

This should be a separate patch.
>
>  N:     Francois Perrad <francois.perrad@gadz.org>
>  F:     board/olimex/a20_olinuxino
> +F:     board/olimex/imx233_olinuxino
>  F:     configs/olimex_a20_olinuxino_*
> +F:     configs/olimex_ims233_olinuxino_*

ims233 ?

I don't see the value in doing this splitting.

What is the problem it fixes or what advantage it brings?
