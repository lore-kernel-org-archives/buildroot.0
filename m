From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:03:46 +0100
Subject: [Buildroot] [PATCH next v2 1/1] package/python-mako: New package
In-Reply-To: <1424460031-10626-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424460031-10626-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150221140346.2fcb9672@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 20 Feb 2015 20:20:31 +0100, Bernd Kuhls wrote:

> +PYTHON_MAKO_VERSION = 1.0.1
> +PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
> +PYTHON_MAKO_SITE = https://pypi.python.org/packages/source/M/Mako
> +PYTHON_MAKO_SETUP_TYPE = setuptools
> +PYTHON_MAKO_DEPENDENCIES = host-pkgconf

I had a look, and it wasn't really clear that this dependency was
needed.

So I've committed your package to the next branch, without this
dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
