From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:59:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.4.0
In-Reply-To: <20190330144350.26730-1-fontaine.fabrice@gmail.com>
References: <20190330144350.26730-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331135930.414543bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 15:43:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add a dependency to glibc for execinfo.h and drop first patch (as it
>   was useful only for uclibc)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vdr/0001-getloadavg.patch             | 55 -------------------
>  ...{0002-libjpeg.patch => 0001-libjpeg.patch} |  0
>  package/vdr/Config.in                         |  6 +-
>  package/vdr/vdr.hash                          |  7 ++-
>  package/vdr/vdr.mk                            |  4 +-
>  5 files changed, 9 insertions(+), 63 deletions(-)
>  delete mode 100644 package/vdr/0001-getloadavg.patch
>  rename package/vdr/{0002-libjpeg.patch => 0001-libjpeg.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
