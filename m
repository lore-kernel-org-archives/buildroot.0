From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 09:12:22 +0100
Subject: [Buildroot] [RFC,
 PATCH 4/8] package/powerpc-utils: Add powerpc hardware utilities
In-Reply-To: <1389862338.918857.878477328980.4.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.918857.878477328980.4.gpush@pablo>
Message-ID: <20140129091222.713ed46f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

Hey, thanks for posting this! Nice to see that our short discussion at
LCA after your talk was useful :-)

On Thu, 16 Jan 2014 16:52:18 +0800, Jeremy Kerr wrote:

> diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
> new file mode 100644
> index 00000000..15deb2e9
> --- /dev/null
> +++ b/package/powerpc-utils/powerpc-utils.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# powerpc-utils
> +#
> +#############################################################
> +
> +POWERPC_UTILS_VERSION = aeb32757
> +POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
> +POWERPC_UTILS_AUTORECONF = YES
> +POWERPC_UTILS_DEPENDENCIES = zlib

In addition to the comments that were made by others, it would be good
to add POWERPC_UTILS_LICENSE and POWERPC_UTILS_LICENSE_FILES.

> +POWERPC_UTILS_CONF_OPT += --without-librtas

Nitpick: a = is sufficient here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
