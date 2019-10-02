From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:31:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 3.1.6
In-Reply-To: <20190930123302.28215-7-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
 <20190930123302.28215-7-asafka7@gmail.com>
Message-ID: <20191002223131.6306c16f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:32:33 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> -PYTHON_BITSTRING_VERSION = 3.1.5
> +PYTHON_BITSTRING_VERSION = 3.1.6
>  PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
> -PYTHON_BITSTRING_SITE = https://github.com/scott-griffiths/bitstring/archive
> -PYTHON_BITSTRING_SETUP_TYPE = distutils
> +PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/f4/87/fe6f7093088f4396e84c1b5d5dfb08c4840487ad46ff4805b7008c8f5ffc
> +PYTHON_BITSTRING_SETUP_TYPE = setuptools

The SETUP_TYPE changed from distutils to setuptools, that's typically
worth mentioning in the commit log, so I updated it when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
