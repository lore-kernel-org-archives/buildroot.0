From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 May 2016 19:23:52 -0300
Subject: [Buildroot] [PATCH v3 2/2] configs: add defconfig for TS-4800
In-Reply-To: <1464296633-1880-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1464296633-1880-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <CAOMZO5CZwV4zMfhyUcDfH3wzub7h=hGcRAzyNyWb_wHnacR0zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 26, 2016 at 6:03 PM, Patrick Keroulas
<patrick.keroulas@savoirfairelinux.com> wrote:

> +        partition uboot {
> +                partition-type = 0xda
> +                image = "u-boot.bin"

Just curious:  why do you use u-boot.bin instead of u-boot.imx?
