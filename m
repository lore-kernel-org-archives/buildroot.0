From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 14 Apr 2020 11:44:04 +0200
Subject: [Buildroot] [PATCH] package/python-cbor2: needs
 host-python-setuptools-scm
In-Reply-To: <20200414065915.8310-1-asafka7@gmail.com>
References: <20200414065915.8310-1-asafka7@gmail.com>
Message-ID: <CAGm1_ksJuWSx6RRho8k47chX62ZpQBXt8Djzp0XQs2=jvAR5GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 14, 2020 at 9:00 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Fixes:
>   http://autobuild.buildroot.net/results/124e1e628c78449fbaa027d74ab871b36d782343/
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-cbor2/python-cbor2.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
> index d504e33d2d..d0cee7e941 100644
> --- a/package/python-cbor2/python-cbor2.mk
> +++ b/package/python-cbor2/python-cbor2.mk
> @@ -10,5 +10,6 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3e/2c/188d040bd4cf99
>  PYTHON_CBOR2_SETUP_TYPE = setuptools
>  PYTHON_CBOR2_LICENSE = MIT
>  PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
> +PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
>
>  $(eval $(python-package))
> --
> 2.26.0
>
