From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:59:10 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump kernel used for the RPi
In-Reply-To: <1407181598-15423-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407181598-15423-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140806195910.44ebdcdb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon,  4 Aug 2014 21:46:38 +0200, Bernd Kuhls wrote:
> The rpi-3.12.y branch has now been merged with the 3.12.26 upstream.
> 
> Bump kernel headers used for the toolchain at the same time.
> 
> Fixes
> http://jenkins.free-electrons.com/job/buildroot/config=raspberrypi_defconfig/320/console
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  configs/raspberrypi_defconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
