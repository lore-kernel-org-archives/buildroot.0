From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:45:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.30.0
In-Reply-To: <20191006092231.26063-1-bernd.kuhls@t-online.de>
References: <20191006092231.26063-1-bernd.kuhls@t-online.de>
Message-ID: <20191007214548.564ef404@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 11:22:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.sqlite.org/releaselog/3_30_0.html
> 
> Changed Config.in option from stat3 to stat4
> https://www.sqlite.org/compile.html#enable_stat3
> "This option used to cause the ANALYZE command to collect index
>  histogram data in the sqlite_stat3 table. But that functionality was
>  superceded by SQLITE_ENABLE_STAT4 as of SQLite version 3.8.1
>  (2013-10-17). The SQLITE_ENABLE_STAT3 compile-time option continued to
>  be supported through version 3.29.0 (2019-07-10) but has now become a
>  no-op."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy           | 6 ++++++
>  package/sqlite/Config.in   | 4 ++--
>  package/sqlite/sqlite.hash | 4 ++--
>  package/sqlite/sqlite.mk   | 6 +++---
>  4 files changed, 13 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
