From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:39:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version
 2.4.3
In-Reply-To: <20190930123302.28215-27-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
 <20190930123302.28215-27-asafka7@gmail.com>
Message-ID: <20191002223921.5f0e7152@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:32:53 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> -PYTHON_SCAPY_VERSION = 2.4.0
> +PYTHON_SCAPY_VERSION = 2.4.3
>  PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
> -PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/68/01/b9943984447e7ea6f8948e90c1729b78161c2bb3eef908430638ec3f7296
> +PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/52/e7/464079606a9cf97ad04936c52a5324d14dae36215f9319bf3faa46a7907d
> +PYTHON_SCAPY_SETUP_TYPE = setuptools
>  PYTHON_SCAPY_LICENSE = GPL-2.0
> -PYTHON_SCAPY_LICENSE_FILES = PKG-INFO
> -PYTHON_SCAPY_SETUP_TYPE = distutils
> +PYTHON_SCAPY_LICENSE_FILES = LICENSE

Same: the change to setuptools is quite important to mention in the
commit log, so I updated it when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
