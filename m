From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:58:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libcap-ng: bump to version
 0.7.11
In-Reply-To: <20200829204514.2892410-1-fontaine.fabrice@gmail.com>
References: <20200829204514.2892410-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829225800.32b6ccaa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:45:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version) and so autoreconf
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Fix-compilation-without-pthread.h.patch | 47 -------------------
>  package/libcap-ng/libcap-ng.hash              |  6 +--
>  package/libcap-ng/libcap-ng.mk                |  4 +-
>  3 files changed, 4 insertions(+), 53 deletions(-)
>  delete mode 100644 package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
