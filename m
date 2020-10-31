From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:44:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.15.1
In-Reply-To: <20201028154220.648052-1-egorenar@linux.ibm.com>
References: <20201028154220.648052-1-egorenar@linux.ibm.com>
Message-ID: <20201031234430.5d7ec716@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Oct 2020 16:42:20 +0100
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  .../0001-zipl-boot-disable-SSP.patch          | 28 -------------------
>  .../0002-genprotimg-boot-disable-SSP.patch    | 28 -------------------
>  package/s390-tools/s390-tools.hash            |  2 +-
>  package/s390-tools/s390-tools.mk              |  2 +-
>  4 files changed, 2 insertions(+), 58 deletions(-)
>  delete mode 100644 package/s390-tools/0001-zipl-boot-disable-SSP.patch
>  delete mode 100644 package/s390-tools/0002-genprotimg-boot-disable-SSP.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
