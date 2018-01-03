From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:54:58 +0100
Subject: [Buildroot] [PATCH 00/16] imx: update packages to
 4.9.x_1.0.0_ga release
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103215458.629888e2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:26 +0100, Gary Bisson wrote:

> Here's some update on pretty much all the i.MX-related packages.
> 
> Mainly:
> - Switch to 4.9-based kernel
> - Graphics driver updated accordingly
>   -> g2d and apitrace now in separate packages
>   -> apitrace package not included in this series  
> - Switch freescale.com repositories to codeaurora
> - Switch NXPMicro repositories to codeaurora
> 
> Since G2D libraries now have their own package (preparation for i.MX8
> which uses the DPU for G2D operation) gst1-imx needed to match the new
> package name. Right now it is in its own commit but let me know if you
> prefer having it squashed with the 'g2d new package' commit.

Thanks for this update! I made a few comments on some of the patches.
Could you take them into account and resend the entire series ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
