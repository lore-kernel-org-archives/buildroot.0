From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:55:21 +0200
Subject: [Buildroot] [PATCH] pandaboard: remove use of gcc 4.6.x
In-Reply-To: <1405607022-18746-1-git-send-email-vincent.stehle@laposte.net>
References: <1405607022-18746-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20140717205521.3a1b8ddf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Thu, 17 Jul 2014 16:23:42 +0200, Vincent Stehl? wrote:
> Gcc 4.6.x is legacy now; remove version specification from the config file to
> repair the build.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> ---
>  configs/pandaboard_defconfig | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
