From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:37:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcms2: fix static building with
 tiff
In-Reply-To: <20210212200006.2394292-1-fontaine.fabrice@gmail.com>
References: <20210212200006.2394292-1-fontaine.fabrice@gmail.com>
Message-ID: <20210213223725.37da74ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2021 21:00:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Strangely enough, we have only one build failure on the autobuilder even
> if lcms2 never used pkg-config to retrieve static dependencies of tiff
> (which also depends on xz since 2016)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/07c5ca780bcdbfcd7cad6502345f1553ce17bdc3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...gure.ac-fix-static-linking-with-tiff.patch | 37 +++++++++++++++++++
>  package/lcms2/lcms2.mk                        |  4 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
