From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:44:25 +0200
Subject: [Buildroot] [PATCH] python-u-msgpack: new package
In-Reply-To: <1462520243-1315-1-git-send-email-yegorslists@googlemail.com>
References: <1462520243-1315-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160609104425.5a9ccb3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 09:37:23 +0200, yegorslists at googlemail.com wrote:

> +PYTHON_U_MSGPACK_VERSION = 2.1
> +PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
> +PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/b7/8d/791f037a0954f98a8eceb09c7c14babb97db0a81c985108bb21939b801eb
> +PYTHON_U_MSGPACK_SETUP_TYPE = distutils
> +PYTHON_U_MSGPACK_LICENSE = MIT

I've added umsgpack.py as a license file. Yes it's a bit annoying to
have basically the entire source as a license file, but it's better
than nothing. If you could suggest upstream to add a LICENSE file, it
would be even better.

Patch applied with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
