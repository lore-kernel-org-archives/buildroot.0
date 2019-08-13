From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 15:12:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-brotli: new package
In-Reply-To: <20190812230345.128129-1-james.hilliard1@gmail.com>
References: <20190812230345.128129-1-james.hilliard1@gmail.com>
Message-ID: <20190813151234.0756bcfd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Mon, 12 Aug 2019 17:03:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +PYTHON_BROTLI_VERSION = 1.0.7
> +PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).zip
> +PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cd/9c/7955895f5672ecc85270244582c6b53ff95bb4c24bf77bd9271d42351635
> +PYTHON_BROTLI_SETUP_TYPE = setuptools
> +PYTHON_BROTLI_LICENSE = Apache-2.0

Pypi is wrong: the license is MIT, not Apache-2.0 (just read the
LICENSE file to verify). I've fixed this and applied your patch to
next. You probably want to notify the python-brotli maintainers that
the license details regarding their package are incorrect on pypi.org.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
