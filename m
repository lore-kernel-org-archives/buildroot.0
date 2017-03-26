From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 10:05:47 +0200
Subject: [Buildroot] [PATCH 1/2] xenomai: bump version to 3.0.3
In-Reply-To: <20170321165137.23527-2-sikor6@gmail.com>
References: <187459> <20170321165137.23527-1-sikor6@gmail.com>
 <20170321165137.23527-2-sikor6@gmail.com>
Message-ID: <20170326100547.2ce52b7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 17:51:37 +0100, Pawel Sikora wrote:
> Bump Xenomai version to 3.0.3,
> Remove patch 0001-bfin-remove-inline-keyword.patch for version 2.6.4,
> as it is already included in upstream
> 
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> ---
>  .../xenomai/0001-bfin-remove-inline-keyword.patch  | 62 ----------------------
>  package/xenomai/xenomai.hash                       |  2 +-
>  package/xenomai/xenomai.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 64 deletions(-)
>  delete mode 100644 package/xenomai/0001-bfin-remove-inline-keyword.patch

This wasn't building properly with gcc 6.x, so I've added a patch to
fix this, and then applied.

At some point, it would be nice to support the "Mercury" variant of
Xenomai 3, but that can be done through additional patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
