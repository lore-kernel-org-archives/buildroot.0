From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:00:25 +0100
Subject: [Buildroot] [PATCH] postgresql: security bump to version 11.1
In-Reply-To: <20181108195442.31413-1-peter@korsgaard.com>
References: <20181108195442.31413-1-peter@korsgaard.com>
Message-ID: <20181108210025.5ec4d750@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Nov 2018 20:54:42 +0100, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2018-16850: SQL injection in pg_upgrade and pg_dump, via CREATE TRIGGER
> ...  REFERENCING
> 
> For more details, see the advisory:
> 
> https://www.postgresql.org/about/news/1905/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/postgresql/postgresql.hash | 8 ++++----
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
