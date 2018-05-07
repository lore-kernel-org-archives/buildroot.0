From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 17:45:25 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: fix build with static libcap and
 shared gnutls
In-Reply-To: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
References: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
Message-ID: <20180507174525.269b774e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 18:22:34 +0200, Fabrice Fontaine wrote:

> diff --git a/package/lxc/0001-Fix-compilation-with-static-libcap-and-shared-gnutls.patch b/package/lxc/0001-Fix-compilation-with-static-libcap-and-shared-gnutls.patch
> new file mode 100644
> index 0000000000..9a0dcbe55a
> --- /dev/null
> +++ b/package/lxc/0001-Fix-compilation-with-static-libcap-and-shared-gnutls.patch

There was already a 0001 patch, so I renumbered this one to 0002. I've
also added the upstream status. And applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
