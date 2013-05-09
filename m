From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 23:56:57 +0200
Subject: [Buildroot] [PATCH 2/4] Move firmware-imx and imx-lib to
 freescale-imx and refactor them
In-Reply-To: <1368121316-3645-3-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368121316-3645-3-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <20130509235657.2b5f1a77@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henk Fijnvandraat,

On Thu,  9 May 2013 19:41:54 +0200, Henk Fijnvandraat wrote:
> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
> ---
>  package/freescale-imx/firmware-imx/Config.in       |   13 +++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk |   38 ++++++++++++++
>  package/freescale-imx/imx-lib/Config.in            |   53 ++++++++++++++++++++
>  package/freescale-imx/imx-lib/imx-lib.mk           |   40 +++++++++++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 package/freescale-imx/firmware-imx/Config.in
>  create mode 100644 package/freescale-imx/firmware-imx/firmware-imx.mk
>  create mode 100644 package/freescale-imx/imx-lib/Config.in
>  create mode 100644 package/freescale-imx/imx-lib/imx-lib.mk

No. If you're moving a package from one directory to another, the
addition and removal should be done in the same patch. Thanks to git
format-patch -M, git will detect the move and will show it in the
generated patch.

See my suggestion to organize the patches in my comments on PATCH 1.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
