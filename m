From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 12:41:58 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <40cdfc7c804704b95c963d3c76852e6d2b82de31.1362693294.git.yann.morin.1998@free.fr>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <40cdfc7c804704b95c963d3c76852e6d2b82de31.1362693294.git.yann.morin.1998@free.fr>
Message-ID: <20130310124158.65520084@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 22:55:29 +0100, Yann E. MORIN wrote:

> +GENIMAGE_VERSION        = 4
> +GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
> +GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
> +GENIMAGE_DEPENDENCIES   = libconfuse

Even though it is a host package, we could add:

GENIMAGE_LICENSE = GPLv2

Unfortunately, there is no license file.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
