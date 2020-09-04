From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:29:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 5.8
In-Reply-To: <20200830182318.4225-1-heiko.thiery@gmail.com>
References: <20200830182318.4225-1-heiko.thiery@gmail.com>
Message-ID: <20200904102958.292b8661@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Aug 2020 20:23:18 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Release notes: https://lwn.net/Articles/828044/
> 
> - remove patch that is in new version
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  .../0001-netlink-fix-build-warnings.patch     | 52 -------------------
>  package/ethtool/ethtool.hash                  |  2 +-
>  package/ethtool/ethtool.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 54 deletions(-)
>  delete mode 100644 package/ethtool/0001-netlink-fix-build-warnings.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
