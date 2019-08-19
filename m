From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 15:38:33 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/gauche: bump to version
 0.9.8
In-Reply-To: <20190818101226.13205-1-fontaine.fabrice@gmail.com>
References: <20190818101226.13205-1-fontaine.fabrice@gmail.com>
Message-ID: <20190819153833.1a43ad5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Aug 2019 12:12:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove second, third and fourth patches (already in version)
> - Update first patch and sent it upstream
> - Add AUTORECONF=YES to avoid patching configure in first patch
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gauche/0001-fix-so-suffix.patch       | 43 ++++++-------
>  ...d-check-for-NO_GETCONTEXT-definition.patch | 62 -------------------
>  ...-version.h-build-error-uClibc-x86-_6.patch | 46 --------------
>  package/gauche/0004-rfc-needs-srfi.patch      | 35 -----------
>  package/gauche/gauche.hash                    |  7 ++-
>  package/gauche/gauche.mk                      |  4 +-
>  6 files changed, 29 insertions(+), 168 deletions(-)
>  delete mode 100644 package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
>  delete mode 100644 package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch
>  delete mode 100644 package/gauche/0004-rfc-needs-srfi.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
