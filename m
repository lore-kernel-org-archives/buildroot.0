From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 12:59:06 +0100
Subject: [Buildroot] [PATCH] grep: bump version to 2.18
In-Reply-To: <53104244.8010305@t-online.hu>
References: <53104244.8010305@t-online.hu>
Message-ID: <20140301125906.1f155340@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear L?vai Tam?s,

On Fri, 28 Feb 2014 09:01:08 +0100, L?vai Tam?s wrote:
> Signed-off-by: Tamas Levai <levai.tamas@t-online.hu>
> ---
>   package/grep/grep.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
> 
> -GREP_VERSION = 2.16
> +GREP_VERSION = 2.18
>   GREP_SITE = $(BR2_GNU_MIRROR)/grep
>   GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>   GREP_LICENSE = GPLv3+

Thanks for your patch. It looks good, but unfortunately, you have used
Thunderbird to send it, and Thunderbird has screwed up the patch. Could
you please resend it with 'git send-email', which ensures that your
patch will not reformatted by your e-mail client on the way?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
