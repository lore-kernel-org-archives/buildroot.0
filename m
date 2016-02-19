From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:14:04 +0100
Subject: [Buildroot] [PATCH v4 1/2] python-cryptography: new package
In-Reply-To: <1454922262-14230-1-git-send-email-yegorslists@googlemail.com>
References: <1454922262-14230-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160219231404.4161439c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Mon,  8 Feb 2016 10:04:21 +0100, yegorslists at googlemail.com wrote:

> +PYTHON_CRYPTOGRAPHY_VERSION = 1.2.2
> +PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> +PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
> +PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
> +PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0, BSD-3c

As explained in the LICENSE file, the license is Apache-2.0 or BSD-3c,
not both.

> +PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE.APACHE LICENSE.BSD

And therefore I added the LICENSE file here.

Applied to next with those two changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
