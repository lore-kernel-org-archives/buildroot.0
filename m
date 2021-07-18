From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:39:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/apitrace: bump to version 10.0
In-Reply-To: <20210717145037.1005480-1-fontaine.fabrice@gmail.com>
References: <20210717145037.1005480-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718233923.772a9763@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 16:50:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - C++17 and gcc >= 7 is required since
>   https://github.com/apitrace/apitrace/commit/37c36e66b8cfa534797ca565c22e8c30923f35d4
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-dlsym-Fix-build-under-uClibc.patch   |  31 ------
>  ...t-libc-that-don-t-have-RTLD_DEEPBIND.patch |  25 -----
>  ...eLists.txt-respect-BUILD_TESTING-OFF.patch | 104 ------------------
>  package/apitrace/Config.in                    |   6 +-
>  package/apitrace/apitrace.hash                |   4 +-
>  package/apitrace/apitrace.mk                  |   2 +-
>  6 files changed, 6 insertions(+), 166 deletions(-)
>  delete mode 100644 package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
>  delete mode 100644 package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch
>  delete mode 100644 package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
