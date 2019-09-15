From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:05:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump version to 2.4
In-Reply-To: <20190904185022.399-1-bernd.kuhls@t-online.de>
References: <20190904185022.399-1-bernd.kuhls@t-online.de>
Message-ID: <20190915230514.1ba5541e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 20:50:22 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added license hash.
> 
> vnstat as of version 2.0 requires sqlite:
> https://github.com/vergoh/vnstat/commit/bb24d7bd0f5e9051872f88a98f8b7906b4959aa7
> 
> Added --disable-extra-paths to _CONF_OPTS to prevent build error:
> https://github.com/vergoh/vnstat/commit/fffc15d877edf37ff42ab057e1f30c70e6e99314
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vnstat/Config.in   | 1 +
>  package/vnstat/vnstat.hash | 3 ++-
>  package/vnstat/vnstat.mk   | 9 +++++----
>  3 files changed, 8 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
