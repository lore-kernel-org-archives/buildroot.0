From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 22:06:51 +0100
Subject: [Buildroot] [PATCH] toolchain: update crosstool-NG project URL
In-Reply-To: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 19 Mar 2013 20:15:38 +0100")
References: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwtzt7ys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/Config.in |    2 +-
 Thomas>  1 file changed, 1 insertion(+), 1 deletion(-)

 Thomas> diff --git a/toolchain/Config.in b/toolchain/Config.in
 Thomas> index 6311349..fa78cf4 100644
 Thomas> --- a/toolchain/Config.in
 Thomas> +++ b/toolchain/Config.in
 Thomas> @@ -26,7 +26,7 @@ config BR2_TOOLCHAIN_CTNG
 Thomas>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 Thomas>  	help
 Thomas>  	  Say 'y' if you want to generate the toolchain with crosstool-NG
 Thomas> -	  ( http://ymorin.is-a-geek.org/projects/crosstool )
 Thomas> +	  (http://crosstool-ng.org).

Thanks, but what tree did you make this against? It doesn't apply to
current head (we have a select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
line).

-- 
Bye, Peter Korsgaard
