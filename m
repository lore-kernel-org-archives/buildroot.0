From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:31:19 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone: Add missing
 genimage.cfg file
In-Reply-To: <1465307881-2101-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465307881-2101-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160607213119.68803e48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 10:58:01 -0300, Ezequiel Garcia wrote:
> Commit 7d0b7d3c27a6 ("configs/beaglebone: Use genimage
> to produce the SD card image") introduce genimage usage,
> but forgot to add the genimage config file. Fix it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  board/beaglebone/genimage.cfg | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 board/beaglebone/genimage.cfg

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
