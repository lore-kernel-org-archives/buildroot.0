From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:34:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 5.3.0
In-Reply-To: <20210406195549.1275989-1-fontaine.fabrice@gmail.com>
References: <20210406195549.1275989-1-fontaine.fabrice@gmail.com>
Message-ID: <2a032fb6-43f5-0d7f-ac70-df1b6cf3bd9e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 21:55, Fabrice Fontaine wrote:
> - Update indentation in hash file (two spaces)
> - Update URL in Config.in as current URL returns 404 Not Found
> 
> https://github.com/zopefoundation/zope.interface/blob/5.3.0/CHANGES.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/python-zope-interface/Config.in                  | 2 +-
>  package/python-zope-interface/python-zope-interface.hash | 6 +++---
>  package/python-zope-interface/python-zope-interface.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-zope-interface/Config.in b/package/python-zope-interface/Config.in
> index 4279aa9ef8..17f7aed0d9 100644
> --- a/package/python-zope-interface/Config.in
> +++ b/package/python-zope-interface/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
>  	  implementation of the Design By Contract methodology support
>  	  in Python.
>  
> -	  http://docs.zope.org/zope.interface/
> +	  https://zopeinterface.readthedocs.io/
> diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
> index 2828d85c32..6c2f75303d 100644
> --- a/package/python-zope-interface/python-zope-interface.hash
> +++ b/package/python-zope-interface/python-zope-interface.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/zope-interface/json
> -md5	a3b24f9d079bae5e13dd7a88aa512112  zope.interface-4.6.0.tar.gz
> -sha256	1b3d0dcabc7c90b470e59e38a9acaa361be43b3a6ea644c0063951964717f0e5  zope.interface-4.6.0.tar.gz
> +md5  291fd76bd83dda946674af1526b6c2cd  zope.interface-5.3.0.tar.gz
> +sha256  b18a855f8504743e0a2d8b75d008c7720d44e4c76687e13f959e35d9a13eb397  zope.interface-5.3.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256	3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
> +sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
> diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
> index f36aab692b..db0739405d 100644
> --- a/package/python-zope-interface/python-zope-interface.mk
> +++ b/package/python-zope-interface/python-zope-interface.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_ZOPE_INTERFACE_VERSION = 4.6.0
> +PYTHON_ZOPE_INTERFACE_VERSION = 5.3.0
>  PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
> -PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/4e/d0/c9d16bd5b38de44a20c6dc5d5ed80a49626fafcb3db9f9efdc2a19026db6
> +PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/b1/f8/aa59109d5345ece4820e8e7a05a97203ef21a0ac2c0460c6c929ea5be889
>  PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
>  PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
>  PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
> 
