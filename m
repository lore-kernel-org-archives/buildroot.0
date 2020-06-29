From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:10:07 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/cups-filters: fix
 cups-browsed service
In-Reply-To: <20200624204347.797088-2-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-2-angelo@amarulasolutions.com>
Message-ID: <20200629231007.1c277c9c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Jun 2020 22:43:41 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> cups-browsed service is compiled and installed by the package,
> but the corresponding services file were not installed for
> systemv and systemd.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I've applied, after tweaking a bit the commit title and commit log, as
well as after replacing --with-rcdir=no by --without-rcdir, as we use
the --without-XYZ in Buildroot in general.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
