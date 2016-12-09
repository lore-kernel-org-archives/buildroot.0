From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Dec 2016 15:00:38 +0000
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.4.2
In-Reply-To: <1481295149-1317-1-git-send-email-gustavo@zacarias.com.ar>
References: <1481295149-1317-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <415ec025-b430-5f63-bc8c-a599a09aecab@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 09/12/16 14:52, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sysstat/sysstat.hash | 2 +-
>  package/sysstat/sysstat.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
> index 3170fc9..e6e0c53 100644
> --- a/package/sysstat/sysstat.hash
> +++ b/package/sysstat/sysstat.hash
> @@ -1,2 +1,2 @@
>  # From: http://sebastien.godard.pagesperso-orange.fr/download.html
> -sha1	59769deddef02acd60db3a42d772e57bd0978efb	sysstat-11.4.0.tar.xz
> +sha1	84ac7feba76049f201e203c7ce0cc750479a9d43	sysstat-11.4.2.tar.xz

it would probably be a good idea to include a calculated sha256 hash
since upstream only provides one weak hash (sha1).

Regards,

Vincent.

> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index de6cd9f..1a86fa0 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSSTAT_VERSION = 11.4.0
> +SYSSTAT_VERSION = 11.4.2
>  SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
>  SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
>  SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
> 
