From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:14:21 +0200
Subject: [Buildroot] [PATCH 3/4] package/spandsp: new package
In-Reply-To: <20181003131358.28002-3-bernd.kuhls@t-online.de>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
 <20181003131358.28002-3-bernd.kuhls@t-online.de>
Message-ID: <20181009151421.396cb25a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 15:13:57 +0200, Bernd Kuhls wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> [Bernd:
>  - bumped version to 20180108
>  - removed 0001-fix-msse4.x.patch, applied upstream
>  - removed autoreconf after patch removal
>  - added license hash (Arnout)
>  - added SPDX license codes (Arnout)]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in            |  1 +
>  package/spandsp/Config.in    |  9 +++++++++
>  package/spandsp/spandsp.hash |  3 +++
>  package/spandsp/spandsp.mk   | 27 +++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/spandsp/Config.in
>  create mode 100644 package/spandsp/spandsp.hash
>  create mode 100644 package/spandsp/spandsp.mk

I am wondering why a signal processing library for telephony needs the
TIFF library, but OK, it seems to be the case. I've applied, after
adding the missing entry to the DEVELOPERS file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
