From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 22:10:11 +0100
Subject: [Buildroot] [PATCH] zedboard: uboot: load env earlier
In-Reply-To: <1447418954-3350-1-git-send-email-gwenj@trabucayre.com>
References: <1447418954-3350-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151116221011.5fc9a09d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 13 Nov 2015 13:49:14 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> By default, with the original patch bootcmd runs sdboot before loading uEnv.txt.
> Consequently, if the user change modeboot, the user's defined content is updated
> too late.
> By loading uEnv.txt before 'run $modeboot' the correct boot mode is used instead
> of default mode.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  .../0001-zynq-Create-zedboard-specific-U-Boot-environment.patch    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
