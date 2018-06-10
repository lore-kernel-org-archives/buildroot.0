From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 13:23:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/sqlite: bump version to 3.24.0
In-Reply-To: <20180610090442.23425-1-bernd.kuhls@t-online.de>
References: <20180610090442.23425-1-bernd.kuhls@t-online.de>
Message-ID: <20180610132300.2ecdafa1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 11:04:41 +0200, Bernd Kuhls wrote:
> Release notes:
> https://www.sqlite.org/releaselog/3_24_0.html
> https://www.sqlite.org/releaselog/3_23_1.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sqlite/sqlite.hash | 4 ++--
>  package/sqlite/sqlite.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied, thanks!

Unrelated, but could you have a look at
https://bugs.busybox.net/show_bug.cgi?id=11066 ? It's related to the
X.org init script you have contributed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
