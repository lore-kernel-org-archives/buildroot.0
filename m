From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:48:42 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.16.1
In-Reply-To: <e53a8182bb77e84d2d406289a1fe7652a019e28a.1528200636.git.baruch@tkos.co.il>
References: <e53a8182bb77e84d2d406289a1fe7652a019e28a.1528200636.git.baruch@tkos.co.il>
Message-ID: <20180605184842.5e538b2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 15:10:36 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0003-btrfs.static-needs-libbtrfsutil.patch | 39 -------------------
>  package/btrfs-progs/btrfs-progs.hash          |  2 +-
>  package/btrfs-progs/btrfs-progs.mk            |  2 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
