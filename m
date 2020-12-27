From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Dec 2020 10:09:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.4.6
In-Reply-To: <20201223202608.3051064-1-fontaine.fabrice@gmail.com>
References: <20201223202608.3051064-1-fontaine.fabrice@gmail.com>
Message-ID: <20201227100934.6c9c8317@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Dec 2020 21:26:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - pkg-config can be used to retrieve dependencies since
>   https://projects.vdr-developer.org/git/vdr.git/commit?id=f5dba03447fa73da6e181ead7fb98c2b0a2fed41
>   so use it and drop unneeded workarounds such as VDR_INCLUDE_DIRS
> - Update indentation in hash file (two spaces)
> 
> https://projects.vdr-developer.org/git/vdr.git/tree/HISTORY?id=V20406
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vdr/0001-libjpeg.patch                | 40 -------------------
>  ...ility-with-current-versions-of-glibc.patch | 27 -------------
>  package/vdr/vdr.hash                          |  8 ++--
>  package/vdr/vdr.mk                            |  8 ++--
>  4 files changed, 7 insertions(+), 76 deletions(-)
>  delete mode 100644 package/vdr/0001-libjpeg.patch
>  delete mode 100644 package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
