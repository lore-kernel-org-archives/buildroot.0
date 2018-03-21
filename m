From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 21 Mar 2018 11:02:20 +0100
Subject: [Buildroot] [PATCH v3 1/3] python-decorator: update to add host
 package
In-Reply-To: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <CAGm1_ku-dDCFYAqbkQ1AKpftbP60S+hsThXUwji8M80hgfQx+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2018 at 9:39 PM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
> Update to add host package for python decorator
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> --
> v2 -> v3: Update to remove the dependency changes
> v1 -> v2: No change
>
> ---
>  package/python-decorator/python-decorator.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
> index c0c43f6..3802f3d 100644
> --- a/package/python-decorator/python-decorator.mk
> +++ b/package/python-decorator/python-decorator.mk
> @@ -11,3 +11,4 @@ PYTHON_DECORATOR_LICENSE = BSD-2-Clause
>  PYTHON_DECORATOR_SETUP_TYPE = setuptools
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
