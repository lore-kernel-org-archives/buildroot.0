From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:44:35 +0100
Subject: [Buildroot] [PATCH v3] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <20181126193746.32026-1-alexander.sverdlin@gmail.com>
References: <20181126193746.32026-1-alexander.sverdlin@gmail.com>
Message-ID: <20181130094435.5a6d43a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Nov 2018 20:37:46 +0100, Alexander Sverdlin wrote:
> This will save 1700K on target filesystem (as tested on ARM, i686).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v3:
> - removed redundant empty HOST_LIBTOOL_CONF_OPTS
> - dual HOST_LIBTOOL_LICENSE from Yann&Arnout
> v2:
> - rework target libtool instead of new package/libltdl
>  package/libtool/libtool.mk | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
