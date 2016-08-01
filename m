From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 23:37:25 +0200
Subject: [Buildroot] [PATCH] util-linux: use upstream patch to fix
 uClibc build issue
In-Reply-To: <20160731160852.GA5227@waldemar-brodkorb.de>
References: <20160731160852.GA5227@waldemar-brodkorb.de>
Message-ID: <20160801233725.2b169430@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 18:08:52 +0200, Waldemar Brodkorb wrote:
> Upstream has this patch a while and other projects are using
> it already. So better switch to this.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
>  .../0001-Fix-libmount-build-under-uClibc.patch     | 153 ---------------------
>  .../0001-build-sys-fix-uClibc-ng-scanf-check.patch |  34 +++++
>  package/util-linux/util-linux.mk                   |   2 +-
>  3 files changed, 35 insertions(+), 154 deletions(-)
>  delete mode 100644 package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
>  create mode 100644 package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
