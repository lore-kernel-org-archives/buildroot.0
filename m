From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 2 Jun 2015 23:04:44 +0200
Subject: [Buildroot] [PATCH v2 1/3] boot/at91bootstrap3: add license
 information
In-Reply-To: <1433234780-21084-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
 <1433234780-21084-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150602210444.GH1715@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2015 at 10:46:18 +0200, Angelo Compagnucci wrote :
> This patch adds licensing informations to at91bootstrap3
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fixed license with a more appropriate one
> 
>  boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index ff49e14..a997152 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -6,6 +6,8 @@
>  
>  AT91BOOTSTRAP3_VERSION = v3.7.1
>  AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
> +AT91BOOTSTRAP3_LICENSE = BSD-2c with endorsement clause

I know I'm late to the party but this is actually a non endorsement
clause.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
