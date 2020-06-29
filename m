From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:18:28 +0200
Subject: [Buildroot] [PATCH 2/4] package/poco: bump to version 1.10.1
In-Reply-To: <20200629210735.179913-2-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200629210735.179913-2-juju@cotds.org>
Message-ID: <20200629231828.2222716b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 23:07:33 +0200
Julien Olivain <juju@cotds.org> wrote:

> +Subject: [PATCH 1/3] poco: add the staging path to search path

Please generate patches with "git format-patch -N" to not have the 1/3,
2/3, 3/3 part. "make check-package" normally warns about this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
