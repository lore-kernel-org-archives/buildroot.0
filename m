From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 23:12:28 +0100
Subject: [Buildroot] [PATCH] package/postgresql: bump to version 11.2
In-Reply-To: <20190217171908.30080-1-peter@korsgaard.com>
References: <20190217171908.30080-1-peter@korsgaard.com>
Message-ID: <20190218231228.3a6988cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Feb 2019 18:19:07 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes a long standing fsync issue and a number of other bugs:
> https://www.postgresql.org/docs/11/release-11-2.html
> 
> https://wiki.postgresql.org/wiki/Fsync_Errors
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/postgresql/postgresql.hash | 10 +++++-----
>  package/postgresql/postgresql.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master after adding in the commit log an explanation about
the change in the license file hash. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
