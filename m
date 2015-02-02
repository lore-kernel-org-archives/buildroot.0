From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:29:26 +0100
Subject: [Buildroot] [PATCH 1/1] board/beaglebone: fix kernel load
 command in u-boot environment file
In-Reply-To: <1422860881-5188-1-git-send-email-vsergeev@gmail.com>
References: <1422860881-5188-1-git-send-email-vsergeev@gmail.com>
Message-ID: <20150202092926.41e8492a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vanya Sergeev,

On Sun,  1 Feb 2015 23:08:01 -0800, Vanya Sergeev wrote:
> the loaduimage command was renamed to loadimage when the default kernel
> image changed from uImage to zImage in u-boot commit e3cf9692053a, which
> made it into the v2013.10 u-boot release that the beaglebone_defconfig
> currently builds.
> 
> Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
