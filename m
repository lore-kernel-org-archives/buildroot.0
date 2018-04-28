From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:09:22 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.30
In-Reply-To: <20180428203314.GA24480@waldemar-brodkorb.de>
References: <20180428203314.GA24480@waldemar-brodkorb.de>
Message-ID: <20180428230922.1d2f789b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 22:33:14 +0200, Waldemar Brodkorb wrote:
> Patches are upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...0001-utils-fix-compile-of-msgfmt-msgmerge.patch | 48 ----------------------
>  ...dd-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch | 36 ----------------
>  package/uclibc/uclibc.hash                         |  2 +-
>  package/uclibc/uclibc.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch
>  delete mode 100644 package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
