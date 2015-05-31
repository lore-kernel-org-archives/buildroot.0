From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:43:10 +0200
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add license
 information
In-Reply-To: <1432892326-10261-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1432892326-10261-1-git-send-email-angelo.compagnucci@gmail.com>
 <1432892326-10261-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150531104310.48e68079@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 29 May 2015 11:38:44 +0200, Angelo Compagnucci wrote:
> This patch adds licensing informations to at91bootstrap3
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index ff49e14..2164a74 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -6,6 +6,8 @@
>  
>  AT91BOOTSTRAP3_VERSION = v3.7.1
>  AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
> +AT91BOOTSTRAP3_LICENSE = BSD-2c
> +AT91BOOTSTRAP3_LICENSE_FILES = main.c

I *think* it is actually closer to a BSD-3c, since it has the following
text:

 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.

However, the wording is not 100% the one of the BSD-3c, so I'm not sure
if we should call it BSD-3c or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
