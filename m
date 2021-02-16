From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 21:05:40 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/lcms2: fix static
 building with tiff"
In-Reply-To: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
References: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
Message-ID: <20210216210540.2bb03689@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Feb 2021 18:28:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 7e4f054d2347708c9e22fe84c1d5f374d5b343cd.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...gure.ac-fix-static-linking-with-tiff.patch | 37 -------------------
>  package/lcms2/lcms2.mk                        |  4 +-
>  2 files changed, 1 insertion(+), 40 deletions(-)
>  delete mode 100644 package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
