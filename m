From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:06:25 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: bump to version 1.1.0
In-Reply-To: <20180502200457.25434-1-fontaine.fabrice@gmail.com>
References: <20180502200457.25434-1-fontaine.fabrice@gmail.com>
Message-ID: <20180503220625.23b6493d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 22:04:57 +0200, Fabrice Fontaine wrote:
> - Remove patches (already in version)
> - Add patch for getrandom (sent upstream:
>   https://github.com/smuellerDD/libkcapi/pull/56)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-getrandom-call-in-kcapi-rng.c.patch   |  31 +++++
>  ...1-Have-sufficient-memory-size-for-message.patch |  31 -----
>  .../0002-Do-not-compile-unused-functions.patch     |  35 ------
>  ...0003-Unify-code-to-read-from-seed-sources.patch | 132 ---------------------
>  ...4-internal.h-make-inline-functions-static.patch | 103 ----------------
>  package/libkcapi/libkcapi.hash                     |   5 +-
>  package/libkcapi/libkcapi.mk                       |   2 +-
>  7 files changed, 36 insertions(+), 303 deletions(-)
>  create mode 100644 package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch
>  delete mode 100644 package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
>  delete mode 100644 package/libkcapi/0002-Do-not-compile-unused-functions.patch
>  delete mode 100644 package/libkcapi/0003-Unify-code-to-read-from-seed-sources.patch
>  delete mode 100644 package/libkcapi/0004-internal.h-make-inline-functions-static.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
