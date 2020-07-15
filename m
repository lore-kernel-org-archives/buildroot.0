From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 21:30:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix license
In-Reply-To: <20200715190438.16497-1-fontaine.fabrice@gmail.com>
References: <20200715190438.16497-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715213055.407fac8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:04:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5a393677314dfdaa6a4bd6a847b642ae54517538 forgot to update
> license which has been changed from COPYING to LICENSE.GPL2 and
> LICENSE.LGPL2.1 since version 4.0.0 and
> https://github.com/lxc/lxc/commit/cc73685dd09315b292968ee91a08a8f295376b35
> 
> It should be noted that COPYING describes GPLv3 for an unknown reason

Has this been reported upstream ?

>  LXC_VERSION = 4.0.3
>  LXC_SITE = https://linuxcontainers.org/downloads/lxc
> -LXC_LICENSE = LGPL-2.1+
> -LXC_LICENSE_FILES = COPYING
> +LXC_LICENSE = GPL-2.0, LGPL-2.1+

Do we have some details about what is under GPL, what is under LGPL ?

Is it GPL-2.0, or GPL-2.0+ ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
