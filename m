From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 13 Feb 2015 20:58:45 +0100
Subject: [Buildroot] [PATCH] package/python: change
 BR2_PACKAGE_PYTHON_PYEXPAT description
In-Reply-To: <1423849041-7978-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1423849041-7978-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CAGm1_kvxFeAErb6VYyFXbuhoYkUEg=3eACYqSQUzS7K-uTMxPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 13, 2015 at 6:37 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> This patch changes BR2_PACKAGE_PYTHON_PYEXPAT description and
> help text to underline that all the xml libraries will be
> included in python.
> It also reorders alphabetically the affected option.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python/Config.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/python/Config.in b/package/python/Config.in
> index 87defad..5a22833 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -65,12 +65,6 @@ config BR2_PACKAGE_PYTHON_OSSAUDIODEV
>         help
>           ossaudiodev module for Python.
>
> -config BR2_PACKAGE_PYTHON_PYEXPAT
> -       select BR2_PACKAGE_EXPAT
> -       bool "pyexpat"
> -       help
> -         pyexpat module for Python.
> -
>  config BR2_PACKAGE_PYTHON_READLINE
>         select BR2_PACKAGE_READLINE
>         bool "readline"
> @@ -114,6 +108,12 @@ config BR2_PACKAGE_PYTHON_SQLITE
>         help
>           SQLite database support
>
> +config BR2_PACKAGE_PYTHON_PYEXPAT
> +       select BR2_PACKAGE_EXPAT
> +       bool "xml module"
> +       help
> +         pyexpat and xml libraries for Python
> +
>  config BR2_PACKAGE_PYTHON_ZLIB
>         bool "zlib module"
>         select BR2_PACKAGE_ZLIB
> --

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
