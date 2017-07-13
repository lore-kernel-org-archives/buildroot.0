From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 13 Jul 2017 10:25:46 +0200
Subject: [Buildroot] [PATCH 6/8] python-incremental: add host variant
In-Reply-To: <20170712162801.31131-7-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
 <20170712162801.31131-7-thomas.petazzoni@free-electrons.com>
Message-ID: <CAGm1_kt4b02tnj0jQuBwbBXRoc6pEBTGxYfQV49dSxYBgtsTMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 12, 2017 at 6:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> A host variant of the python-incremental package will be needed for
> the python-treq package.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-incremental/python-incremental.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
> index 64eda68..fc1975f 100644
> --- a/package/python-incremental/python-incremental.mk
> +++ b/package/python-incremental/python-incremental.mk
> @@ -12,3 +12,4 @@ PYTHON_INCREMENTAL_LICENSE = MIT
>  PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.9.4
>
