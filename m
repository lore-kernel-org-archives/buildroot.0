From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 9 Apr 2020 14:25:24 +0200
Subject: [Buildroot] [PATCH v1 3/5] package/python-flask: bump version
 to 1.1.2
In-Reply-To: <20200408204828.998-3-ps.report@gmx.net>
References: <20200408204828.998-1-ps.report@gmx.net>
 <20200408204828.998-3-ps.report@gmx.net>
Message-ID: <8754ba66-468a-9c74-05d8-e47603766c87@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 4/8/20 10:48 PM, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-flask/python-flask.hash | 9 +++++----
>  package/python-flask/python-flask.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> index 24f68c6605..c6ccd633f8 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,6 +1,7 @@
> -# md5, sha256 from https://pypi.org/pypi/flask/json
> -md5	0e3ed44ece1c489ed835d1b7047e349c  Flask-1.1.1.tar.gz
> -sha256	13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52  Flask-1.1.1.tar.gz
> -# Locally computed sha256 checksums
> +# From https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980
> +md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
> +sha256	4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060  Flask-1.1.2.tar.gz
> +
> +# License files
>  sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
>  sha256	0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150  docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> index 0cd1a18018..cc39bf7e49 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FLASK_VERSION = 1.1.1
> +PYTHON_FLASK_VERSION = 1.1.2
>  PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/2e/80/3726a729de758513fd3dbc64e93098eb009c49305a97c6751de55b20b694
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d
>  PYTHON_FLASK_SETUP_TYPE = setuptools
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
> 

Reviewed-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Regards,

-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
