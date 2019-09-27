From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:02:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add option to enable
 server support
In-Reply-To: <20190925121726.17454-1-heiko.thiery@gmail.com>
References: <20190925121726.17454-1-heiko.thiery@gmail.com>
Message-ID: <20190927230212.2ed06bd6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Wed, 25 Sep 2019 14:17:26 +0200
heiko.thiery at gmail.com wrote:

> +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER),y)
> +    LIBSSH_CONF_OPTS += -DWITH_SERVER=ON
> +else
> +    LIBSSH_CONF_OPTS += -DWITH_SERVER=OFF

We don't indent such lines in our coding style, as can be seen in the
rest of the file. I have fixed this and applied your patch to Buildroot
master branch.

Just curious, what is the use case for the server support in libssh ?
The INSTALL file is not very clear about what WITH_SERVER=ON provides.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
