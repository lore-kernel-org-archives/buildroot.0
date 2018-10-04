From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 15:30:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix header version
 dependency for Vulkan Intel driver
In-Reply-To: <20181003083426.25992-1-bernd.kuhls@t-online.de>
References: <20181003083426.25992-1-bernd.kuhls@t-online.de>
Message-ID: <20181004153016.5e2de79f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 10:34:26 +0200, Bernd Kuhls wrote:
> memfd.h was included in kernel 3.17, not 3.18.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
