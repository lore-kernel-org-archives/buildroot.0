From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 15:45:46 +0100
Subject: [Buildroot] [PATCH v2 1/2] python-libconfig: new package
In-Reply-To: <1393941501.23823.14.camel@kuuclt18625l>
References: <1393941501.23823.14.camel@kuuclt18625l>
Message-ID: <20140304154546.147e7937@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Derycke, Johan,

On Tue, 4 Mar 2014 13:58:10 +0000, Derycke, Johan wrote:
> v2
> -Fixed indentations and blank lines
> -added package/Config.in

The changelog should not be part of the commit log itself. See
http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog.

> +PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
> +PYTHON_LIBCONFIG_SITE = $(call github,cnangel,python-libconfig,
> $(PYTHON_LIBCONFIG_VERSION))

Your patch is line-wrapped. Can you use "git send-email" to ensure
patches don't get line-wrapped by your e-mail client?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
