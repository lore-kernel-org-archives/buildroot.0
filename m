From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 12:44:09 +0100
Subject: [Buildroot] [PATCH 5/6] package/genpart: new host-only package
In-Reply-To: <bfe10d7db2c24538af439516e719f4e1c98eba5b.1362693294.git.yann.morin.1998@free.fr>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <bfe10d7db2c24538af439516e719f4e1c98eba5b.1362693294.git.yann.morin.1998@free.fr>
Message-ID: <20130310124409.1a4d33a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 22:55:30 +0100, Yann E. MORIN wrote:

> --- /dev/null
> +++ b/package/genpart/genpart.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# genpart
> +#
> +#############################################################
> +
> +GENPART_VERSION       = 1.0.2
> +GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
> +GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/

There's no license at all mentioned in the source code. It's true the
code is pretty trivial, but anyway. Maybe you could add:

GENPART_LICENSE = Currently being decided by authors

And contact the Pengutronix people to get your patches merged and ask
them to put a proper license in there.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
