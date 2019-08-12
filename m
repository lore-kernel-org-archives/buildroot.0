From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Mon, 12 Aug 2019 07:41:41 +0000
Subject: [Buildroot] [PATCH] DEVELOPERS: add Christophe Priouzeau as
 contact for STM32 defconfigs
In-Reply-To: <20190811120739.26539-1-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-1-thomas.petazzoni@bootlin.com>
Message-ID: <8c0dadd1-baeb-135b-7ce7-6f4105bfcf17@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8/11/19 2:07 PM, Thomas Petazzoni wrote:
> Christophe has recently taken care of those defconfigs, so let's add
> him as a contact for those defconfigs, so that he receives build
> failure notifications and is Cc'ed on patches.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> Christophe, please reply with an Acked-by if you are OK with
> this. Thanks!
> ---
>   DEVELOPERS | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8ba6cd985..8995065c5f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -517,6 +517,12 @@ F:	package/rtl8821au/
>   F:	package/runc/
>   F:	package/tini/
>   
> +N:	Christophe Priouzeau <christophe.priouzeau@st.com>
> +F:	board/stmicroelectronics/stm32f429-disco/
> +F:	board/stmicroelectronics/stm32f469-disco/
> +F:	configs/stm32f429_disco_defconfig
> +F:	configs/stm32f469_disco_defconfig
> +
>   N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>   F:	package/drbd-utils/
>   F:	package/iotop/

Acked-by: Christophe Priouzeau <christophe.priouzeau@st.com>
