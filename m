From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 22:36:19 +0100
Subject: [Buildroot] [PATCH v2 4/4] cog: new package
In-Reply-To: <20190205204152.10376-5-francois.perrad@gadz.org>
References: <20190205204152.10376-1-francois.perrad@gadz.org>
 <20190205204152.10376-5-francois.perrad@gadz.org>
Message-ID: <20190211223619.58c65df3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 21:41:52 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff --git a/package/cog/Config.in b/package/cog/Config.in
> new file mode 100644
> index 000000000..4aee4ac91
> --- /dev/null
> +++ b/package/cog/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_COG
> +	bool "cog"
> +	depends on BR2_PACKAGE_WPEWEBKIT
> +	select BR2_PACKAGE_DBUS

I added the "depends on" of dbus here (even if they are implied by the
depends on wpewebkit), and added the corresponding Config.in comments.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
