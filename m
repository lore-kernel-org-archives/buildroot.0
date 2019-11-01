From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Nov 2019 11:39:40 +0100
Subject: [Buildroot] [PATCH] package/systemd: bump to v243-78
In-Reply-To: <20191101085746.18330-1-jeremy.rosen@smile.fr>
References: <20191101085746.18330-1-jeremy.rosen@smile.fr>
Message-ID: <20191101113940.141c074f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my,

On Fri,  1 Nov 2019 09:57:46 +0100
J?r?my Rosen <jeremy.rosen@smile.fr> wrote:

> -SYSTEMD_VERSION = 243
> -SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
> +SYSTEMD_VERSION = v243-78-gef677436aa
> +SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))

You added a leading "v" in the _VERSION variable, but it was already
encoded in the _SITE variable. So I dropped it again from _VERSION and
applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
