From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jun 2017 21:14:02 +0200
Subject: [Buildroot] [PATCH] glmark2: Bump to the latest version
In-Reply-To: <1498224490-13161-1-git-send-email-festevam@gmail.com>
References: <1498224490-13161-1-git-send-email-festevam@gmail.com>
Message-ID: <20170623211402.2c274a8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Jun 2017 10:28:10 -0300, Fabio Estevam wrote:
> The two patches are no longer needed with the latest upstream version,
> so bump to the latest one.
> 
> Tested on imx6.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  ...NativeStateDRM-add-imx-drm-driver-support.patch | 25 -------------------
>  ...eStateDRM-use-fixed-event-context-version.patch | 28 ----------------------
>  package/glmark2/glmark2.hash                       |  2 +-
>  package/glmark2/glmark2.mk                         |  2 +-
>  4 files changed, 2 insertions(+), 55 deletions(-)
>  delete mode 100644 package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
>  delete mode 100644 package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
