From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:11:53 +0100
Subject: [Buildroot] [PATCH] boards/raspberrypi: update dt kernel sha1
In-Reply-To: <1423623973-19872-1-git-send-email-fhunleth@troodon-software.com>
References: <1423623973-19872-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150214101153.6435fb29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue, 10 Feb 2015 22:06:13 -0500, Frank Hunleth wrote:
> The sha1 used for the DT enabled kernel is no longer available
> (presumably, the rpi-3.18.y branch was rebased recently.) This updates
> it to the lastest sha1 in the rpi-3.18.y branch.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  configs/raspberrypi_dt_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
