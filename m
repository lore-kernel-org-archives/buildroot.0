From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 13:55:59 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mutt: bump to version
 1.12.1
In-Reply-To: <20190815113214.25018-1-fontaine.fabrice@gmail.com>
References: <20190815113214.25018-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815135559.78ac2882@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 13:32:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove both patches (already in version) and drop AUTORECONF
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-static-build-with-idn2-and-unistrin.patch | 37 --------------
>  ...Fix-unistring-library-configure-test.patch | 49 -------------------
>  package/mutt/mutt.hash                        |  2 +-
>  package/mutt/mutt.mk                          |  4 +-
>  4 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch
>  delete mode 100644 package/mutt/0002-Fix-unistring-library-configure-test.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
