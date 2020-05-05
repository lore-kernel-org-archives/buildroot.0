From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 May 2020 23:05:39 +0200
Subject: [Buildroot] [PATCH v2] package/libnss: bump version to 3.52
In-Reply-To: <20200504151036.122311-1-giulio.benetti@benettiengineering.com>
References: <20200504151036.122311-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200505230539.47012d8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 17:10:36 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version to 3.52 and drop all patches since they've all been
> upstreamed.
> 
> Release notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.52_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * improve commit log
> ---
>  ...troduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch | 132 ------------------
>  ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch |  30 ----
>  package/libnss/libnss.hash                    |   4 +-
>  package/libnss/libnss.mk                      |   2 +-
>  4 files changed, 3 insertions(+), 165 deletions(-)
>  delete mode 100644 package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
>  delete mode 100644 package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
