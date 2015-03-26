From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Mar 2015 22:55:57 +0100
Subject: [Buildroot] [PATCH 5/5 v2] linux: migrate extensions to use the
 new infrastructure
In-Reply-To: <724c084b0e9f1d98670184ab5e77a2381e04d67c.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <724c084b0e9f1d98670184ab5e77a2381e04d67c.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <5514806D.2030701@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 14/03/2015 15:25, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux-ext-fbtft.mk   | 8 +-------
>  linux/linux-ext-rtai.mk    | 8 +-------
>  linux/linux-ext-xenomai.mk | 8 +-------
>  3 files changed, 3 insertions(+), 21 deletions(-)
> 

    Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Tested with Xenomai extensions.

    Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
