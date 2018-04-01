From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 1 Apr 2018 07:37:08 +0200
Subject: [Buildroot] [PATCH] utils/scanpypi: don't hardcode python2
In-Reply-To: <20180330214807.6135-1-peter@korsgaard.com>
References: <20180330214807.6135-1-peter@korsgaard.com>
Message-ID: <CAGm1_ku-S_3RSa2x=Qj0R83iDJXYDwsMDUKtTqvuYoCuq=vgsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 30, 2018 at 11:48 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Commit 3a0c20c5309b (scanpypi: add support for Python3) adapted the script
> to work with python 3.x, but the shebang still said python2 making it
> unlikely to work on systems without python 2.x.
>
> Change it to just 'python' instead.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 505ba0a246..df8939b82e 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python2
> +#!/usr/bin/env python
>  """
>
>  Utility for building Buildroot packages for existing PyPI packages
> --
> 2.11.0
>
