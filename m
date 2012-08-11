From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 23:00:25 +0200
Subject: [Buildroot] [PATCH 1/2] python-meld3: new package
In-Reply-To: <1344669126-28921-2-git-send-email-net147@gmail.com>
References: <1344669126-28921-1-git-send-email-net147@gmail.com>
 <1344669126-28921-2-git-send-email-net147@gmail.com>
Message-ID: <20120811230025.70cd10e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 11 Aug 2012 17:12:05 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> +config BR2_PACKAGE_PYTHON_MELD3
> +    bool "python-meld3"
> +    depends on BR2_PACKAGE_PYTHON
> +    help
> +      A HTML/XML templating system.
> +
> +      https://github.com/supervisor/meld3

Indentation was incorrect here, and the 'select' on PYEXPAT was missing.

> +PYTHON_MELD3_VERSION = 0.6.8
> +PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
> +PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3/
> +PYTHON_MELD3_DEPENDENCIES = python

Would be good to add license informations now for all new packages.

I've fixed those and committed to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
