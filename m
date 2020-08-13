From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:45:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/18xx-ti-utils: fix build with
 gcc 10
In-Reply-To: <20200813213247.526099-1-fontaine.fabrice@gmail.com>
References: <20200813213247.526099-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813234540.7c00993f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 23:32:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/df2d04de4b2e5003f3fc56c9e84db5054bd4d499
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-plt.h-fix-build-with-gcc-10.patch    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
