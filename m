From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:38:00 +0100
Subject: [Buildroot] [PATCH v3] package/libnfs: bump to version 3.0.0
In-Reply-To: <20181105171141.3814-1-joerg.krause@embedded.rocks>
References: <20181105171141.3814-1-joerg.krause@embedded.rocks>
Message-ID: <20181129223800.239c22d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Nov 2018 18:11:41 +0100, J?rg Krause wrote:
> Also add an patch from upstream to fix building libnfs with the musl C
> library. This issue was introduced upstream between version 2.0.0 and
> version 3.0.0.
> 
> Note, that upstreams commit message says it fixes a warning. However, as
> musl is more strictly regarding missing headers it actually fixes the
> build with musl.
> 
> Furthermore, the COPYING license file was changed in the way that it now
> includes a clarification about the .x files being distributed under the
> simplified BSD license. We already note in LIBNFS_LICENSE that the .x
> files are BSD-2-Clause. So, updating the hash for this license file is
> enough.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2 -> v3:
>  - improve commit log regardings updating the hash of COPYING (Thomas)
> v1 -> v2:
>  - fix hash of license file COPYING
> ---
>  ...-libnfs.c-include-time.h-in-libnfs.c.patch | 35 +++++++++++++++++++
>  package/libnfs/libnfs.hash                    |  4 +--
>  package/libnfs/libnfs.mk                      |  2 +-
>  3 files changed, 38 insertions(+), 3 deletions(-)
>  create mode 100644 package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
