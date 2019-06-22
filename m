From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 07:46:49 +0200
Subject: [Buildroot] [PATCH] package/util-linux: bump to version 2.34
In-Reply-To: <20190621014232.9282-1-unixmania@gmail.com>
References: <20190621014232.9282-1-unixmania@gmail.com>
Message-ID: <20190622074649.27df8177@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Thu, 20 Jun 2019 22:42:32 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> - Remove patches already applied upstream.
> - Update file hash.
> - Add an option to select the new "hardlink" command (off by defaul)
> - hardlink uses libpcre2-8 if pcre2 is detected at config time so add a
>   build dependency on pcre2, if it's selected.
> - Change selections to reflect that libblkid now does not depend on
>   libuuid anymore
> 
> Full release notes available at
> 
>   https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.34/v2.34-ReleaseNotes
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Thanks, I have applied, after doing one change. See below.

> +config BR2_PACKAGE_UTIL_LINUX_HARDLINK
> +	bool "hardlink"
> +	help
> +	  Query or set the hardware clock (RTC)

Repeat after me: "copy/paste is bad", "copy/paste is bad" :-)

I fixed that up to a more appropriate description of hardlink :)

Thanks a lot for taking care of this version bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
