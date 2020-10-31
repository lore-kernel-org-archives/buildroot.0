From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:20:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: bump to version
 1.6.1
In-Reply-To: <20201031162010.232026-1-fontaine.fabrice@gmail.com>
References: <20201031162010.232026-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031222036.7f147a98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 17:20:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...btac-lib-magic.c-fix-build-on-uclibc.patch |  52 --
>  .../0002-Drop-u_char-and-u_short.patch        | 653 ------------------
>  ...0003-Fix-unused-parameters-with-musl.patch |  52 --
>  ...build-failure-when-time_t-is-64-bits.patch |  80 ---
>  ...failure-of-OpenSSL-RAND_pseudo_bytes.patch | 146 ----
>  package/libpam-tacplus/libpam-tacplus.hash    |   4 +-
>  package/libpam-tacplus/libpam-tacplus.mk      |   5 +-
>  7 files changed, 3 insertions(+), 989 deletions(-)
>  delete mode 100644 package/libpam-tacplus/0001-libtac-lib-magic.c-fix-build-on-uclibc.patch
>  delete mode 100644 package/libpam-tacplus/0002-Drop-u_char-and-u_short.patch
>  delete mode 100644 package/libpam-tacplus/0003-Fix-unused-parameters-with-musl.patch
>  delete mode 100644 package/libpam-tacplus/0004-fix-build-failure-when-time_t-is-64-bits.patch
>  delete mode 100644 package/libpam-tacplus/0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
