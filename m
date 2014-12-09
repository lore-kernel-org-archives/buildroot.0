From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 09 Dec 2014 09:21:44 -0300
Subject: [Buildroot] [PATCH 1/1] ncurses: add support for 256 colors
In-Reply-To: <1418122710-27852-1-git-send-email-tbultel@free.fr>
References: <1418122710-27852-1-git-send-email-tbultel@free.fr>
Message-ID: <5486E958.9070404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/2014 07:58 AM, Thierry Bultel wrote:

> +config BR2_PACKAGE_NCURSES_EXT_COLORS
> +	bool "ncurses extended colors"
> +	select BR2_PACKAGE_NCURSES_WCHAR
> +	depends on BR2_USE_WCHAR
> +	help
> +	  compile for 256-color support
> +

Hi.
Do you know the size delta between this option enabled and disabled?
I'm asking because it might not be even worth an option.
Thanks.
Regards.
