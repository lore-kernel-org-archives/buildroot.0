From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 06:36:54 +0100
Subject: [Buildroot] [PATCH 01/19] python-jinja2: bump to 2.8
In-Reply-To: <1454373899-22481-2-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-2-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuJeY6iyj2Q2zBaTdBdNatQb7mp8=H3DCsVROoXOd3-MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-jinja2/python-jinja2.hash | 6 +++---
>  package/python-jinja2/python-jinja2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
> index 6e8c160..04fcbc8 100644
> --- a/package/python-jinja2/python-jinja2.hash
> +++ b/package/python-jinja2/python-jinja2.hash
> @@ -1,3 +1,3 @@
> -# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9dffd2f3b43d673802fe857c8445b1a, sha256 locally computed
> -md5    b9dffd2f3b43d673802fe857c8445b1a  Jinja2-2.7.3.tar.gz
> -sha256 2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb  Jinja2-2.7.3.tar.gz
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=edb51693fe22c53cee5403775c71a99e, sha256 locally computed.
> +md5    edb51693fe22c53cee5403775c71a99e  Jinja2-2.8.tar.gz
> +sha256 bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4  Jinja2-2.8.tar.gz
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 8440b64..ce6e2b9 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -PYTHON_JINJA2_VERSION = 2.7.3
> +PYTHON_JINJA2_VERSION = 2.8
>  PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
>  PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
>  PYTHON_JINJA2_SETUP_TYPE = setuptools
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
