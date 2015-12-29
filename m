From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 12:20:10 +0100
Subject: [Buildroot] [PATCH v3] Fixing xdriver_xf86-video-ati
 dependencies
In-Reply-To: <1450965468-22030-1-git-send-email-ltrimas@synopsys.com>
References: <1450965468-22030-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20151229122010.3b8529de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Thu, 24 Dec 2015 16:57:48 +0300, Lada Trimasova wrote:
> This package depends on the radeon driver from libdrm and depends on
> DRI support in xserver_xorg-server, to achieve this we select the
> Radeon mesa3d DRI driver.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9da/9da4ffdf1c4ec78ae37322e253cb769340116035
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes v2 -> v3:
>  - Libdrm dependencies on libpthread-stubs were propagated.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
