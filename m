From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:24:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/wine: bump version to 5.12
In-Reply-To: <20200713202758.14081-1-heiko.thiery@gmail.com>
References: <20200713202758.14081-1-heiko.thiery@gmail.com>
Message-ID: <20200714102442.18cee446@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 22:27:58 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> -WINE_VERSION = 5.0
> +WINE_VERSION = 5.12

How big is the jump from 5.0 to 5.12 in terms of Wine changes? Is it as
simple as doing this version bump, or do we need to adjust the package
to accommodate for new options/dependencies ?

It'd be good to have some feedback from Andr? on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
