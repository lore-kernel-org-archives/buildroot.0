From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:45:51 +0200
Subject: [Buildroot] [PATCH 1/1] xfsprogs: bump to version 4.18.0
In-Reply-To: <20180916180713.16504-1-fontaine.fabrice@gmail.com>
References: <20180916180713.16504-1-fontaine.fabrice@gmail.com>
Message-ID: <20180922184551.297846cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Sep 2018 20:07:13 +0200, Fabrice Fontaine wrote:
> - Update second patch because crc32 moved from libxfs to libfrog:
>   https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=973de649842b6f96db32e5060b62e8fbcc05f033
> - Update XFSPROGS_LICENSE_FILES because doc/COPYING has been replaced by
>   LICENSES/GPL-2.0 and LICENSES/LGPL-2.1, see:
>   https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=959ef98176005b1aa69619dd76b1d46cf112dfc4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-libxfs-do-not-try-to-run-the-crc32selftest.patch | 8 +++++---
>  package/xfsprogs/xfsprogs.hash                            | 7 +++++--
>  package/xfsprogs/xfsprogs.mk                              | 4 ++--
>  3 files changed, 12 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
