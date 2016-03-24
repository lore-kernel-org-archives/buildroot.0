From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:52:09 +0100
Subject: [Buildroot] [PATCH] icu: bump to version 57.1
In-Reply-To: <1458770031-12475-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458770031-12475-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160324225209.49721579@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 18:53:51 -0300, Gustavo Zacarias wrote:
> 0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch is
> upstream so drop it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...llocating-memory-for-pkgDataFlags.-compil.patch | 34 ----------------------
>  package/icu/icu.hash                               |  6 ++--
>  package/icu/icu.mk                                 |  2 +-
>  3 files changed, 4 insertions(+), 38 deletions(-)
>  delete mode 100644 package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
