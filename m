From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:21:23 +0200
Subject: [Buildroot] [PATCH v2] package/harfbuzz: bump to version 2.6.8
In-Reply-To: <20200910132613.1881110-1-francois.perrad@gadz.org>
References: <20200910132613.1881110-1-francois.perrad@gadz.org>
Message-ID: <20200912142123.778d9f32@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 15:26:13 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> - update home page URL (old one is redirected to github)
> - change download to new location (github)
> - update license hash because of copyright year update:
> diff COPING:
> -Copyright ? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019  Google, Inc.
> -Copyright ? 2019  Facebook, Inc.
> +Copyright ? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020  Google, Inc.
> +Copyright ? 2018,2019,2020  Ebrahim Byagowi
> +Copyright ? 2019,2020  Facebook, Inc.
> 
> note: newer versions (2.7.x) require a migration to meson
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/harfbuzz/Config.in     | 2 +-
>  package/harfbuzz/harfbuzz.hash | 6 ++----
>  package/harfbuzz/harfbuzz.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
