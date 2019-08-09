From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:06:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 11.5
In-Reply-To: <20190809155941.26206-1-bernd.kuhls@t-online.de>
References: <20190809155941.26206-1-bernd.kuhls@t-online.de>
Message-ID: <20190809220658.5113a18f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 17:59:41 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.postgresql.org/about/news/1960/
> 
> Switch POSTGRESQL_SITE to https.
> 
> Fixes CVE-2019-10208, CVE-2019-10209, CVE-2019-10210 & CVE-2019-10211.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 8 ++++----
>  package/postgresql/postgresql.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
