From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:42:09 +0100
Subject: [Buildroot] [PATCH v3 2/2] Added keepalived
In-Reply-To: <1486672636-20750-2-git-send-email-apalos@gmail.com>
References: <1486672636-20750-1-git-send-email-apalos@gmail.com>
 <1486672636-20750-2-git-send-email-apalos@gmail.com>
Message-ID: <20170209214209.5f28f345@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 22:37:16 +0200, Ilias Apalodimas wrote:
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
> ---
>  package/ipset/ipset.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
> index db4952b..bb40fee 100644
> --- a/package/ipset/ipset.mk
> +++ b/package/ipset/ipset.mk
> @@ -13,5 +13,6 @@ IPSET_CONF_OPTS = --with-kmod=no
>  IPSET_AUTORECONF = YES
>  IPSET_LICENSE = GPLv2
>  IPSET_LICENSE_FILES = COPYING
> +IPSET_INSTALL_STAGING = YES

Why? ipset installs some libraries used by other packages?

In any case, this shouldn't be a separate commit, it should be part of
the commit adding the keepalived package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
