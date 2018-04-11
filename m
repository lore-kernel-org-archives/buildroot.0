From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 16:18:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
In-Reply-To: <20180410190936.19222-1-bernd.kuhls@t-online.de>
References: <20180410190936.19222-1-bernd.kuhls@t-online.de>
Message-ID: <20180411161829.59d93bad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 21:09:36 +0200, Bernd Kuhls wrote:
> Removed DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES, not needed anymore
> after upstream commit
> https://git.linuxtv.org/dtv-scan-tables.git/commit/?id=9481e7c283d3bad69a0440b26a75ab0d16ccdf68
> 
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dtv-scan-tables/dtv-scan-tables.hash |  4 +++-
>  package/dtv-scan-tables/dtv-scan-tables.mk   | 11 +----------
>  2 files changed, 4 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
