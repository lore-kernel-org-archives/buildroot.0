From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 30 Aug 2019 11:50:29 -0700
Subject: [Buildroot] [PATCH] package/rrdtool: bump to version 1.7.2
In-Reply-To: <20190830184512.28329-1-chrismcc@gmail.com>
References: <20190830184512.28329-1-chrismcc@gmail.com>
Message-ID: <CALURroSwDOCDYTd80Bs__Sbtz+zVr8EWo2UHRUyKNJa4T-3PFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

D'oh , should be

Update hash for license file (update in year and address)


On Fri, Aug 30, 2019 at 11:45 AM Christopher McCrory <chrismcc@gmail.com>
wrote:

> Add hash for license file.
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/rrdtool/rrdtool.hash | 8 ++++----
>  package/rrdtool/rrdtool.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
> index 6640673440..efdcd14f6f 100644
> --- a/package/rrdtool/rrdtool.hash
> +++ b/package/rrdtool/rrdtool.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated sha256
> -sha256 f97d348935b91780f2cd80399719e20c0b91f0a23537c0a85f9ff306d4c5526b
>       rrdtool-1.7.0.tar.gz
> -sha256 884385795ee48cd820082e8823bc748cd20574112da2cc7d2ef505b47b1058c3
>       COPYRIGHT
> -sha256 14079d501f3092405a192463603f66e13da88fc5894981e2962e2e6aec4ab178
>       LICENSE
> +# Locally calculated
> +sha256 a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db
> rrdtool-1.7.2.tar.gz
> +sha256 ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320
> COPYRIGHT
> +sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388
> LICENSE
> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
> index 144bbcfb18..2731b7b39d 100644
> --- a/package/rrdtool/rrdtool.mk
> +++ b/package/rrdtool/rrdtool.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -RRDTOOL_VERSION = 1.7.0
> +RRDTOOL_VERSION = 1.7.2
>  RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
>  RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in
> COPYRIGHT
>  RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
> --
> 2.20.1
>
>

-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190830/b580154c/attachment.html>
