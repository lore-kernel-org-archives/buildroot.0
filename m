From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:52:53 +0100
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.24
In-Reply-To: <20191204112546.29507-1-giulio.benetti@benettiengineering.com>
References: <20191204112546.29507-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191205225253.7d04dd68@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 12:25:46 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> All patches have been upstreamed so remove them.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnspr/0001-nios2.patch      | 76 -------------------------
>  package/libnspr/0002-microblaze.patch | 81 ---------------------------
>  package/libnspr/0003-nds32.patch      | 73 ------------------------
>  package/libnspr/libnspr.hash          |  2 +-
>  package/libnspr/libnspr.mk            |  2 +-
>  5 files changed, 2 insertions(+), 232 deletions(-)
>  delete mode 100644 package/libnspr/0001-nios2.patch
>  delete mode 100644 package/libnspr/0002-microblaze.patch
>  delete mode 100644 package/libnspr/0003-nds32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
