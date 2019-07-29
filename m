From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:10:56 +0200
Subject: [Buildroot] [PATCH v2] package/mtd: bump to 2.1.1
In-Reply-To: <20190722225745.2743-1-matthew.weber@rockwellcollins.com>
References: <20190722225745.2743-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190729091056.4845185b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jul 2019 17:57:45 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Removes 0001-mkfs.ubifs-fix-build-without-openssl.patch which has been
> merged upsteam as b5027be5f470830ac9543db3c52e076b13abd313.
> 
> Release Notes:
> https://www.spinics.net/lists/linux-mtd/msg08093.html
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> Changes
> v1 -> v2
>  - Added hash file update missed in first patch
> ---
>  ...mkfs.ubifs-fix-build-without-openssl.patch | 38 -------------------
>  package/mtd/mtd.hash                          |  4 +-
>  package/mtd/mtd.mk                            |  2 +-
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
