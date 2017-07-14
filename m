From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 00:08:52 +0200
Subject: [Buildroot] [PATCH 02/15] libwebsockets: support libressl
In-Reply-To: <20170714181537.17479-2-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
 <20170714181537.17479-2-aduskett@gmail.com>
Message-ID: <20170715000852.6a2f8105@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 14:15:24 -0400, Adam Duskett wrote:

> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +LIBWEBSOCKETS_DEPENDENCIES += libressl host-openssl
> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON

I'm wondering: do we want to mix using libressl on the target, and
openssl on the host?

I don't necessarily see a big problem with this, but I'm just
wondering, since it might be a bit confusing.

Arnout, what do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
