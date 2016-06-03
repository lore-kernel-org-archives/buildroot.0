From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:51:15 +0200
Subject: [Buildroot] [PATCH] imx53loco: Fix post-image.sh permission
In-Reply-To: <1464906172-6285-1-git-send-email-festevam@gmail.com>
References: <1464906172-6285-1-git-send-email-festevam@gmail.com>
Message-ID: <20160603095115.01c6f12c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 19:22:52 -0300, Fabio Estevam wrote:
> Fix post-image.sh permission to avoid the following error:
> 
> >>>   Executing post-image script board/freescale/imx53loco/post-image.sh  
> /bin/bash: board/freescale/imx53loco/post-image.sh: Permission denied
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx53loco/post-image.sh | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 board/freescale/imx53loco/post-image.sh

Applied to master, thanks. Interestingly, patchwork didn't capture this
patch, because it was only a change of permission.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
