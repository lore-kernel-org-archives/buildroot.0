From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:26:05 +0100
Subject: [Buildroot] [PATCH] package/minicom: bump version to latest
In-Reply-To: <20200312231200.64017-1-giulio.benetti@benettiengineering.com>
References: <20200312231200.64017-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200314152605.132f2fe7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Mar 2020 00:12:00 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop patch since it's replaced by upstream commit:
> https://salsa.debian.org/minicom-team/minicom/-/commit/23292150e07ec264827fb6cf237ddb0ac9fc043b
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...0001-fix-static-linking-with-ncurses.patch | 745 ------------------
>  package/minicom/minicom.hash                  |   2 +-
>  package/minicom/minicom.mk                    |   2 +-
>  3 files changed, 2 insertions(+), 747 deletions(-)
>  delete mode 100644 package/minicom/0001-fix-static-linking-with-ncurses.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
