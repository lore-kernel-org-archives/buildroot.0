From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 14:41:53 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.60
In-Reply-To: <20201214121703.1189147-1-giulio.benetti@benettiengineering.com>
References: <20201214121703.1189147-1-giulio.benetti@benettiengineering.com>
Message-ID: <20201231144153.3ae1fbf5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Dec 2020 13:17:03 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version to 3.60 and remove local patch that has been upstreamed.
> 
> Release Notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.60_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/0001-fix-old-abi-ppc.patch | 40 -----------------------
>  package/libnss/libnss.hash                |  4 +--
>  package/libnss/libnss.mk                  |  2 +-
>  3 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 package/libnss/0001-fix-old-abi-ppc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
