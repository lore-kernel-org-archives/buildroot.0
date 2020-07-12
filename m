From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:07:36 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.54
In-Reply-To: <20200702160500.3374986-1-giulio.benetti@benettiengineering.com>
References: <20200702160500.3374986-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200712230736.6aec89bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jul 2020 18:05:00 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version to 3.54 and remove 0002[1] and 0003[2] local patches that
> has been upstreamed.
> 
> Release Notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.54_release_notes
> 
> [1]: https://hg.mozilla.org/projects/nss/rev/e955ece90b050e9da67528f09648945156d2bcea
> [2]: https://hg.mozilla.org/projects/nss/rev/f46fca8ced7fca6aa6de60e3170b2a3b6b2df565
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...d-infinite-recursion-when-CHECKLOC-i.patch | 30 -----------
>  ...-seed.o-back-into-freeblpriv3.-r-bbe.patch | 50 -------------------
>  package/libnss/libnss.hash                    |  4 +-
>  package/libnss/libnss.mk                      |  2 +-
>  4 files changed, 3 insertions(+), 83 deletions(-)
>  delete mode 100644 package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch
>  delete mode 100644 package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
