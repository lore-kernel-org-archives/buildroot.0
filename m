From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 11:12:39 +0200
Subject: [Buildroot] [PATCH 5/7] Add fancy options to busybox sleep,
 like float arguments
In-Reply-To: <1435929086-21205-6-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-6-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150704111239.7de95201@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain Raybaud,

On Fri,  3 Jul 2015 15:11:24 +0200, Sylvain Raybaud wrote:
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
> ---
>  package/busybox/busybox.config | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 9d930d1..8d1d80a 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -273,8 +273,8 @@ CONFIG_SHA256SUM=y
>  CONFIG_SHA512SUM=y
>  CONFIG_SHA3SUM=y
>  CONFIG_SLEEP=y
> -# CONFIG_FEATURE_FANCY_SLEEP is not set
> -# CONFIG_FEATURE_FLOAT_SLEEP is not set
> +CONFIG_FEATURE_FANCY_SLEEP=y
> +CONFIG_FEATURE_FLOAT_SLEEP=y
>  CONFIG_SORT=y
>  CONFIG_FEATURE_SORT_BIG=y
>  # CONFIG_SPLIT is not set

Can you include in the commit information about the size different of
the resulting Busybox binary before/after this patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
