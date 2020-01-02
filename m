From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:24:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/librsync: fix static link with
 popt
In-Reply-To: <20200101175316.2524581-1-fontaine.fabrice@gmail.com>
References: <20200101175316.2524581-1-fontaine.fabrice@gmail.com>
Message-ID: <20200102092427.3f0beac2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jan 2020 18:53:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to retrieve popt dependencies such as iconv
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/896e8e3efbedad90d66ae8c4e1e50f16206cab49
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...FindPOPT.cmake-Add-PkgConfig-support.patch | 67 +++++++++++++++++++
>  package/librsync/librsync.mk                  |  2 +-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 package/librsync/0002-cmake-FindPOPT.cmake-Add-PkgConfig-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
