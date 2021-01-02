From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 17:38:07 +0100
Subject: [Buildroot] [PATCH] configs/nitrogen8m*: new uboot requires
 host ssl
In-Reply-To: <20210102162927.377498-1-gary.bisson@boundarydevices.com>
References: <20210102162927.377498-1-gary.bisson@boundarydevices.com>
Message-ID: <20210102173807.26b0fd7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 Jan 2021 17:29:27 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Fixes: 8f75e63ec4 ("configs/nitrogen*: bump u-boot to version 2020.10")
> https://gitlab.com/buildroot.org/buildroot/-/jobs/938922366
> https://gitlab.com/buildroot.org/buildroot/-/jobs/938922367
> https://gitlab.com/buildroot.org/buildroot/-/jobs/938922368
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen8m_defconfig  | 1 +
>  configs/nitrogen8mm_defconfig | 1 +
>  configs/nitrogen8mn_defconfig | 1 +
>  3 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
