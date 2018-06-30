From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:07:28 +0200
Subject: [Buildroot] [PATCH] raspberrypi3: post-image.sh update 64-bit
 option
In-Reply-To: <C163C8A5-70D5-4EE3-8177-4296770198D5@jtang.org>
References: <C163C8A5-70D5-4EE3-8177-4296770198D5@jtang.org>
Message-ID: <20180630220728.7a0765b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 15:14:25 -0400, J. Tang wrote:
> As per latest Raspberry Pi firmware documentation, the option
> 'arm_control' has been deprecated in favor of 'arm_64bit'.
> 
> Fixes #11111.
> 
> Signed-off-by: Jason Tang <tang@jtang.org>
> ---
>  board/raspberrypi/post-image.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
