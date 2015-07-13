From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:10:49 +0200
Subject: [Buildroot] [PATCH v2] configs: add altera_socdk_defconfig for
 Altera Cyclone 5 Development Board
In-Reply-To: <1436738431-16791-1-git-send-email-arnout@mind.be>
References: <1399342751-7799-1-git-send-email-cdhmanning@gmail.com>
 <1436738431-16791-1-git-send-email-arnout@mind.be>
Message-ID: <20150713021049.34cdf6ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 00:00:31 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Charles Manning <cdhmanning@gmail.com>
> 
> This is largely the same as altera_sockit_defconfig.
> 
> It uses a fresher Linux and u-boot than SocKit. It also speeds the
> serial port up to 115200.
> 
> The post-image script is generalized by adding
> BR2_ROOTFS_POST_SCRIPT_ARGS and moving it up the altera directory.
> Similarly, the readme is moved up and made more generic.
> 
> Signed-off-by: Charles Manning <cdhmanning@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: [Arnout] refactored with sockit, renamed to socdk (both are
>     cyclone5 so that name was not distinguishing).

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
