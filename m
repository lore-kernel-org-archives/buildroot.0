From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 19:23:34 +0100
Subject: [Buildroot] [PATCH v4 3/4] beaglebone: update to latest U-Boot
In-Reply-To: <1392021600-32293-4-git-send-email-anders@chargestorm.se>
References: <1392021600-32293-1-git-send-email-anders@chargestorm.se>
 <1392021600-32293-4-git-send-email-anders@chargestorm.se>
Message-ID: <20140210192334.3bf8c906@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Mon, 10 Feb 2014 09:39:59 +0100, Anders Darander wrote:
> Update to the default version of U-Boot, at this time 2013.10.
> 
> Tested with an old uEnv.txt (i.e. using uImage) and with the
> currently prefered zImage.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  configs/beaglebone_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
