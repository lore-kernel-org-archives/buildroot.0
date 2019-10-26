From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:21:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump version to 1.9.6
In-Reply-To: <20191026083109.9067-1-bernd.kuhls@t-online.de>
References: <20191026083109.9067-1-bernd.kuhls@t-online.de>
Message-ID: <20191026152144.7f952217@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 10:31:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch which was applied upstream:
> https://github.com/royhills/arp-scan/commit/cbeda6a9c5e154fd5e5d56e3e6e6bdc5ddd2b088
> 
> We still need autoreconf however due to using source code retrieved by
> the github helper.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...nking-to-detect-stack-protector-supp.patch | 39 -------------------
>  package/arp-scan/arp-scan.hash                |  2 +-
>  package/arp-scan/arp-scan.mk                  |  4 +-
>  3 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
