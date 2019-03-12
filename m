From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:04:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version
 0.09.55
In-Reply-To: <20190309202432.24124-1-fontaine.fabrice@gmail.com>
References: <20190309202432.24124-1-fontaine.fabrice@gmail.com>
Message-ID: <20190312230432.32d61a12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 21:24:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop three patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ress-ng.h-fix-include-on-semaphore.h.patch | 34 -------------------
>  ...2-stress-stackmmap-needs-swapcontext.patch | 29 ----------------
>  ...bsd-wchar-Explicitly-include-stdio.h.patch | 29 ----------------
>  package/stress-ng/stress-ng.hash              |  2 +-
>  package/stress-ng/stress-ng.mk                |  2 +-
>  5 files changed, 2 insertions(+), 94 deletions(-)
>  delete mode 100644 package/stress-ng/0001-stress-ng.h-fix-include-on-semaphore.h.patch
>  delete mode 100644 package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch
>  delete mode 100644 package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
