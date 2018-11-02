From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 2 Nov 2018 09:55:30 +0100
Subject: [Buildroot] [PATCH 1/1] python-django: select
 BR2_PACKAGE_PYTHON_SETUPTOOLS
In-Reply-To: <20181102085341.29421-2-asafka7@gmail.com>
References: <20181102085341.29421-1-asafka7@gmail.com>
 <20181102085341.29421-2-asafka7@gmail.com>
Message-ID: <CAGm1_kv08pDOMJeN56v7x5Y7Q-4E1mE9S66prpU1wxUkWkr7YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2018 at 9:53 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> The django-admin cli tool is loaded as entry point with
> pkg_resources, which is included in setuptools.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-django/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-django/Config.in b/package/python-django/Config.in
> index 89dec8e17a..0a2e308d31 100644
> --- a/package/python-django/Config.in
> +++ b/package/python-django/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
>         select BR2_PACKAGE_PYTHON3_UNICODEDATA
>         select BR2_PACKAGE_PYTHON3_PYEXPAT
>         select BR2_PACKAGE_PYTHON_PYTZ # runtime
> +       select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>         help
>           Django is a high-level Python Web framework that encourages
>           rapid development and clean, pragmatic design. It takes your
> --
> 2.19.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
