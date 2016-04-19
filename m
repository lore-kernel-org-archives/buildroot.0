From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 00:54:42 +0200
Subject: [Buildroot] [PATCH 1/4] linux: explicit latest kernel version
In-Reply-To: <1461099155-30702-2-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <5716B732.2090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 22:52, Vivien Didelot wrote:
> When setting BR2_LINUX_KERNEL_LATEST_VERSION, it is hard for the user to
> know that this version is subject to change in the future.
>
> Explicit this in the Kconfig entry text.
>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   linux/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 043b147..8600ea1 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -27,7 +27,7 @@ choice
>   	prompt "Kernel version"
>
>   config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "4.5.1"
> +	bool "Latest version (4.5.1)"
>
>   config BR2_LINUX_KERNEL_CUSTOM_VERSION
>   	bool "Custom version"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
