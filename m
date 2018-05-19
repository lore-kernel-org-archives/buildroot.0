From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:06:47 +0200
Subject: [Buildroot] [PATCH] libopusenc: new package
In-Reply-To: <20180517183824.16742-1-joerg.krause@embedded.rocks>
References: <20180517183824.16742-1-joerg.krause@embedded.rocks>
Message-ID: <20180519140647.7217eb26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 May 2018 20:38:24 +0200, J?rg Krause wrote:

> diff --git a/package/libopusenc/Config.in b/package/libopusenc/Config.in
> new file mode 100644
> index 0000000000..610aba926e
> --- /dev/null
> +++ b/package/libopusenc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBOPUSENC
> +	bool "libopusenc"

You forgot a "select BR2_PACKAGE_OPUS" here.

So I've added that and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
