From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: new package
In-Reply-To: <20191101080135.23413-1-james.hilliard1@gmail.com>
References: <20191101080135.23413-1-james.hilliard1@gmail.com>
Message-ID: <20200413225019.50c19a06@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Nov 2019 02:01:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +PYTHON_GREENLET_VERSION = 0.4.15
> +PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
> +PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7
> +PYTHON_GREENLET_SETUP_TYPE = distutils
> +PYTHON_GREENLET_LICENSE = MIT
> +PYTHON_GREENLET_LICENSE_FILES = LICENSE

The LICENSE file states that there are some parts under the PSF-2.0
license. So I've updated the LICENSE variable to include PSF-2.0, and
the LICENSE_FILES variable to include the LICENSE.PSF file.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
