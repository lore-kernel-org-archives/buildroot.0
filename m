From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:18:39 +0200
Subject: [Buildroot] [PATCH 1/4] linux kernel: bump default to version
 4.7
In-Reply-To: <1469404570-19495-1-git-send-email-festevam@gmail.com>
References: <1469404570-19495-1-git-send-email-festevam@gmail.com>
Message-ID: <20160725221839.6b64ef24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 20:56:07 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  linux/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, I've applied after changing the prefix from "linux kernel:" to
just "linux:" since "linux" is the name of the Buildroot package this
change applies to.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
