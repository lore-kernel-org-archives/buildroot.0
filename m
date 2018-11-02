From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 2 Nov 2018 09:55:16 +0100
Subject: [Buildroot] [PATCH 1/1] python-cython: write full package name
 on .mk title.
In-Reply-To: <20181102085341.29421-1-asafka7@gmail.com>
References: <20181102085341.29421-1-asafka7@gmail.com>
Message-ID: <CAGm1_ktFe0NLo7DoG8cAcEELjOY89T+PX2ZSRbKJkJaBH+Pveg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2018 at 9:53 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Renamed 'cython' to 'python-cython'.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-cython/python-cython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index 624fe2fb75..f4cff975f1 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# cython
> +# python-cython
>  #
>  ################################################################################
>
> --
> 2.19.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
