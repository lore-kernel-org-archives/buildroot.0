From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 04 Feb 2014 17:19:59 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: cleanup dependencies.sh
In-Reply-To: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <52F1132F.1050008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Maxime Hadjinlian wrote:
> Cleanup mixed indents and remove commented lines.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>   support/dependencies/dependencies.sh | 214 +++++++++++++++++------------------
>   1 file changed, 107 insertions(+), 107 deletions(-)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 47d4d10..06386e6 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -1,199 +1,199 @@
>   #!/bin/sh
>   # vi: set sw=4 ts=4:
> -#set -x
>
>   export LC_ALL=C
>
>   # Verify that grep works
>   echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>   if test $? != 0 ; then
> -	echo
> -	echo "grep doesn't work"
> -	exit 1
> +echo
> +echo "grep doesn't work"
> +exit 1
>   fi

Are you really suggesting we should remove all nesting? Well, I guess
there's been a problem with the e-mail or something...

-- 
Luca
