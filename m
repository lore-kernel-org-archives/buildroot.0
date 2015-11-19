From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:16:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] chrony: bump to version 2.2
In-Reply-To: <1447882595-6228-1-git-send-email-james.knight@rockwellcollins.com>
References: <1447882595-6228-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151119221601.427a7fed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Wed, 18 Nov 2015 16:36:35 -0500, James Knight wrote:

> -CHRONY_CONF_OPTS = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
> +CHRONY_CONF_OPTS = \
> +    --host-system=Linux \
> +    --host-machine=$(BR2_ARCH) \
> +    --prefix=/usr \
> +    --without-seccomp \
> +    --without-tomcrypt

These lines should have been indented with a tab.

I've fixed that up and applied your patch to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
