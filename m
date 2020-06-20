From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:51:55 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.53.1
In-Reply-To: <20200619000147.86253-1-giulio.benetti@benettiengineering.com>
References: <20200619000147.86253-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200620215155.7c17bde0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 02:01:47 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version to 3.53.1 and add a patch from upstream[1] to fix build
> failure.
> 
> Release notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.53.1_release_notes
> 
> [1]:
> https://hg.mozilla.org/projects/nss/rev/e955ece90b050e9da67528f09648945156d2bcea
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...d-infinite-recursion-when-CHECKLOC-i.patch | 30 +++++++++++++++++++
>  package/libnss/libnss.hash                    |  4 +--
>  package/libnss/libnss.mk                      |  2 +-
>  3 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 package/libnss/0002-Bug-1642153-Avoid-infinite-recursion-when-CHECKLOC-i.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
