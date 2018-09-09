From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:21:06 +0200
Subject: [Buildroot] [PATCH 1/1] lsscsi: bump to version 0.30
In-Reply-To: <20180909115848.4014-1-fontaine.fabrice@gmail.com>
References: <20180909115848.4014-1-fontaine.fabrice@gmail.com>
Message-ID: <20180909152106.7b2dadf2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 13:58:48 +0200, Fabrice Fontaine wrote:
> - Add hash for license file
> - Fix build with glibc 2.28: <sys/sysmacros.h> is no longer included
>   from <sys/types.h>, and therefore <sys/sysmacros.h> must be included
>   explicitly when major()/minor() are used
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60ec736ec524dcffedcef8f92d98aa29fb8987aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lsscsi/lsscsi.hash | 3 ++-
>  package/lsscsi/lsscsi.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
