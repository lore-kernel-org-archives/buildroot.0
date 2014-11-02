From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 02 Nov 2014 17:37:01 +0100
Subject: [Buildroot] [PATCH] lttng-tools: Update hash file after silent
	update
In-Reply-To: <1414945495-22530-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
 <1414945495-22530-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <54565DAD.3040809@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Le 02/11/2014 17:24, Maxime Hadjinlian a ?crit :
> The tarballs for 2.5.1 have been silently updated by upstream at
> '2014-10-31 15:35'.
> 
> This fixes:
> http://autobuild.buildroot.net/results/a2a/a2ab3c526a3f67371524e1b076512cf1f8058c72/build-end.log
> 
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlia@gmail.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
> Thanks to Romain Naour for pointing this out on IRC.
> ---
>  package/lttng-tools/lttng-tools.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
> index c0c4bc1..92a4401 100644
> --- a/package/lttng-tools/lttng-tools.hash
> +++ b/package/lttng-tools/lttng-tools.hash
> @@ -1,2 +1,2 @@
>  # Locally generated
> -sha256  3c6511e6ceef975cfe36b5644ab9bfaa6780c71b1d2551718279823924429739  lttng-tools-2.5.1.tar.bz2
> +sha256  1084ce1fac0030cb5e0e3e117002444ceb9f94d6a15a6cce6607c480eca9b21b  lttng-tools-2.5.1.tar.bz2
> 

Manually downloaded tarball, and manually checked the hash.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain Naour
