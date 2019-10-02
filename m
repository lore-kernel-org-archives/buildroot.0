From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:38:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to
 version 0.25
In-Reply-To: <20190930123302.28215-23-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
 <20190930123302.28215-23-asafka7@gmail.com>
Message-ID: <20191002223849.5641d3fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:32:49 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> -PYTHON_PYELFTOOLS_VERSION = 0.24
> +PYTHON_PYELFTOOLS_VERSION = 0.25
>  PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
> -PYTHON_PYELFTOOLS_SITE = https://pypi.python.org/packages/ba/78/d4a186a2e38731286c99dc3e3ca8123b6f55cf2e28608e8daf2d84b65494
> +PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
>  PYTHON_PYELFTOOLS_LICENSE = Public domain
>  PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
> -PYTHON_PYELFTOOLS_SETUP_TYPE = distutils
> +PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools

The change from distutils to setuptools is worth mentioning in the
commit log, so I updated it when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
