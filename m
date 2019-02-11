From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 13:07:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: bump version to
 2.4.0
In-Reply-To: <20190210100313.19591-1-bernd.kuhls@t-online.de>
References: <20190210100313.19591-1-bernd.kuhls@t-online.de>
Message-ID: <20190211130743.6607a22a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Feb 2019 11:03:13 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch 0002, applied upstream.
> Follow upstream switch of release tarball to bz2 and new location.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-KJSL-fix-up-C99-issue.patch          | 120 ------------------
>  package/libva-utils/libva-utils.hash          |   4 +-
>  package/libva-utils/libva-utils.mk            |   5 +-
>  3 files changed, 5 insertions(+), 124 deletions(-)
>  delete mode 100644 package/libva-utils/0002-KJSL-fix-up-C99-issue.patch

This bump breaks the build quite badly:
http://autobuild.buildroot.net/?reason=libva-utils-2.4.0. Could you
have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
