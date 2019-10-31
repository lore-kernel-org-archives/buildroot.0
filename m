From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:06:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: fix build on musl
In-Reply-To: <20191031164624.17499-1-fontaine.fabrice@gmail.com>
References: <20191031164624.17499-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031220655.4031dc47@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 31 Oct 2019 17:46:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9c67acf77fdcebab1e50d6c1b42475efcedec82d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._poll-h-to-fix-build-failure-on-musl.patch | 798 ++++++++++++++++++
>  ...ns-about-glibc-being-only-libc-imple.patch |  27 +
>  ...e-configure-test-for-struct-timespec.patch |  48 ++
>  ...finition-of-ALLPERMS-and-ACCESSPERMS.patch |  61 ++
>  ...-test-for-feature-instead-of-platfor.patch | 150 ++++
>  ...onfigure-test-for-sys-stat.h-include.patch |  28 +
>  6 files changed, 1112 insertions(+)
>  create mode 100644 package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
>  create mode 100644 package/openvmtools/0004-Remove-assumptions-about-glibc-being-only-libc-imple.patch
>  create mode 100644 package/openvmtools/0005-Use-configure-test-for-struct-timespec.patch
>  create mode 100644 package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
>  create mode 100644 package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
>  create mode 100644 package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch

Applied to master, thanks. However, while you submitted patch 0003
(your own patch), there are no details about the upstreaming status for
the other patches that come from OpenEmbedded. Could you make sure
these have been submitted upstream, and if not, submit them ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
