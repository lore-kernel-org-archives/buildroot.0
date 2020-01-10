From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:34:04 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/zxing-cpp: replace ZXING_CPP_MAKE_OPTS workaround
In-Reply-To: <20200109223915.3719988-1-fontaine.fabrice@gmail.com>
References: <20200109223915.3719988-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110223404.35d98a90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Jan 2020 23:39:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Bumping to version e0e40dd in commit
> ad9c5bbfa7ee355b9f6120358cde08ae866537ac included the following upstream
> commit:
> https://github.com/glassechidna/zxing-cpp/commit/4e2b4fe1668c60d73e7649b0d3d5888912878392
> 
> This commit contains CMake improvements and especially a new
> BUILD_TESTING option that disable the testrunner compile, use this
> instead of the ZXING_CPP_MAKE_OPTS workaround.
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Update commit title and message to fix version and drop C++11

Thanks, both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
