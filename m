From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 21:45:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.1.35
In-Reply-To: <20180818152707.18186-1-bernd.kuhls@t-online.de>
References: <20180818152707.18186-1-bernd.kuhls@t-online.de>
Message-ID: <20180818214533.613b6e99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 17:27:07 +0200, Bernd Kuhls wrote:
> Fixes CVE-2018-3064, CVE-2018-3063, CVE-2018-3058 & CVE-2018-3066:
> https://mariadb.com/kb/en/library/mariadb-10135-release-notes/
> 
> Added all hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mariadb/mariadb.hash | 7 +++++--
>  package/mariadb/mariadb.mk   | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
