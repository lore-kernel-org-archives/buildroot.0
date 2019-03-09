From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:47:07 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/ncmpc: fix build with
 gcc 5"
In-Reply-To: <20190309144242.32654-1-fontaine.fabrice@gmail.com>
References: <20190309144242.32654-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309214707.1ee7101e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 15:42:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 56c476db99b764c6a1f64a64e0295e96f8a4612f.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...TagListPage.cxx-fix-build-with-gcc-5.patch | 39 -------------------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 package/ncmpc/0002-src-TagListPage.cxx-fix-build-with-gcc-5.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
