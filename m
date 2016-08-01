From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:23:42 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.17
In-Reply-To: <20160801121429.GA24576@waldemar-brodkorb.de>
References: <20160801121429.GA24576@waldemar-brodkorb.de>
Message-ID: <20160801222342.7e71b431@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Aug 2016 14:14:30 +0200, Waldemar Brodkorb wrote:
> Many cleanups and ARC improvements including PIE support.
> Patches included upstream and removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
>  package/uclibc/0001-bfin-allow-to-build-ldd.patch  | 29 ---------
>  ...issing-Linux-extension-headers-for-poll.h.patch | 71 ----------------------
>  package/uclibc/uclibc.hash                         |  2 +-
>  package/uclibc/uclibc.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 102 deletions(-)
>  delete mode 100644 package/uclibc/0001-bfin-allow-to-build-ldd.patch
>  delete mode 100644 package/uclibc/0002-include-missing-Linux-extension-headers-for-poll.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
