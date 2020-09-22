From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:24:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 0.11.0
In-Reply-To: <20200921213143.57319-1-fontaine.fabrice@gmail.com>
References: <20200921213143.57319-1-fontaine.fabrice@gmail.com>
Message-ID: <20200922212429.1e4ff977@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 23:31:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Retrieve sha512 from upstream
> - Drop first patch (not needed since
>   https://github.com/apache/logging-log4cxx/commit/33ca357ea075fabf74d50b2a2c8420ae39a8b453)
> - Drop second patch (already in version:
>   https://github.com/apache/logging-log4cxx/commit/1f6bf7e11963849f44e65ed32eb8e2fea35e2065)
> - Drop third patch (already in version:
>   https://github.com/apache/logging-log4cxx/commit/0319bfa7f64048efeff954e4c5da055711b28ce4)
> - Drop fourth patch (already in version:
>   https://github.com/apache/logging-log4cxx/commit/3d96b34921913aed39b61b7c617bda285889887c)
> - Drop fifth patch (not needed since
>   https://github.com/apache/logging-log4cxx/commit/d6776be8f280914982c4f0d6ad979607e91fb89a)
> - Add LOG4CXX_AUTORECONF = YES as running the bundled configure fails
>   during the build step on:
>   configure.ac:47: error: required file './compile' not found
>   configure.ac:47:   'automake --add-missing' can install 'compile'
> 
> https://logging.apache.org/log4cxx/latest_stable/changes-report.html#a0.11.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cxx/0001-charset-fixes.patch      |  43 -----
>  package/log4cxx/0002-missing-includes.patch   |  44 -----
>  package/log4cxx/0003-missing-includes.patch   |  21 --
>  ...r-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch | 180 ------------------
>  ...fix-narrowing-conversion-compile-err.patch |  36 ----
>  package/log4cxx/log4cxx.hash                  |   4 +-
>  package/log4cxx/log4cxx.mk                    |   4 +-
>  7 files changed, 5 insertions(+), 327 deletions(-)
>  delete mode 100644 package/log4cxx/0001-charset-fixes.patch
>  delete mode 100644 package/log4cxx/0002-missing-includes.patch
>  delete mode 100644 package/log4cxx/0003-missing-includes.patch
>  delete mode 100644 package/log4cxx/0004-Applied-patch-for-LOGCXX-400-LOGCXX-404-LOGCXX-402-L.patch
>  delete mode 100644 package/log4cxx/0005-domtestcase.cpp-fix-narrowing-conversion-compile-err.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
