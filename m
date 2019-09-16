From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Sep 2019 18:59:48 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: add missing external
 toolchain *.mk inclusion in sample
In-Reply-To: <20190916165051.23838-1-vadim4j@gmail.com>
References: <20190916165051.23838-1-vadim4j@gmail.com>
Message-ID: <20190916165948.GA17787@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-09-16 19:50 +0300, Vadim Kochan spake thusly:
> If follow through the customize-outside-br.txt with how to add external
> toolchain in br-ext tree then one thing is missing - inclusion of
> *.mk file with external toolchain package description.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-outside-br.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> index 6ab01bcb1f..7d3e2b1714 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -246,6 +246,7 @@ illustration, of course):
>    |
>    |- external.mk
>    |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
> +  |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/toolchain/*/*.mk))
>    |     |
>    |     |flash-my-board:
>    |     |    $(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/flash-image \
> -- 
> 2.22.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
