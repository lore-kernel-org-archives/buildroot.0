From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:12:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
In-Reply-To: <20180610101415.20349-1-bernd.kuhls@t-online.de>
References: <20180610101415.20349-1-bernd.kuhls@t-online.de>
Message-ID: <20180610141220.336c8703@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 12:14:15 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
>  package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. However, for bumps from a random Git commit
to another random Git commit, it would be good to indicate what was the
motivation for the bump. Indeed, if we start bumping every day packages
that are fetched from Git based on a commit ID, we will have gazillions
of bump patches :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
