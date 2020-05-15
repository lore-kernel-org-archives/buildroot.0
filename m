From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:08:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: bump to version
 1.0.3
In-Reply-To: <20200513032859.18478-1-james.hilliard1@gmail.com>
References: <20200513032859.18478-1-james.hilliard1@gmail.com>
Message-ID: <20200515220825.7e6bfe73@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 May 2020 21:28:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches that are now upstream.
> 
> We don't need to autoreconf since we are using a release tarball.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...rogs-add-missing-include-sys-types.h.patch |  49 ------
>  ...PRIu64-PRIx64-to-printf-64-bit-types.patch | 144 ------------------
>  ...k-fix-node-may-be-used-uninitialized.patch |  63 --------
>  .../0004-fsck-Zero-init-using-memset.patch    |  37 -----
>  package/exfatprogs/exfatprogs.hash            |   2 +-
>  package/exfatprogs/exfatprogs.mk              |   5 +-
>  6 files changed, 3 insertions(+), 297 deletions(-)
>  delete mode 100644 package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
>  delete mode 100644 package/exfatprogs/0002-mkfs-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
>  delete mode 100644 package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch
>  delete mode 100644 package/exfatprogs/0004-fsck-Zero-init-using-memset.patch

We normally don't take version bumps in master, but I looked through
the changes between 1.0.2 and 1.0.3 and all of them are fixes, and this
patch allows to drop a number of patches. So, I've applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
