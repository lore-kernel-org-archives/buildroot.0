From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 21:47:02 +0100
Subject: [Buildroot] [PATCH 1/1] python-schedule: new package
In-Reply-To: <20171106182823.28656-1-joseph.kogut@gmail.com>
References: <20171106182823.28656-1-joseph.kogut@gmail.com>
Message-ID: <20171106214702.01d10bf1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Nov 2017 10:28:23 -0800, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-schedule/Config.in            |  6 ++++++
>  package/python-schedule/python-schedule.hash |  5 +++++
>  package/python-schedule/python-schedule.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-schedule/Config.in
>  create mode 100644 package/python-schedule/python-schedule.hash
>  create mode 100644 package/python-schedule/python-schedule.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c651bf26fa..7f6f2a276b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -789,6 +789,7 @@ F:	configs/qemu_ppc64le_pseries_defconfig
>  
>  N:	Joseph Kogut <joseph.kogut@gmail.com>
>  F:	package/python-websockets/
> +F:	package/python-schedule/

Minor nit: alphabetic ordering.

No need to send an updated version just for this, we can fixup when
applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
