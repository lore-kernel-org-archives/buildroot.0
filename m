From: Joris OFFOUGA <offougajoris@gmail.com>
Date: Mon, 5 Apr 2021 22:41:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-simplelogging: bump to
 version 0.11.0
In-Reply-To: <20210405203703.791180-1-fontaine.fabrice@gmail.com>
References: <20210405203703.791180-1-fontaine.fabrice@gmail.com>
Message-ID: <CACr73kBJY9ysG_b1jUK6Cf+1JRZ3VjixMG85GbwHge8RZj9b+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Thanks for update.

Acked-by Joris Offouga <offougajoris@gmail.com>

Best regards,



Le lun. 5 avr. 2021 ? 22:37, Fabrice Fontaine <fontaine.fabrice@gmail.com>
a ?crit :

> Update indentation in hash file (two spaces)
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-simplelogging/python-simplelogging.hash | 6 +++---
>  package/python-simplelogging/python-simplelogging.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-simplelogging/python-simplelogging.hash
> b/package/python-simplelogging/python-simplelogging.hash
> index 86698fe88c..6d80fb93ec 100644
> --- a/package/python-simplelogging/python-simplelogging.hash
> +++ b/package/python-simplelogging/python-simplelogging.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/simplelogging/json
> -md5    e3f9da393098d8fd8ebd8349a00692f2  simplelogging-0.10.0.tar.gz
> -sha256 c070e0d82b68eff6918076a0edbf0a48b2c9a263854bd35f48a12c6adbbe9d80
> simplelogging-0.10.0.tar.gz
> +md5  97b5f2a5cd9cff1b60c727cd03b3ffe1  simplelogging-0.11.0.tar.gz
> +sha256  23a128b47d3e88213adc51fdd102aae15a398cf459d782eb19534945d23f0bc5
> simplelogging-0.11.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256 bd2a0fe3b3bab7092ffa7f58d46bb05d98f12f107b3a6be947c098f7c2ad1d1a
> LICENSE
> +sha256  bd2a0fe3b3bab7092ffa7f58d46bb05d98f12f107b3a6be947c098f7c2ad1d1a
> LICENSE
> diff --git a/package/python-simplelogging/python-simplelogging.mk
> b/package/python-simplelogging/python-simplelogging.mk
> index 28acc5c952..556628613b 100644
> --- a/package/python-simplelogging/python-simplelogging.mk
> +++ b/package/python-simplelogging/python-simplelogging.mk
> @@ -4,9 +4,9 @@
>  #
>
>  ################################################################################
>
> -PYTHON_SIMPLELOGGING_VERSION = 0.10.0
> +PYTHON_SIMPLELOGGING_VERSION = 0.11.0
>  PYTHON_SIMPLELOGGING_SOURCE =
> simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
> -PYTHON_SIMPLELOGGING_SITE =
> https://files.pythonhosted.org/packages/17/85/3d2431f971e703916c7254e4560ed15451faedf2461eb484da9e1ebc5da6
> +PYTHON_SIMPLELOGGING_SITE =
> https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
>  PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
>  PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
>  PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
> --
> 2.30.2
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210405/9c9b7f2c/attachment.html>
