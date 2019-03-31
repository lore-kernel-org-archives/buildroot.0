From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:15:25 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2019.78
In-Reply-To: <20190331160356.29392-1-francois.perrad@gadz.org>
References: <20190331160356.29392-1-francois.perrad@gadz.org>
Message-ID: <20190331211525.2119cdf3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 18:03:56 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...here-TTY-modes-weren-t-reset-for-cli.patch | 56 -------------------
>  package/dropbear/dropbear.hash                |  2 +-
>  package/dropbear/dropbear.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 58 deletions(-)
>  delete mode 100644 package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
