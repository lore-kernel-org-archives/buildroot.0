From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:50:17 +0200
Subject: [Buildroot] [PATCH 2/9] package/systemd: Add optional support
 for resolved
In-Reply-To: <1467467955-14609-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467467955-14609-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702165017.2de81229@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:59:08 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/systemd/Config.in  | 10 ++++++++++
>  package/systemd/systemd.mk |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 7c591b7..b2f9feb 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -287,6 +287,16 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
>  
>  	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
>  
> +config BR2_PACKAGE_SYSTEMD_RESOLVED
> +	bool "enable resolve daemon"
> +	default y
> +	help
> +	  systemd-resolved is a system service that provides network name
> +	  resolution to local applications. It implements a caching and validating
> +	  DNS/DNSSEC stub resolver, as well as an LLMNR resolver and responder.

Same: too long lines, so I rewrapped and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
