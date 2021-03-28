From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:46:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/sofia-sip: bump version to
 1.13.3
In-Reply-To: <20210326190856.704217-1-bernd.kuhls@t-online.de>
References: <20210326190856.704217-1-bernd.kuhls@t-online.de>
Message-ID: <20210328224629.67a3524e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Mar 2021 20:08:55 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches which were applied upstream:
> https://github.com/freeswitch/sofia-sip/commit/f6f29b483e9c31ce8d3e87419ec3deea8679312d
> https://github.com/freeswitch/sofia-sip/commit/d568475eb7291bc72f585a116319b05d80b818e1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...reintroduce-soatag_local_sdp_str_ref.patch | 30 ---------------
>  .../0002-sofia-sip-fix-s2tcase.c.patch        | 38 -------------------
>  package/sofia-sip/sofia-sip.hash              |  2 +-
>  package/sofia-sip/sofia-sip.mk                |  2 +-
>  4 files changed, 2 insertions(+), 70 deletions(-)
>  delete mode 100644 package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
>  delete mode 100644 package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
