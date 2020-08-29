From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:14:14 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libcap: bump to version
 2.42
In-Reply-To: <20200829205731.2899225-1-fontaine.fabrice@gmail.com>
References: <20200829205731.2899225-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829231414.67d8b344@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:57:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version:
>   https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=22f2e207f7824d231aab4de973e547f006e3ea3c)
> - Drop second patch (already in version:
>   https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=786b64b72b5ba3d4b6195f40c0096932d2c72b57)
> - Drop third patch (not needed since
>   https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit?id=f1c3ac995d02d4f17b9d15656ab6d58f4c87435a)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...d-system-fixes-for-cross-compilation.patch | 53 -------------------
>  ...tall-into-install-shared-install-sta.patch | 48 -----------------
>  ....c-fix-build-with-old-kernel-headers.patch | 51 ------------------
>  package/libcap/libcap.hash                    |  4 +-
>  package/libcap/libcap.mk                      |  2 +-
>  5 files changed, 3 insertions(+), 155 deletions(-)
>  delete mode 100644 package/libcap/0001-build-system-fixes-for-cross-compilation.patch
>  delete mode 100644 package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
>  delete mode 100644 package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
