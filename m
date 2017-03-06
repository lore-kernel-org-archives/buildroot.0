From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:22:25 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <1488803273-25019-1-git-send-email-festevam@gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
Message-ID: <20170306212225.0819a97b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 09:27:53 -0300, Fabio Estevam wrote:
> As announced by Rob Clark at:
> https://lists.freedesktop.org/archives/mesa-dev/2017-February/145745.html
> 
> , the kmscube repository has been moved from github to freedesktop.org,
> so change it to the new location.
> 
> With the newest code the local patch for adding imx-drm support
> is no longer needed.
> 
> Also, on imx6q we need to explicitily pass the card device now:
> 
> # kmscube -D /dev/dri/card1
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/kmscube/0001-addimxdrm.patch | 27 ---------------------------
>  package/kmscube/kmscube.hash         |  2 +-
>  package/kmscube/kmscube.mk           |  4 ++--
>  3 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100644 package/kmscube/0001-addimxdrm.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
